import 'package:flutter/material.dart';
import 'package:vehicle_management_app/data/models/auth/create_user_req.dart';
import 'package:vehicle_management_app/domain/usecases/auth/signup.dart';
import 'package:vehicle_management_app/presentation/pages/signinpage/signinpage.dart';
import 'package:vehicle_management_app/presentation/widgets/authappbutton.dart';
import 'package:vehicle_management_app/presentation/widgets/logo_name.dart';
import 'package:vehicle_management_app/service_locator.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _employeeIdController = TextEditingController();
  final TextEditingController _contactNumberController =
      TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LogoNameAppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    // fullNameField(context),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    emailField(context),
                    const SizedBox(
                      height: 20,
                    ),
                    // employeeIdField(context),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    // contactNumberField(context),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    passwordField(context),
                    const SizedBox(
                      height: 20,
                    ),
                    confirmPasswordField(context),
                    const SizedBox(
                      height: 20,
                    ),
                    AuthAppButton(
                        text: "Sign Up",
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                });
                            var result = await sl<SignupUseCase>().call(
                              params: CreateUserReq(
                                email: _emailController.text.toString(),
                                password: _passwordController.text.toString(),
                              ),
                            );
                            result.fold(
                              (l) {
                                Navigator.pop(context);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(l.message),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              },
                              (r) {
                                Navigator.pop(context);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Signup successful'),
                                    backgroundColor: Colors.green,
                                  ),
                                );
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SigninPage(),
                                  ),
                                );
                              },
                            );
                          }
                        }),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.15,
                    ),
                    const Text(
                      'Already have an account?',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    AuthAppButton(
                        text: "Sign In",
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SigninPage(),
                            ),
                          );
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget fullNameField(BuildContext context) {
    return TextFormField(
      controller: _fullNameController,
      decoration: InputDecoration(
        labelText: 'Fullname',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter your fullname';
        } else if (value.length < 3) {
          return 'Please enter a valid fullname';
        }
        return null;
      },
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
        } else if (!value.contains('@') && !value.contains('.')) {
          return 'Please enter a valid email';
        }
        return null;
      },
    );
  }

  Widget employeeIdField(BuildContext context) {
    return TextFormField(
      controller: _employeeIdController,
      decoration: InputDecoration(
        labelText: 'Employee ID',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter your employee ID';
        }
        return null;
      },
    );
  }

  Widget contactNumberField(BuildContext context) {
    return TextFormField(
      controller: _contactNumberController,
      decoration: InputDecoration(
        labelText: 'Contact Number',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter your contact number';
        } else if (value.length < 10 || value.length > 10) {
          return 'Please enter a valid contact number';
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

  Widget confirmPasswordField(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Confirm Password',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      obscureText: true,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please confirm your password';
        } else if (value != _passwordController.text) {
          return 'Passwords do not match';
        }
        return null;
      },
    );
  }
}
