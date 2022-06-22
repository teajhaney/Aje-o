// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:ajeo_test/resource/auth_methods.dart';
import 'package:ajeo_test/screens/policy_screen.dart';
import 'package:ajeo_test/screens/screens.dart';

import '../utils/utils.dart';

import '../widget/text_input_feild.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });

    //signup user using auth methods

    String response = await AuthMethods().signUpUser(
      firstName: _firstNameController.text,
      lastName: _lastNameController.text,
      email: _emailController.text,
      password: _passwordController.text,
    );

    if (response == 'success') {
      setState(() {
        _isLoading = false;
      });

      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const PolicyScreen()));
    } else {
      setState(() {
        _isLoading = false;
      });

      //show notice
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(response)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
              horizontal: padding50, vertical: padding100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFieldInput(
                textEditingController: _firstNameController,
                hintText: 'Enter your first name',
                textInputType: TextInputType.text,
              ),
              const SizedBox(
                height: padding30,
              ),
              TextFieldInput(
                textEditingController: _lastNameController,
                hintText: 'Enter your last name',
                textInputType: TextInputType.text,
              ),
              const SizedBox(
                height: padding30,
              ),
              TextFieldInput(
                textEditingController: _emailController,
                hintText: 'Enter your email address',
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: padding30,
              ),
              TextFieldInput(
                textEditingController: _passwordController,
                hintText: 'Enter your password',
                textInputType: TextInputType.text,
                isPass: true,
              ),
              const SizedBox(
                height: padding30,
              ),
              InkWell(
                onTap: signUpUser,
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: padding12),
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                    color: primaryColor,
                  ),
                  child: !_isLoading
                      ? const Text(
                          'Sign up',
                        )
                      : const CircularProgressIndicator(
                          color: Colors.white,
                        ),
                ),
              ),
              const SizedBox(
                height: padding20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: padding10),
                    child: const Text(
                      'Already have an account?',
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: padding10),
                      child: Text(
                        ' Login.',
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                              color: primaryColor,
                              fontSize: 20,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
