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
     var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Componentes().texto("Perfil", 20, true, Colors.black),
      ),

      body: Container(

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
            
            
            Container(
              height: 550,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 247, 247, 247),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), 
                  bottomLeft: Radius.circular(20)
                  )
              ),
              child: Column(
                children: [
                  
                  Align(
                alignment: Alignment.topLeft,
                child: Componentes().texto(
                  "Informações Pessoais",
                  22,
                  true,
                  Colors.black,
                ),
              ),SizedBox(height: 20),
                  Container(
                    width: width,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 3, 148, 15),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.person, color: Colors.white,),
                        SizedBox(width: 20,),
                         Componentes().texto("Edilson Cardoso", 20, true, Colors.white),
                        
                      ],
                    ),
                  ),
                  SizedBox(height:  20,),
                  Container(
                    width: width,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 3, 148, 15),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.phone ,color: Colors.white,),
                        SizedBox(width: 20,),
                         Componentes().texto("955 26 52 60", 20, true, Colors.white),
                        
                      ],
                    ),
                  ),
                  SizedBox(height:  20,),
                  Container(
                    width: width,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 3, 148, 15),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.location_city,
                        color: Colors.white,
                        ),
                        SizedBox(width: 20,),
                         Componentes().texto("Bissau,Cuntum", 20, true, const Color.fromARGB(255, 255, 255, 255)),
                        
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
