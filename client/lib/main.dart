import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data/library.dart';
import 'ui/home.dart';

const hgRed = Color(0xffff526e),
    hgBackground = Color(0xff121316),
    hgPanel = Color(0xff202126);
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  runApp(HongguoApp(library: Library(prefs)));
}

class HongguoApp extends StatelessWidget {
  final Library library;
  const HongguoApp({super.key, required this.library});
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
    home: HomePage(library: library),
  );
}
