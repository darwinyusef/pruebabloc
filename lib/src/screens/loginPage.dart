import 'package:bucaplogin/src/bloc/provider.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/image1.png'),
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.topCenter)),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 270),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.all(23),
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Center(
                      child: Container(
                        child: Text('Log in to your account',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'SFUIDisplay',
                                fontWeight: FontWeight.bold,
                                fontSize: 18)),
                      ),
                    ),
                  ),
                  _userEmailForm(context, bloc),
                  _passwordForm(context, bloc),
                  _signinForm(context, bloc),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Center(
                      child: Text(
                        'Forgot your password?',
                        style: TextStyle(
                            fontFamily: 'SFUIDisplay',
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Center(
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "Don't have an account?  ",
                              style: TextStyle(
                                fontFamily: 'SFUIDisplay',
                                color: Colors.black,
                                fontSize: 15,
                              )),
                          TextSpan(
                              text: "Sign up",
                              style: TextStyle(
                                fontFamily: 'SFUIDisplay',
                                color: Color(0xffff2d55),
                                fontSize: 15,
                              ))
                        ]),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget _signinForm(BuildContext context, LoginBloc bloc) {
  return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Padding(
          padding: EdgeInsets.only(top: 20),
          child: MaterialButton(
            onPressed: () {}, //since this is only a UI app
            child: Text(
              'SIGN IN',
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'SFUIDisplay',
                fontWeight: FontWeight.bold,
              ),
            ),
            color: Color(0xffff2d55),
            elevation: 0,
            minWidth: 400,
            height: 50,
            textColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        );
      });
}

Widget _passwordForm(BuildContext context, LoginBloc bloc) {
  return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          color: Color(0xfff5f5f5),
          child: TextFormField(
            obscureText: true,
            style: TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay'),
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock_outline),
                labelStyle: TextStyle(fontSize: 15),
                counterText: snapshot.data,
                errorText: 'No es un password valido'),
            onChanged: bloc.changePassword,
          ),
        );
      });
}

Widget _userEmailForm(BuildContext context, LoginBloc bloc) {
  return StreamBuilder(
      stream: bloc.emailStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Padding(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
          child: Container(
            color: Color(0xfff5f5f5),
            child: TextFormField(
                style:
                    TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay'),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username or email',
                    prefixIcon: Icon(Icons.person_outline),
                    labelStyle: TextStyle(fontSize: 15),
                    counterText: snapshot.data,
                    errorText: 'No es una contraseña valido'),
                onChanged: bloc.changeEmail),
          ),
        );
      });
}
