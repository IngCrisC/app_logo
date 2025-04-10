import 'package:flutter/material.dart';
import '../core/routes.dart';
import '../core/color.dart';
import '../core/string.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      // se establece que espere 5 segundos y luego pase a la vista home
      Navigator.of(context).pushReplacementNamed(Routes.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor, // color de fondo
      body: Stack(
        children: [
          Center(
            // centrar elementos
            child: Column(
              // elemento hijo tipo columna
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/icons/3.png',
                  width: 300,
                  fit: BoxFit.contain,
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  AppStrings.nameApp, // Nombre de la aplicacion
                  style: TextStyle(
                    // estilos de texto como, color, tamaño y negrita
                    color: AppColors.secondaryColor,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(), // espacio
          Positioned(
            // configuracion de mi nombre
            bottom: 16, // pocicion respecto a la parte inferior de la pantalla
            right: 1, // pocicion respecto a la parte derecha de la pantalla
            child: const Text(
              AppStrings.myName, // nombre
              style: TextStyle(
                fontSize: 19, // tamaño de texto
                color: AppColors.secondaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
