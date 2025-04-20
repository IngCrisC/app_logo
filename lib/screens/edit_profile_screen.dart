import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController(text: 'Juan Pérez');
  final _emailController = TextEditingController(text: 'juan.perez@email.com');

  File? _imageFile;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  void _saveProfile() {
    if (_formKey.currentState!.validate()) {
      // Aquí guardarías los datos en tu backend o servicio de usuario.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Perfil actualizado correctamente')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Editar Perfil')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: _imageFile != null
                        ? FileImage(_imageFile!)
                        : NetworkImage('https://i.pravatar.cc/300')
                            as ImageProvider,
                  ),
                  IconButton(
                    icon: Icon(Icons.camera_alt),
                    onPressed: _pickImage,
                  ),
                ],
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Nombre completo'),
                validator: (value) => value == null || value.isEmpty
                    ? 'Este campo es obligatorio'
                    : null,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Correo electrónico'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) => value == null || value.isEmpty
                    ? 'Este campo es obligatorio'
                    : null,
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: _saveProfile,
                child: Text('Guardar cambios'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
