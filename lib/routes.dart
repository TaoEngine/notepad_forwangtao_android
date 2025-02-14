import 'package:go_router/go_router.dart';

import 'package:notepad_forwangtao_android/pages/home.dart';
import 'package:notepad_forwangtao_android/pages/notepads.dart';
import 'package:notepad_forwangtao_android/pages/notepad.dart';
import 'package:notepad_forwangtao_android/pages/notify.dart';
import 'package:notepad_forwangtao_android/pages/search.dart';
import 'package:notepad_forwangtao_android/pages/settings.dart';

class NotepadRoutes {
  static const String homePage = "/";
  static const String notepadsPage = "/notepads";
  static const String notepadPage = "/notepad";
  static const String notifyPage = "/notify";
  static const String searchPage = "/search";
  static const String settingsPage = "/settings";

  static const String homeNamed = "home";
  static const String notepadsNamed = "notepads";
  static const String notepadNamed = "notepad";
  static const String notifyNamed = "notify";
  static const String searchNamed = "search";
  static const String settingsNamed = "settings";

  static final GoRouter router = GoRouter(
    routes: _buildRoutes(),
  );

  static List<GoRoute> _buildRoutes() {
    return [
      GoRoute(
        path: homePage,
        name: homeNamed,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: notepadsPage,
        name: notepadsNamed,
        builder: (context, state) => const NotepadsPage(),
      ),
      GoRoute(
        path: notepadPage,
        name: notepadNamed,
        builder: (context, state) => const NotepadPage(),
      ),
      GoRoute(
        path: notifyPage,
        name: notifyNamed,
        builder: (context, state) => const NotifyPage(),
      ),
      GoRoute(
        path: searchPage,
        name: searchNamed,
        builder: (context, state) => const SearchPage(),
      ),
      GoRoute(
        path: settingsPage,
        name: settingsNamed,
        builder: (context, state) => const SettingsPage(),
      ),
    ];
  }
}
