import 'dart:developer';
import 'package:bloc_clean_coding/bloc/login/login_bloc.dart';
import 'package:bloc_clean_coding/utils/enums.dart';
import 'package:bloc_clean_coding/utils/flush_bar_helper.dart';
import 'package:bloc_clean_coding/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginBloc loginBloc;
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    loginBloc = LoginBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: BlocProvider(
        create: (_) => LoginBloc(),

        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: .center,
              mainAxisAlignment: .center,
              children: [
                BlocBuilder<LoginBloc, LoginState>(
                  buildWhen: (current, previous) =>
                      current.email != previous.email,
                  builder: (context, state) {
                    return TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      focusNode: emailFocusNode,
                      decoration: const InputDecoration(
                        hintText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        context.read<LoginBloc>().add(
                          EmailChanged(email: value),
                        );
                      },

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter email';
                        }
                        if (!Validation.emailValidator(value)) {
                          return "Please enter valid email";
                        }
                        return null;
                      },

                      onFieldSubmitted: (value) {},
                    );
                  },
                ),
                const SizedBox(height: 20),

                BlocBuilder<LoginBloc, LoginState>(
                  buildWhen: (current, previous) =>
                      current.password != previous.password,
                  builder: (context, state) {
                    log('password build');
                    return TextFormField(
                      focusNode: passwordFocusNode,
                      decoration: const InputDecoration(
                        hintText: 'password',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        context.read<LoginBloc>().add(
                          PasswordChanged(password: value),
                        );
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter password';
                        }
                        return null;
                      },

                      onFieldSubmitted: (value) {},
                    );
                  },
                ),

                BlocListener<LoginBloc, LoginState>(
                  listenWhen: (current, previous) =>
                      current.postApiStatus != previous.postApiStatus,
                  listener: (context, state) {
                    if (state.postApiStatus == PostApiStatus.error) {
                      FlushBarHelper.flushBarErrorMessage(
                        state.messages.toString(),
                        context,
                      );
                    }
                    if (state.postApiStatus == PostApiStatus.sucess) {
                      FlushBarHelper.flushBarErrorMessage(
                        'Login Successful',
                        context,
                      );
                    }
                  },
                  child: BlocBuilder<LoginBloc, LoginState>(
                    buildWhen: (current, previous) =>
                        current.postApiStatus != previous.postApiStatus,
                    builder: (context, state) {
                      log('password build');
                      return ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<LoginBloc>().add(LoginApi());
                          }
                        },
                        child: state.postApiStatus == PostApiStatus.loading
                            ? CircularProgressIndicator()
                            : Text('Login'),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
