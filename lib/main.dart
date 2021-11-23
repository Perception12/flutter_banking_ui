
import 'package:flutter/material.dart';

void main() {
  runApp(const SignInPage());
}

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.arrow_back_ios,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Sign In',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                const Text(
                  'E-mail',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                TextField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Enter Email',
                  ),controller:email,
                  onChanged: (a){setState(() {

                  });}, ),
                const SizedBox(height: 30),
                const Text(
                  'Password',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                TextField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Enter Password',
                  ),controller: password,
                  onChanged: (a){setState(() {

                  });},
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed:email.text.isEmpty || password.text.isEmpty? null: () {},
                    child: const Text('Sign in'),
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 150),
                        primary:email.text.isEmpty || password.text.isEmpty? Colors.grey: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                        )),
                  ),
                ),
                const SizedBox(height: 20),
                const Center(
                  child: Text(
                      'Forgot the password?', style: TextStyle(fontWeight: FontWeight.bold)
                  ),
                ),
                Expanded(child: SizedBox()),
                const Center(
                  child: Text(
                        "Don't have an Account? Sign-up", style: TextStyle(fontWeight: FontWeight.bold)
                    ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
