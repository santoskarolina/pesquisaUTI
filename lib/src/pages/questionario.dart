import 'package:flutter/material.dart';
import 'package:pacienteneuro/src/pages/homr.dart';
import 'package:pacienteneuro/src/pages/listas.dart';
import 'package:pacienteneuro/src/pages/models.dart';
import 'package:pacienteneuro/src/widgets/dialog.dart';

class QuestionarioPage extends StatefulWidget {

  Paciente? paciente;

  QuestionarioPage({Key? key, required this.paciente}) : super(key: key);

  @override
  State<QuestionarioPage> createState() => _QuestionarioPageState();
}

class _QuestionarioPageState extends State<QuestionarioPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void successDialog() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return customDialog(context, 'Sucesso!',
              'Avaliação concluída', 'Fechar', true);
        }).then((_) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(52, 78, 65, 1),
        centerTitle: true,
        title: const Text("Avaliação do paciente"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
          width: screenWidth,
          padding: const EdgeInsets.all(10),
          child: SizedBox(
              width: screenWidth,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromRGBO(52, 78, 65, 1),
                ),
                onPressed: () {
                  successDialog();
                },
                child: const Text(
                  'Finalizar questionário',
                  style: TextStyle(fontSize: 20),
                ),
              ))),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 20, vertical: 10.0),
            child: form(),
          ),
        ],
      ),
    );
  }

  Widget form() {
    return Form(
      key: _formKey,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: perguntasPrincipais.length,
        itemBuilder: (_, int index) {
          return Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  '${index + 1}: ${perguntasPrincipais[index].titulo}',
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.w700),
                ),
              ),
              Column(
                children: [
                  for (var question in perguntasPrincipais[index].perguntas)
                    CheckboxListTile(
                      title: Text(
                        question.titulo,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      value: question.check,
                      onChanged: (bool? value) {
                        setState(() {
                          perguntasPrincipais[index].valueCheck = value;
                          question.check = value!;
                        });
                      },
                    ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
