import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bloc_clean_coding/utils/enums.dart';
import 'package:equatable/equatable.dart';

import '../../repository/auth/login_repository.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvents, LoginState> {
  LoginRepository loginRepository = LoginRepository();
  LoginBloc() : super(const LoginState()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<LoginApi>(_loginApi);
  }

  void _onEmailChanged(EmailChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _loginApi(LoginApi event, Emitter<LoginState> emit) async {
    Map data = {"email": state.email, "password": state.password};
    emit(state.copyWith(postApiStatus: PostApiStatus.loading));
    await loginRepository
        .loginApi(data)
        .then((value) {
          if (value.message!.isNotEmpty) {
            emit(
              state.copyWith(
                messages: value.message.toString(),
                postApiStatus: PostApiStatus.error,
              ),
            );
          } else {
            emit(
              state.copyWith(
                messages: value.token,
                postApiStatus: PostApiStatus.sucess,
              ),
            );
          }
        })
        .onError((error, stackTrace) {
          log(error.toString());
          emit(
            state.copyWith(
              messages: error.toString(),
              postApiStatus: PostApiStatus.error,
            ),
          );
        });
  }
}
