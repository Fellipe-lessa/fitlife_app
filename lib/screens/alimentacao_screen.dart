import 'package:flutter/material.dart';
import '../mock/dados_mock.dart';

class AlimentacaoScreen extends StatelessWidget {
  const AlimentacaoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Alimentação Saudável"), backgroundColor: Colors.teal),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: DadosMock.refeicoes.length,
        itemBuilder: (context, index) {
          final item = DadosMock.refeicoes[index];
          return Card(
            elevation: 2,
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: const Icon(Icons.apple, color: Colors.green, size: 30),
              title: Text(item["titulo"]!, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(item["descricao"]!),
            ),
          );
        },
      ),
    );
  }
}