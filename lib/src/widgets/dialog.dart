import 'package:flutter/material.dart';

Dialog customDialog(context, String title, String message, String btnMessage, bool success){
  return Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    elevation: 0,
    backgroundColor: Colors.transparent,
    child: contentBox(context, title, message, btnMessage, success),
  );
}

contentBox(context, String title, String message, String btnMessage, bool success) {
  double screenWidth = MediaQuery.of(context).size.width;
  return Stack(
    children: <Widget>[
      Container(
        width: screenWidth,
        height: 250,
        padding: const EdgeInsets.only(
            left: 20, top: 45 + 20, right: 20, bottom: 20),
        margin: const EdgeInsets.only(top: 45),
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: const Color.fromRGBO(52, 78, 65, 1),
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
            ]),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.white),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              message,
              style: const TextStyle(fontSize: 20, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 22,
            ),
            Container(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 40,
                  width: screenWidth * 0.5,
                  child: TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: const Color.fromRGBO(88, 129, 87, 1),
                        shadowColor: Colors.green[900],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                        elevation: 5,
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w600),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        btnMessage,
                        style: const TextStyle(fontSize: 18),
                      )),
                )
            )
          ],
        ),
      ),
    ],
  );
}