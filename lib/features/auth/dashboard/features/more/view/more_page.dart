import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:therapy_app/core/providers/theme_provider.dart';
import 'package:therapy_app/features/auth/dashboard/features/services/model/repo/firebase.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
                  IconButton(
                    onPressed: () async {
              final firebaseRepo = FirebaseRepo();
              await firebaseRepo.signOut(context);
            },
                    icon: Icon(Icons.exit_to_app),
                    iconSize: 25,
                   color: Colors.brown,
                  )
                ],
      ),
      body: Column(
        children: [
          SwitchListTile(
            secondary: Image.asset(
              'assets/images/theme.png',
              fit: BoxFit.fill,
            ),
            title: Text(
                themeProvider.getIsDarkTheme ? "Dark mode" : "Light mode"),
            value: themeProvider.getIsDarkTheme,
            onChanged: (value) {
              themeProvider.setDarkTheme(themeValue: value);
            },
          ),
        ],
      ),
    );
  }
}
