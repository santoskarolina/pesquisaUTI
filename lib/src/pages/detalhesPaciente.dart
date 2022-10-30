import 'package:flutter/material.dart';
import 'package:pacienteneuro/src/pages/avaliacaoDetails.dart';
import 'package:pacienteneuro/src/pages/listas.dart';
import 'package:pacienteneuro/src/pages/models.dart';
import 'package:pacienteneuro/src/pages/pacienteWidgets/boxDetalhes.dart';
import 'package:intl/intl.dart';
import 'package:pacienteneuro/src/pages/pdfPages/pacienteDetalhes.dart';
import 'package:pacienteneuro/src/pages/pdfPreview.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class DetalhesPaciente extends StatefulWidget {
  int? pacienteId;

  DetalhesPaciente({required this.pacienteId, Key? key}) : super(key: key);

  @override
  State<DetalhesPaciente> createState() => _DetalhesPacienteState();
}

class _DetalhesPacienteState extends State<DetalhesPaciente> {
  late Paciente paciente;

  @override
  void initState() {
    getPaciente();
    super.initState();
  }

  getPaciente() {
    if (widget.pacienteId != null) {
      var index = widget.pacienteId;
      Paciente pacienteFind = pacientesTodos.elementAt(index!);
      setState(() {
        paciente = pacienteFind;
      });
    }
  }

  formatDate(_date) {
    var inputFormat = DateFormat('yyyy-MM-dd');
    var inputDate = inputFormat.parse(_date);
    var outputFormat = DateFormat('dd/MM/yyyy');
    return outputFormat.format(inputDate);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(52, 78, 65, 1),
        centerTitle: true,
        title: const Text("Informações do paciente"),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.print,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              _displayPdf();
            },
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
          width: screenWidth,
          padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          child: SizedBox(
              width: screenWidth,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromRGBO(52, 78, 65, 1),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AvaliacaoDetails(avaliacaoPaciente: paciente.avaliacaoPaciente)),
                  );
                },
                child: const Text(
                  'Ver avaliação',
                  style: TextStyle(fontSize: 20),
                ),
              ))),
      body: body(),
    );
  }

  Widget body() {
    double screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            width: screenWidth,
            child: Card(
                elevation: 4,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  child: Column(
                    children: [
                      SizedBox(
                        width: screenWidth,
                        child: const Text(
                          "Dados do paciente",
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 6.0,
                      ),
                      boxPaciente(context, 'Nome do paciente', paciente.nome!),
                      boxPaciente(context, 'Sexo do paciente', paciente.sexo!),
                      boxPaciente(context, 'Data de nascimento',
                          formatDate(paciente.dataNascimento!)),
                    ],
                  ),
                )),
          ),
          paciente.leitos!.isNotEmpty ?  Container(
            padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            width: screenWidth,
            child: Card(
                elevation: 4,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  child: Column(
                    children: [
                      SizedBox(
                        width: screenWidth,
                        child: const Text(
                          "Leito atual",
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 6.0,
                      ),
                      boxPaciente(context, 'Leito',
                          '${paciente.leitos!.last.leitoId.toString()}- Status: ${paciente.leitos!.last.status.toString()}'),
                    ],
                  ),
                )),
          ) : const SizedBox(width: 0.0, height: 0.0,)
        ],
      ),
    );
  }

  /// display a pdf document.
  void _displayPdf() {
    final doc = pw.Document();
    doc.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pacienteDetalhesWIegetBox(paciente);
        },
      ),
    );

    /// open Preview Screen
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PreviewScreen(doc: doc),
        ));
  }
}

/// create PDF & print it
// void _createPdf(Paciente paciente, context) async {
//   final doc = pw.Document();
//
//   /// for using an image from assets
//   // final image = await imageFromAssetBundle('assets/image.png');
//
//   doc.addPage(
//     pw.Page(
//       pageFormat: PdfPageFormat.a4,
//       build: (pw.Context context) {
//         return pw.Center(
//
//         ); // Center
//       },
//     ),
//   ); // Page
//
//   /// print the document using the iOS or Android print service:
//   // await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => doc.save());
//
//   /// share the document to other applications:
//   await Printing.sharePdf(
//       bytes: await doc.save(), filename: '${paciente.nome}.pdf');
// }
