import 'package:appcoqueiro/Componentes.dart';
import 'package:appcoqueiro/produto.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Produtosingle extends StatefulWidget {
  final Poroduto produto;
  const Produtosingle({Key? key, required this.produto}) : super(key: key);

  @override
  State<Produtosingle> createState() => _ProdutosingleState();
}

class _ProdutosingleState extends State<Produtosingle> {
  int numero = 1;

  int ids_ = 0;

  double preco = 0;
  List<dynamic> ingridientes = [
    ["Cebola", false],
    ["Salsa", false],
    ["Maionese", false],
    ["Molho", false],
    ["Pimenta", false],
    ["Pimenta", false],
    ["Pimenta", false],
  ];

  void mudar(int val) {
    setState(() {
      if ((val.isNegative) && (numero <= 1)) {
      } else {
        numero = numero + val;
        preco = widget.produto.preco * numero;
      }
    });
  }

  void marcar(int index) {
    setState(() {
      ingridientes[index][1] = !ingridientes[index][1];
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
    Poroduto porodutoActual = widget.produto;
    if (preco == 0) {
      preco = porodutoActual.preco;
    }

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: Componentes().appBar(
        porodutoActual.nome,
        ids_.toString(),
        context,
      ),

      body:  Container(
          width: width,
          height: height,
          color: Color.fromARGB(255, 241, 241, 241),
          child: Container(
            padding: EdgeInsets.all(20),
            height: height * 60 / 100,
            width: width,
        
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: height * 83 / 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: width,
                        height: height * 25 / 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(porodutoActual.img),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      SizedBox(height: 20),
                      Componentes().texto(
                        porodutoActual.nome,
                        25,
                        true,
                        Colors.black,
                      ),
                      Componentes().texto(
                        porodutoActual.categoria,
                        16,
                        true,
                        Colors.grey,
                      ),
                      Componentes().texto(
                        "Get Flutter is one of the largest Flutter open-source et Flutter is one of the largest Flutter open-source UI library for mobile open-source UI library for mobile",
                        14,
                        false,
                        Colors.black,
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Container(
                            width: width * 30 / 100,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 236, 236, 236),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width: 30,
                                  height: 30,
                                  child: CircleAvatar(
                                    backgroundColor: const Color.fromARGB(
                                      255,
                                      170,
                                      170,
                                      170,
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        mudar(-1);
                                      },
                                      child: Icon(
                                        Icons.remove,
                                        color: Colors.black,
                                        size: 15,
                                      ),
                                    ),
                                  ),
                                ),
                                Componentes().texto(
                                  numero.toString(),
                                  18,
                                  true,
                                  Colors.black,
                                ),
        
                                Container(
                                  width: 30,
                                  height: 30,
                                  child: CircleAvatar(
                                    backgroundColor: Color(0xFF307A59),
                                    child: GestureDetector(
                                      onTap: () {
                                        mudar(1);
                                      },
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.black,
                                        size: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
        
                          SizedBox(width: 20),
                          Componentes().texto(
                            "xof " + preco.toString(),
                            20,
                            true,
                            Color.fromARGB(255, 4, 75, 43),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Container(
                        height: 1,
                        color: const Color.fromARGB(255, 214, 214, 214),
                      ),
                      SizedBox(height: 10),
                      Container(
                       
                        height: 240,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: (ingridientes.length / 3).ceil(),
        
                          itemBuilder: (context, index) {
                            final int first = index * 3;
                            final int second = first + 1;
                            final int tird = second + 1;
        
                            return Container(
                              margin: EdgeInsets.only(top: 20),
                          
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      marcar(first);
                                    },
                                    child: Container(
                                      width: 110,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: (!ingridientes[first][1])? const Color.fromARGB(
                                          255,
                                          245,
                                          245,
                                          245,
                                        ): const Color.fromARGB(255, 0, 167, 6),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Center(
                                        child: Componentes().texto(
                                          ingridientes[first][0],
                                          18,
                                          true,
                                          (!ingridientes[first][1])? Colors.black: Colors.white
                                        ),
                                      ),
                                    ),
                                  ),
        
                                  if (second < ingridientes.length)
                                    GestureDetector(
                                       onTap: () {
                                      marcar(second);
                                    },
                                      child: Container(
                                        width: 110,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: (!ingridientes[second][1])? const Color.fromARGB(
                                            255,
                                            245,
                                            245,
                                            245,
                                          ): const Color.fromARGB(255, 0, 167, 6),
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        child: Center(
                                          child: Componentes().texto(
                                            ingridientes[second][0],
                                            18,
                                            true,
                                           (!ingridientes[second][1])? Colors.black: Colors.white
                                          ),
                                        ),
                                      ),
                                    )
                                  else
                                    Expanded(child: SizedBox()),
        
                                  if (tird < ingridientes.length)
                                    GestureDetector(
                                       onTap: () {
                                      marcar(tird);
                                    },
                                      child: Container(
                                        width: 110,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: (!ingridientes[tird][1])? const Color.fromARGB(
                                            255,
                                            245,
                                            245,
                                            245,
                                          ): const Color.fromARGB(255, 0, 167, 6),
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        child: Center(
                                          child: Componentes().texto(
                                            ingridientes[tird][0],
                                            18,
                                            true,
                                           (!ingridientes[tird][1])? Colors.black: Colors.white
                                          ),
                                        ),
                                      ),
                                    )
                                  else
                                    Expanded(child: SizedBox()),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                GFButton(
                  size: 50,
                  color: Color.fromARGB(255, 22, 100, 65),
                  fullWidthButton: true,
                  child: Componentes().texto(
                    "Adicionar ( xof " + porodutoActual.preco.toString() + ")",
                    18,
                    true,
                    Colors.white,
                  ),
                  onPressed: () async { 
                    final shared = await SharedPreferences.getInstance();
                    List<String>? listaProdutos =
                        (shared.getStringList("produtos") != null)
                        ? shared.getStringList("produtos")
                        : [];
                    listaProdutos?.add(porodutoActual.nome);
                    shared.setStringList("produtos", listaProdutos!);
                  },
                ),
              ],
            ),
          ),
        ),
      
    );
  }
}
