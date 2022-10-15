import 'package:flutter/material.dart';

class DecoratedBoxWidget extends StatelessWidget {
  const DecoratedBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget DecoratedBox'),
      ),
      // body: SizedBox(
      //   width: 400,
      //   height: 200,
      //   child: Container(
      //     color: Colors.red,
      //   ),
      // ),
      body: const DecoratedBox(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.yellow, Colors.red]),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                offset: Offset(3, 3),
                blurRadius: 4.0,
              )
            ]),
        child: FloatingActionButton(
          onPressed: null,
          child: Text('test button'),
        ),
      ),
    );
  }
}
