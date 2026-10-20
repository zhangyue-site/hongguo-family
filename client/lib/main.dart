import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/direct_media.dart';
import 'data/library.dart';
import 'ui/home.dart';

const hgRed = Color(0xffff526e),
    hgBackground = Color(0xff121316),
    hgPanel = Color(0xff202126);

class _PrefsStore implements SharedPreferencesLike {
  _PrefsStore(this.prefs);
  final SharedPreferences prefs;
  @override
  Future<String?> read(String key) async => prefs.getString(key);
  @override
  Future<void> write(String key, String value) =>
      prefs.setString(key, value);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final tmp = await getTemporaryDirectory();
  final direct = DirectMediaService(
    store: () async => _PrefsStore(prefs),
    cacheDir: Directory('${tmp.path}/hongguo-media'),
  );
  runApp(HongguoApp(library: Library(prefs), direct: direct));
}

class HongguoApp extends StatelessWidget {
  final Library library;
  final DirectMediaService direct;
  const HongguoApp({
    super.key,
    required this.library,
    required this.direct,
  });
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: '红果家庭版',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
      scaffoldBackgroundColor: hgBackground,
      colorScheme: ColorScheme.fromSeed(
        seedColor: hgRed,
        brightness: Brightness.dark,
        surface: hgPanel,
        primary: hgRed,
      ),
      chipTheme: ChipThemeData(
        selectedColor: const Color(0xff34202a),
        backgroundColor: hgPanel,
        side: BorderSide.none,
        showCheckmark: false,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: hgBackground,
        surfaceTintColor: Colors.transparent,
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Color(0xff1b1c21),
        surfaceTintColor: Colors.transparent,
        showDragHandle: true,
      ),
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: hgPanel,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
    ),
    home: HomePage(library: library, direct: direct),
  );
}
