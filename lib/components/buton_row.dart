// ignore_for_file: prefer_const_constructors

import 'package:calculator/components/button.dart';
import 'package:flutter/material.dart';

class ButtonRow extends StatelessWidget {
  const ButtonRow({super.key, required this.buttons});

  final List<Button> buttons;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        //adicionando espaçamento entre os botões
        children: buttons.fold(<Widget>[], (list, b) {
          list.isEmpty
              ? list.add(b)
              : list.addAll([
                  Container(
                    width: 1,
                    color: Colors.black,
                  ),
                  b
                ]);
          return list;
        }),
      ),
    );
  }
}
