import 'package:flutter/material.dart';
import 'package:pacienteneuro/src/pages/listas.dart';
import 'package:pacienteneuro/src/pages/models.dart';
import 'package:pacienteneuro/src/pages/questionario.dart';

class SelecionarPaciente extends StatefulWidget {
  const SelecionarPaciente({Key? key}) : super(key: key);

  @override
  State<SelecionarPaciente> createState() => _SelecionarPacienteState();
}

class _SelecionarPacienteState extends State<SelecionarPaciente> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController pacienteController = TextEditingController();
  dynamic pacienteSelect;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(52, 78, 65, 1),
        centerTitle: true,
        title: const Text("Selecione o paciente"),
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
                  if(_formKey.currentState!.validate()){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => QuestionarioPage(paciente: pacienteSelect,)),
                    );
                  }
                },
                child: const Text(
                  'Fazer avaliação',
                  style: TextStyle(fontSize: 20),
                ),
              ))),
      body: Center(child: nameField()),
    );
  }

  Widget nameField() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 0.0),
        child: Form(
          key: _formKey,
          child: TextFormField(
            readOnly: true,
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      child: containerSector(context),
                    );
                  });
            },
            controller: pacienteController,
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
                hintStyle: const TextStyle(fontSize: 20.0, color: Colors.black),
                fillColor: const Color.fromARGB(255, 255, 255, 255),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.black, width: 1.0),
                ),
                errorStyle: const TextStyle(color: Colors.redAccent, fontSize: 18),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.black, width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.black, width: 1.0),
                ),
                prefixIcon: Icon(
                  Icons.person_search,
                  color: Colors.lightGreen[900],
                ),
                hintText: 'Nome completo'
            ),
            validator: (String? value) {
              if (value!.isEmpty) {
                return 'Selecione o paciente';
              }
              return null;
            },
          ),
        ));
  }

  Widget containerSector(context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 300,
      child: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.loose,
        children: [
          Container(
              width: screenWidth,
              height: 300,
              padding: const EdgeInsets.only(
                  left: 20, top: 20, right: 20, bottom: 20),
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: const Color.fromRGBO(52, 78, 65, 1),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black,
                        offset: Offset(0, 10),
                        blurRadius: 10),
                  ]),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Selecione o paciente",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: pacientesTodos.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        Paciente resp = pacientesTodos[index];
                        return RadioListTile<Paciente>(
                          title: Text(
                            resp.nome!,
                            style: const TextStyle(color: Colors.white),
                          ),
                          value: resp,
                          groupValue: pacienteSelect,
                          onChanged: (value) {
                            setState(() {
                              pacienteSelect = value!;
                              pacienteController.text = value.nome!;
                              Navigator.pop(context);
                            });
                          },
                        );
                      },
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
