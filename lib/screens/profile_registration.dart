import 'package:flutter/material.dart';
import '../widgets/custom_textformfiled.dart';

class ProfileRegistration extends StatefulWidget {
  const ProfileRegistration({super.key});

  @override
  State<ProfileRegistration> createState() => _ProfileRegistrationState();
}

class _ProfileRegistrationState extends State<ProfileRegistration> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController bioController = TextEditingController();

  bool isOnlyDigits(String s) {
    return RegExp(r'^[0-9]+$').hasMatch(s);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4A70A9),
        title: Text(
          'Profile Registration',
          style: TextStyle(fontSize: 35, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xFF8FABD4),
              ),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    CustomTextFormFiled(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                      title: 'Full Name',
                      hint: 'Enter your full name',
                      controller: nameController,
                    ),
                    CustomTextFormFiled(
                      validator: (value) {
                        if (!value!.contains('@') || value.isEmpty) {
                          return 'Please enter valid Email';
                        }
                        return null;
                      },
                      title: 'Email Address',
                      hint: 'Enter your email address',
                      controller: emailController,
                    ),
                    CustomTextFormFiled(
                      validator: (value) {
                        if (!isOnlyDigits(value!)) {
                          if (value.length != 10 ||
                              value.isEmpty ||
                              value.length != 11) {
                            return 'Please enter valid Phone Number ';
                          }
                        }
                        return null;
                      },
                      title: 'Phone Number',
                      hint: 'Enter your phone number',
                      controller: phoneController,
                    ),
                    CustomTextFormFiled(
                      validator: (value) {
                        if (!isOnlyDigits(value!)) {
                          if (18 < value.length ||
                              value.length > 100 ||
                              value.isEmpty) {
                            return 'Please enter valid age ';
                          }
                        }
                        return null;
                      },
                      title: 'Age',
                      hint: 'Enter your phone number',
                      controller: ageController,
                    ),
                    CustomTextFormFiled(
                      title: 'bio',
                      hint: 'Enter your bio "optional" ',
                      controller: bioController,
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF4A70A9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Form Submitted Successfully"),
                        backgroundColor: Color(0xFF4A70A9),
                      ),
                    );
                  }
                },
                child: Text('Submit',style: TextStyle(fontSize: 20,color: Colors.white),),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  nameController.clear();
                  emailController.clear();
                  phoneController.clear();
                  ageController.clear();
                  bioController.clear();
                  },
                child: Text('clear',style: TextStyle(fontSize: 20,color: Colors.white),),
              ),
            ],
          ),
        ],
      ),
    );
  }
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    ageController.dispose();
    bioController.dispose();
    super.dispose();
  }
}
