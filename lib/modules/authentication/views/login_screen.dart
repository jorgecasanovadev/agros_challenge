import 'dart:async';

import 'package:agros_challenge/components/shared/client_preferences.dart';
import 'package:agros_challenge/components/theme/btn_theme.dart';
import 'package:agros_challenge/components/theme/color_theme.dart';
import 'package:agros_challenge/components/theme/inputs_theme.dart';
import 'package:agros_challenge/components/views/spinner_loader.dart';
import 'package:agros_challenge/modules/home/views/home_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginFormKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _failedLogin = false; //visibilidad
  bool _isLoading = false;

  bool _passwordIsObscured = true;
  Color _eyeButtonColor = Colors.grey;

  @override
  void initState() {
    super.initState();
  }

  void authenticateClient(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      ClientSharedPreferences.setClientName(_usernameController.text);
      Navigator.of(context).pushReplacementNamed('/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: GestureDetector(
              onTap: () {
                FocusNode currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              },
              child: Form(
                key: _loginFormKey,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(20, 40, 20, 10),
                  child: Column(
                    children: <Widget>[
                      formSeparator(),
                      Image.asset(
                        'assets/images/logo_agros.png',
                        width: 280,
                        height: 280,
                      ),
                      Visibility(
                        visible: _failedLogin,
                        child: Container(
                          padding: const EdgeInsets.only(top: 15),
                          child: Center(
                            child: Text(
                              'Datos de Acceso Incorrectos',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.red[800],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      buildUsernameField(),
                      formSeparator(),
                      buildPasswordField(context),
                      const SizedBox(height: 60),
                      SizedBox(
                        width: double.infinity,
                        child: buildLoginButton(context),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            visible: _isLoading,
            child: const Center(child: SpinnerLoader()),
          ),
        ],
      ),
    );
  }

  TextFormField buildUsernameField() {
    return TextFormField(
      controller: _usernameController,
      validator: (usernameInput) {
        if (usernameInput == null || usernameInput.isEmpty) {
          return "Debe ingresar su usuario";
        }
        return null;
      },
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'Usuario',
        labelStyle: InputTheme.labelTextStyle,
      ),
      style: InputTheme.inputTextStyle,
      keyboardType: TextInputType.text,
    );
  }

  TextFormField buildPasswordField(BuildContext context) {
    return TextFormField(
      controller: _passwordController,
      validator: (passwordInput) {
        if (passwordInput == null || passwordInput.isEmpty) {
          return "Debe ingresar su contraseña";
        }
        return null;
      },
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'Contraseña',
        labelStyle: InputTheme.labelTextStyle,
        suffixIcon: IconButton(
          onPressed: () {
            if (_passwordIsObscured) {
              setState(() {
                _passwordIsObscured = false;
                _eyeButtonColor = Theme.of(context).primaryColor;
              });
            } else {
              setState(() {
                _passwordIsObscured = true;
                _eyeButtonColor = Colors.grey;
              });
            }
          },
          icon: Icon(Icons.remove_red_eye, color: _eyeButtonColor),
        ),
      ),
      style: InputTheme.inputTextStyle,
      obscureText: _passwordIsObscured,
    );
  }

  TextButton buildLoginButton(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      backgroundColor: ColorTheme.primaryColor,
      padding: BtnTheme.btnPadding,
      shape: BtnTheme.btnShape,
    );
    return TextButton(
      style: flatButtonStyle,
      child: Text("Ingresar", style: BtnPrimaryTheme.btnTextStyle),
      onPressed: () {
        setState(() {
          this._failedLogin = false;
        });
        if (_loginFormKey.currentState!.validate()) {
          setState(() => _isLoading = true);
          authenticateClient(context);
        }
      },
    );
  }

  // OutlinedButton buildSignUpButton(BuildContext context) {
  //   return OutlinedButton(
  //     style: OutlinedButton.styleFrom(
  //       side: BtnOutlinePrimaryTheme.borderSide,
  //       shape: BtnTheme.btnShape,
  //       padding: BtnTheme.btnPadding,
  //     ),
  //     onPressed: () {
  //       Navigator.of(context).pushNamed('/sign_up');
  //     },
  //     child: Container(
  //       padding: const EdgeInsets.symmetric(horizontal: 8.0),
  //       child: Text(
  //         "No tienes cuenta, regístrate aquí",
  //         style: BtnOutlinePrimaryTheme.btnTextStyle,
  //         textAlign: TextAlign.center,
  //       ),
  //     ),
  //   );
  // }

  SizedBox formSeparator() {
    return const SizedBox(
      height: 30,
    );
  }
}
