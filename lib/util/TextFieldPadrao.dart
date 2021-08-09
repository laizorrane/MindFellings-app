import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldPadrao extends StatefulWidget {
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
  _TextFieldPadraoState createState() => _TextFieldPadraoState();
}

class _TextFieldPadraoState extends State<TextFieldPadrao> {
  TextEditingController controller;
  @override
  void initState() {
controller = TextEditingController(text: widget.value ?? "");
    super.initState();
  }
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
            
            )),
        Container(
          height: 45,
          child: TextField(
            
            keyboardType: widget.inputType,
            inputFormatters: widget.inputFormatters,
            onChanged: widget.onChanged,
            obscureText: widget.obscureText,
            controller: controller,
            decoration: InputDecoration(
              labelText: "${widget.titulo}",
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
