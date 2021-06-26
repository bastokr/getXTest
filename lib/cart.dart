import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      Container(
        child: Column(
          children: <Widget>[
            Text(
              "",
              style: TextStyle(color: Colors.red),
            ),
            Expanded(
                child: Container(
                    width: double.infinity,
                    child: Image.asset(
                      'assets/jumun.png',
                      //width: 200,
                      // fit: BoxFit.fitHeight,
                    )))
          ],
        ),
      ),
    ]));
  }
}
