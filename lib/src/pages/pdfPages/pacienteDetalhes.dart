import 'package:pacienteneuro/src/pages/pdfPages/historicoDeLeitos.dart';
import 'package:pacienteneuro/src/pages/pdfPages/namePaciente.dart';
import 'package:pdf/widgets.dart' as pw;

pw.Widget pacienteDetalhesWIegetBox(paciente){
  return pw.Column(
    children: [
      namePacienteWidget(paciente),
      pw.Container(
        width:  double.infinity,
        padding: const pw.EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        child: pw.Column(
          children: [
            pw.SizedBox(
              child: pw.Text(
                "Leito atual",
                style: const pw.TextStyle(fontSize: 16.0),
              ),
            ),
            pw.Divider(),
            pw.SizedBox(
              height: 6.0,
            ),
            pw.Container(
                width: double.infinity,
                margin: const pw.EdgeInsets.only(top: 1.0, bottom: 1.0),
                alignment: pw.Alignment.centerLeft,
                child: pw.Text("Leito: ${paciente.leitos?.last.leitoId!} - Status ${paciente.leitos?.last.status!}")
            ),
          ],
        ),
      ),
      historicoDeLeitos(paciente),
    ],
  );
}