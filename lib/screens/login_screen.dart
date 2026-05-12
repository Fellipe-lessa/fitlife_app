import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';
import 'home_screen.dart';
import 'cadastro_screen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final AuthService authService = AuthService();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.health_and_safety, size: 100, color: Colors.teal),
            const SizedBox(height: 20),
            const Text("FitLife", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.teal)),
            const SizedBox(height: 40),
            CustomTextField(label: "E-mail", controller: emailController, keyboardType: TextInputType.emailAddress),
            CustomTextField(label: "Senha", isPassword: true, controller: senhaController),
            const SizedBox(height: 20),
            CustomButton(
              texto: "Entrar",
              onPressed: () {
                if (authService.login(emailController.text, senhaController.text)) {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomeScreen()));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Preencha e-mail e senha!")),
                  );
                }
              },
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => CadastroScreen()));
              },
              child: const Text("Criar novo perfil", style: TextStyle(color: Colors.teal)),
            )
          ],
        ),
      ),
    );
  }
}