import 'package:flutter/material.dart';
import 'package:pacienteneuro/src/pages/createAccount.dart';
import 'package:pacienteneuro/src/pages/homr.dart';
import 'package:pacienteneuro/src/pages/questionario.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
            decoration: const BoxDecoration(color: Color.fromRGBO(88, 129, 87, 1)),
          ),
          buildForm()
        ],
      ),
    );
  }

  Widget buildForm() {
    return Container(
      padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
      alignment: Alignment.center,
      child: Center(
        child: ListView(
          children: [circleImage(), form(), loginButton(), createAccountPage()],
        ),
      ),
    );
  }

  Widget circleImage() {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
        width: screenWidth * 0.6,
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: screenWidth * 0.6,
              child: Image.asset("assets/logo.png"),
            ),
          ],
        ));
  }

  Widget form() {
    return Column(
      children:  [
        const Text(
          "Acesse sua conta",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: "Roboto",
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.none),
        ),
        Form(
          key: _formKey,
          child: ListView(
            shrinkWrap: true,
            children: [
              emailField(),
              passwordField()
            ],
          ),
        ),
      ],
    );
  }

  Widget emailField(){
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 0.0),
      child: TextFormField(
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintStyle: const TextStyle(fontSize: 20.0, color: Colors.white),
          fillColor: const Color.fromARGB(80, 0, 0, 0),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
          ),
          errorStyle: const TextStyle(color: Colors.white, fontSize: 18),
          prefixIcon: Icon(
            Icons.email,
            color: Colors.lightGreen[900],
          ),
          hintText: 'E-mail',
        ),
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return 'Informe seu email';
          }
          return null;
        },
      ),
    );
  }

  Widget passwordField(){
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 0.0),
      child: TextFormField(
        controller: passwordController,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintStyle: const TextStyle(fontSize: 20.0, color: Colors.white),
          fillColor: const Color.fromARGB(80, 0, 0, 0),
          filled: true,
          errorStyle: const TextStyle(color: Colors.white, fontSize: 18),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
          ),
          prefixIcon: Icon(
            Icons.key_rounded,
            color: Colors.lightGreen[900],
          ),
          hintText: 'Senha',
        ),
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return 'Informe sua senha';
          }
          return null;
        },
      ),
    );
  }

  Widget loginButton() {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
        width: screenWidth,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
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
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              child: const Text('Entrar', style: TextStyle(fontSize: 20),),
            )
        )
    );
  }

  Widget createAccountPage() {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
        width: screenWidth,
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: TextButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.transparent,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CreateAccountPage()),
            );
          },
          child: const Text('Criar conta', style: TextStyle(fontSize: 20, color: Colors.white),),
        )
    );
  }
}
