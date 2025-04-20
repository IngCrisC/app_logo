import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String userName;
  final String email;
  final String profileImageUrl;

  ProfilePage({
    this.userName = 'Juan Pérez',
    this.email = 'juan.perez@email.com',
    this.profileImageUrl = 'https://i.pravatar.cc/300',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mi Perfil')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(profileImageUrl),
            ),
            SizedBox(height: 16),
            Text(
              userName,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              email,
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            SizedBox(height: 32),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text('Editar perfil'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navegar a vista de edición de perfil
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text('Cambiar contraseña'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navegar a vista de cambio de contraseña
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.red),
              title: Text('Cerrar sesión', style: TextStyle(color: Colors.red)),
              onTap: () {
                // Lógica para cerrar sesión
              },
            ),
          ],
        ),
      ),
    );
  }
}
