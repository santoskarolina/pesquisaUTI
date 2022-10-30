import 'package:flutter/material.dart';
import 'package:pacienteneuro/src/pages/listas.dart';
import 'package:pacienteneuro/src/pages/models.dart';

Widget leitoField(controller) {
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
            hintText: 'Leito',
          ),
          onChanged: (value) {
            controller.value = value?.leitoId;
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