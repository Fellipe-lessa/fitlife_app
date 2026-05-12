import 'package:flutter/material.dart';
import '../mock/dados_mock.dart';
import '../widgets/treino_card.dart';

class TreinoScreen extends StatelessWidget {
  const TreinoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Lista de Treinos"),
          backgroundColor: Colors.teal,
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: "Peito"),
              Tab(text: "Pernas"),
              Tab(text: "Costas"),
              Tab(text: "Braços"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildListaPorCategoria("Peito"),
            _buildListaPorCategoria("Pernas"),
            _buildListaPorCategoria("Costas"),
            _buildListaPorCategoria("Braços"),
          ],
        ),
      ),
    );
  }

  Widget _buildListaPorCategoria(String categoria) {
    final filtrados = DadosMock.treinos.where((t) => t.grupoMuscular == categoria).toList();
    return ListView.builder(
      itemCount: filtrados.length,
      itemBuilder: (context, index) {
        return TreinoCard(treino: filtrados[index]);
      },
    );
  }
}