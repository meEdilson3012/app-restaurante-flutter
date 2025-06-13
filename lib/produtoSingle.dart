import 'package:appcoqueiro/Componentes.dart';
import 'package:appcoqueiro/produto.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';


class Produtosingle extends StatefulWidget {
  const Produtosingle({super.key});


  @override
  State<Produtosingle> createState() => _ProdutosingleState();
}


class _ProdutosingleState extends State<Produtosingle> {
  Poroduto porodutoActual = new Poroduto(
    "Massa Italiano",
    "xof 10.000",
    "assests/5833.jpg",
  );


  List<dynamic> ingridientes = [
    ["Cebola", false],
    ["Salsa", false],
    ["Maionese", false],
    ["Molho", false],
    ["Pimenta", false],
    ["Pimenta", false],
    ["Pimenta", false],
  ];
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 241, 241, 241),
        title: Center(
          child: Componentes().texto("Produto", 20, true, Colors.black),
        ),
      ),


      body:
          Container(
            width: width,
            height: height,
            color: Color.fromARGB(255, 241, 241, 241),
            child: Container(
              padding: EdgeInsets.all(20),
              height: height * 80 / 100,
              width: width,


              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: height *83/100,
                      child: ListView(
                       
                        children: [
                            Container(
                        width: width,
                        height: height * 25 / 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage("assests/5833.jpg"),
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
                      Componentes().texto("Comida Italiada", 16, true, Colors.grey),
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
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.black,
                                      size: 20,
                                    ),
                                  ),
                                ),
                                Componentes().texto("2", 18, true, Colors.black),
                                      
                                      
                                Container(
                                  width: 30,
                                  height: 30,
                                  child: CircleAvatar(
                                    backgroundColor: Color(0xFF307A59),
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                                      
                                      
                          SizedBox(width: 20),
                          Componentes().texto(
                            porodutoActual.preco,
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
                      SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: const Color.fromARGB(255, 214, 214, 214),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 300,
                        child: ListView.builder(
                          itemCount: ingridientes.length,
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: const Color.fromARGB(255, 214, 214, 214),
                                  ),
                                ),
                              ),
                              child: GFCheckboxListTile(
                                padding: EdgeInsets.all(2),
                                title: Componentes().texto(
                                  ingridientes[index][0],
                                  18,
                                  true,
                                  Colors.black,
                                ),
                                size: 20,
                                activeBgColor: Colors.green,
                                type: GFCheckboxType.square,
                                activeIcon: Icon(
                                  Icons.check,
                                  size: 15,
                                  color: Colors.white,
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    print("dsds");
                                    ingridientes[index][1] = value;
                                  });
                                },
                                value: ingridientes[index][1],
                                inactiveIcon: null,
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
                       child: Componentes().texto("Adicionar (xof 10.000)", 18, true, Colors.white),
                        onPressed: (){
                      
                      }),
                    
                  ],
                ),
              ),




          )

    
               
    );
  }
}



