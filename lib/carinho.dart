import 'package:appcoqueiro/Componentes.dart';
import 'package:appcoqueiro/produto.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:getwidget/getwidget.dart';
import 'package:qr_flutter_new/qr_flutter.dart';

class Carinho extends StatefulWidget {
  const Carinho({super.key});

  @override
  State<Carinho> createState() => _CarinhoState();
}

class _CarinhoState extends State<Carinho> {
  List<Poroduto> produtosCarts = [];
  Poroduto poroduto1 = new Poroduto(
    "Massa Italiano",
    10000,
    "assests/5833.jpg",
    "Massa",
  );
  Poroduto poroduto2 = new Poroduto(
    "Massa Português",
    9000,
    "assests/6807.jpg",
    "Massa",
  );
  Poroduto poroduto3 = new Poroduto(
    "Massa Grego",
    12000,
    "assests/19739.jpg",
    "Massa",
  );
  Poroduto poroduto4 = new Poroduto(
    "Caipirinha",
    1000,
    "assests/123609526_1290548177958322_2907966714455681483_n.jpg",
    "Alcool",
  );

  Future<List<String>?> lerNome() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getStringList('produtos');
  }

  int numero = 0;

  int ids_ = 0;

  void mudar(int val) {
    setState(() {
      numero = numero + val;
    });
  }

  @override
  void initState() {
    super.initState();
    lerNome()
        .then((ids) {
          if (mounted) {
            setState(() {
              ids_ = ids!.length;
              if (ids != null && ids.isNotEmpty) {
                print(ids);
                List<Poroduto> produtos = [
                  poroduto1,
                  poroduto2,
                  poroduto3,
                  poroduto4,
                ];
                for (var produto in produtos) {
                  print(produto.id);

                  if (ids.contains(produto.nome)) {
                    produtosCarts.add(produto);
                  }
                }
                print(produtosCarts);
              }
            });
          }
        })
        .catchError((onError) => {print(onError)});
  }

  mostrarProdutos() {
    print(produtosCarts);
  }

  @override
  Widget build(BuildContext context) {
    var alert = GFAlert(
    
      content:  QrImageView(
          data: 'https://www2.hm.com/pt_pt/index.html',
          version: QrVersions.auto,
          size: 200.0,

        ),
      
      contentAlignment: Alignment.center,
      type: GFAlertType.rounded,
      title: "Capture o QrCode e apresente no retaurante",
      bottomBar: GFButton(
        child: Componentes().texto(
                "Guardar QrCode",
                20,
                true,
                Colors.white,
              ),
        onPressed: (){

      }),
      bottomBarAlignment: Alignment.bottomCenter,
      
    );

    var gesture1 = GestureDetector(
      onTap: () {
        mudar(-1);
      },
      child: Icon(Icons.remove, color: Colors.black, size: 15),
    );

    var gesture2 = GestureDetector(
      onTap: () {
        mudar(1);
      },
      child: Icon(Icons.add, color: Colors.black, size: 15),
    );

    mostrarProdutos();
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Componentes().appBar("Carinho", ids_.toString(), context),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Componentes().anuncio(width, height,"assests/Image.png"),
              SizedBox(height: 10),
              Componentes().texto("Seus pedidos (3)", 18, true, Colors.black),
              SizedBox(height: 20),
              Container(
                height: 440,
                child: ListView.builder(
                  itemCount: produtosCarts.length,
                  itemBuilder: (context, index) {
                    return Componentes().carPrato(
                      width,
                      produtosCarts[index],
                      numero,
                      gesture1,
                      gesture2,
                    
                    );
                  },
                ),
              ),
              GFButton(
                color: Color(0xFF307A59),
                size: 45,
                fullWidthButton: true,
                child: Componentes().texto(
                  "Fazer Pedido",
                  20,
                  true,
                  Colors.white,
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return alert;
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: Componentes().AppbarButton(context, ids_.toString()),
    );
  }
}
