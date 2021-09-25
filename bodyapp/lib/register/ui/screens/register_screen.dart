import 'dart:io';

import 'package:bodyapp/home/screens/home_screen.dart';
import 'package:bodyapp/login/login.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/brandico_icons.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bodyapp/shared/colors.dart';
import 'package:validators/validators.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF008B8B),
        title: Center(
            child: Text('Sign Up',
                style: GoogleFonts.roboto(
                  fontSize: 40,
                  color: Colors.white,
                ))),
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(Icons.keyboard_arrow_left_rounded),
            color: Colors.white,
            onPressed: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()))
            },
          );
        }),
      ),
      body: Column(
        children: [
          Avatar(),
          RegisterFormWidget(),
        ],
      ),
    );
  }
}

class Avatar extends StatefulWidget {
  const Avatar({
    Key? key,
  }) : super(key: key);

  @override
  _AvatarStates createState() => _AvatarStates();
}

class _AvatarStates extends State<Avatar> {
  final picker = ImagePicker();
  late File _selectedImage;
  bool _inProcess = false;

  getImage(ImageSource src) async {
    this.setState(() {
      _inProcess = true;
    });
    final pickedFile = await picker.getImage(source: src);
    if (pickedFile != null) {
      File? cropped = await ImageCropper.cropImage(
        sourcePath: pickedFile.path,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
        compressQuality: 100,
        maxHeight: 700,
        maxWidth: 700,
        compressFormat: ImageCompressFormat.jpg,
        androidUiSettings: AndroidUiSettings(
          toolbarTitle: 'Camera',
        ),
        iosUiSettings: IOSUiSettings(
          title: 'Camera',
        ),
      );
      setState(() {
        _selectedImage = cropped!;
        _inProcess = false;
      });
    } else {
      setState(() {
        _inProcess = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding:
            const EdgeInsets.only(top: 30, bottom: 30, left: 40, right: 40),
        child: Center(
            child: CircleAvatar(
          radius: 60,
          backgroundColor: AppColors.teal[1000],
          //backgroundImage: Image.asset(name),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.person_add_alt_1_rounded,
                      color: AppColors.teal[400],
                      size: 35.0,
                    ),
                    onPressed: () {
                      getImage(ImageSource.gallery);
                    },
                  ),
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}

class RegisterFormWidget extends StatefulWidget {
  const RegisterFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  _RegisterFormWidgetState createState() => _RegisterFormWidgetState();
}

class _RegisterFormWidgetState extends State<RegisterFormWidget> {
  final _formKey = GlobalKey<FormState>();
  RegExp _upper = RegExp(r'[A-Z]');
  RegExp _lower = RegExp(r'[a-z]');
  RegExp _numeric = RegExp(r'[0-9]');
  bool isPasswordObscured = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0, right: 50, left: 50),
            child: InputWidget(
              hintText: 'Nome',
              prefixIcon: Icons.person,
              validator: (value) {
                if (value != null && value.isEmpty) {
                  return 'Insira o seu nome';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, right: 50.0, left: 50.0),
            child: InputWidget(
              hintText: 'Email',
              prefixIcon: Icons.email_outlined,
              validator: (value) {
                if (value != null && !isEmail(value)) {
                  return 'Preencha um e-mail válido.';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, right: 50.0, left: 50.0),
            child: InputWidget(
              hintText: 'Senha',
              prefixIcon: Icons.lock,
              sufixIcon:
                  isPasswordObscured ? Icons.visibility_off : Icons.visibility,
              obscureText: isPasswordObscured,
              suffixIconOnPressed: () {
                setState(() {
                  isPasswordObscured = !isPasswordObscured;
                });
              },
              validator: (value) {
                if (value != null && value.length < 6) {
                  return 'A senha deve conter no mínimo 6 caracteres';
                }
                if (value != null && !value.contains(_upper)) {
                  return 'A senha deve conter pelo menos um caractere uppercase.';
                }
                if (value != null && !value.contains(_lower)) {
                  return 'A senha deve conter pelo menos um caractere lowercase.';
                }
                if (value != null && !value.contains(_numeric)) {
                  return 'A senha deve conter pelo menos um caractere numerico.';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, right: 50, left: 50),
            child: InputWidget(
              hintText: 'Confirmar senha',
              prefixIcon: Icons.lock,
              sufixIcon:
                  isPasswordObscured ? Icons.visibility_off : Icons.visibility,
              obscureText: isPasswordObscured,
              suffixIconOnPressed: () {
                setState(() {
                  isPasswordObscured = !isPasswordObscured;
                });
              },
              validator: (value) {
                if (value != null && value.length < 6) {
                  return 'A senha deve conter no mínimo 6 caracteres';
                }
                if (value != null && !value.contains(_upper)) {
                  return 'A senha deve conter pelo menos um caractere uppercase.';
                }
                if (value != null && !value.contains(_lower)) {
                  return 'A senha deve conter pelo menos um caractere lowercase.';
                }
                if (value != null && !value.contains(_numeric)) {
                  return 'A senha deve conter pelo menos um caractere numerico.';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 50.0, right: 50.0),
            child: ButtonTheme(
              minWidth: 55.0,
              height: 55.0,
              child: Column(
                children: <Widget>[
                  RaisedButton(
                    child: Center(
                      child: Text(
                        'Criar Conta',
                        style: GoogleFonts.roboto(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    color: AppColors.teal[500],
                    onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                      ),
                    },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: null,
                icon: Icon(
                  Brandico.facebook_1,
                  color: Colors.blueAccent,
                ),
                iconSize: 32,
              ),
              IconButton(
                onPressed: null,
                icon: Icon(
                  Brandico.twitter_bird,
                  color: Colors.lightBlueAccent,
                ),
                iconSize: 32,
              ),
              IconButton(
                onPressed: null,
                icon: Icon(
                  Brandico.googleplus_rect,
                  color: Colors.redAccent,
                ),
                iconSize: 32,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
