import 'package:appcoqueiro/Componentes.dart';
import 'package:appcoqueiro/produto.dart';
import 'package:appcoqueiro/produtoSingle.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    ["Alcool", false],
    ["Suma", false],
    ["Marisco", false],
  ];
  List<String> cats = [
    "Todos",
    "Massas",
    "Made in Bissau",
    "Alcool",
    "Suma",
    "Marisco",
  ];

  List<Poroduto> produtos = [
    new Poroduto("Massa Italiano", 10000, "assests/5833.jpg", "Massas"),
    new Poroduto("Massa Português", 9000, "assests/6807.jpg", "Massas"),
    new Poroduto("Massa Grego", 12000, "assests/19739.jpg", "Massas"),
    new Poroduto(
      "Caipirinha",
      1000,
      "assests/123609526_1290548177958322_2907966714455681483_n.jpg",
      "Alcool",
    ),
    new Poroduto(
      "Mariscos",
      5000,
      "assests/480553920_1201694678073051_2142196710517619218_n.jpg",
      "Marisco",
    ),
    new Poroduto(
      "Mariscos",
      10000,
      "assests/481971582_1195849901990862_2590177300498674252_n.jpg",
      "Marisco",
    ),
    new Poroduto(
      "Frango Salada",
      3000,
      "assests/485726719_1210021833907002_3367598957874447215_n.jpg",
      "Made in Bissau",
    ),
    new Poroduto(
      "Olho de Palma",
      3000,
      "assests/486840931_1213403243568861_7246199826315047553_n.jpg",
      "Made in Bissau",
    ),
  ];
  String categoria = "";
  int ids_ = 0;
  bool mostrarounao = true;
  List<Poroduto> lista = [];

  List<Poroduto> listaTodos() {
    lista = produtos;
    return lista;
  }

  List<Poroduto> listaCat(String cat) {
    if (cat != "Todos")
      lista = produtos.where((item) => item.categoria == cat).toList();
    else
      lista = produtos;
    return lista;
  }

  void marcar(int index) {
    setState(() {
      for (var element in categorias) {
        element[1] = false;
      }

      categorias[index][1] = true;
      categoria = categorias[index][0];
      mostrarounao = false;
    });
  }

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
    List<Poroduto> listaFinal = (mostrarounao)
        ? listaTodos()
        : listaCat(categoria);
    for (var element in listaFinal) {
      print(element.id);
    }

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Componentes().appBar("Menu", ids_.toString(), context),

      body: SingleChildScrollView(
        child: Container(
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
                  itemCount: (listaFinal.length / 2).ceil(),
                  itemBuilder: (context, index) {
                    final int first = index * 2;
                    final int second = first + 1;
                    print(first.toString());
                    print(second.toString() + "\n");
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    Produtosingle(produto: listaFinal[first]),
                              ),
                            );
                          },
                          child: Componentes().prato(
                            listaFinal[first],
                            width * 40 / 100,
                          ),
                        ),
                        SizedBox(width: 20),
                        if (second < listaFinal.length)
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Produtosingle(produto: listaFinal[second]),
                                ),
                              );
                            },
                            child: Componentes().prato(
                              listaFinal[second],
                              width * 40 / 100,
                            ),
                          )
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
      ),

      bottomNavigationBar: Componentes().AppbarButton(context,ids_.toString()),
    );
  }
}
