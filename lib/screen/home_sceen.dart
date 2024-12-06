//import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rlddrs_project/screen/signin_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child:ElevatedButton(
        child:Text("Logout"),
        onPressed: (){
          FirebaseAuth.instance.signOut().then((value){
            print("Signed Out");
          Navigator.push(context,
              MaterialPageRoute(builder: (context)=>SignInScreen(title: 'Rice leaf Disease Detectio And emedies Sugestions')));
        });
        }
      )
      )
    );


  }
}
