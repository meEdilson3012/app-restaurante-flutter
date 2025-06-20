import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class TecladoExemplo extends StatefulWidget {
  @override
  _TecladoExemploState createState() => _TecladoExemploState();
}

class _TecladoExemploState extends State<TecladoExemplo> {
  FocusNode _focusNode = FocusNode();
  String _ultimaTecla = 'Nenhuma tecla pressionada ainda';

  @override
  void initState() {
    super.initState();
    _focusNode.requestFocus(); // Garante que o widget receba foco
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Eventos de Tecla')),
      body:RawKeyboardListener(
        
        focusNode: _focusNode,
        onKey: (RawKeyEvent event) {
          if (event is RawKeyDownEvent) {
            setState(() {
              _ultimaTecla = 'Tecla pressionada: ${event.logicalKey.keyLabel}';
            });
          }
        },
        child: Center(
          child: Text(
            _ultimaTecla,
            style: TextStyle(fontSize: 24),
          ),
        ),
        
      ),
    );
  }
}
