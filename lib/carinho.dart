import 'package:appcoqueiro/Componentes.dart';
import 'package:appcoqueiro/produto.dart';
import 'package:flutter/material.dart';

class Carinho extends StatefulWidget {
  const Carinho({super.key});

  @override
  State<Carinho> createState() => _CarinhoState();
}

class _CarinhoState extends State<Carinho> {
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
    List<Poroduto> produtos = [poroduto1, poroduto2, poroduto3,poroduto4];

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Componentes().texto("Carinho", 20, true, Colors.black),
        ),
      ),
      body: Container(
       
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Componentes().anuncio(width, height),
            SizedBox(height: 10),
            Componentes().texto("Seus pedidos (3)", 18, true, Colors.black),
            SizedBox(height: 20),
            Container(
               height: 490,
              child: ListView.builder(
                itemCount: produtos.length,
                itemBuilder: (context, index) {
                  return Componentes().carPrato(width, produtos[index]);
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
