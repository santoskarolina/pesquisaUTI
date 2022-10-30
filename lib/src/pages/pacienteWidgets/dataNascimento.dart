import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget dataNascimentoField(controller, context) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 0.0),
    child: TextFormField(
      readOnly: true,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1950),
            lastDate: DateTime(2100));

        if (pickedDate != null) {
          String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
          controller.text = formattedDate;
        } else {}
      },
      controller: controller,
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
        hintText: 'Data de nascimento'
      ),
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Campo obrigatório';
        }
        return null;
      },
    ),
  );
}
