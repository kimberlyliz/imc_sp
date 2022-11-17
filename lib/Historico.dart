
import 'package:flutter/material.dart';
import 'package:imc_sp/LeftMenu.dart';

class Historico extends StatefulWidget {
  const Historico({super.key});

  @override
  State<Historico> createState() => _HistoricoState();
}

class _HistoricoState extends State<Historico> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const LeftMenu(),
      appBar: AppBar(
        title: const Text('Historico'),
        backgroundColor:  Colors.indigo[800],
      ),
      
    );
  }
}