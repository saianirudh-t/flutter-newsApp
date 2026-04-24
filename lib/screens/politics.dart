import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/appbar.dart';

class Politics extends StatelessWidget {
  const Politics({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: MainAppbar(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                height: 400,
                child: ListView.builder(
                  itemCount: 11,
                  itemBuilder: (context, position) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          position.toString(),
                          style: TextStyle(fontSize: 22.0),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: 15,
                  padding: EdgeInsets.all(16),
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        leading: Icon(Icons.star, color: Colors.orange),
                        title: Text('Feature ${index + 1}'),
                        subtitle: Text('This is feature number ${index + 1}.'),
                        trailing: Icon(Icons.more_vert),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(
                    color: Colors.blue,
                    thickness: 6,
                    indent: 60,
                    endIndent: 40,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
