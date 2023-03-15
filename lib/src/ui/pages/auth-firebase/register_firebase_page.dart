import 'package:echnelapp/src/data/services/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:echnelapp/src/data/providers/providers.dart';
import 'package:echnelapp/src/ui/herlpers/helpers.dart';
import 'package:echnelapp/src/ui/widgets/widgets.dart';

class RegisterFirebasePage extends StatelessWidget {
  const RegisterFirebasePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AuthBackground(
            child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 250),
          CardContainer(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Crear Cuenta',
                  style: Theme.of(context).textTheme.headline4,
                ),
                SizedBox(
                  height: 30,
                ),
                ChangeNotifierProvider(
                  create: (_) => LoginFromProvider(),
                  child: _LoginForm(),
                )
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          TextButton(
              style: ButtonStyle(
                  overlayColor:
                      MaterialStateProperty.all(Colors.blue.withOpacity(0.1)),
                  shape: MaterialStateProperty.all(StadiumBorder())),
              onPressed: () => Navigator.pushReplacementNamed(context, 'login'),
              child: Text(
                'Inicia sesión con tu cuenta',
                style: TextStyle(fontSize: 18, color: Colors.black87),
              )),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    )));
  }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFromProvider>(context);

    return Container(
      child: Form(
          key: loginForm.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              TextFormField(
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecorations.authInputDecoration(
                    hintText: 'john.doe@gmail.com',
                    labelText: 'correo electronico',
                    prefixIcon: Icons.alternate_email_rounded),
                onChanged: (value) => loginForm.email = value,
                validator: (value) {
                  String pattern =
                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  RegExp regExp = new RegExp(pattern);
                  return regExp.hasMatch(value ?? '')
                      ? null
                      : 'El valor ingresado no luce como un correo';
                },
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                obscureText: true,
                decoration: InputDecorations.authInputDecoration(
                    hintText: '******',
                    labelText: 'contraseña',
                    prefixIcon: Icons.lock_outline),
                onChanged: (value) => loginForm.password = value,
                validator: (value) {
                  return (value != null && value.length >= 6)
                      ? null
                      : 'La contraseña debe ser de 6 caracteres';
                },
              ),
              SizedBox(
                height: 30,
              ),
              MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  disabledColor: Colors.grey,
                  elevation: 0,
                  color: Colors.blue,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                    child: Text(
                      loginForm.isLoading ? 'Espere...' : 'Ingresar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  onPressed: loginForm.isLoading
                      ? null
                      : () async {
                          FocusScope.of(context).unfocus();

                          final authService = Provider.of<FirebaseAuthService>(
                              context,
                              listen: false);

                          if (!loginForm.isValidForm()) return;
                          loginForm.isLoading = true;
                          await Future.delayed(Duration(seconds: 2));

                          final String? errorMessage = await authService
                              .createUser(loginForm.email, loginForm.password);

                          if (errorMessage == null) {
                            Navigator.pushReplacementNamed(
                                context, 'user/home');
                          } else {
                            NotificationsService.showSnackbar(
                                'Revise sus credenciales porfavor');
                            loginForm.isLoading = false;
                          }

                          // Navigator.pushNamed(context, 'admin/home');
                          // Navigator.pushNamed(context, 'driver/home');
                        })
            ],
          )),
    );
  }
}
