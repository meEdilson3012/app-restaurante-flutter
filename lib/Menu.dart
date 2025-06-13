import 'package:appcoqueiro/Componentes.dart';
import 'package:appcoqueiro/produto.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  List<dynamic> categorias = [
    ["Todos", true],
    ["Massas", false],
    ["Made in Bissau", false],
    ["Cerveja", false],
    ["Suma", false],
    ["Marisco", false],
  ];

  void marcar(int index) {
    setState(() {
      for (var element in categorias) {
        element[1] = false;
      }

      categorias[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    Poroduto poroduto1 = new Poroduto(
      "Massa Italiano",
      "xof 10.000",
      "assests/5833.jpg",
    );
    Poroduto poroduto2 = new Poroduto(
      "Massa Português",
      "xof 9.000",
      "assests/6807.jpg",
    );
    Poroduto poroduto3 = new Poroduto(
      "Massa Grego",
      "xof 12.000",
      "assests/19739.jpg",
    );

    Poroduto poroduto4 = new Poroduto(
      "Caipirinha",
      "xof 1.000",
      "assests/123609526_1290548177958322_2907966714455681483_n.jpg",
    );

    Poroduto poroduto5 = new Poroduto(
      "Mariscos",
      "xof 5.000",
      "assests/480553920_1201694678073051_2142196710517619218_n.jpg",
    );

    Poroduto poroduto7 = new Poroduto(
      "Mariscos",
      "xof 10.000",
      "assests/481971582_1195849901990862_2590177300498674252_n.jpg",
    );

    Poroduto poroduto8 = new Poroduto(
      "Frango Salada",
      "xof 3.000",
      "assests/485726719_1210021833907002_3367598957874447215_n.jpg",
    );

    Poroduto poroduto9 = new Poroduto(
      "Olho de Palma",
      "xof 3.000",
      "assests/486840931_1213403243568861_7246199826315047553_n.jpg",
    );

    List<Poroduto> produtos = [poroduto1, poroduto2, poroduto3,poroduto4,poroduto5,poroduto7,poroduto8,poroduto9];
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Componentes().texto("Menu", 20, true, Colors.black),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Icon(Icons.notification_add_outlined),
          ),
        ],
      ),

      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Componentes().texto("Comidas", 16, false, Colors.grey),
            Componentes().texto(
              "Feitas Para Você",
              22,
              true,
              Color(0xFF307A59),
            ),
            SizedBox(height: 15),
            Componentes().pesquisa(),
            SizedBox(height: 20),

            Container(
              height: 40,
              width: width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categorias.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(left: 15),
                    child: GestureDetector(
                      onTap: () {
                        marcar(index);
                      },
                      child: Componentes().categoria(categorias[index]),
                    ),
                  );
                },
              ),
            ),

            Container(
              height: 535,
              width: width,
              child: ListView.builder(
                itemCount: (produtos.length / 2).ceil(),
                itemBuilder: (context, index) {
                  final int first = index * 2;
                  final int second = first + 1;
                  print(first.toString());
                  print(second.toString()+"\n");
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                       GestureDetector(
                         onTap: () {
                      Navigator.of(context).pushNamed("/produto");
                    },
                        child: Componentes().prato(produtos[first],width*40/100)),
                       SizedBox(width: 20,),
                      if (second < produtos.length)
                       GestureDetector(
                         onTap: () {
                      Navigator.of(context).pushNamed("/produto");
                    },
                        child: Componentes().prato(produtos[second],width*40/100))
                      else
                        Expanded(
                          child: SizedBox(),
                        ), // placeholder vazio se ímpar
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: Componentes()
      .AppbarButton(context)
    );
  }
}
