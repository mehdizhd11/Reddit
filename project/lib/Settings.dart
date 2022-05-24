import 'package:flutter/material.dart';
import 'package:project/SplashScreen.dart';
import 'package:settings_ui/settings_ui.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool lockInBackground = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Settings'),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.black,
        ),
      body: SettingsList(
        lightTheme: SettingsThemeData(
          settingsListBackground: Colors.orange,
          settingsSectionBackground: Colors.grey,
        ),
        sections: [
          SettingsSection(
            //title: Text('General'),
            tiles: [
              SettingsTile.navigation(
                title: Text('Profile'),
                leading: Icon(Icons.person),
                onPressed: (BuildContext context) {
                  Navigator.push(context,
                    MaterialPageRoute(
                      builder: (context) => SplashScreen(),
                    ),
                  );
                },
              ),
              SettingsTile.navigation(
                title: Text('Create Subreddit'),
                leading: Icon(Icons.add_circle),
                onPressed: (BuildContext context) {
                  Navigator.push(context,
                    MaterialPageRoute(
                      builder: (context) => SplashScreen(),
                    ),
                  );
                },
              ),
              SettingsTile.navigation(
                title: Text('Saved Posts'),
                leading: Icon(Icons.bookmark),
                onPressed: (BuildContext context) {
                  Navigator.push(context,
                    MaterialPageRoute(
                      builder: (context) => SplashScreen(),
                    ),
                  );
                },
              ),
              SettingsTile.navigation(
                title: Text('About Us'),
                leading: Icon(Icons.info),
                onPressed: (BuildContext context) {
                  Navigator.push(context,
                    MaterialPageRoute(
                      builder: (context) => SplashScreen(),
                    ),
                  );
                },
              ),
              SettingsTile.switchTile(
                title: Text('Theme'),
                leading: Icon(Icons.brightness_3),
                onToggle: (bool value) {
                  setState(() {
                    lockInBackground = value;
                  });
                }, initialValue: null,
              ),
            ],
          ),
        ],
      ),
    );
  }
}