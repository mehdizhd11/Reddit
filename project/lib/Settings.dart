import 'package:flutter/material.dart';
import 'package:project/AboutUs.dart';
import 'package:project/Home.dart';
import 'package:project/SplashScreen.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:project/CreateSubreddit.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool lockInBackground = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //** Scaffold color */
      backgroundColor: Colors.black,
      //** App Bar */
      appBar: AppBar(
        title: Center(
          child: Text(
            'Settings',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'GoogleSans-Medium',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context,
                      MaterialPageRoute(
                        builder: (context) => Home(),
                      ),
                    );
          },
        ),
        backgroundColor: Colors.black,
      ),
      //** End the App Bar */
      //*************************************/
      //** body and List of Settings */
      body: SettingsList(
        lightTheme: SettingsThemeData(
            //** Setting theme */
            settingsListBackground: Colors.black,
            settingsSectionBackground: Colors.black),
        sections: [
          SettingsSection(
            tiles: [
              SettingsTile.navigation(
                //** Profile */
                title: Text(
                  'Profile',
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'GoogleSans-Medium',
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                leading: Icon(
                  Icons.person_outline,
                  color: Colors.orange,
                ),
                onPressed: (BuildContext context) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SplashScreen(), //!!!!
                    ),
                  );
                },
              ),
              SettingsTile.navigation(
                //** Create Sub... */
                title: Text(
                  'Create Subreddit',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'GoogleSans-Medium',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                leading: Icon(
                  Icons.add_circle_outline,
                  color: Colors.orange,
                ),
                onPressed: (BuildContext context) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreateSubreddit(),
                    ),
                  );
                },
              ),
              SettingsTile.navigation(
                //** Saved Posts */
                title: Text(
                  'Saved Posts',
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'GoogleSans-Medium',
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                leading: Icon(
                  Icons.bookmark_outline,
                  color: Colors.orange,
                ),
                onPressed: (BuildContext context) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SplashScreen(), //!!!
                    ),
                  );
                },
              ),
              SettingsTile.navigation(
                //** About Us */
                title: Text(
                  'About Us',
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'GoogleSans-Medium',
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                leading: Icon(
                  Icons.info_outline,
                  color: Colors.orange,
                ),
                onPressed: (BuildContext context) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AboutUs(),
                    ),
                  );
                },
              ),
              SettingsTile.switchTile(
                //** Theme INCOMPELETE */
                title: Text(
                  'Theme',
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'GoogleSans-Medium',
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                leading: Icon(
                  Icons.brightness_3,
                  color: Colors.orange,
                ),
                onToggle: (bool value) {
                  setState(() {
                    lockInBackground = value;
                  });
                },
                initialValue: null,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
