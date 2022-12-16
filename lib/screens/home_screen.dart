import 'package:flutter/material.dart';
import 'package:preferencias_usuario/shared_preferences/preferences.dart';
import 'package:preferencias_usuario/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routerName = 'Home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const SideMenu(),
        appBar: AppBar(
          title: const Text('Home'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('DarkMode: ${Preferences.isDarkMode}'),
              const Divider(),
              Text('Genero: ${Preferences.gender}'),
              const Divider(),
              Text('Nombre de usuario: ${Preferences.name}'),
              const Divider(),
            ],
          ),
        ));
  }
}
