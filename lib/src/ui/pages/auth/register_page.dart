import 'dart:io';

import 'package:echnelapp/src/ui/herlpers/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:echnelapp/src/ui/widgets/widgets.dart';
import 'package:echnelapp/src/data/services/services.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF2F2F2),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              height: Platform.isIOS
                  ? MediaQuery.of(context).size.height * 0.9
                  : MediaQuery.of(context).size.height * 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Logo(),
                  _Form(),
                  Labels(
                      ruta: 'login',
                      titulo: '¿Ya tienes una cuenta?',
                      subtitulo: '¡Ingresa aqui!'),
                  Text(
                    'Echnelapp',
                    style: TextStyle(fontWeight: FontWeight.w200),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

class _Form extends StatefulWidget {
  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  final emailCtrl = TextEditingController();
  final nombreCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          CustomInput(
            icon: Icons.person_outline,
            placeholder: 'Nombre',
            textController: nombreCtrl,
          ),
          CustomInput(
            icon: Icons.mail_outline,
            placeholder: 'Correo',
            keyboardType: TextInputType.emailAddress,
            textController: emailCtrl,
          ),
          CustomInput(
            icon: Icons.lock_outline,
            placeholder: 'Contraseña',
            isPassword: true,
            textController: passCtrl,
          ),
          BotonAzul(
              text: 'Registrar',
              onPressed: () async {
                final registroOk = await authService.register(
                    nombreCtrl.text.trim(),
                    emailCtrl.text.trim(),
                    passCtrl.text.trim());

                if (registroOk == true) {
                  Navigator.pushReplacementNamed(context, 'user/home');
                } else {
                  mostrarAlerta(context, 'Registro incorrecto', '$registroOk');
                }
              })
        ],
      ),
    );
  }

  mostrarAlerta(BuildContext context, String titulo, String subtitulo) {
    if (Platform.isAndroid) {
      return showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: Text(titulo),
                content: Text(subtitulo),
                actions: [
                  MaterialButton(
                      child: Text('Ok'),
                      elevation: 5,
                      textColor: Colors.blue,
                      onPressed: () => Navigator.pop(context))
                ],
              ));
    }

    showCupertinoDialog(
        context: context,
        builder: (_) => CupertinoAlertDialog(
              title: Text(titulo),
              content: Text(subtitulo),
              actions: [
                CupertinoDialogAction(
                  isDefaultAction: true,
                  child: Text('Ok'),
                  onPressed: () => Navigator.pop(context),
                )
              ],
            ));
  }
}
