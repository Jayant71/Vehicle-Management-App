import 'package:flutter/material.dart';
import 'package:vehicle_management_app/data/models/auth/signin_user_req.dart';
import 'package:vehicle_management_app/domain/usecases/auth/sigin.dart';
import 'package:vehicle_management_app/presentation/pages/homepage/homepage.dart';
import 'package:vehicle_management_app/presentation/pages/signuppage/signuppage.dart';
import 'package:vehicle_management_app/presentation/widgets/authappbutton.dart';
import 'package:vehicle_management_app/presentation/widgets/logo_name.dart';
import 'package:vehicle_management_app/service_locator.dart';

class SigninPage extends StatelessWidget {
  SigninPage({super.key});
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const LogoNameAppBar(),
      body: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 150,
            ),
            const Text(
              'Sign In',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    emailField(context),
                    const SizedBox(
                      height: 20,
                    ),
                    passwordField(context),
                    const SizedBox(
                      height: 20,
                    ),
                    AuthAppButton(
                        text: "Sign In",
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                });
                            var result = await sl<SigninUseCase>().call(
                              params: SigninUserReq(
                                email: _emailController.text.toString(),
                                password: _passwordController.text.toString(),
                              ),
                            );
                            result.fold(
                              (l) {
                                Navigator.of(context).pop();
                                showDialog(
                                    context: context,
                                    builder: (builder) {
                                      return AlertDialog(
                                        title: const Text('Error'),
                                        content: Text(l.toString()),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text('OK'),
                                          ),
                                        ],
                                      );
                                    });
                              },
                              (r) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    behavior: SnackBarBehavior.floating,
                                    content: Text('Sign in successful'),
                                  ),
                                );
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Homepage(),
                                  ),
                                );
                              },
                            );
                          }
                        }),
                    const SizedBox(
                      height: 200,
                    ),
                    const Text(
                      'Don\'t have an account?',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    AuthAppButton(
                        text: "Sign Up",
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignupPage(),
                            ),
                          );
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget emailField(BuildContext context) {
    return TextFormField(
      controller: _emailController,
      decoration: InputDecoration(
        labelText: 'Email',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter your email';
        }
        return null;
      },
    );
  }

  Widget passwordField(BuildContext context) {
    return TextFormField(
      controller: _passwordController,
      decoration: InputDecoration(
        labelText: 'Password',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      obscureText: true,
      keyboardType: TextInputType.visiblePassword,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter your password';
        } else if (value.length < 6) {
          return 'Password must be at least 6 characters';
        }
        return null;
      },
    );
  }
}
