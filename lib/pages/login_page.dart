import 'package:a1/main_screen.dart';
import 'package:a1/models/current_user.dart';
import 'package:a1/models/user_services.dart';
import 'package:a1/widgets/custom_field.dart';
import 'package:a1/widgets/mini_captcha.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController login = TextEditingController();
  final TextEditingController password = TextEditingController();

  bool isVerify = false;

  final UserServices _userServices = UserServices();
  String? error;
  bool isLoading = false;

  Future<void> onTap() async {
    final user = await _userServices.findUser(login.text.trim());
    if(!mounted) return;

    if(user == null){
      setState(() {
        error = "Email or username does not exist";
      });
      return;
    }

    final correctPassword = _userServices.checkPassword(user, password.text);
    if(!correctPassword){
      setState(() {
        error = "Incorrect password";
      });
      return;
    }

    if(!isVerify){
      setState(() {
        error = "Выполни капчу";
      });
      return;
    }

    CurrentUser.user = user;

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> MainScreen()));

  }


  @override
  void dispose() {
    // TODO: implement dispose
    login.dispose();
    password.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(width: double.infinity, height: size.height * 0.05),
            Text(
              "Explore places in \n everyday life",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: size.width * 0.1,
              ),
            ),

            SizedBox(height: 10),
            CustomField(controller: login, labelText: "Email or username"),
            SizedBox(height: 10),
            CustomField(controller: password, labelText: "Password"),
            SizedBox(height: 20),
            MiniCaptcha(onTap: (){
              setState(() {
                isVerify = true;
              });
            }),

            if(error != null) Text(error!, style: TextStyle(color: Colors.red),),

            SizedBox(height: 20),
            SizedBox(
              width: size.width * 0.8,
              child: ElevatedButton(onPressed: onTap,
                  child: Text("Login")),
            ),
          ],
        ),
      ),
    );
  }
}
