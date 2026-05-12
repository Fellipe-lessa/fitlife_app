import 'package:flutter/material.dart';
import '../mock/dados_mock.dart';
import 'treino_screen.dart';
import 'alimentacao_screen.dart';
import 'perfil_screen.dart';
import 'metas_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final usuario = DadosMock.usuarioAtual;

    return Scaffold(
      appBar: AppBar(
        title: const Text("FitLife Dashboard"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Olá, ${usuario.nome}!", style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Card(
              color: Colors.teal.shade50,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text("Resumo da Evolução", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text("Objetivo Atual: ${usuario.objetivo}"),
                    Text("Peso Registrado: ${usuario.peso} kg"),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text("Navegação Rápida", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  _buildNavButton(context, Icons.fitness_center, "Treinos", const TreinoScreen()),
                  _buildNavButton(context, Icons.restaurant_menu, "Alimentação", const AlimentacaoScreen()),
                  _buildNavButton(context, Icons.flag, "Metas & Evolução", const MetasScreen()),
                  _buildNavButton(context, Icons.person, "Perfil", const PerfilScreen()),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildNavButton(BuildContext context, IconData icon, String title, Widget screen) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.teal,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => screen)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40),
          const SizedBox(height: 10),
          Text(title, textAlign: TextAlign.center, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}