import 'package:appcoqueiro/carinho.dart';
import 'package:appcoqueiro/produto.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Componentes {
  var carinho = Carinho();

  TextStyle styleNormal = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.normal,
    color: Colors.grey,
  );

  TextStyle styleActivo = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Color(0xFF307A59),
  );

  Text texto(String texto, double size, bool bold, Color color) {
    return Text(
      texto,
      style: TextStyle(
        fontSize: size,
        fontWeight: (bold) ? FontWeight.bold : FontWeight.normal,
        color: color,
      ),
    );
  }

  GFSearchBar pesquisa() {
    return GFSearchBar(
      margin: EdgeInsets.all(0),
      padding: EdgeInsets.all(0),
      searchList: [],
      searchQueryBuilder: (query, list) {
        return list
            .where((item) => item.toLowerCase().contains(query.toLowerCase()))
            .toList();
      },
      overlaySearchListItemBuilder: (item) {
        return Container(
          padding: const EdgeInsets.all(8),
          child: Text(item, style: const TextStyle(fontSize: 15)),
        );
      },
    );
  }

  Container anuncio(double largura, altura, String img) {
    return Container(
      width: largura,
      height: altura * 18 / 100,
      decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(img), fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        margin: EdgeInsets.only(left: 20),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            this.texto("Tarde Tradicional", 18, true, Colors.black),
            this.texto("Sexta- 14h", 16, false, Colors.black),
            Container(
              width: 140,
              child: GFButton(
                color: Color(0xFF307A59),
                child: this.texto("Reservar Agora", 16, true, Colors.white),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container prato(Poroduto produto, double largura) {
    return Container(
      height: 180,
      margin: EdgeInsets.only(right: 10, top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200 * 60 / 100,
            width: largura,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(produto.img),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
              color: Colors.black,
            ),
          ),
          SizedBox(height: 5),
          this.texto(produto.nome, 16, true, Colors.black),
          SizedBox(height: 5),
          this.texto(
            "xof " + produto.preco.toString(),
            14,
            true,
            Color.fromARGB(255, 29, 100, 68),
          ),
        ],
      ),
    );
  }

  Text categoria(List<dynamic> lista) {
    return Text(lista[0], style: (lista[1]) ? styleActivo : styleNormal);
  }

  Container carPrato(
    double largura,
    Poroduto produto,
    int numero,
    GestureDetector gesture1,
    GestureDetector geture2,
  ) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Container(
            width: largura,

            decoration: BoxDecoration(),
            height: 90,
            child: Row(
              children: [
                Container(
                  height: 100,
                  width: largura * 25 / 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(produto.img),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(width: 5),
                Container(
                  height: 100 - 32,
                  width: largura * 60 / 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      this.texto(produto.nome, 19, true, Colors.black),
                      SizedBox(height: 3),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          this.texto(
                            "xof " + produto.preco.toString(),
                            18,
                            true,
                            Color(0xFF307A59),
                          ),
                          SizedBox(width: 20),
                          Container(
                            child: Center(
                              child: this.texto("2 ", 16, true, Colors.black),
                            ),
                            padding: EdgeInsets.all(5),
                            color: const Color.fromARGB(255, 245, 245, 245),
                            width: 50,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            width: largura,
            height: 1,
            color: const Color.fromARGB(255, 223, 223, 223),
          ),
        ],
      ),
    );
  }

  Container eventos(String img, double width,GFButton btn) {
    return Container(
      
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      border: Border.all(width: 2,color: const Color.fromARGB(255, 243, 243, 243))
      ),
      padding: EdgeInsetsGeometry.all(5),
      
      height: 180+190,
      child: Container(
        height: 200 / 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              
              width: width,
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(image: NetworkImage(img),fit: BoxFit.cover),
              ),
            ),

            SizedBox(height: 15),
            Row(
              children: [
                Row(
                  children: [
                    Icon(Icons.date_range, color: Colors.green),
                    SizedBox(width: 10),
                    Componentes().texto("Sexta-Feira", 20, true, Colors.black),
                  ],
                ),
                SizedBox(width: 20),
                
                Row(
                  children: [
                    Icon(Icons.hourglass_bottom, color: Colors.green),
                    SizedBox(width: 10),
                    Componentes().texto("14:00 pm", 20, true, Colors.black),
                  ],
                ),
              ],
            ),
            SizedBox(height: 15),
             Componentes().texto(
              "Preencha informações para preencha alguma essas informações para confirmar a sua reserva!",
              16,
              false,
              const Color.fromARGB(255, 114, 114, 114),
            ),SizedBox(width: 20),
           btn
          ],
        ),
      ),
    );
  }

  BottomAppBar AppbarButton(BuildContext context, String numero) {
    return BottomAppBar(
      height: 80,
      color: Color(0xFFFAFAFA),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              IconButton(
                icon: Icon(Icons.home_outlined),
                onPressed: () {
                  Navigator.of(context).pushNamed("/home");
                },
              ),
            ],
          ),
          Column(
            children: [
              IconButton(
                icon: Icon(Icons.restaurant_menu_outlined),
                onPressed: () {
                  Navigator.of(context).pushNamed("/menu");
                },
              ),
            ],
          ),
          Column(
            children: [
              IconButton(
                icon: Icon(Icons.event),
                onPressed: () {
                  Navigator.of(context).pushNamed("/eventos");
                },
              ),
            ],
          ),
          Column(
            children: [
              IconButton(
                icon: Icon(Icons.person),
                onPressed: () {
                  Navigator.of(context).pushNamed("/user");
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  AppBar appBar(String titulo, String numero, BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Center(child: Componentes().texto(titulo, 20, true, Colors.black)),
      actions: [
        Container(
          margin: EdgeInsets.only(right: 10, top: 10),
          child: GFIconBadge(
            child: GFIconButton(
              onPressed: () {},
              icon: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed("/cart");
                },
                child: Icon(Icons.shopping_cart_checkout_sharp),
              ),
              type: GFButtonType.transparent,
              color: Colors.black,
              iconSize: 20,
            ),

            counterChild: GFBadge(child: Text(numero)),
          ),
        ),
      ],
    );
  }
}

class Int {}
