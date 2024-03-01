import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pantalla/form_inicio.dart'; 
import 'package:flutter_application_1/Pantalla/form_registro.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
//import 'package:glassmorphism_ui/glassmorphism_ui.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MiApp());
}

//void main() => runApp(const MiApp());

class MiApp extends StatelessWidget {
  const MiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: "TaskMaster",
      home: InicioSesion(),
       theme: ThemeData.dark(), // Configura el tema de la aplicación como oscuro
    );
  }
}



class InicioSesion extends StatelessWidget {
  const InicioSesion({Key? key}) : super(key: key);
  // Constante para el tamaño de los botones
  static const double buttonWidth = 290.0;


/*await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);*/
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      
      

      appBar: AppBar(
        title: const Text('TaskMaster te da la bienvenida'),
      ),
      
      

      body: Align(

        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              //espaciado entre botones
              const SizedBox(height: 20),

              //Boton de LogIn
            SizedBox(
              width: buttonWidth,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FormularioInicioSesion()), // Navega a la pantalla de inicio de sesión
                  );
                  // Aquí agregaríamos la funcionalidad para iniciar sesión
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 255, 0, 179)), // Cambiar el color de fondo del botón
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Cambiar el color del texto del botón
                ),
                child: const Text(
                  'Acceder a mi cuenta',
                  style: TextStyle(color: Colors.white), // Cambiar el color del texto del botón
                ),
              ),
            ),

            //Boton de LogIn
          SizedBox(
            width: buttonWidth,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FormularioRegistro()), // Navega a la pantalla de inicio de sesión
                  );
                // Aquí agregaríamos la navegación a la pantalla de registro
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(231, 253, 253, 253)), // Cambiar el color de fondo del botón
                foregroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 239, 239, 239)), // Cambiar el color del texto del botón
              ),
              child: const Text(
                'Iniciar una nueva cuenta',
                style: TextStyle(color: Color.fromARGB(170, 0, 0, 0)), // Cambiar el color del texto del botón
              ),
            ),
          ),
              
              
            
            ],
          ),//Columna como un contenedor
        ),//Margen

      ),//Body



    
    
    
    );
  }
}
