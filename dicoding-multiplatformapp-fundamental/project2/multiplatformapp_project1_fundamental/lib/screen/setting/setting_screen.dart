import 'package:flutter/material.dart';
import 'package:multiplatformapp_project1_fundamental/data/local/workmanager_service.dart';
import 'package:multiplatformapp_project1_fundamental/data/provider/notification/local_notification_provider.dart';
import 'package:multiplatformapp_project1_fundamental/data/provider/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          titleSpacing: 0.0,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Setting", style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back,
                color: Theme.of(context).colorScheme.primary),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                    width: 30,
                    height: 30,
                    alignment: Alignment.center,
                    padding: EdgeInsets.zero,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(100)),
                    child: Consumer<ThemeProvider>(
                        builder: (context, themeProvider, child) {
                      return IconButton(
                        color: Theme.of(context).colorScheme.secondary,
                        icon: Icon(
                          themeProvider.themeMode == ThemeMode.light
                              ? Icons.light_mode
                              : Icons.nights_stay,
                          size: 15,
                        ),
                        onPressed: themeProvider.toggleTheme,
                      );
                    })),
                const SizedBox(width: 15),
              ],
            )
          ],
        ),
        body: Column(
          children: [
            Consumer<LocalNotificationProvider>(
                builder: (context, provider, child) {
              return ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                title: Text("Enable Notifications",
                    style: Theme.of(context).textTheme.labelLarge),
                trailing: Transform.scale(
                  alignment: Alignment.centerRight,
                  scale: 0.8,
                  child: Switch(
                    value: provider.isNotificationEnabled,
                    onChanged: (value) {
                      _runBackgroundToggleWorkManager();
                      provider.toggleNotification();
                    },
                    activeColor: Theme.of(context).colorScheme.primary,
                    inactiveThumbColor: Theme.of(context).colorScheme.secondary,
                    inactiveTrackColor: Theme.of(context).colorScheme.primary,
                  ),
                ),
              );
            }),
          ],
        ));
  }

  void _runBackgroundToggleWorkManager() async {
    context.read<WorkmanagerService>().toggleWorkManager();
  }
}
