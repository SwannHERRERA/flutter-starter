import 'package:flutter/material.dart';
import 'package:flutter_auth/states/loginform/login_form_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocProvider(
          create: (context) => LoginFormBloc(),
          child: Form(
            key: _formKey,
            child: Container(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20.0, bottom: 15.0, top: 80),
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: Column(
                  children: [
                    _usernameField(),
                    _passwordField(),
                    _submitButton(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _usernameField() {
    return BlocBuilder<LoginFormBloc, LoginFormState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: TextFormField(
            decoration: const InputDecoration(hintText: "Username"),
            validator: RequiredValidator(errorText: "Username is required"),
            onChanged: (value) => context
                .read<LoginFormBloc>()
                .add(LoginFormUpdateUsername(username: value)),
          ),
        );
      },
    );
  }

  Widget _passwordField() {
    return BlocBuilder<LoginFormBloc, LoginFormState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: TextFormField(
            decoration: const InputDecoration(hintText: "Password"),
            validator: RequiredValidator(errorText: "Password is required"),
            obscureText: true,
            onChanged: (value) => {
              context
                  .read<LoginFormBloc>()
                  .add(LoginFormUpdatePassword(password: value)),
            },
          ),
        );
      },
    );
  }

  Widget _submitButton() {
    return BlocBuilder<LoginFormBloc, LoginFormState>(
      builder: (context, state) {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.cyan,
            onPrimary: Colors.black87,
            textStyle: const TextStyle(
              fontSize: 17,
            ),
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 7.0),
          ),
          onPressed: () =>
              context.read<LoginFormBloc>().add(LoginFormSubmitted()),
          child: const Text('Login'),
        );
      },
    );
  }
}
