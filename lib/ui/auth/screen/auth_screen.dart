import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress_follower/ui/auth/bloc/auth_bloc.dart';
import 'package:progress_follower/ui/auth/bloc/auth_event.dart';
import 'package:progress_follower/ui/auth/bloc/auth_state.dart';
import 'package:progress_follower/ui/login/screen/login_screen.dart';
import 'package:progress_follower/ui/page_control/screen/page_control_screen.dart';
import 'package:progress_follower/utils/enums.dart';

AuthBloc authBloc = AuthBloc();

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  AuthScreenStatus _status;

  @override
  void initState() {
    _status = AuthScreenStatus.loading;
    authBloc.add(InitAuthEvent());
    super.initState();
  }

  @override
  void dispose() {
    authBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => authBloc,
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthInitialState ||
                state is AuthInitializingState) {
              setState(() {
                _status = AuthScreenStatus.loading;
              });
            } else if (state is UnAuthenticatedState) {
              setState(() {
                _status = AuthScreenStatus.unauthorized;
              });
            } else if (state is AuthenticatedState) {
              setState(() {
                _status = AuthScreenStatus.authorized;
              });
            } else {
              setState(() {
                _status = AuthScreenStatus.unauthorized;
              });
            }
          },
          child: selectPage(_status),
        ),
      ),
    );
  }

  Widget selectPage(AuthScreenStatus status) {
    switch (status) {
      case AuthScreenStatus.loading:
        return Scaffold(
          backgroundColor: Colors.deepOrangeAccent,
          body: Center(
            child: Text(
              "SPLASH",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      case AuthScreenStatus.unauthorized:
        return LoginScreen();
      case AuthScreenStatus.authorized:
        return PageControlScreen();
      default:
        return Scaffold();
    }
  }
}
