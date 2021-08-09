import 'package:flutter/material.dart';

class TextFieldPadraoExp extends StatefulWidget {
  final Function(String text) onChanged;
  final String titulo, value;
  final bool obscureText;
  final TextEditingController controller;

  const TextFieldPadraoExp(
      {Key key,
      this.onChanged,
      this.titulo,
      this.controller,
      this.obscureText = false,
      this.value})
      : super(key: key);

  @override
  _TextFieldPadraoExpState createState() => _TextFieldPadraoExpState();
}

class _TextFieldPadraoExpState extends State<TextFieldPadraoExp> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
            visible: widget.titulo?.isNotEmpty ?? false,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text("${widget.titulo}",
                  style: TextStyle(fontSize: 16, color: Colors.blue)),
            )),
        Container(
          child: TextField(
            maxLength: 200,
            minLines: 1,
            maxLines: 4,
            onChanged: widget.onChanged,
            obscureText: widget.obscureText,
            controller: widget.controller ??
                TextEditingController(text: widget.value ?? ""),
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
