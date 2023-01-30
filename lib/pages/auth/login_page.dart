import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/theme/theme.dart';
import 'package:flutter_chat_app/widgets/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";

  bool _validateEmail(String value) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);
  }

  bool _validatePassword(String value) {
    return value.length > 6;
  }

  void showMessageSnackBar(String message) {
    var snackBar = SnackBar(
        content: Text(
      message,
    ));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  bool _validateEmptyFields() {
    bool isOk = false;
    if (email == "" && password == "") {
      showMessageSnackBar("Campo email y contraseña vacíos...");
    } else if (email == "") {
      showMessageSnackBar("Campo email vacío...");
    } else if (password == "") {
      showMessageSnackBar("Campo contraseña vacío...");
    } else {
      isOk = true;
    }
    return isOk;
  }

  login() {
    if (_validateEmptyFields()) {
      String response = "";
      if (_validateEmail(email)) {
        if (_validatePassword(password)) {
        } else {
          response = "El formato de la contraseña no es correcto";
        }
      } else {
        response = "El formato del email no es correcto";
      }
      if (response != "") {
        showMessageSnackBar(response);
      } else {
        // Login Process
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 40,
                ),
                const Text("Login",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    )),
                const SizedBox(
                  height: 10,
                ),
                const Text("Ingresa ahora para comenzar a chatear",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
                const Icon(
                  CupertinoIcons.bubble_left_bubble_right_fill,
                  size: 200,
                  color: AppTheme.accentColor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("BubbleChat",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.accentColor)),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                // Email TextField
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      border: Border.all(color: Theme.of(context).cardColor),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email',
                        ),
                        onChanged: (val) {
                          setState(() {
                            email = val;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                // Email TextField
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      border: Border.all(color: Theme.of(context).cardColor),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Contraseña',
                        ),
                        onChanged: (val) {
                          setState(() {
                            password = val;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                // Sign In Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: GestureDetector(
                    onTap: login,
                    child: Container(
                      width: 300,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: AppColors.accent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          'Iniciar Sesion',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                // Sign In Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Sin Cuenta?',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(' Registrate aquí',
                        style: TextStyle(
                            color: AppColors.secondary,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Desarrollado por SSAYKO",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.accentColor)),
            Icon(
              CupertinoIcons.layers_alt_fill,
              color: AppTheme.accentColor,
              size: 12,
            ),
          ],
        ),
      ),
    );
  }
}
