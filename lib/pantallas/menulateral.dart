import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutterparcial4/pantallas/acercaDe.dart';
import 'package:flutterparcial4/pantallas/principal.dart';

class MenuLaterial extends StatelessWidget {
  const MenuLaterial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 195, 255, 226),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _buildDrawerHeader(),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(FeatherIcons.home),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text("CLIENTES"),
                )
              ],
            ),
            onTap: () => {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Clientes()))
            },
          ),
          Divider(
            height: 1,
            color: Colors.black,
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(FeatherIcons.settings),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text("ACERCA DE"),
                )
              ],
            ),
            onTap: () => {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => AcercaDe()))
            },
          ),
        ],
      ),
    );
  }
}

Widget _buildDrawerHeader() {
  return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: Colors.tealAccent,
      ),
      child: Stack(children: <Widget>[
        Positioned(
            bottom: 20.0,
            left: 20.0,
            child: Text("APP CLIENTES - ETPS3 PRACIAL 4",
                style: TextStyle(
                    color: Color.fromARGB(255, 4, 137, 6),
                    fontSize: 15,
                    fontWeight: FontWeight.w500))),
      ]));
}
