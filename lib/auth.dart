import 'package:flutter/material.dart';

import 'google_auth.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Google Auth"),
        ),
        body: Center(
          child: GestureDetector(
            onTap: () => Auth().signIn(context),
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 20.0,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: const Text("Google Auth"),
            ),
          ),
        ));
  }
}
