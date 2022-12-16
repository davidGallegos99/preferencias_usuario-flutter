import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:preferencias_usuario/provider/preferences_provider.dart';
import 'package:preferencias_usuario/shared_preferences/preferences.dart';
import 'package:preferencias_usuario/widgets/custom_drawer.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  static const String routerName = 'Settings';

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final PreferencesProvider provider =
        Provider.of<PreferencesProvider>(context);
    return Scaffold(
        drawer: const SideMenu(),
        appBar: AppBar(
          title: const Text('Settings'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Ajustes',
                  style: TextStyle(fontSize: 45, fontWeight: FontWeight.w300),
                ),
                const Divider(),
                ListTile(
                  onTap: () {},
                  title: const Text('DarkMode'),
                  trailing: CupertinoSwitch(
                      value: Preferences.isDarkMode,
                      onChanged: (val) {
                        Preferences.setDarkMode = val;
                        val ? provider.setDarkMode() : provider.setLightMode();
                        setState(() {});
                      }),
                ),
                const Divider(),
                RadioListTile<int>(
                    title: const Text('Masculino'),
                    value: 1,
                    groupValue: Preferences.gender,
                    onChanged: (val) {
                      Preferences.setGender = val ?? 1;
                      setState(() {});
                    }),
                RadioListTile<int>(
                    title: const Text('Femenino'),
                    value: 2,
                    groupValue: Preferences.gender,
                    onChanged: (val) {
                      Preferences.setGender = val ?? 2;
                      setState(() {});
                    }),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    initialValue: Preferences.name,
                    decoration: const InputDecoration(
                        labelText: 'Nombre', helperText: 'Nombre del usuario'),
                    onChanged: (val) {
                      Preferences.setName = val;
                      setState(() {});
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
