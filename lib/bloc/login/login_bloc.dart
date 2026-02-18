import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bloc_clean_coding/utils/enums.dart';
import 'package:equatable/equatable.dart';

import '../../repository/auth/login_repository.dart';
import '../../services/sessionManager/session_controller.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvents, LoginState> {
  final LoginRepository loginRepository;

  LoginBloc(this.loginRepository) : super(const LoginState()) {
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

  Future<void> _loginApi(LoginApi event, Emitter<LoginState> emit) async {
    try {
      emit(state.copyWith(postApiStatus: PostApiStatus.loading));

      final Map<String, dynamic> data = {
        "email": state.email,
        "password": state.password,
      };

      final value = await loginRepository.loginApi(data);

      /// ❌ LOGIN FAILED
      if (value.token == null || value.token!.isEmpty) {
        emit(
          state.copyWith(
            messages: value.message ?? "Login Failed",
            postApiStatus: PostApiStatus.error,
          ),
        );
        return;
      }

      /// ✅ SAVE SESSION
      await SessionController().saveUserInPreference(value);
      await SessionController().getUserFromPreference();

      emit(
        state.copyWith(
          messages: value.message ?? "Login Success",
          postApiStatus: PostApiStatus.sucess,
        ),
      );
    } catch (error, stackTrace) {
      log(error.toString());
      log(stackTrace.toString());

      emit(
        state.copyWith(
          messages: error.toString(),
          postApiStatus: PostApiStatus.error,
        ),
      );
    }
  }
}
