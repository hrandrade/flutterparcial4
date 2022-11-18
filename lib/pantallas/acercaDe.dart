import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutterparcial4/pantallas/menulateral.dart';

class AcercaDe extends StatefulWidget {
  const AcercaDe({
    Key? key,
  }) : super(key: key);

  @override
  State<AcercaDe> createState() => _AcercaDeState();
}

class _AcercaDeState extends State<AcercaDe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuLaterial(),
      appBar: AppBar(
          backgroundColor: Colors.tealAccent,
          title: const Text(
              'ACERCA DE',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 4, 137, 6),
                  fontSize: 18),
            ),),
      backgroundColor: Colors.greenAccent, //color de fondo
      body: spotBody(),
    );
  }

  Widget spotBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 40, left: 30, right: 30),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("PARCIAL 4 / ETPS3-T",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 4, 137, 6))),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, ),
              child: Center(
                child: Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                          color: Colors.green,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.tealAccent.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 1,
                              offset:
                                  Offset(0, 1), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(20)),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        FeatherIcons.users,
                        color: Colors.white,
                        size: 80,
                      )),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("INTEGRANTES: ",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
            Padding(
              padding: const EdgeInsets.only(top:10, left: 10, right: 10),
              child: Text("Jose Alexander Ramirez Reyes",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
            Text("25-3422-2018",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.black)
            ),
            Padding(
              padding: const EdgeInsets.only(top:10, left: 10, right: 10),
              child: Text("Heber Rodrigo Ventura Andrade",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
            Text("25-2418-2018",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.black)
            ),
          ],
        ),
      ),
    );
  }
}