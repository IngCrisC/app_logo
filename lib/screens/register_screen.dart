import 'package:flutter/material.dart';
import '../../core/routes.dart';
import '../../core/color.dart';
import '../../core/string.dart';

// Se crea la clase RegisterScreen y se le dice que extienda de StateFulWidget, ya que los datos con que va trabajar esta clase pueden cambiar
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  //  TextEditingController() me permite obtener o asignar datos en un campo de texto
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _isPasswordVisible = false;

  void _register() {
    if (_formKey.currentState!.validate()) {
      // text.trim se usa para eliminar espacios al comienzo y al final de texto.
      final name = _nameController.text.trim();
      final email = _emailController.text.trim();
      // .text se usa para obtener la entrada del texto
      final password = _passwordController.text;

      // Validacion que los datos se estan obteniendo.
      print('Registrando: $name, $email, $password');
    }
  }

  // Este dispose se usa para liberar la memoria que usaron los controladores, la memoria se libera cuando la vista se cierra
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold es el que organiza elementos en una estructura
    return Scaffold(
      // AppBar es una clase widget proporcionada por flutter y funciona como una barra de navegacion
      appBar: AppBar(title: Text(AppStrings.nameApp)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        // Form es un contenedor que fluter reconoce como formulario, al envolver los elementos dentro de este contenedor se podran usar metodos especiales para un formulario.
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Center(
                // centrar elementos
                child: Column(
                  // elemento hijo tipo columna
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/icons/3.png',
                      width: 200,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      AppStrings.register,
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
              const Spacer(),
              TextFormField(
                // Campo para nombre
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Nombre',
                  labelStyle: TextStyle(
                    color: AppColors.secondaryColor,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: AppColors.thirdColor,
                    width: 1,
                  )),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: AppColors.thirdColor,
                    width: 2,
                  )),
                ),

                validator: (value) =>
                    // Si el campo es valido retorna ingrese su nombre si no entonces retorna null
                    value!.isEmpty ? 'Ingrese su nombre completo' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Correo electrónico',
                  labelStyle: TextStyle(
                    color: AppColors.secondaryColor,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: AppColors.thirdColor,
                    width: 1,
                  )),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: AppColors.thirdColor,
                    width: 2,
                  )),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'Ingrese su correo';
                  final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                  if (!emailRegex.hasMatch(value)) return 'Correo inválido';
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  labelStyle: TextStyle(
                    color: AppColors.secondaryColor,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: AppColors.thirdColor,
                    width: 1,
                  )),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: AppColors.thirdColor,
                    width: 2,
                  )),
                  suffixIcon: IconButton(
                    icon: Icon(_isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () => setState(
                        () => _isPasswordVisible = !_isPasswordVisible),
                  ),
                ),
                obscureText: !_isPasswordVisible,
                validator: (value) => value != null && value.length < 6
                    ? 'Mínimo 6 caracteres'
                    : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _confirmPasswordController,
                decoration: const InputDecoration(
                  labelText: 'Confirmar contraseña',
                  labelStyle: TextStyle(
                    color: AppColors.secondaryColor,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: AppColors.thirdColor,
                    width: 1,
                  )),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: AppColors.thirdColor,
                    width: 2,
                  )),
                ),
                obscureText: true,
                validator: (value) {
                  if (value != _passwordController.text)
                    return 'Las contraseñas no coinciden';
                  return null;
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(Routes.login);
                },
                child: Text(
                  AppStrings.save,
                  style: const TextStyle(
                    color: AppColors.secondaryColor,
                    fontSize: 19,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  // Navegar a login
                  Navigator.pop(context);
                },
                child: Text(
                  '${AppStrings.alreadyAccount} ${AppStrings.logIn}',
                  style: const TextStyle(
                    color: AppColors.secondaryColor,
                    fontSize: 19,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
