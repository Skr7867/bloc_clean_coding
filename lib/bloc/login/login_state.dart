part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState({
    this.email = '',
    this.password = '',
    this.messages = '',
    this.postApiStatus = PostApiStatus.initial,
  });

  final String email;
  final String password;
  final String messages;
  final PostApiStatus postApiStatus;

  LoginState copyWith({
    String? email,
    String? password,
    String? messages,
    PostApiStatus? postApiStatus,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      messages: messages ?? this.messages,
      postApiStatus: postApiStatus ?? this.postApiStatus,
    );
  }

  @override
  List<Object> get props => [email, password, postApiStatus, messages];
}
