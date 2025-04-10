import 'package:app_logo/core/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../core/color.dart';
import '../core/string.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? Key}) : super(key: Key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo + Nombre de la App
              Row(
                children: [
                  Image.asset(
                    'assets/icons/3.png',
                    width: 90,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    AppStrings.nameApp,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: AppColors.secondaryColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),

              // Texto centrado
              Text(
                AppStrings.textInit,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black, fontSize: 19),
              ),
              const SizedBox(height: 40),

              // Campo de usuario
              Row(
                children: [
                  const Icon(Icons.person, color: Colors.black),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: AppColors.secondaryColor,
                          width: 3,
                        )),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Campo de contraseña
              Row(
                children: [
                  const Icon(Icons.vpn_key, color: Colors.black),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: AppColors.secondaryColor,
                          width: 3,
                        )),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),

              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed(Routes.login);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.secondaryColor,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 90, vertical: 15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                          side: BorderSide(color: Colors.white, width: 2))),
                  child: const Text(
                    AppStrings.login,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),

              Center(
                child: Text(
                  AppStrings.restore,
                  style: TextStyle(color: Colors.black, fontSize: 19),
                ),
              ),
              const SizedBox(height: 40),

              // Botón con ícono de Google
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {
                    // acción con Google
                  },
                  icon:
                      const FaIcon(FontAwesomeIcons.google, color: Colors.red),
                  label: const Text(
                    'Ingresa con Google',
                    style: TextStyle(color: Colors.black87, fontSize: 19),
                  ),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    side: BorderSide(
                      color: AppColors.secondaryColor,
                      width: 3,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Texto final
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    AppStrings.anyAcount,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 19,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.login);
                    },
                    child: const Text(
                      AppStrings.register,
                      style: TextStyle(
                        color: AppColors.secondaryColor,
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
