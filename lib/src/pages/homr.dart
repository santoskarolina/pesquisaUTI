import 'package:flutter/material.dart';
import 'package:pacienteneuro/src/pages/login.dart';
import 'package:pacienteneuro/src/pages/questionarios.dart';
import 'package:pacienteneuro/src/pages/selecionarPaciente.dart';
import 'cadastrarPaciente.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromRGBO(52, 78, 65, 1),
          centerTitle: true,
          title: const Text("UTI Questionario"),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
            ),
          ],
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              boxQuestionario('Cadastrar paciente', () => const CadastrarPaciente()),
              boxQuestionario('Ver avaliações', () => const Questionarios()),
              boxQuestionario('Fazer avaliação', () => const SelecionarPaciente()),
            ],
          )
        ));
  }

  Widget boxQuestionario(String title, Widget Function() page) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) {
                return page();
              }));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 120.0,
              child: Image.asset("assets/logo.png"),
            ),
            Container(
                padding: const EdgeInsets.all(1.0),
                margin: const EdgeInsets.only(top: 2.0),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                ))
          ],
        ),
      ),
    );
}

}
