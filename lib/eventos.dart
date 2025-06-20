import 'package:appcoqueiro/Componentes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:getwidget/getwidget.dart';
import 'package:qr_flutter_new/qr_flutter.dart';

class Eventos extends StatefulWidget {
  const Eventos({super.key});

  @override
  State<Eventos> createState() => _EventosState();
}

class _EventosState extends State<Eventos> {
  int ids_ = 0;

  Future<List<String>?> lerNome() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getStringList('produtos');
  }

  @override
  void initState() {
    super.initState();
    lerNome()
        .then((ids) {
          if (mounted) {
            setState(() {
              ids_ = ids!.length;
            });
          }
        })
        .catchError((onError) => {print(onError)});
  }

  bool mostrar = false;

  List<String> eventos = [
    "assests/Image.png",
    "assests/eventos2.png",
    "assests/488928211_1222242279351624_1954856099603705637_n.jpg",
  ];

  void mostrarQrCode() {
    setState(() {
      mostrar = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var alertQRCode = AlertDialog(
      content: Center(
        child: QrImageView(
          data: 'https://www2.hm.com/pt_pt/index.html',
          version: QrVersions.auto,
          size: 200.0,
        ),
      ),
    );
    var alert = AlertDialog(
      backgroundColor: Colors.white,

      content: Container(
        height: 270,
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Componentes().texto(
                "Preencha alguma essas informações para confirmar a sua reserva!",
                16,
                true,
                const Color.fromARGB(255, 151, 151, 151),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  label: Text("Nome Completo"),
                  icon: Icon(Icons.person),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.group_add),
                  label: Text("Número de pessoas"),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GFButton(
                    fullWidthButton: false,
                    size: 40,
                    color: Color(0xFF307A59),
                    child: Componentes().texto(
                      "Reservar Agora",
                      16,
                      true,
                      Colors.white,
                    ),

                    onPressed: () {
                      Navigator.of(context).pop();
                      
                    },
                  ),

                  GFButton(
                    fullWidthButton: false,
                    size: 40,
                    color: Color.fromARGB(255, 255, 37, 37),
                    child: Componentes().texto(
                      "Cancelar",
                      16,
                      true,
                      Colors.white,
                    ),

                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),

              (mostrar)
                  ? QrImageView(
                      data: 'https://www2.hm.com/pt_pt/index.html',
                      version: QrVersions.auto,
                      size: 200.0,
                    )
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );

    var btnReservar = GFButton(
      size: 40,
      color: Color(0xFF307A59),
      child: Componentes().texto("Reservar Agora", 16, true, Colors.white),

      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return alert;
          },
        );
      },
    );
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: Componentes().appBar("Eventos", ids_.toString(), context),

      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Componentes().pesquisa(),

              Container(
                width: width,
                height: 800,
                child: ListView.builder(
                  itemCount: eventos.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 15, top: 10),
                      child: Componentes().eventos(
                        eventos[index],
                        width,
                        btnReservar,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Componentes().AppbarButton(context, ids_.toString()),
    );
  }
}
