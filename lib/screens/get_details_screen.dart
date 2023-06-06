import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../api services class/api_services.dart';
import '../api_models/get_details_model.dart';
import 'get_employee_details_screen.dart';

class GetEployeeDetailsScreen extends StatefulWidget {
  const GetEployeeDetailsScreen({super.key});

  @override
  State<GetEployeeDetailsScreen> createState() =>
      _GetEployeeDetailsScreenState();
}

class _GetEployeeDetailsScreenState extends State<GetEployeeDetailsScreen> {
  List<GetMethodModel> employeeList = [];
  bool isLoading = true;
  @override
  void initState() {
    getEmpolyeeData();
    super.initState();
  }

  getEmpolyeeData() async {
    employeeList = await ApiServices().fetchEmployees();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Employee details'),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddEmployeeScreen(),
              ));
        },
        child: Container(
          color: Colors.blueAccent,
          padding: EdgeInsets.all(10),
          child: Text(
            'Add employee',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: employeeList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Text(employeeList[index].id.toString()),
            title: Text(employeeList[index].name.toString()),
            subtitle: Text(employeeList[index].phone.toString()),
          );
        },
      ),
    );
  }
}