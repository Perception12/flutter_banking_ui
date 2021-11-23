import 'package:flutter/material.dart';
import '../colors.dart' as color;

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool agreeToConditions = false;
  Widget _nameWidget() {
    return const TextField(
      obscureText: false,
      decoration: InputDecoration(hintText: "Enter Your name"),
    );
  }

  Widget _emailWidget() {
    return const TextField(
      obscureText: false,
      decoration: InputDecoration(hintText: "Enter Email"),
    );
  }

  Widget _passwordWidget() {
    return const TextField(
      obscureText: true,
      decoration: InputDecoration(hintText: "Enter password"),
    );
  }

  Widget _confirmWidget() {
    return const TextField(
      obscureText: true,
      decoration: InputDecoration(hintText: "Enter password"),
    );
  }

  Color buttonColor() {
    Color btnColor;
    btnColor = agreeToConditions == true ? color.AppColor.primaryColor : color.AppColor.disabledColor;
    return btnColor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: color.AppColor.mainBackground,
      body: Container(
        padding:

            const EdgeInsets.only(top: 70, left: 30, right: 30, bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: color.AppColor.primaryColor,
            ),
            const SizedBox(height: 20),
            const Text(
              "Create account",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "Name",
              style: TextStyle(fontSize: 16),
            ),
            _nameWidget(),
            const SizedBox(height: 25),
            const Text(
              "Email address",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            _emailWidget(),
            const SizedBox(height: 25),
            const Text(
              "Password",
              style: TextStyle(fontSize: 16),
            ),
            _passwordWidget(),
            const SizedBox(height: 25),
            const Text(
              "Repeat password",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            _confirmWidget(),
            const SizedBox(height: 10),
            Row(
              children: [
                Checkbox(
                    checkColor: Colors.white,
                    activeColor: color.AppColor.primaryColor,
                    value: agreeToConditions,
                    onChanged: (bool? value) {
                      setState(() {
                        agreeToConditions = value!;
                      });
                    }),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("By creating an account, you agree"),
                    Text("to our Terms and Conditions")
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 40,
              width: MediaQuery.of(context).size.width,
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(buttonColor()),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                  ),
                ),
                onPressed: (){},
                child: Text(
                  "Sign up",
                  style: TextStyle(
                    color: color.AppColor.mainBackground,
                  ),
                ),
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
