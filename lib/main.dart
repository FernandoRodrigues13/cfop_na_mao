// lib/main.dart (VERSÃO COM TEMA DE LISTA CORRIGIDO)

import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'cfop_model.dart';
import 'ncm_model.dart';
import 'splash_page.dart';

late Isar isar;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  isar = await Isar.open(
    [CfopSchema, NcmSchema],
    directory: dir.path,
    name: 'fiscalFacilDB',
  );
  runApp(const FiscalFacilApp());
}

class FiscalFacilApp extends StatelessWidget {
  const FiscalFacilApp({super.key});

  @override
  Widget build(BuildContext context) {
    const Color corPrimaria = Colors.deepPurple;

    return MaterialApp(
      title: 'Fiscal Fácil',
      
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(
          seedColor: corPrimaria,
          brightness: Brightness.light,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.grey[800],
          elevation: 1,
          titleTextStyle: TextStyle(
            color: Colors.grey[800],
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        listTileTheme: ListTileThemeData(
          subtitleTextStyle: TextStyle(color: Colors.grey[600]),
        ),
      ),
      
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: corPrimaria,
          brightness: Brightness.dark,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[900],
          foregroundColor: Colors.white70,
          elevation: 1,
          titleTextStyle: TextStyle(
            color: Colors.white.withOpacity(0.87),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        listTileTheme: ListTileThemeData(
          subtitleTextStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
        ),
      ),

      themeMode: ThemeMode.system, 
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
    );
  }
}