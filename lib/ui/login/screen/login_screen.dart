import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:progress_follower/client/services/login_service.dart';
import 'package:progress_follower/generated/i18n.dart';
import 'package:progress_follower/ui/login/bloc/login_bloc.dart';
import 'package:progress_follower/ui/login/bloc/login_event.dart';
import 'package:progress_follower/ui/login/bloc/login_state.dart';
import 'package:progress_follower/ui/page_control/screen/page_control_screen.dart';
import 'package:progress_follower/utils/custom_variables/custom_variables.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginBloc _loginBloc;
  bool navigatedToTrakt = false;
  String code;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _loginBloc = LoginBloc();
    super.initState();
  }

  @override
  void dispose() {
    _loginBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => _loginBloc,
      child: Scaffold(
        body: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccessState) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => PageControlScreen()));
            }
            if (state is LoginErrorState) {
              showDialog(
                context: context,
                child: AlertDialog(
                  title: Text(I18n.of(context).login_failed),
                  content: Text(I18n.of(context).try_again),
                  actions: <Widget>[
                    FlatButton(
                      child: Text(I18n.of(context).ok),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              );
            }
          },
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                topLogoWidget(height, width),
                if (navigatedToTrakt) ...[
                  codeTextFieldWidget(),
                ],
                SizedBox(height: 3),
                loginButtonWidget(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  GestureDetector loginButtonWidget(BuildContext context) {
    return GestureDetector(
      onTap: navigatedToTrakt ? _doLogin : _getCode,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            Variable.svg.traktIconRed,
            width: 40,
          ),
          SizedBox(width: 5),
          Text(
            navigatedToTrakt
                ? I18n.of(context).login
                : I18n.of(context).trakt_login,
            style: TextStyle(fontSize: 20),
          )
        ],
      ),
    );
  }

  Form codeTextFieldWidget() {
    return Form(
      key: formKey,
      child: TextFormField(
        textDirection: TextDirection.ltr,
        style: TextStyle(fontSize: 40),
        autofocus: false,
        textCapitalization: TextCapitalization.characters,
        textAlign: TextAlign.center,
        maxLength: 8,
        decoration: InputDecoration(
          counter: Container(),
          isDense: true,
          contentPadding: EdgeInsets.all(2),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
        validator: (value) {
          if (value.trim().length != 8) {
            return I18n.of(context).code_lenght_warning;
          } else {
            return null;
          }
        },
        onSaved: (value) {
          setState(() {
            code = value;
          });
        },
      ),
    );
  }

  Container topLogoWidget(double height, double width) {
    return Container(
      height: height * 0.5,
      alignment: Alignment.center,
      child: Text(
        "SB",
        style: TextStyle(
          fontSize: width * 0.5,
          color: Colors.red,
        ),
      ),
    );
  }

  void _doLogin() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      _loginBloc.add(BeginLoginEvent(code));
    }
  }

  void _getCode() async {
    if (navigatedToTrakt) {
    } else {
      await LoginService().code();
      setState(() {
        navigatedToTrakt = true;
      });
    }
  }
}
