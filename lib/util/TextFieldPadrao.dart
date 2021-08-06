import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldPadrao extends StatelessWidget {
  final Function(String text) onChanged;
  final TextInputType inputType;
  final String titulo, value;
  final List<TextInputFormatter> inputFormatters;

  final bool obscureText;
  const TextFieldPadrao(
      {Key key,
      this.inputFormatters,
      this.onChanged,
      this.titulo,
      this.inputType,
      this.obscureText = false,
      this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
            visible: titulo?.isNotEmpty ?? false,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8),
            
            )),
        Container(
          height: 45,
          child: TextField(
            
            keyboardType: inputType,
            inputFormatters: inputFormatters,
            onChanged: onChanged,
            obscureText: obscureText,
            controller: TextEditingController(text: value ?? ""),
            decoration: InputDecoration(
              labelText: "$titulo",
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(5.0),
                  ),
                ),
                filled: true,
                hintStyle: new TextStyle(color: Colors.grey[800]),
                fillColor: Colors.white70),
          ),
        ),
      ],
    );
  }
}
