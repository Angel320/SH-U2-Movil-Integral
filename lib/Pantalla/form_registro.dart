import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/Servicios/validaciones.dart';

class FormularioRegistro extends StatefulWidget {
  const FormularioRegistro({Key? key}) : super(key: key);

  @override
  _FormularioRegistroState createState() => _FormularioRegistroState();
}

class _FormularioRegistroState extends State<FormularioRegistro> {
  final _formKey = GlobalKey<FormState>();
  late String correo;
  late String contrasena = ''; // Ahora inicializada como cadena vacía

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Nueva Cuenta'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Correo Electrónico',
                ),
                validator: Validaciones.validarCorreo,
                onSaved: (value) {
                  correo = value!;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Contraseña (mínimo 6 caracteres)',
                ),
                validator: Validaciones.validarContrasena,
                onChanged: (value) {
                  setState(() {
                    contrasena = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Confirmar Contraseña',
                ),
                validator: (value) => Validaciones.confirmarContrasena(value, contrasena),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  // Ejecutar la validación del formulario
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    try {
                      UserCredential userCredential =
                          await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: correo,
                        password: contrasena,
                      );
                      print(
                          'Registro exitoso. ID del usuario: ${userCredential.user!.uid}');
                    } catch (e) {
                      print('Error durante el registro: $e');
                    }
                  }
                },
                child: const Text('Siguiente'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
