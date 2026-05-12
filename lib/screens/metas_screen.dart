import 'package:flutter/material.dart';
import '../mock/dados_mock.dart';

class MetasScreen extends StatefulWidget {
  const MetasScreen({super.key});

  @override
  State<MetasScreen> createState() => _MetasScreenState();
}

class _MetasScreenState extends State<MetasScreen> {

  final Map<String, bool> _metasStatus = {
    for (var item in DadosMock.metas) item: false
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Metas e Evolução"), backgroundColor: Colors.teal),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Histórico de Peso Corporal", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.teal)),
            const SizedBox(height: 10),
            Card(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: DadosMock.historicoPesos.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.timeline, color: Colors.teal),
                    title: Text("Registro #${DadosMock.historicoPesos.length - index}"),
                    trailing: Text(DadosMock.historicoPesos[index], style: const TextStyle(fontWeight: FontWeight.bold)),
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
            const Text("Metas Fitness Pessoais", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.teal)),
            const SizedBox(height: 10),
            Card(
              child: Column(
                children: _metasStatus.keys.map((meta) {
                  return CheckboxListTile(
                    activeColor: Colors.teal,
                    title: Text(meta, style: TextStyle(decoration: _metasStatus[meta]! ? TextDecoration.lineThrough : null)),
                    value: _metasStatus[meta],
                    onChanged: (bool? value) {
                      setState(() {
                        _metasStatus[meta] = value ?? false;
                      });
                    },
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}