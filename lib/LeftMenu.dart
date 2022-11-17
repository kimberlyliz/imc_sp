import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:imc_sp/Historico.dart';
import 'package:imc_sp/IMCapp.dart';


class LeftMenu extends StatelessWidget {
  const LeftMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildHeader(context),
            buildMenuItems(context),
          ],
        ),
      ),
    );
  }
  Widget buildHeader(BuildContext context) => Container(
    color:Colors.indigo[800],
    padding: EdgeInsets.only(
      top: MediaQuery.of(context).padding.top,
    ),
  );

  Widget buildMenuItems(BuildContext context) => Container(
    padding: const EdgeInsets.all(24),
    child: Wrap(
      runSpacing: 16, // espaço vertical
      children: [
        ListTile(
          leading: const Icon(Icons.home_outlined),
          title: const Text('Home'),
          onTap: () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const IMCapp(title: 'Calculadora IMC',),
            )),
        ),
        ListTile(
          leading: const Icon(Icons.workspaces_outline),////////MUDAR ICONEEEEE
          title: const Text('Histórico'),
          onTap: () {
            //close navigation drawer before
            Navigator.pop(context);
            
            Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const Historico(),
            ));
          }
        ),
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text('Sair'),
          onTap: () => FirebaseAuth.instance.signOut(),
        ),
      ],
    ),
  );

}