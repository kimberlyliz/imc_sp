import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:imc_sp/HomePage.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  //no lugar dessa linha de const:
  //static final String title = 'Firebase Auth UI';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora IMC',
      //no lugar desse title seria:
      //title: title
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        //customizando o TextField
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
        //Customizando Botão de Entrar
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            minimumSize: Size.fromHeight(50),
            textStyle: TextStyle(fontSize: 20),
            backgroundColor: Colors.blue,
            primary: Colors.white,
          ),
        ),
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});
  @override
  Widget build(BuildContext context) => StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomePage();
          } else {
            return SignInScreen(
              providerConfigs: [
                EmailProviderConfiguration(),
                //GoogleProviderConfiguration(clientId: '...',)
              ],
            );
          }
        },
      );
}






//vídeo base:
//https://youtu.be/tre6TfQELsg