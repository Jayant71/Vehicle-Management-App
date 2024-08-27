import 'package:flutter/material.dart';
import 'package:vehicle_management_app/domain/usecases/auth/sigin.dart';
import 'package:vehicle_management_app/presentation/widgets/authappbutton.dart';

class CompleteProfilePage extends StatelessWidget {
  CompleteProfilePage({super.key});
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _contactNumberController =
      TextEditingController();
  final TextEditingController _employeeIdController = TextEditingController();
  final TextEditingController _departmentController = TextEditingController();
  final TextEditingController _designationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              const Center(
                child: Text(
                  'Complete Your Profile',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      fullNameField(context),
                      const SizedBox(
                        height: 20,
                      ),
                      emailField(context),
                      const SizedBox(
                        height: 20,
                      ),
                      contactNumberField(context),
                      const SizedBox(
                        height: 20,
                      ),
                      employeeIdField(context),
                      const SizedBox(
                        height: 20,
                      ),
                      departmentField(context),
                      const SizedBox(
                        height: 20,
                      ),
                      designationField(context),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      AuthAppButton(text: "Continue", onPressed: () async {}),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget emailField(BuildContext context) {
    return TextFormField(
      initialValue: "email",
      enabled: false,
      decoration: InputDecoration(
        labelText: 'Email',
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
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

  Widget fullNameField(BuildContext context) {
    return TextFormField(
      controller: _fullNameController,
      decoration: InputDecoration(
        labelText: 'Full Name',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter your full name';
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

  Widget departmentField(BuildContext context) {
    return TextFormField(
      controller: _departmentController,
      decoration: InputDecoration(
        labelText: 'Department',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter your department';
        }
        return null;
      },
    );
  }

  Widget designationField(BuildContext context) {
    return TextFormField(
      controller: _designationController,
      decoration: InputDecoration(
        labelText: 'Designation',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter your designation';
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
}
