import 'package:flutter/material.dart';
import 'package:flutter_application_1/servicios/crud_firebase.dart';
import 'package:flutter_application_1/Pantalla/Inicio.dart'; // Importa la nueva pantalla de inicio

class FormularioInicioSesion extends StatefulWidget {
  const FormularioInicioSesion({Key? key}) : super(key: key);

  @override
  _FormularioInicioSesionState createState() => _FormularioInicioSesionState();
}

class _FormularioInicioSesionState extends State<FormularioInicioSesion> {
  TextEditingController correoController = TextEditingController();
  TextEditingController contrasenaController = TextEditingController();
  String? mensajeError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio de Sesión'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: correoController,
              decoration: InputDecoration(
                labelText: 'Correo Electrónico',
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: contrasenaController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Contraseña',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                String correo = correoController.text;
                String contrasena = contrasenaController.text;
                // Iniciar sesión
                Map<String, dynamic>? usuario = await CRUDFirebase().iniciarSesion(correo, contrasena);
                if (usuario != null) {
                  // El inicio de sesión fue exitoso, navegar a la pantalla de inicio
                  Navigator.pushReplacement( // Reemplazar la pantalla actual con la nueva
                    context,
                    MaterialPageRoute(builder: (context) => Inicio()), // PantallaInicio es la nueva pantalla de inicio
                  );
                } else {
                  // El inicio de sesión falló
                  setState(() {
                    mensajeError = 'Correo o contraseña incorrectos';
                  });
                  print("Inicio de sesión fallido. Correo: $correo, Contraseña: $contrasena");
                }
              },
              child: const Text('Iniciar Sesión'),
            ),
            if (mensajeError != null) // Mostrar el mensaje de error si está presente
              Text(
                mensajeError!,
                style: TextStyle(color: Colors.red),
              ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Limpiar los controladores de texto al salir del widget
    correoController.dispose();
    contrasenaController.dispose();
    super.dispose();
  }
}
