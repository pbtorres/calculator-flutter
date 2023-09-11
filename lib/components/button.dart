// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button(
      {super.key,
      required this.text,
      this.big = false,
      this.color = DEAFULT,
      required this.cb});
  //construtores nomeados
  const Button.big(
      {super.key,
      required this.text,
      this.big = true,
      this.color = DEAFULT,
      required this.cb});
  const Button.operation(
      {super.key,
      required this.text,
      this.big = false,
      this.color = OPERATION,
      required this.cb});

  static const DARK = Color.fromRGBO(82, 82, 82, 1);
  static const DEAFULT = Color.fromRGBO(112, 112, 112, 1);
  static const OPERATION = Color.fromRGBO(250, 158, 13, 1);

  final String text;
  final bool big;
  final Color color;
  //função de collback para devolver o valor do botão
  final void Function(String) cb;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: big ? 2 : 1,
        child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(color),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ))),
            onPressed: () => cb(text),
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.w200,
              ),
            )));
  }
}
