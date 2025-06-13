import 'package:appcoqueiro/Componentes.dart';
import 'package:appcoqueiro/produto.dart';
import 'package:flutter/material.dart';

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

    List<Poroduto> produtos = [poroduto1, poroduto2, poroduto3];

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Componentes().texto("Home", 20, true, Colors.black),
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
            Componentes().pesquisa(),
            SizedBox(height: 15),
            Componentes().anuncio(width, height),
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
                      Navigator.of(context).pushNamed("/produto");
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
                      Navigator.of(context).pushNamed("/produto");
                    },
                    child: Componentes().prato(produtos[index], 125));
                },
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: Componentes().AppbarButton(context),
    );
  }
}
