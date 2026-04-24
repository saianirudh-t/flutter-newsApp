import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter_application_1/screens/appbar.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});
  @override
  State<Contact> createState() => _Contact();
}

class MyValidators {
  // Global empty check
  static String? required(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  static String? mobile(String? value) {
    final val = value ?? "";
    // Check if every character is a digit
    if (!RegExp(r'^\d+$').hasMatch(val)) {
      return "Mobile no should contain digits only";
    }
    if (val.length != 10) {
      return "Mobile number length should be 10";
    }
    return null;
  }
}

class _Contact extends State<Contact> {
  bool checked = false;
  int? selectedValue = 1;
  bool _isSwitched = false;
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _userData = {};
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: MainAppbar(),
        body: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Contact Us",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "First name:",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  labelText: "Enter your first name",
                                  border: OutlineInputBorder(),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                ),
                                validator: MyValidators.required,
                                onSaved: (val) =>
                                    _userData['First name'] = val!,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Last name:",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                  labelText: "Enter your last name",
                                  border: OutlineInputBorder(),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                ),
                                validator: MyValidators.required,
                                onSaved: (val) => _userData['Last name'] = val!,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Mobile:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Enter your mobile",
                        border: OutlineInputBorder(),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      ),
                      validator: (value) {
                        // Check required first
                        String? error = MyValidators.required(value);
                        if (error != null) return error;

                        // Then check format
                        return MyValidators.mobile(value);
                      },
                      onSaved: (val) => _userData['Mobile'] = val!,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Email:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Enter your Email",
                        border: OutlineInputBorder(),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      ),
                      validator: MyValidators.required,
                      onSaved: (val) => _userData['Email'] = val!,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Select your gender:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    RadioGroup<int>(
                      groupValue: selectedValue,

                      onChanged: (int? value) {
                        setState(() {
                          selectedValue = value;
                        });
                      },
                      child: Column(
                        children: const [
                          RadioListTile<int>(
                            value: 1,
                            title: Text('Male'),
                            contentPadding: EdgeInsets.zero,
                            visualDensity: VisualDensity(
                              horizontal: -4,
                              vertical: -4,
                            ),
                            horizontalTitleGap: 4,
                            activeColor: Color.fromARGB(255, 7, 83, 245),
                          ),
                          RadioListTile<int>(
                            value: 2,
                            title: Text('Female'),
                            contentPadding: EdgeInsets.zero,
                            visualDensity: VisualDensity(
                              horizontal: -4,
                              vertical: -4,
                            ),
                            horizontalTitleGap: 4,
                            activeColor: Color.fromARGB(255, 7, 83, 245),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: checked,
                          onChanged: (bool? value) {
                            setState(() {
                              checked = value!;
                            });
                          },
                          activeColor: const Color.fromARGB(255, 7, 83, 245),
                        ),

                        const Text(
                          "Subscribe to news letter",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    SwitchListTile(
                      contentPadding: EdgeInsets.zero,
                      title: const Text(
                        "Enable notifications",
                        style: TextStyle(fontSize: 20),
                      ),
                      value: _isSwitched,
                      activeThumbColor: const Color.fromARGB(255, 7, 83, 245),
                      onChanged: (bool value) {
                        setState(() {
                          _isSwitched = value;
                        });
                      },
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 40,

                      child: FilledButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            _userData['Gender'] = (selectedValue == 1)
                                ? "male"
                                : "female";
                            _userData['Subscribed to newsletter'] = checked;
                            _userData['NotificationsEnabled'] = _isSwitched;
                            debugPrint(
                              const JsonEncoder.withIndent(
                                '  ',
                              ).convert(_userData),
                            );
                          }
                        },

                        style: FilledButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 7, 83, 245),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          "Send",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
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
}
