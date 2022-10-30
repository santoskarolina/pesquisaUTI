import 'dart:core';

import 'package:intl/intl.dart';
import 'package:pacienteneuro/src/pages/models.dart';
import 'package:pdf/widgets.dart' as pw;

formatDate(_date) {
  var inputFormat = DateFormat('yyyy-MM-dd');
  var inputDate = inputFormat.parse(_date);
  var outputFormat = DateFormat('dd/MM/yyyy');
  return outputFormat.format(inputDate);
}

pw.Widget namePacienteWidget(Paciente paciente) {
  DateTime currentDate = DateTime.now();
  var formatter = DateFormat('dd/MM/yyyy');
  String formattedDate = formatter.format(currentDate);

  return pw.Container(
    width: double.infinity,
    padding: const pw.EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
    child: pw.Column(
      children: [
        pw.Row(crossAxisAlignment: pw.CrossAxisAlignment.center,
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.SizedBox(
                child: pw.Text(
                  "Dados do paciente",
                  style: const pw.TextStyle(fontSize: 16.0),
                ),
              ),
              pw.SizedBox(
                child: pw.Text(
                  formattedDate,
                  style: const pw.TextStyle(fontSize: 16.0),
                ),
              ),
            ]),
        pw.Divider(),
        pw.SizedBox(
          height: 6.0,
        ),
        pw.Container(
            width: double.infinity,
            margin: const pw.EdgeInsets.only(top: 1.0, bottom: 1.0),
            alignment: pw.Alignment.centerLeft,
            child: pw.Text("Nome completo: ${paciente.nome!}")),
        pw.Container(
            width: double.infinity,
            margin: const pw.EdgeInsets.only(top: 1.0, bottom: 1.0),
            alignment: pw.Alignment.centerLeft,
            child: pw.Text("Sexo: ${paciente.sexo!}")),
        pw.Container(
            width: double.infinity,
            margin: const pw.EdgeInsets.only(top: 1.0, bottom: 1.0),
            alignment: pw.Alignment.centerLeft,
            child: pw.Text(
                "Data de nascimento: ${formatDate(paciente.dataNascimento!)}")),
      ],
    ),
  );
}
