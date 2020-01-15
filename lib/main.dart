import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color color1 = Colors.red;
  Color color2 = Colors.amber;
  bool isAccepted = false;
  Color targetColor;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("Latihan Dragable"),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Draggable<Color>(
                      data: color1,
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: Material(
                          color: color1,
                          shape: StadiumBorder(),
                          elevation: 3.0,
                        ),
                      ),
                      childWhenDragging: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: Material(
                          color: Colors.grey,
                          shape: StadiumBorder(),
                          elevation: 0,
                        ),
                      ),
                      // memberi bentuk lingkaran  ketika di drag
                      feedback: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: Material(
                          color: color1.withOpacity(0.7),
                          shape: StadiumBorder(),
                          elevation: 3.0,
                        ),
                      ),
                    ),
                    Draggable<Color>(
                      data: color2,
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: Material(
                          color: color2,
                          shape: StadiumBorder(),
                          elevation: 3.0,
                        ),
                      ),
                      childWhenDragging: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: Material(
                          color: Colors.grey,
                          shape: StadiumBorder(),
                          elevation: 0,
                        ),
                      ),
                      // memberi bentuk lingkaran  ketika di drag
                      feedback: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: Material(
                          color: color2.withOpacity(0.7),
                          shape: StadiumBorder(),
                          elevation: 3.0,
                        ),
                      ),
                    )
                  ],
                ),
                DragTarget<Color>(
                    onWillAccept: (value) => true,
                    onAccept: (value) {
                      isAccepted = true;
                      targetColor = value;
                    },
                    builder: (context, candidates, reject) {
                      // memberi pengembalian ketika isAccepted true atau false
                      return (isAccepted)
                          ? SizedBox(
                              width: 100.0,
                              height: 100.0,
                              child: Material(
                                color: targetColor,
                                shape: StadiumBorder(),
                              ))
                          : SizedBox(
                              width: 100.0,
                              height: 100.0,
                              child: Material(
                                color: Colors.black26,
                                shape: StadiumBorder(),
                              ));
                    })
              ],
            )));
  }
}
