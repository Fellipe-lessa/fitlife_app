import 'package:flutter/material.dart';
import '../mock/dados_mock.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final u = DadosMock.usuarioAtual;

    return Scaffold(
      appBar: AppBar(title: const Text("Perfil do Usuário"), backgroundColor: Colors.teal),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const CircleAvatar(radius: 50, backgroundColor: Colors.teal, child: Icon(Icons.person, size: 60, color: Colors.white)),
            const SizedBox(height: 20),
            Text(u.nome, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text(u.email, style: const TextStyle(color: Colors.grey)),
            const Divider(height: 40, thickness: 1),
            ListTile(leading: const Icon(Icons.cake), title: const Text("Idade"), trailing: Text("${u.idade} anos")),
            ListTile(leading: const Icon(Icons.monitor_weight), title: const Text("Peso Atual"), trailing: Text("${u.peso} kg")),
            ListTile(leading: const Icon(Icons.height), title: const Text("Altura"), trailing: Text("${u.altura} m")),
            ListTile(leading: const Icon(Icons.track_changes), title: const Text("Objetivo"), trailing: Text(u.objetivo)),
          ],
        ),
      ),
    );
  }
}