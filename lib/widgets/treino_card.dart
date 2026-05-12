import 'package:flutter/material.dart';
import '../models/treino.dart';

class TreinoCard extends StatelessWidget {
  final Treino treino;

  const TreinoCard({super.key, required this.treino});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 3,
      child: ListTile(
        leading: const Icon(Icons.fitness_center, color: Colors.teal, size: 35),
        title: Text(treino.nome, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text("Séries: ${treino.series} | Repetições: ${treino.repeticoes}"),
        trailing: Chip(label: Text(treino.grupoMuscular)),
      ),
    );
  }
}