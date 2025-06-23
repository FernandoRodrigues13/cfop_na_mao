// lib/about_page.dart

import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobre o App'),
        backgroundColor: Colors.deepPurple[100],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Ícone do nosso App (reutilizando a imagem da splash)
              Image.asset('assets/splash.png', height: 120),
              const SizedBox(height: 20),
              
              // Título do App
              const Text(
                'CFOP na Mão',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(height: 8),

              // Versão do App
              const Text(
                'Versão 1.0.0', // Podemos tornar isso dinâmico no futuro
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 32),
              
              // Texto de descrição
              const Text(
                'Um aplicativo desenvolvido para simplificar a consulta de Códigos Fiscais de Operações e Prestações.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              const Spacer(), // Ocupa todo o espaço restante, empurrando o próximo item para baixo

              // Créditos
              const Text(
                'Desenvolvido o por: Fernando Rodrigues',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}