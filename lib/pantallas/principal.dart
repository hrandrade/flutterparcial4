import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutterparcial4/pantallas/menulateral.dart';
//import 'package:flutterparcial4/pantallas/menulateral.dart';

class Clientes extends StatefulWidget {
  const Clientes({Key? key}) : super(key: key);

  @override
  State<Clientes> createState() => _ClientesState();
}

class _ClientesState extends State<Clientes> {
  // text fields' controllers
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _cedulaController = TextEditingController();
  final TextEditingController _apellidoController = TextEditingController();
  final TextEditingController _fechanacimientoController =
      TextEditingController();
  final TextEditingController _sexoController = TextEditingController();
  final TextEditingController _tipoController = TextEditingController();
  final TextEditingController _usuarioController = TextEditingController();
  final TextEditingController _reservasidController = TextEditingController();

  //collection firebase
  final CollectionReference _clientes =
      FirebaseFirestore.instance.collection('clientes');

  //insertar producto
  Future<void> _create([DocumentSnapshot? documentSnapshot]) async {
    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 0.01),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //primer campo
                TextField(
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  controller: _cedulaController,
                  decoration: const InputDecoration(
                    labelText: 'Cedula',
                  ),
                ),
                //segundo campo
                TextField(
                  controller: _nombreController,
                  decoration: const InputDecoration(labelText: 'Nombre'),
                ),
                //tercer campo
                TextField(
                  controller: _apellidoController,
                  decoration: const InputDecoration(labelText: 'Apellido'),
                ),
                //cuarto campo
                TextField(
                  controller: _fechanacimientoController,
                  decoration:
                      const InputDecoration(labelText: 'Fecha de Nacimiento'),
                ),
                //quinto campo
                TextField(
                  controller: _sexoController,
                  decoration: const InputDecoration(labelText: 'Sexo'),
                ),
                //sexto campo
                TextField(
                  controller: _tipoController,
                  decoration: const InputDecoration(labelText: 'Tipo'),
                ),
                //septimo campo
                TextField(
                  controller: _usuarioController,
                  decoration: const InputDecoration(labelText: 'Usuario'),
                ),
                //octavo campo
                TextField(
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  controller: _reservasidController,
                  decoration: const InputDecoration(
                    labelText: 'Id Reserva',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      primary: Colors.black,
                      shadowColor: Colors.white,
                      backgroundColor: Colors.greenAccent,
                      side: BorderSide(color: Colors.blue, width: 1),
                      elevation: 8,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                    label: const Text('Crear Cliente',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        )),
                    icon: const Icon(FeatherIcons.userCheck),
                    onPressed: () async {
                      final double? cedula =
                          double.tryParse(_cedulaController.text);
                      final String nombre = _nombreController.text;
                      final String apellido = _apellidoController.text;
                      final String fechanacimiento =
                          _fechanacimientoController.text;
                      final String sexo = _sexoController.text;
                      final String tipo = _tipoController.text;
                      final String usuario = _usuarioController.text;
                      final double? reservasidreservas =
                          double.tryParse(_reservasidController.text);
                      if (reservasidreservas != null) {
                        await _clientes.add({
                          "cedula": cedula,
                          "nombre": nombre,
                          "apellido": apellido,
                          "fecha_nacimiento": fechanacimiento,
                          "sexo": sexo,
                          "tipo": tipo,
                          "usuario": usuario,
                          "reservas_idreservas": reservasidreservas
                        });
                        _cedulaController.text = '';
                        _nombreController.text = '';
                        _apellidoController.text = '';
                        _fechanacimientoController.text = '';
                        _sexoController.text = '';
                        _tipoController.text = '';
                        _usuarioController.text = '';
                        _reservasidController.text = '';
                        Navigator.of(context).pop();
                      }
                    },
                  ),
                )
              ],
            ),
          );
        });
  }

  //actualizar Cliente
  Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      _cedulaController.text = documentSnapshot['cedula'].toString();
      _nombreController.text = documentSnapshot['nombre'].toString();
      _apellidoController.text = documentSnapshot['apellido'].toString();
      _fechanacimientoController.text =
          documentSnapshot['fecha_nacimiento'].toString();
      _sexoController.text = documentSnapshot['sexo'].toString();
      _tipoController.text = documentSnapshot['tipo'].toString();
      _usuarioController.text = documentSnapshot['usuario'].toString();
      _reservasidController.text =
          documentSnapshot['reservas_idreservas'].toString();
    }

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 0.1),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //primer campo
                TextField(
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  controller: _cedulaController,
                  decoration: const InputDecoration(
                    labelText: 'Cedula',
                  ),
                ),
                TextField(
                  controller: _nombreController,
                  decoration: const InputDecoration(labelText: 'Nombre'),
                ),
                TextField(
                  controller: _apellidoController,
                  decoration: const InputDecoration(labelText: 'Apellido'),
                ),
                TextField(
                  controller: _fechanacimientoController,
                  decoration:
                      const InputDecoration(labelText: 'Fecha de Nacimiento'),
                ),
                TextField(
                  controller: _sexoController,
                  decoration: const InputDecoration(labelText: 'Sexo'),
                ),
                TextField(
                  controller: _tipoController,
                  decoration: const InputDecoration(labelText: 'Tipo'),
                ),
                TextField(
                  controller: _usuarioController,
                  decoration: const InputDecoration(labelText: 'Usuario'),
                ),
                TextField(
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  controller: _reservasidController,
                  decoration: const InputDecoration(
                    labelText: 'Id Reservas',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      primary: Colors.black,
                      shadowColor: Colors.white,
                      backgroundColor: Colors.greenAccent,
                      side: BorderSide(color: Colors.blue, width: 1),
                      elevation: 8,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                    label: const Text('Actualizar Cliente',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        )),
                    icon: const Icon(FeatherIcons.check),
                    onPressed: () async {
                      final double? cedula =
                          double.tryParse(_cedulaController.text);
                      final String nombre = _nombreController.text;
                      final String apellido = _apellidoController.text;
                      final String fechanacimiento =
                          _fechanacimientoController.text;
                      final String sexo = _sexoController.text;
                      final String tipo = _tipoController.text;
                      final String usuario = _usuarioController.text;
                      final double? reservasidreservas =
                          double.tryParse(_reservasidController.text);
                      if (reservasidreservas != null) {
                        await _clientes.doc(documentSnapshot!.id).update({
                          "cedula": cedula,
                          "nombre": nombre,
                          "apellido": apellido,
                          "fecha_nacimiento": fechanacimiento,
                          "sexo": sexo,
                          "tipo": tipo,
                          "usuario": usuario,
                          "reservas_idreservas": reservasidreservas
                        });
                        _cedulaController.text = '';
                        _nombreController.text = '';
                        _apellidoController.text = '';
                        _fechanacimientoController.text = '';
                        _sexoController.text = '';
                        _tipoController.text = '';
                        _usuarioController.text = '';
                        _reservasidController.text = '';
                        Navigator.of(context).pop();
                      }
                    },
                  ),
                )
              ],
            ),
          );
        });
  }

  //borrar cliente
  Future<void> _delete(String clienteId) async {
    await _clientes.doc(clienteId).delete();

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('El cliente fue eliminado correctamente')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      drawer: MenuLaterial(),
      appBar: AppBar(
        backgroundColor: Colors.tealAccent,
        title: const Text(
          'MANTENIMIENTO CLIENTES',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 4, 137, 6),
              fontSize: 18),
        ),
      ),
      body: StreamBuilder(
          stream: _clientes.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return ListView.separated(
                separatorBuilder: (context, index) {
                  return Divider(
                    height: 1,
                    color: Colors.green,
                  );
                },
                itemCount: streamSnapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot =
                      streamSnapshot.data!.docs[index];
                  return Card(
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      title: Text(documentSnapshot['usuario'].toString()),
                      subtitle: Text(documentSnapshot['nombre'].toString()),
                      leading: CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 112, 112, 112),
                        child: Icon(FeatherIcons.user),
                      ),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                                icon: const Icon(
                                  FeatherIcons.edit,
                                  color: Colors.blue,
                                ),
                                onPressed: () => _update(documentSnapshot)),
                            IconButton(
                                icon: const Icon(
                                  FeatherIcons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () => _delete(documentSnapshot.id)),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
      // agregar productos
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () => _create(),
        child: const Icon(FeatherIcons.userPlus),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
