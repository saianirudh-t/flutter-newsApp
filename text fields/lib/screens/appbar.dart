import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Sports.dart';
import 'package:flutter_application_1/screens/contact.dart';
import 'package:flutter_application_1/screens/home_screen.dart';
import 'package:flutter_application_1/screens/politics.dart';
import 'package:flutter_application_1/screens/signin.dart';

class MainAppbar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: Border(bottom: BorderSide(color: Colors.grey, width: 1)),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left Column
          Text(
            "News",
            style: TextStyle(
              fontSize: 30,
              color: Color.fromARGB(255, 1, 57, 153),
            ),
          ),
          // Right Column
          Row(
            spacing: 10,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => Homescreen()),
                  );
                },
                child: Text("Home", style: TextStyle(fontSize: 20)),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => Politics()),
                  );
                },
                child: Text("Politics", style: TextStyle(fontSize: 20)),
              ),
              GestureDetector(
                onTap: () {
                  if (context.widget is! Sports) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => Sports()),
                    );
                  }
                },
                child: Text("Sports", style: TextStyle(fontSize: 20)),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => Contact()),
                  );
                },
                child: Text("Contact us ", style: TextStyle(fontSize: 20)),
              ),
            ],
          ),

          SearchBar(
            constraints: const BoxConstraints(maxWidth: 125),
            leading: const Icon(Icons.search), // The search icon container
            hintText: 'Search..',
            onTap: () {
              /* handle tap */
            },
          ),

          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => Signin()),
              );
            },
            child: Icon(Icons.person_rounded, color: Colors.blue[400]),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
