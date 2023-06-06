import 'dart:convert';
import 'package:http/http.dart' as http;



import '../api_models/get_details_model.dart';

class ApiServices {
  Future<List<GetMethodModel>> fetchEmployees() async {
    final response = await http
        .get(Uri.parse('https://cashbes.com/attendance/apis/employees'));

    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body);
      final List<GetMethodModel> loadedEmployees = [];

      for (final employee in decodedData['data']) {
        loadedEmployees.add(GetMethodModel.fromJson(employee));
      }
      return loadedEmployees;
    } else {
      throw Exception('Failed to load employees');
    }
  }

  Future<void> addEmployee({
    required String name,
    required String dob,
    required String email,
    required String city,
    required String gender,
    required String address,
    required String phone,
  }) async {
    final response = await http.post(
        Uri.parse('https://cashbes.com/attendance/apis/add_employee'),
        body: {
          'name': name,
          'dob': '2023-05-01',
          'email': 'sjdfhj@gmail',
          'city': 'kjfk',
          'gender': 'Female',
          'address': 'nlksdhfo',
          'phone': ''
        });
  }
}