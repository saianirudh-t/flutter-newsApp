import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/appbar.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final TextEditingController _dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: MainAppbar(),
        body: Padding(
          padding: const EdgeInsets.all(16.0), // Adds 16px space on all sides
          child: Form(
            key: GlobalKey<FormState>(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                Text("Email:", style: TextStyle(fontSize: 20)),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Enter your email",
                    border: OutlineInputBorder(),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                ),
                Text("Date of birth:", style: TextStyle(fontSize: 20)),
                TextFormField(
                  controller: _dateController,
                  decoration: InputDecoration(
                    labelText: "Select Date",
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                  readOnly: true, // Prevents keyboard from appearing
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );

                    if (pickedDate != null) {
                      // Format using intl package: DateFormat('yyyy-MM-dd').format(pickedDate)
                      _dateController.text = pickedDate.toString().split(
                        ' ',
                      )[0];
                    }
                  },
                ),
                Text("Password:", style: TextStyle(fontSize: 20)),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Enter your password:",
                    border: OutlineInputBorder(),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.center,
                  child: FilledButton(onPressed: () {}, child: Text("Signin")),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
