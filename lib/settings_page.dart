import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool notifications = true;
  bool darkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Configurações do CryptoTrack')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                elevation: 4,
                color: Theme.of(context).cardColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: SwitchListTile(
                  title: Text('Notificações de Mercado', style: Theme.of(context).textTheme.bodyLarge),
                  subtitle: Text('Receber alertas de variação de preço e notícias', style: TextStyle(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7))),
                  value: notifications,
                  onChanged: (val) => setState(() => notifications = val),
                  secondary: Icon(Icons.notifications, color: Theme.of(context).colorScheme.primary),
                ),
              ),
              const SizedBox(height: 12),
              Card(
                elevation: 4,
                color: Theme.of(context).cardColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: SwitchListTile(
                  title: Text('Modo escuro', style: Theme.of(context).textTheme.bodyLarge),
                  subtitle: Text('Ativar tema escuro para melhor visualização', style: TextStyle(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7))),
                  value: darkMode,
                  onChanged: (val) => setState(() => darkMode = val),
                  secondary: Icon(Icons.dark_mode, color: Theme.of(context).colorScheme.primary),
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Configurações salvas!')),
                  );
                },
                icon: const Icon(Icons.save),
                label: const Text('Salvar Preferências'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
 