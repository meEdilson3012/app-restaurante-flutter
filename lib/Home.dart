import 'package:appcoqueiro/Componentes.dart';
import 'package:appcoqueiro/produto.dart';
import 'package:appcoqueiro/produtoSingle.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:getwidget/getwidget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<dynamic> appbar = [false, false, false, false];

  void marcar(int index) {
    setState(() {
      for (var element in appbar) {
        element = false;
      }

      appbar[index] = true;
    });
  }

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

  @override
  Widget build(BuildContext context) {
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
    List<dynamic> categorias = [
      ["Todos", true],
      ["Massas", false],
      ["Made in Bissau", false],
      ["Alcool", false],
      ["Suma", false],
      ["Marisco", false],
    ];

    List<String> listaEvento = [
      "assests/Camada 1.png",
  "https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg",
  "https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg",
  "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg",
  "https://cdn.pixabay.com/photo/2019/12/22/04/18/x-mas-4711785__340.jpg",
  "https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg"
    ];

    List<Poroduto> produtos = [poroduto1, poroduto2, poroduto3];

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Componentes().appBar("Home", ids_.toString(), context),

      body: SingleChildScrollView(
        
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Componentes().pesquisa(),
              SizedBox(height: 15),
              Componentes().anuncio(width, height,"assests/Image.png"),
              SizedBox(height: 15),
              Container(
                child: Componentes().texto(
                  "Mais Pedidos ",
                  16,
                  true,
                  Colors.black,
                ),
              ),
              Container(
                height: 210,
                width: width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: produtos.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                Produtosingle(produto: produtos[index]),
                          ),
                        );
                      },
                      child: Componentes().prato(produtos[index], 125),
                    );
                  },
                ),
              ),
              Container(
                child: Componentes().texto(
                  "Made in Bissau ",
                  16,
                  true,
                  Colors.black,
                ),
              ),
        
              Container(
                height: 210,
                width: width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: produtos.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                Produtosingle(produto: produtos[index]),
                          ),
                        );
                      },
                      child: Componentes().prato(produtos[index], 125),
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
