import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/screens/login.dart';
import 'package:settings_ui/settings_ui.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool confrim = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SETTING'),
        automaticallyImplyLeading: false,
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: Text('Common'),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: Icon(Icons.language),
                title: Text('Language'),
                value: Text('English'),
                onPressed: (context) {
                  // Handle navigation to change language screen
                },
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.cloud_queue),
                title: Text('Environment'),
                value: Text('Production'),
                onPressed: (context) {
                  // Handle environment settings
                },
              ),
              SettingsTile.switchTile(
                onToggle: (value) {
                  // Handle enable custom theme
                },
                initialValue: false,
                leading: Icon(Icons.format_paint),
                title: Text('Enable custom theme'),
              ),
            ],
          ),
          SettingsSection(
            title: Text('Account'),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: Icon(Icons.phone),
                title: Text('Phone number'),
                onPressed: (context) {
                  // Handle phone number settings
                },
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.email),
                title: Text('Email'),
                onPressed: (context) {
                  // Handle email settings
                },
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.exit_to_app),
                title: Text('Sign out'),
                onPressed: (context) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Confirm Sign Out'),
                        content: Text('Are you sure you want to sign out?'),
                        actions: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.red.withOpacity(0.9)),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(); // ปิด modal ถ้ายกเลิก
                                  },
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(color: Colors.white),
                                  )),
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.blue.withOpacity(0.9)),
                                ),
                                onPressed: () async {
                                  // Sign out จาก Firebase
                                  await FirebaseAuth.instance.signOut();

                                  // กลับไปที่หน้า Login หลังจาก Sign out
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Sign Out',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          )
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
          SettingsSection(
            title: Text('Security'),
            tiles: <SettingsTile>[
              SettingsTile.switchTile(
                onToggle: (value) {
                  // Handle lock app in background
                },
                initialValue: true,
                leading: Icon(Icons.phonelink_lock),
                title: Text('Lock app in background'),
              ),
              SettingsTile.switchTile(
                onToggle: (value) {
                  // Handle use fingerprint
                },
                initialValue: false,
                leading: Icon(Icons.fingerprint),
                title: Text('Use fingerprint'),
              ),
              SettingsTile.switchTile(
                onToggle: (value) {
                  // Handle enable notifications
                },
                initialValue: true,
                leading: Icon(Icons.notifications_active),
                title: Text('Enable notifications'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
