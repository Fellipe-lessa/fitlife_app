import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';
import '../mock/dados_mock.dart';

class CadastroScreen extends StatelessWidget {
  final TextEditingController nomeCtrl = TextEditingController();
  final TextEditingController idadeCtrl = TextEditingController();
  final TextEditingController pesoCtrl = TextEditingController();
  final TextEditingController alturaCtrl = TextEditingController();
  final TextEditingController objetivoCtrl = TextEditingController();

  CadastroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cadastro de Usuário"), backgroundColor: Colors.teal),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            CustomTextField(label: "Nome Completo", controller: nomeCtrl),
            CustomTextField(label: "Idade", controller: idadeCtrl, keyboardType: TextInputType.number),
            CustomTextField(label: "Peso (kg)", controller: pesoCtrl, keyboardType: TextInputType.number),
            CustomTextField(label: "Altura (m)", controller: alturaCtrl, keyboardType: TextInputType.number),
            CustomTextField(label: "Objetivo Fitness", controller: objetivoCtrl),
            const SizedBox(height: 20),
            CustomButton(
              texto: "Salvar Perfil",
              onPressed: () {

                if (nomeCtrl.text.isNotEmpty) {
                  DadosMock.usuarioAtual.nome = nomeCtrl.text;
                  DadosMock.usuarioAtual.objetivo = objetivoCtrl.text;
                }
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}