import 'package:bloc_eg/src/newappforbloc/blocs/app_stt_provider.dart';
import 'package:bloc_eg/src/newappforbloc/blocs/global_bloc.dart';
import 'package:bloc_eg/src/newappforbloc/blocs/sttmgt_bloc.dart';
import 'package:bloc_eg/src/newappforbloc/mainUI2.dart';
import 'package:flutter/material.dart';

class MainUI1 extends StatefulWidget {
  @override
  MainUI1State createState() {
    return new MainUI1State();
  }
}

class MainUI1State extends State<MainUI1> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    final sttMgmtBloc = ApplicationStateProvider.of(context);

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          StreamBuilder(
            stream: globalBloc.stream,
            builder: (context, AsyncSnapshot<String> snapshot) {
              if (snapshot.hasData) {
                return Text('Value: ${snapshot.data}');
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
          RaisedButton(
            child: Icon(Icons.add),
            onPressed: () {
              globalBloc.push('Initial {$count}');
              count++;
            },
          ),
          emailField(sttMgmtBloc),
          SizedBox(
            height: 40.0,
          ),
          passwordField(sttMgmtBloc),
          SizedBox(
            height: 40.0,
          ),
          loginButton(sttMgmtBloc),
        ],
      ),
    );
  }

  emailField(SttMgmtBloc sttMgmtBloc) {
    return StreamBuilder(
        stream: sttMgmtBloc.emailStream,
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          return TextField(
            onChanged: sttMgmtBloc.updateEmail,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'abc@def.com',
              labelText: 'Email',
              errorText: snapshot.error,
            ),
          );
        });
  }

  passwordField(SttMgmtBloc sttmgmtBloc) {
    return StreamBuilder(
        stream: sttmgmtBloc.passwordStream,
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          return TextField(
            onChanged: sttmgmtBloc.updatePassword,
            decoration: InputDecoration(
              hintText: '********',
              labelText: 'Password',
              errorText: snapshot.error,
            ),
          );
        });
  }

  loginButton(SttMgmtBloc sttmgtBloc) {
    return StreamBuilder(
        stream: sttmgtBloc.submitValid,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return RaisedButton(
            child: Text('Login'),
            onPressed: snapshot.hasData
                ? () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MainUI2()));
                  }
                : null,
          );
        });
  }
}
