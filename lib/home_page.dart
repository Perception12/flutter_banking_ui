import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool agreeToConditions = false;
  Widget _nameWidget(){
    return const TextField(
      obscureText: false,
      decoration: InputDecoration(
          hintText: "Enter Your name"
      ),
    );
  }

  Widget _emailWidget(){
    return const TextField(
      obscureText: false,
      decoration: InputDecoration(
          hintText: "Enter Email"
      ),
    );
  }

  Widget _passwordWidget(){
    return const TextField(
      obscureText: false,
      decoration: InputDecoration(
          hintText: "Enter password"
      ),
    );
  }

  Widget _confirmWidget(){
    return const TextField(
      obscureText: false,
      decoration: InputDecoration(
          hintText: "Enter password"
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.only(top: 70, left: 30, right: 30, bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.arrow_back_ios, size: 20, color: Colors.blue,),
            const SizedBox(height: 20),
            const Text(
              "Create account",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "Name",
              style: TextStyle(fontSize: 16),
            ),
            _nameWidget(),
            const SizedBox(height: 20),
            const Text(
              "Email address",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            _emailWidget(),
            const SizedBox(height: 20),
            const Text(
              "Password",
              style: TextStyle(fontSize: 16),
            ),
            _passwordWidget(),
            const SizedBox(height: 20),
            const Text(
              "Repeat password",
              style: TextStyle(fontSize: 16,),
            ),
            _confirmWidget(),
            const SizedBox(height: 10),
            Row(
              children: [
                Checkbox(
                    checkColor: Colors.white,
                    value: agreeToConditions,
                    onChanged: (bool? value){
                      setState(() {
                        agreeToConditions = value!;
                      }
                      );
                    }
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("By creating an account, you agree"),
                    Text("to our Terms and Conditions")
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20,),
            SizedBox(
              height: 40,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(10.0)
                    ),
                  ),
                ),
                onPressed: null,
                child: const Text("Sign up"),
              ),
            ),
            Expanded(child: Container()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("Already have an account?"),
                SizedBox(width: 5),
                Text(
                  "Sign in",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
