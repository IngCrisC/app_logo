import 'package:flutter/material.dart';

class ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscureCurrent = true;
  bool _obscureNew = true;
  bool _obscureConfirm = true;

  void _toggleObscureText(String field) {
    setState(() {
      if (field == 'current') {
        _obscureCurrent = !_obscureCurrent;
      } else if (field == 'new') {
        _obscureNew = !_obscureNew;
      } else if (field == 'confirm') {
        _obscureConfirm = !_obscureConfirm;
      }
    });
  }

  void _submitChange() {
    if (_formKey.currentState!.validate()) {
      // Aquí realizarías el cambio de contraseña, llamando a tu API o lógica de backend.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Contraseña actualizada correctamente')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cambiar contraseña')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildPasswordField(
                controller: _currentPasswordController,
                label: 'Contraseña actual',
                obscureText: _obscureCurrent,
                toggle: () => _toggleObscureText('current'),
              ),
              SizedBox(height: 16),
              _buildPasswordField(
                controller: _newPasswordController,
                label: 'Nueva contraseña',
                obscureText: _obscureNew,
                toggle: () => _toggleObscureText('new'),
              ),
              SizedBox(height: 16),
              _buildPasswordField(
                controller: _confirmPasswordController,
                label: 'Confirmar contraseña',
                obscureText: _obscureConfirm,
                toggle: () => _toggleObscureText('confirm'),
                validator: (value) {
                  if (value != _newPasswordController.text) {
                    return 'Las contraseñas no coinciden';
                  }
                  return null;
                },
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: _submitChange,
                child: Text('Actualizar contraseña'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required String label,
    required bool obscureText,
    required VoidCallback toggle,
    FormFieldValidator<String>? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return 'Este campo es obligatorio';
            }
            if (value.length < 6) {
              return 'Debe tener al menos 6 caracteres';
            }
            return null;
          },
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        suffixIcon: IconButton(
          icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility),
          onPressed: toggle,
        ),
      ),
    );
  }
}
