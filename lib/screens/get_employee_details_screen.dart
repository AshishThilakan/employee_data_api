import 'package:flutter/material.dart';



import '../api services class/api_services.dart';
import 'get_details_screen.dart';

class AddEmployeeScreen extends StatefulWidget {
  const AddEmployeeScreen({super.key});

  @override
  State<AddEmployeeScreen> createState() => _AddEmployeeScreenState();
}

class _AddEmployeeScreenState extends State<AddEmployeeScreen> {

  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        onPressed: () async {
          if (formKey.currentState!.validate()) {
            setState(() {
              isLoading = true;
            });
            await ApiServices().addEmployee(
              name: nameController.text,
              address: addressController.text,
              city: cityController.text,
              dob: dobController.text,
              email: emailController.text,
              gender: genderController.text,
              phone: phoneController.text,
            );
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => GetEployeeDetailsScreen(),
                ),
                    (route) => false);
          }
        },
        child: Icon(Icons.save),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Add Employees'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                      hintText: 'Enter Name',
                      border: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(80)),
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter your name';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                        hintText: 'Enter Email',
                        border: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(80)),
                        )),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter your Email';
                      }
                      return null;
                    }),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                    controller: phoneController,
                    decoration: InputDecoration(
                        hintText: 'Enter Phone number',
                        border: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(80)),
                        )),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter your Phone number';
                      }
                      return null;
                    }),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                    controller: addressController,
                    decoration: InputDecoration(
                        hintText: 'Enter Address',
                        border: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(80)),
                        )),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter your address';
                      }
                      return null;
                    }),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                    controller: cityController,
                    decoration: InputDecoration(
                        hintText: 'Enter City',
                        border: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(80)),
                        )),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter your city';
                      }
                      return null;
                    }),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                    controller: dobController,
                    decoration: InputDecoration(
                        hintText: 'Date of birth',
                        border: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(80)),
                        )),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter your date of birth';
                      }
                      return null;
                    }),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                    controller: genderController,
                    decoration: InputDecoration(
                        hintText: 'Gender',
                        border: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(80)),
                        )),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter your gender';
                      }
                      return null;
                    }),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}