import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_frontier/application/core/ui_objects.dart';
import 'package:flutter_frontier/application/theme/theme_bloc.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Button App'),
        actions: [
          PopupMenuButton(
              icon: const Icon(Icons.menu),
              itemBuilder: (_) {
                return [
                  themeMenuItem(
                      label: 'Light Theme',
                      context: context,
                      themeType: const ThemeType.light()),
                  themeMenuItem(
                      label: 'Dark Theme',
                      context: context,
                      themeType: const ThemeType.dark()),
                ];
              }),
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: const Text('first button')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {}, child: const Text('second button')),
          ],
        ),
      ),
    );
  }

  PopupMenuEntry themeMenuItem(
      {required BuildContext context,
      required String label,
      required ThemeType themeType}) {
    return PopupMenuItem(
      value: themeType,
      child: Text(label),
      onTap: () => BlocProvider.of<ThemeBloc>(context)
          .add(ThemeEvent.changeTheme(themeType)),
    );
  }
}
