import 'package:flutter/material.dart';
import 'package:login_signup/screens/signup_screen.dart';
import 'package:login_signup/utils/form_validator_utils.dart';
import 'package:login_signup/widgets/primary_button.dart';
import 'package:login_signup/widgets/social_authentication_card.dart';
import 'package:login_signup/widgets/text_button.dart';
import 'package:login_signup/widgets/text_input_field.dart';
import 'package:login_signup/widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        appBar: AppWidgets.getAppBar(context),
        body: Container(
          height: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  formFields(),
                  const SizedBox(height: 50),
                  _interactions(),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: _bottomSheet()),
      ),
    );
  }

  Widget formFields() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppWidgets.pageTitle("Login"),
          const SizedBox(height: 20),
          MyTextInputField(
            title: "E-mail",
            hint: "Your email id",
            controller: emailController,
            validator: (value) {
              return MyFormValidator.emailValidator(emailId: value);
            },
          ),
          const SizedBox(height: 20),
          MyTextInputField(
              title: "Password",
              hint: "Password",
              isPassword: true,
              controller: passwordController,
              validator: (value) {
                return MyFormValidator.passwordValidator(
                    password: value, minLength: 6);
              }),
        ],
      ),
    );
  }

  Widget _interactions() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(""),
            MyTextButton(
              text: "Forgot Password?",
              onPressed: () {
                print("Forgot password pressed");
              },
            ),
          ],
        ),
        const SizedBox(height: 20),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          child: PrimaryButton(
              text: "LOGIN",
              onPressed: () {
                if (_formKey.currentState?.validate() == true) {
                  String email = emailController.value.text;
                  String password = passwordController.value.text;
                  //Do your Logic here
                }
              }),
          width: double.infinity,
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Don't have an account?"),
            MyTextButton(
              text: "Sign up",
              onPressed: () {
                print("SignUp pressed");
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SignupScreen()));
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _bottomSheet() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppWidgets.getOrOptionDivider(context, "Sign in with"),
        const SizedBox(height: 16),
        _facebookAndGoogle()
      ],
    );
  }

  Widget _facebookAndGoogle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SocialAuthentication(
            icon: Image.asset(
              "assets/images/fb_icon.png",
              height: 40,
            ),
            title: "FACEBOOK",
            onPressed: () {
              //Facebook login Logic here
            }),
        SocialAuthentication(
            icon: Image.asset(
              "assets/images/google_icon.png",
              height: 40,
            ),
            title: "GOOGLE",
            onPressed: () {
              //Google login Logic here
            })
      ],
    );
  }
}
