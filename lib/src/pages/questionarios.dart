import 'package:flutter/material.dart';
import 'package:pacienteneuro/src/pages/detalhesPaciente.dart';
import 'package:pacienteneuro/src/pages/listas.dart';

class Questionarios extends StatefulWidget {
  const Questionarios({Key? key}) : super(key: key);

  @override
  State<Questionarios> createState() => _QuestionariosState();
}

class _QuestionariosState extends State<Questionarios> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(52, 78, 65, 1),
        centerTitle: true,
        title: const Text("Avaliação dos pacientes"),
      ),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 20, vertical: 10.0),
            child: _body(),
          ),
        ],
      ),
    );
  }

  Widget _body() {
    return Container(
      padding: const EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: pacientesTodos.length,
        itemBuilder: (_, int index) {
          return GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetalhesPaciente(pacienteId: index)),
              );
            },
            child: Card(
              elevation: 6,
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 6.0),
                      child: Text(pacientesTodos[index].nome!),),
                    // subtitle: Text('Leito: ${pacientes[index].leito.leitoId}, Status: ${pacientes[index].leito.status}'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
