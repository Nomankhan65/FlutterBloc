import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/bloc/login/login_bloc.dart';

import '../bloc/login/login_event.dart';
import '../bloc/login/login_states.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginBloc _loginBloc;
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loginBloc = LoginBloc();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _loginBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login Screen'),
        ),
        body: BlocProvider(
            create: (_) => _loginBloc,
            child: Form(
                key: _formKey,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                                  border: OutlineInputBorder()),
                              onChanged: (value) {
                                context
                                    .read<LoginBloc>()
                                    .add(EmailChanged(email: value));
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter email';
                                }
                                return null;
                              },
                              onFieldSubmitted: (value) {},
                            );
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      BlocBuilder<LoginBloc, LoginState>(
                          buildWhen: (current, previous) =>
                              current.password != previous.password,
                          builder: (context, state) {
                            return TextFormField(
                              keyboardType: TextInputType.text,
                              focusNode: passwordFocusNode,
                              decoration: const InputDecoration(
                                  hintText: 'Password',
                                  border: OutlineInputBorder()),
                              onChanged: (value) {
                                context
                                    .read<LoginBloc>()
                                    .add(PasswordChanged(password: value));
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter password';
                                }
                                return null;
                              },
                              onFieldSubmitted: (value) {},
                            );
                          }),
                      const SizedBox(
                        height: 50,
                      ),
                      BlocListener<LoginBloc,LoginState>(listener:(context,states){
                        if(states.loginStatus==LoginStatus.error){
                          ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(
                            SnackBar(content: Text(states.message.toString()))
                          );
                        }
                        else if(states.loginStatus==LoginStatus.loading){
                          ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(
                              const SnackBar(content: Text('loading')),
                          );
                        }
                        else if(states.loginStatus==LoginStatus.success){
                          ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(
                            const SnackBar(content: Text('Success')),
                          );
                        }

                      },
                      child: BlocBuilder<LoginBloc, LoginState>(
                          buildWhen: (current, previous) =>false,
                          builder: (context, state) {
                            return SizedBox(
                                width:double.infinity,
                                child: ElevatedButton(onPressed: (){
                                  if (_formKey.currentState!.validate()) {
                                    context.read<LoginBloc>().add(LoginApi());
                                  }
                                }, child: const Text('Login')));
                          }),
                      )

                    ],
                  ),
                ))));
  }
}
