import 'package:appcoqueiro/Componentes.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class User extends StatefulWidget {
  const User({super.key});

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Componentes().texto("Perfil", 20, true, Colors.black),
      ),

      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 0, color: Colors.grey),
              ),
              child: GFAvatar(
                size: 100,
                backgroundImage: NetworkImage(
                  "assests/hombre-sonriente-de-primer-plano-en-pub.jpg",
                ),
              ),
            ),
            SizedBox(height: 20),
            Componentes().texto("Edilson Cardoso", 22, true, Colors.black),
            SizedBox(height: 20),
            Componentes().texto(
              "istmeitchon@gmail.com",
              20,
              false,
              Colors.black,
            ),

            SizedBox(height: 30),
            Align(
              alignment: Alignment.topLeft,
              child: Componentes().texto(
                "Informações Pessoais",
                22,
                true,
                Colors.black,
              ),
            ),
            SizedBox(height: 20),
            Column(
              children: [
                Container(
                  
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 243, 243, 243),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.person),
                      SizedBox(width: 20,),
                       Componentes().texto("Edilson Cardoso", 20, true, Colors.black),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Icon(Icons.edit))
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
