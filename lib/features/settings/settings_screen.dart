import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tiktok_clone/common/theme_config.dart';
import 'package:tiktok_clone/common/widgets/video_config/video_config.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notifications = false;
  void _onNotificationsChanged(bool? newValue) {
    if (newValue == null) return;
    setState(() {
      _notifications = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        body: ListView(
          children: [
            SwitchListTile.adaptive(
              value: context.watch<VideoConfig>().isMuted,
              onChanged: (value) => context.read<VideoConfig>().toggleIsMuted(),
              title: const Text("Auto Mute"),
              subtitle: const Text("Videos muted by default"),
            ),
            ValueListenableBuilder(
              valueListenable: forcedDarkMode,
              builder: (context, value, child) => SwitchListTile.adaptive(
                value: forcedDarkMode.value,
                onChanged: (value) {
                  forcedDarkMode.value = !forcedDarkMode.value;
                },
                title: const Text("Activate Forced DarkMode"),
                subtitle: const Text("Videos will be in dark mode always."),
              ),
            ),
            CheckboxListTile(
              value: _notifications,
              activeColor: Colors.black,
              onChanged: _onNotificationsChanged,
              title: const Text("Enable notifications"),
            ),
            ListTile(
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1980),
                  lastDate: DateTime(2030),
                );
                if (kDebugMode) {
                  print(date);
                }
                if (!mounted) return;
                final time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (kDebugMode) {
                  print(time);
                }
                if (!mounted) return;
                final booking = await showDateRangePicker(
                  context: context,
                  firstDate: DateTime(1980),
                  lastDate: DateTime(2030),
                  builder: (context, child) {
                    return Theme(
                        data: ThemeData(
                            appBarTheme: const AppBarTheme(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.black,
                        )),
                        child: child!);
                  },
                );
                if (kDebugMode) {
                  print(booking);
                }
              },
              title: const Text(
                "What is your birthday?",
              ),
            ),
            ListTile(
              title: const Text("Log out (iOS)"),
              textColor: Colors.red,
              onTap: () {
                showCupertinoDialog(
                  context: context,
                  builder: (context) => CupertinoAlertDialog(
                    title: const Text("Are you sure"),
                    content: const Text("Please don't go"),
                    actions: [
                      CupertinoDialogAction(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text("/No"),
                      ),
                      CupertinoDialogAction(
                        onPressed: () => Navigator.of(context).pop(),
                        isDestructiveAction: true,
                        child: const Text("Yes"),
                      )
                    ],
                  ),
                );
              },
            ),
            ListTile(
              title: const Text("Log out (Android)"),
              textColor: Colors.red,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Are you sure"),
                    content: const Text("Please don't go"),
                    actions: [
                      IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: const FaIcon(FontAwesomeIcons.car)),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text("Yes"),
                      )
                    ],
                  ),
                );
              },
            ),
            ListTile(
              title: const Text("Log out (iOS/Bottom)"),
              textColor: Colors.red,
              onTap: () {
                showCupertinoModalPopup(
                  context: context,
                  builder: (context) => CupertinoActionSheet(
                    title: const Text("Are you sure"),
                    message: const Text("Please don't go"),
                    actions: [
                      CupertinoActionSheetAction(
                        isDefaultAction: true,
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text("Not log out"),
                      ),
                      CupertinoActionSheetAction(
                        isDestructiveAction: true,
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text("Yes Please"),
                      )
                    ],
                  ),
                );
              },
            ),
            const AboutListTile(
              applicationVersion: "1.0",
              applicationLegalese: "Don't copy me.",
            )
          ],
        ));
  }
}
