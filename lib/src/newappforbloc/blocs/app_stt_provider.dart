import 'package:bloc_eg/src/newappforbloc/blocs/sttmgt_bloc.dart';
import 'package:flutter/material.dart';

class ApplicationStateProvider extends InheritedWidget {
  final SttMgmtBloc sttMgmtBloc = SttMgmtBloc();

  ApplicationStateProvider({Key key, Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static SttMgmtBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(ApplicationStateProvider)
            as ApplicationStateProvider)
        .sttMgmtBloc;
  }
}
