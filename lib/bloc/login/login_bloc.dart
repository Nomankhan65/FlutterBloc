import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutterbloc/bloc/login/login_event.dart';
import 'package:flutterbloc/bloc/login/login_states.dart';
import 'package:http/http.dart' as  http;

class LoginBloc extends Bloc<LoginEvent,LoginState>{
  LoginBloc():super(const LoginState()){
   on<EmailChanged>(_emailChanged);
   on<PasswordChanged>(_passwordChanged);
   on<LoginApi>(_loginApi);

  }

  void _emailChanged(EmailChanged event,Emitter<LoginState> emitter){

    emitter(state.copyWith(email:event.email));
  }

  void _passwordChanged(PasswordChanged event,Emitter<LoginState> emitter){

    emitter(state.copyWith(password :event.password));
  }

  void _loginApi(LoginApi event,Emitter<LoginState> emitter)async{
    emitter(state.copyWith(
      loginStatus:LoginStatus.loading,
    ));
    Map data = {'email': state.email, 'password': state.password};

    try {
      final response = await http.post(Uri.parse('https://reqres.in/api/login'), body: data);
     final decodeData=jsonDecode(response.body);
      if(response.statusCode==200){
        emitter(state.copyWith(
          loginStatus:LoginStatus.success,
          message:'Success!'
        ));
      }else
        {
          emitter(state.copyWith(
              loginStatus:LoginStatus.error,
              message:decodeData['error'],
          ));
          print(decodeData['error']);
        }
    }catch (e){
      emitter(state.copyWith(
          loginStatus:LoginStatus.error,
          message:e.toString(),

      ));
      print(e.toString());

    }
  }
}