import 'package:flutter/material.dart';

class TextFieldPadraoExp extends StatelessWidget {
  final Function(String text) onChanged;
  final String titulo, value;
  final bool obscureText;
  const TextFieldPadraoExp(
      {Key key,
      this.onChanged,
      this.titulo,
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
              child: Text("$titulo"),
            )),
        Container(
                    
            child: TextField(
            maxLength: 200,
            minLines: 1,
            maxLines: 4,
            onChanged: onChanged,
            obscureText: obscureText,
            controller: TextEditingController(text: value ?? ""),
            decoration: InputDecoration(
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
