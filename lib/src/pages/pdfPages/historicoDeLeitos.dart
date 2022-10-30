import 'dart:core';
import 'package:pacienteneuro/src/pages/models.dart';
import 'package:pdf/widgets.dart' as pw;

pw.Widget historicoDeLeitos(Paciente paciente) {
  return pw.Column(
    children: [
      pw.Container(
        width: double.infinity,
        padding: const pw.EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        child: pw.Column(
          children: [
            pw.SizedBox(
              child: pw.Text(
                "Histórico de leitos",
                style: const pw.TextStyle(fontSize: 16.0),
              ),
            ),
            pw.Divider(),
            pw.Container(
              alignment: pw.Alignment.centerLeft,
              child: pw.ListView.builder(
                itemCount: paciente.leitos!.length,
                itemBuilder: (_, int index) {
                  return pw.Column(children: [
                    pw.Container(
                      padding: const pw.EdgeInsets.all(8.0),
                      alignment: pw.Alignment.centerLeft,
                      child: pw.Text(
                          'Leito ${paciente.leitos![index].leitoId} - Status: ${paciente.leitos![index].status}',
                          textAlign: pw.TextAlign.left),
                    ),
                    // pw.Text('$paciente.avaliacaoPaciente?.perguntas.last.perguntas.first.titulo'),
                    // pw.Column(
                    //   children: [
                    //     pw.Text(paciente.avaliacaoPaciente!.perguntas[index]
                    //         .perguntas.last.titulo),
                    //     // for (var question in paciente.avaliacaoPaciente!.perguntas[index].perguntas)
                    //     // pw.Text(question.titulo, style: const pw.TextStyle(fontSize: 10.0)),
                    //   ],
                    // ),
                  ]);
                },
              ),
            )
          ],
        ),
      ),
    ],
  );
}
