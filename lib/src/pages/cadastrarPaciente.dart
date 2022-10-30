import 'package:flutter/material.dart';
import 'package:pacienteneuro/src/pages/listas.dart';
import 'package:pacienteneuro/src/pages/models.dart';
import 'package:pacienteneuro/src/pages/pacienteWidgets/dataNascimento.dart';
import 'package:pacienteneuro/src/pages/pacienteWidgets/nomePacienteWidget.dart';
import 'package:pacienteneuro/src/widgets/dialog.dart';
import 'homr.dart';

class CadastrarPaciente extends StatefulWidget {
  const CadastrarPaciente({Key? key}) : super(key: key);

  @override
  State<CadastrarPaciente> createState() => _CadastrarPacienteState();
}

class _CadastrarPacienteState extends State<CadastrarPaciente> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nomeController = TextEditingController();
  final TextEditingController sexoController = TextEditingController();
  TextEditingController dataNascimentoController = TextEditingController();
  LeitoPaciente leioController = LeitoPaciente();

  late final ValueNotifier<String> _valueNotifierController =
      ValueNotifier<String>('Selecione');

  List<String> listSexo = ['MASCULINO', 'FEMININO'];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    sexoController.dispose();
    _valueNotifierController.dispose();
    super.dispose();
  }

  void save() {
    var id = pacientesTodos.length + 1;
    Paciente paciente = Paciente(paciente_id: id,nome: nomeController.text,dataNascimento: dataNascimentoController.text,
        sexo: sexoController.text, avaliacaoPaciente: null, leitos: []);
    paciente.nome = nomeController.text;
    paciente.leitos?.add(leioController);
    successDialog();
  }

  void successDialog() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return customDialog(context, 'Sucesso!',
              'Paciente cadastrado com sucesso!', 'Fechar', true);
        }).then((_) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(52, 78, 65, 1),
        centerTitle: true,
        title: const Text("Cadastrar paciente"),
      ),
      body: form(),
    );
  }

  Widget form() {
    double screenWidth = MediaQuery.of(context).size.width;
    return Form(
      key: _formKey,
      child: ListView(
        shrinkWrap: true,
        children: [
          nameField(nomeController),
          dataNascimentoField(dataNascimentoController, context),
          sexoField(),
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Informações do leito",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          const Divider(),
          leitoField(),
          Container(
              margin: const EdgeInsets.only(top: 20.0),
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
                        save();
                      }
                    },
                    child: const Text(
                      'Cadastrar paciente',
                      style: TextStyle(fontSize: 20),
                    ),
                  ))),
        ],
      ),
    );
  }

  Widget leitoField() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 0.0),
        child: DropdownButtonFormField<LeitoPaciente>(
            icon: const Icon(Icons.arrow_downward),
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
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
                hintText: 'Leito'
            ),
            onChanged: (value) {
              setState(() {
                leioController = value!;
              });
            },
            validator: (value) {
              if (value == null) {
                return 'Campo obrigatório';
              }
              return null;
            },
            items: leitosDisponiveis.map((item){
              return DropdownMenuItem(
                value: item,
                child: Text('Leito ${item.leitoId}', style: const TextStyle(color: Colors.black),),
              );
            }).toList()
        )
    );
  }

  Widget sexoField() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 0.0),
        child: DropdownButtonFormField<String>(
          // value: list.isNotEmpty ?  _valueNotifierController.value: null,
            icon: const Icon(Icons.arrow_downward),
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
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
                hintText: 'Sexo'
            ),
            onChanged: (String? value) {
              sexoController.text = value!;
            },
            validator: (value) {
              if (value == null) {
                return 'Campo obrigatório';
              }
              return null;
            },
            items: listSexo.map((item){
              return DropdownMenuItem(
                value: item,
                child: Text(item),
              );
            }).toList()
        )
    );
  }
}
