import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:session3/crud.dart';
import 'package:session3/google_auth.dart';

class InAppHomePage extends StatefulWidget {
  const InAppHomePage({Key? key}) : super(key: key);

  @override
  State<InAppHomePage> createState() => _InAppHomePageState();
}

class _InAppHomePageState extends State<InAppHomePage> {
  final nameCont = TextEditingController();

  @override
  void initState() {
    TextEditingController nameCont;
    super.initState();
  }

  @override
  void dispose() {
    nameCont.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final instance = FirebaseAuth.instance.currentUser;
    String? photo = instance!.photoURL;
    String? name = instance.displayName;
    String? email = instance.email;

    return Scaffold(
        appBar: AppBar(
          title: Text("Welcome $name"),
          actions: [
            CircleAvatar(
              backgroundImage: NetworkImage(photo.toString()),
            ),
            const SizedBox(width: 20.0),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("you are logged in with $email"),
              const SizedBox(height: 20.0),
              GestureDetector(
                onTap: () => Auth().siignOut(context),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 20.0,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: const Text("Log out"),
                ),
              ),
              const SizedBox(height: 30.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  controller: nameCont,
                  keyboardType: TextInputType.text,
                  decoration:
                      const InputDecoration(hintText: "Enter your name:"),
                ),
              ),
              const SizedBox(height: 10.0),
              ElevatedButton(
                  onPressed: () {
                    Crud().create(nameCont.toString());
                    print(nameCont.toString());
                  },
                  child: const Text("Submit"))
            ],
          ),
        ));
  }
}
