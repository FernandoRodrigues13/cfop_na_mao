// lib/splash_page.dart

import 'dart:async';
import 'package:flutter/material.dart';
import 'main.dart'; // Importa a HomePage para podermos navegar para ela

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  void _navigateToHome() {
    // Aguarda 3 segundos antes de navegar
    Timer(const Duration(seconds: 3), () {
      // pushReplacement navega para a nova tela e remove a splash da pilha,
      // para que o usuário não possa "voltar" para ela.
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Pega as informações de tamanho da tela do dispositivo
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // A imagem agora usa uma fração da largura da tela
            Image.asset(
              'assets/splash.png',
              // A imagem vai ocupar 50% da largura da tela. Mude este valor se quiser.
              width: screenSize.width * 0.5, 
            ),
            const SizedBox(height: 32),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.deepPurple),
            ),
          ],
        ),
      ),
    );
  }
}