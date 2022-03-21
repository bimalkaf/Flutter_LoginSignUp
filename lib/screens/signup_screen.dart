import 'package:flutter/material.dart';
import 'package:login_signup/utils/form_validator_utils.dart';
import 'package:login_signup/widgets/primary_button.dart';
import 'package:login_signup/widgets/social_authentication_card.dart';
import 'package:login_signup/widgets/text_button.dart';
import 'package:login_signup/widgets/text_input_field.dart';
import 'package:login_signup/widgets/widgets.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late TextEditingController fullNameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    fullNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppWidgets.getAppBar(context, showBackButton: true),
      body: Container(
        height: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        // color: Colors.red,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _formFields(),
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
    );
  }

  Widget _formFields() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppWidgets.pageTitle("Sign Up"),
          const SizedBox(height: 20),
          MyTextInputField(
            title: "Full name",
            hint: "Your full name",
            controller: fullNameController,
            validator: (value) {
              return MyFormValidator.textValidator(value: value, minLength: 3);
            },
          ),
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
            },
          ),
          const SizedBox(height: 20),
          MyTextInputField(
            title: "Confirm Password",
            hint: "Retype Password",
            isPassword: true,
            controller: confirmPasswordController,
            validator: (value) {
              return MyFormValidator.passwordMatchValidator(
                  password: value,
                  matchTo: passwordController.value.text,
                  minLength: 6);
            },
          ),
        ],
      ),
    );
  }

  Widget _interactions() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          child: PrimaryButton(
            text: "SIGN UP",
            onPressed: () {
              if (_formKey.currentState?.validate() == true) {
                String fullName = fullNameController.value.text;
                String email = emailController.value.text;
                String password = passwordController.value.text;
                //Do your Logic here
              }
            },
          ),
          width: double.infinity,
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Already have an account?"),
            MyTextButton(
              text: "Login",
              onPressed: () {
                Navigator.of(context).pop();
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
        AppWidgets.getOrOptionDivider(context, "Sign up with"),
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
              //Facebook login logic here
            }),
        SocialAuthentication(
            icon: Image.asset(
              "assets/images/google_icon.png",
              height: 40,
            ),
            title: "GOOGLE",
            onPressed: () {
              //Google login logic here
            })
      ],
    );
  }
}
