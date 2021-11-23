
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
                Icon(
                  Icons.arrow_back_ios,
                ),
                SizedBox(height: 20),
                Text(
                  'Sign In',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.normal),
                ),
                SizedBox(height: 30),
                Text(
                  'E-mail',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.normal),
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Enter Email',
                  ),controller:email,
                  onChanged: (a){setState(() {

                  });}, ),
                SizedBox(height: 30),
                Text(
                  'Password',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.normal),
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Enter Password',
                  ),controller: password,
                  onChanged: (a){setState(() {

                  });},
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed:email.text.isEmpty || password.text.isEmpty? null: () {},
                        child: Text('Sign in'),
                        style: ElevatedButton.styleFrom(
                            primary:email.text.isEmpty || password.text.isEmpty? Colors.grey: Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)
                            )),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
