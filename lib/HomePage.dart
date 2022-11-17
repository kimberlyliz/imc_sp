import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:imc_sp/IMCapp.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
 
class HomePage extends StatelessWidget {
  const HomePage({super.key});
 
  @override
  Widget build(BuildContext context) {
    return IMCapp(title: 'Calculadora IMC',);
  }
}



/* Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
              onPressed: () => FirebaseAuth.instance.signOut(),
              icon: Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Text('Entrou!!'),
      ),
    );*/


