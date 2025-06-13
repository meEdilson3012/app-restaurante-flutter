import 'package:appcoqueiro/produto.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class Componentes {
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

  Container anuncio(double largura, altura) {
    return Container(
      width: largura,
      height: altura * 18 / 100,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage("assests/Image.png"),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        margin: EdgeInsets.only(left: 20),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            this.texto("Caldo de Chabeu", 18, true, Colors.black),
            this.texto("Sem taxa", 16, false, Colors.black),
            Container(
              width: 120,
              child: GFButton(
                color: Color(0xFF307A59),
                child: this.texto("Pedir Agora", 16, true, Colors.white),
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
                image: NetworkImage(produto.img),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
              color: Colors.black,
            ),
          ),
          SizedBox(height: 5),
          this.texto(produto.nome, 16, true, Colors.black),
          SizedBox(height: 5),
          this.texto(produto.preco, 14, true, Color.fromARGB(255, 29, 100, 68)),
        ],
      ),
    );
  }

  Text categoria(List<dynamic> lista) {
    return Text(lista[0], style: (lista[1]) ? styleActivo : styleNormal);
  }

  Container carPrato(double largura, Poroduto produto) {
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
                      image: NetworkImage(produto.img),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(width: 15),
                Container(
                  height: 100 - 32,
                  width: largura * 40 / 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      this.texto(produto.nome, 16, true, Colors.black),
                      SizedBox(height: 3),
                      Row(
                        children: [
                          Container(
                            width: largura * 20 / 100,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 236, 236, 236),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width: 20,
                                  height: 20,
                                  child: CircleAvatar(
                                    backgroundColor: const Color.fromARGB(
                                      255,
                                      170,
                                      170,
                                      170,
                                    ),
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.black,
                                      size: 15,
                                    ),
                                  ),
                                ),
                                this.texto("2", 14, true, Colors.black),
                                Container(
                                  width: 20,
                                  height: 20,
                                  child: CircleAvatar(
                                    backgroundColor: Color(0xFF307A59),
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(width: 10),
                          this.texto(
                            produto.preco,
                            14,
                            true,
                            Color(0xFF307A59),
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

  BottomAppBar AppbarButton(BuildContext context) {
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
                icon: Icon(Icons.shopping_cart_rounded),
                onPressed: () {
                  Navigator.of(context).pushNamed("/cart");
                },
              ),
            ],
          ),
          Column(
            children: [
              IconButton(
                icon: Icon(Icons.person),
                onPressed: () {
                  Navigator.of(context).pushNamed("/home");
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

 
}
