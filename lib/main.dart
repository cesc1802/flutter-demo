import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Column1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 10,
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
                child: Container(
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                        child: Column(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Container(
                                  color: Colors.black54,
                                )),
                            Expanded(
                                flex: 1,
                                child: Container(
                                  color: Colors.orange,
                                )),
                            Expanded(
                                flex: 1,
                                child: Container(
                                  color: Colors.lightBlueAccent,
                                )),
                            Expanded(
                                flex: 1,
                                child: Container(
                                  color: Colors.pinkAccent,
                                ))
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.blue,
                        child: Column(
                          children: [
                            Flexible(
                              flex: 3,
                              child: Container(
                                color: Colors.blue,
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Container(
                                color: Colors.white,
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Container(
                                      color: Colors.green,
                                    )),
                                    Expanded(
                                        child: Container(
                                      color: Colors.yellowAccent,
                                    ))
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ))
                ],
              ),
            )),
            Expanded(
                flex: 2,
                child: Container(
                  color: Colors.black,
                )),
            Expanded(
                flex: 2,
                child: Container(
                  color: Colors.yellow,
                )),
            Expanded(
                flex: 2,
                child: Container(
                  color: Colors.white,
                ))
          ],
        ),
      ),
    );
  }
}

class Column2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 12,
      child: Container(
        color: Colors.pinkAccent,
      ),
    );
  }
}

class Column3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        color: Colors.white,
      ),
    );
  }
}

class Column4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 7,
      child: Container(
        color: Colors.green,
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  Widget _App() {
    return Stack(
      children: [
        Row(
          children: [
            Column1(),
            Column2(),
            Column3(),
            Column4(),
          ],
        ),
        Positioned(
            top: 400,
            left: 50,
            child: Container(
              color: Colors.black,
              width: 150,
              height: 150,
            )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Flutter layout demo'),
          ),
          body: _App()),
    );
  }
}
