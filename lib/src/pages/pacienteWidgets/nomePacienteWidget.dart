import 'package:flutter/material.dart';

Widget nameField(nameController) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 0.0),
    child: TextFormField(
      controller: nameController,
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
          return 'Informe seu nome';
        } else if (value.length < 6) {
          return 'Nome deve ter mais de 6 caracteres';
        }
        return null;
      },
    ),
  );
}