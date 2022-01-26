import 'package:flutter/material.dart';
import '../colors.dart' as color;
import 'sign_in_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  bool agreeToConditions = false;
  bool showPassword = false;
  Widget _nameWidget() {
    return TextField(
      obscureText: false,
      decoration: const InputDecoration(hintText: "Enter Your name"),
      controller: _name,
      onChanged: (a) {
        setState(() {});
      },
    );
  }

  Widget _emailWidget() {
    return TextField(
      obscureText: false,
      decoration: const InputDecoration(hintText: "Enter Email"),
      controller: _email,
      onChanged: (a) {
        setState(() {});
      },
    );
  }

  Widget _passwordWidget() {
    return TextField(
      obscureText: !showPassword,
      decoration: InputDecoration(
        labelText: 'Enter Password',
        suffixIcon: InkWell(
          onTap: () {
            setState(() {
              showPassword = !showPassword;
            });
          },
          child: showPassword ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
        ),
      ),
      controller: _password,
      onChanged: (a) {
        setState(() {});
      },
    );
  }

  Widget _confirmWidget() {
    return TextField(
      obscureText: true,
      decoration: const InputDecoration(hintText: "Enter password"),
      controller: _confirmPassword,
      onChanged: (a) {
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    bool condition = _name.text.isEmpty ||
        _password.text.isEmpty ||
        _password.text != _confirmPassword.text ||
        agreeToConditions == false;

    Color buttonColor() {
      Color btnColor;
      btnColor = condition
          ? color.AppColor.disabledColor
          : color.AppColor.primaryColor;
      return btnColor;
    }

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
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            _nameWidget(),
            const SizedBox(height: 25),
            const Text(
              "Email address",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            _emailWidget(),
            const SizedBox(height: 25),
            const Text(
              "Password",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            _passwordWidget(),
            const SizedBox(height: 25),
            const Text(
              "Repeat password",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
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
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(buttonColor()),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                  ),
                ),
                onPressed: condition
                    ? null
                    : () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignInPage()));
                      },
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
              children: [
                const Text("Already have an account?"),
                const SizedBox(width: 5),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignInPage()));
                  },
                  child: const Text(
                    "Sign in",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
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
