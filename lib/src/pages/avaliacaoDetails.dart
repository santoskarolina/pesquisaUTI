import 'package:flutter/material.dart';
import 'package:pacienteneuro/src/pages/models.dart';

class AvaliacaoDetails extends StatelessWidget {
  late AvaliacaoPaciente? avaliacaoPaciente;

  AvaliacaoDetails({required this.avaliacaoPaciente, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(52, 78, 65, 1),
        centerTitle: true,
        title: const Text("Avaliação"),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 20.0),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: avaliacaoPaciente!.perguntas.length,
            itemBuilder: (_, int index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    padding: const EdgeInsets.only(top: 10.0, bottom: 1.0),
                    child: Text(
                      '${index + 1} - ${avaliacaoPaciente!.perguntas[index].titulo}',
                      style: const TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const Divider(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (var questionCheck
                          in avaliacaoPaciente!.perguntas[index].perguntas)
                        Row(
                          children: [
                            Icon(Icons.check_circle,
                                color: questionCheck.check
                                    ? Colors.green
                                    : Colors.red[800]),
                            const SizedBox(
                              width: 5.0,
                            ),
                            Flexible(
                              child: Text(
                                questionCheck.titulo,
                                style:
                                const TextStyle(fontWeight: FontWeight.w600),
                              ),
                            )
                          ],
                        )
                    ],
                  ),
                ],
              );
            }),
      ),
    );
  }
}
