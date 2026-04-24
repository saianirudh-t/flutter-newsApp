import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/appbar.dart';

class Sports extends StatefulWidget {
  const Sports({super.key});

  @override
  State<Sports> createState() => _SportsState();

  static const TextStyle textStyle = TextStyle(
    color: Colors.white,
    fontSize: 14,
  );
}

class _SportsState extends State<Sports> {
  int _currentIdx = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: MainAppbar(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 30,
            children: [
              Container(
                width: 600,
                height: 600,
                color: Colors.amberAccent,
                child: Stack(
                  children: [
                    Positioned(
                      top: 20,
                      left: 20,
                      width: 300,
                      height: 300,
                      child: Container(
                        color: Colors.black,
                        child: Text("THis is card 1", style: Sports.textStyle),
                      ),
                    ),
                    Positioned.fill(
                      top: 50,
                      left: 50,
                      child: Container(
                        color: Colors.pink,
                        child: Text("THis is card 2", style: Sports.textStyle),
                      ),
                    ),
                    Positioned(
                      top: 80,
                      left: 80,
                      width: 300,
                      height: 300,
                      child: Container(
                        color: Colors.blueAccent,
                        child: Text("THis is card 3", style: Sports.textStyle),
                      ),
                    ),
                    Positioned(
                      top: 100,
                      left: 100,
                      width: 300,
                      height: 300,
                      child: Container(
                        color: Colors.red,
                        child: Text(
                          "THis is card 4",
                          style: Sports.textStyle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 40,
                children: [
                  ElevatedButton(
                    onPressed: () => setState(() => _currentIdx = 0),
                    child: Text("fotball"),
                  ),
                  ElevatedButton(
                    onPressed: () => setState(() => _currentIdx = 1),
                    child: Text("cricket"),
                  ),
                  ElevatedButton(
                    onPressed: () => setState(() => _currentIdx = 2),
                    child: Text("olympics"),
                  ),
                ],
              ),
              Expanded(
                child: IndexedStack(
                  index: _currentIdx,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 600,
                      decoration: BoxDecoration(border: Border.all(width: 2.0)),
                      child: Text(
                        "Football matches",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 600,
                      decoration: BoxDecoration(border: Border.all(width: 2.0)),
                      child: Text("IPL updates", textAlign: TextAlign.center),
                    ),
                    Container(
                      width: double.infinity,
                      height: 600,
                      decoration: BoxDecoration(border: Border.all(width: 2.0)),
                      child: Text(
                        "Olympics information and history",
                        textAlign: TextAlign.center,
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
