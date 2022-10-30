import 'package:flutter/material.dart';

Widget boxPaciente(context, String nome, String nomeContext){
  double screenWidth = MediaQuery.of(context).size.width;
  return Container(
    margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
    alignment: Alignment.center,
    width:  screenWidth,
    child:  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(nome,style: const TextStyle(fontSize: 19.0),),
        const SizedBox(height: 6.0,),
        Container(
          width:  screenWidth,
          padding: const EdgeInsets.fromLTRB(4.0, 6.0, 4.0, 6.0),
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(nomeContext, style: const TextStyle(fontSize: 20.0),),
        )
      ],
    ),
  );
}