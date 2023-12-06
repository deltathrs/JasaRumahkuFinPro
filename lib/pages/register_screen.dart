import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jasarumahku/components/my_button.dart';
import 'package:jasarumahku/components/my_textfield.dart';

class RegisterPage extends StatefulWidget {
  late final Function()? onTap;
  RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text editing controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  // sign user up method
  void signUserUp() async {
    //loading circle
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    // try sign in
    try {
      //check if password same
      if (passwordController.text == confirmpasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      } else {
        //error message password doesn't match
        showErrorMessage("Password tidak sesuai");
      }
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      showErrorMessage(e.code);
    }
  }

  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          message,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                height: 10,
              ),
              //logo
              Image.asset('assets/images/login_assets/logo_red.png'),
              Text(
                'JasaRumahku',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 29,
                  fontWeight: FontWeight.w600,
                ),
              ),

              SizedBox(
                height: 25,
              ),

              //email textfield
              Padding(
                padding: const EdgeInsets.only(right: 280),
                child: Text(
                  'Email',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
              MyTextField(
                controller: emailController,
                hintText: 'Masukkan Email',
                obscureText: false,
                prefixIcon: Icons.email,
              ),

              SizedBox(
                height: 20,
              ),

              //password textfield
              Padding(
                padding: const EdgeInsets.only(right: 250),
                child: Text(
                  'Password',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
              MyTextField(
                controller: passwordController,
                hintText: 'Masukkan Password',
                obscureText: true,
                prefixIcon: Icons.key_outlined,
                suffixIcon: Icons.visibility_off,
              ),

              SizedBox(
                height: 10,
              ),

              //confirm password textfield
              Padding(
                padding: const EdgeInsets.only(right: 160),
                child: Text(
                  'Konfirmasi Password',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
              MyTextField(
                controller: confirmpasswordController,
                hintText: 'Masukkan Password',
                obscureText: true,
                prefixIcon: Icons.key_outlined,
                suffixIcon: Icons.visibility_off,
              ),

              Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 0.0), // Adjust the value as needed
                  child: Text(
                    'Password minimal terdiri dari 8 karakter dan berisi\nkombinasi huruf kapital, huruf kecil, angka, dan simbol.',
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),

              //forgot password

              SizedBox(
                height: 35,
              ),

              //sign in button
              MyButton(
                text: 'Daftar',
                onTap: signUserUp,
              ),

              SizedBox(
                height: 20,
              ),

              //or continue with
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    'atau',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 20,
              ),

              SizedBox(
                height: 20,
              ),

              //register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sudah punya akun?',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      'Masuk',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 15,
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  )
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
