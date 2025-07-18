import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
        title: Text('Perfil do Investidor', style: TextStyle(color: Theme.of(context).colorScheme.onPrimary)),
        actions: [
          IconButton(
            icon: Icon(Icons.edit, color: Theme.of(context).colorScheme.onPrimary),
            onPressed: () {},
            tooltip: 'Editar',
          ),
        ],
        iconTheme: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Theme.of(context).colorScheme.primary,
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  Center(
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Theme.of(context).colorScheme.onPrimary, width: 4),
                      ),
                      child: const CircleAvatar(
                        radius: 48,
                        backgroundImage: NetworkImage('https://randomuser.me/api/portraits/men/32.jpg'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Pedro S. Oliveira',
                    style: TextStyle(color: Theme.of(context).colorScheme.onPrimary, fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'pedro.oliveira@cryptotrack.com',
                    style: TextStyle(color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.7), fontSize: 15),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Column(
                children: [
                  _ProfileInfoCard(
                    label: 'Tipo de Investidor',
                    value: 'Moderado',
                    icon: Icons.trending_up,
                  ),
                  const SizedBox(height: 16),
                  _ProfileInfoCard(
                    label: 'País',
                    value: 'Brasil',
                    icon: Icons.flag,
                  ),
                  const SizedBox(height: 16),
                  _ProfileInfoCard(
                    label: 'Data de Cadastro',
                    value: '15/03/2021',
                    icon: Icons.calendar_today,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileInfoCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  const _ProfileInfoCard({required this.label, required this.value, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Theme.of(context).cardColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Row(
          children: [
            Icon(icon, color: Theme.of(context).iconTheme.color),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7))),
                  const SizedBox(height: 4),
                  Text(value, style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
} 