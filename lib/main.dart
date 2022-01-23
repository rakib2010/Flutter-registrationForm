import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:registration_form/userModel.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    home: registrationPage(),
  ));
}

class registrationPage extends StatefulWidget {
  const registrationPage({Key? key}) : super(key: key);

  @override
  _registrationPageState createState() => _registrationPageState();
}

class _registrationPageState extends State<registrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration"),
      ),
      body: RegistrationBody(),
    );
  }
}

class RegistrationBody extends StatefulWidget {
  const RegistrationBody({Key? key}) : super(key: key);

  @override
  _RegistrationBodyState createState() => _RegistrationBodyState();
}

class _RegistrationBodyState extends State<RegistrationBody> {
  int gender = 0;

  var  course = ["jAVA", "FLUTTER", "Javascript"];

  var selectedItem;



  String dropdownValue = 'System Analysis & Design';

  var nameController = TextEditingController();
  var userNameController = TextEditingController();
  var passwordController = TextEditingController();
  var addressController = TextEditingController();
  



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text("User Registraion"),

          TextFormField(
            controller: nameController,
            decoration: InputDecoration(
              labelText: "Name",

            ),
          ),

          TextFormField(
            controller: userNameController,
            decoration: InputDecoration(
              
              labelText: "Username",

            ),

          ),

          TextFormField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: "Password",

            ),

          ),

          TextFormField(
            controller: addressController,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              labelText: "Address",

            ),

          ),





          // DropdownButtonFormField(
          //   value: selectedItem,
          //   items: course.map((course){
          //     return DropdownMenuItem(
          //         value: selectedItem,
          //
          //         child: Text(course));
          //
          //
          //   }).toList(),
          //   onChanged: (value){
          //     selectedItem = value.toString();
          //
          //   },
          // ),





                  Container(child: Text("Courses: ")),
                  Container(
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      items: <String>['System Analysis & Design', 'WPSI', '.NET'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          this.dropdownValue = value.toString();

                        });
                      },
                    ),
                  ),


          Container(child: Text("Gender: ")),
                   ListTile(
                    title: Text(
                        'Male'
                    ),
                    leading: Radio(
                      value: 0,
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = 0;
                        });
                      },
                    ),
                  ),

               ListTile(
                    title: Text(
                        'Female'
                    ),
                    leading: Radio(
                      value: 1,
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = 1;
                        });
                      },
                    ),
                  ),


                ElevatedButton(
                    onPressed : () async {
                      String name = nameController.text.toString();
                      String username = userNameController.text.toString();
                      String password = passwordController.text.toString();
                      String address = addressController.text.toString();
                      String gen = gender == 0? 'Male': 'Female';
                      String course = this.dropdownValue;

                      User user = User(name: name, username: username, password: password, address: address, course: course, gender: gen);
                      print(user);

                      fetchResult(user).then((value) => print(value.body));

                },
                    child: Text("Submit"),
                )





        ],
      ),
    );
  }
  Future<http.Response> fetchResult(User user) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
    };

    final response = await http
        .post(Uri.parse('http://localhost:8080/save'),headers: requestHeaders,body: jsonEncode(user.toMap()));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return  response;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }










}



