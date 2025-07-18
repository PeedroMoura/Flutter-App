import 'package:flutter/material.dart';
import 'home_page.dart';
import 'profile_page.dart';
import 'settings_page.dart';
import 'markets_page.dart';
import 'app_colors.dart';

final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, mode, _) {
        return MaterialApp(
          title: 'CryptoTrack',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppColors.lightPrimary,
              brightness: Brightness.light,
              primary: AppColors.lightPrimary,
              background: AppColors.lightBackground,
            ),
            scaffoldBackgroundColor: AppColors.lightBackground,
            cardColor: AppColors.lightCard,
            textTheme: const TextTheme(bodyMedium: TextStyle(color: AppColors.lightText)),
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppColors.darkPrimary,
              brightness: Brightness.dark,
              primary: AppColors.darkPrimary,
              background: AppColors.darkBackground,
            ),
            scaffoldBackgroundColor: AppColors.darkBackground,
            cardColor: AppColors.darkCard,
            textTheme: const TextTheme(bodyMedium: TextStyle(color: AppColors.darkText)),
            useMaterial3: true,
          ),
          themeMode: mode,
          routes: {
            '/': (context) => const GenericHomePage(),
            '/home': (context) => const HomePage(),
            '/profile': (context) => const ProfilePage(),
            '/settings': (context) => const SettingsPage(),
            '/markets': (context) => const MarketsPage(),
          },
        );
      },
    );
  }
}

class GenericHomePage extends StatelessWidget {
  const GenericHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: const Text('CryptoTrack'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          IconButton(
            icon: Icon(isDark ? Icons.wb_sunny : Icons.nightlight_round),
            tooltip: isDark ? 'Tema Claro' : 'Tema Escuro',
            onPressed: () {
              themeNotifier.value = isDark ? ThemeMode.light : ThemeMode.dark;
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: const Text(
                'CryptoTrack Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Visão Geral'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/home');
              },
            ),
            ListTile(
              leading: const Icon(Icons.pie_chart),
              title: const Text('Mercados'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/markets');
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Perfil do Investidor'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/profile');
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Configurações'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/settings');
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Sair'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Bem-vindo ao CryptoTrack!',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Image.network(
                'https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=800&q=80',
                height: 200,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 200,
                  color: Colors.grey[200],
                  child: Icon(Icons.image_not_supported, size: 60, color: Colors.grey[400]),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Acompanhe o mercado de criptomoedas em tempo real, monitore seu portfólio e fique por dentro das tendências!',
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/markets');
                },
                icon: const Icon(Icons.pie_chart),
                label: const Text('Explorar Mercados'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              const SizedBox(height: 8),
              OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/profile');
                },
                child: Text('Ver Perfil do Investidor', style: Theme.of(context).textTheme.labelLarge),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.primary,
                  side: BorderSide(color: Theme.of(context).colorScheme.primary),
                ),
              ),
              const SizedBox(height: 24),
              Card(
                elevation: 4,
                color: Theme.of(context).cardColor,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        'Destaque do Dia',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text('Bitcoin atinge novo topo histórico!', style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                ),
              ),
              // RESUMO DO PORTFÓLIO
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                margin: const EdgeInsets.only(bottom: 16),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Saldo do Portfólio', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('R\$ 52.340,90', style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
                          const SizedBox(width: 12),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.green[50],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: const [
                                Icon(Icons.arrow_upward, color: Colors.green, size: 16),
                                SizedBox(width: 2),
                                Text('+2,3%', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      // Mini gráfico fake
                      SizedBox(
                        height: 36,
                        child: CustomPaint(
                          painter: _MiniChartPainter(),
                          size: const Size(double.infinity, 36),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // ATIVOS EM DESTAQUE
              Text('Ativos em destaque', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              SizedBox(
                height: 64,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _AssetChip(name: 'BTC', value: 'R\$ 497.097', change: '+1,2%', icon: 'assets/btc.png', positive: true),
                    _AssetChip(name: 'ETH', value: 'R\$ 1.544', change: '+4,1%', icon: 'assets/eth.png', positive: true),
                    _AssetChip(name: 'SOL', value: 'R\$ 959', change: '-0,8%', icon: 'assets/sol.png', positive: false),
                    _AssetChip(name: 'UNI', value: 'R\$ 34', change: '-2,3%', icon: 'assets/uni.png', positive: false),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // ACESSO RÁPIDO
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _QuickAction(icon: Icons.account_balance_wallet, label: 'Depositar'),
                  _QuickAction(icon: Icons.swap_horiz, label: 'Converter'),
                  _QuickAction(icon: Icons.trending_up, label: 'Adicionar'),
                ],
              ),
              const SizedBox(height: 16),
              // NOTÍCIAS RECENTES
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                margin: const EdgeInsets.only(bottom: 16),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Notícias Recentes', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Icon(Icons.article, color: Theme.of(context).colorScheme.primary),
                        title: Text('ETF de Bitcoin é aprovado nos EUA'),
                        subtitle: Text('Mercado reage positivamente à aprovação do primeiro ETF de Bitcoin.'),
                        onTap: () {},
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Icon(Icons.article, color: Theme.of(context).colorScheme.primary),
                        title: Text('Ethereum prepara atualização Shanghai'),
                        subtitle: Text('Atualização promete maior escalabilidade e taxas menores.'),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
              // DICA DO DIA
              Card(
                elevation: 1,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                margin: const EdgeInsets.only(bottom: 16),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Icon(Icons.lightbulb, color: Theme.of(context).colorScheme.secondary),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text('Dica: Diversifique seu portfólio para reduzir riscos e aumentar oportunidades no mercado cripto.',
                          style: Theme.of(context).textTheme.bodyMedium),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Mini gráfico fake para o saldo do portfólio
class _MiniChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blueAccent
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    final path = Path();
    path.moveTo(0, size.height * 0.7);
    path.cubicTo(size.width * 0.2, size.height * 0.5, size.width * 0.5, size.height * 0.2, size.width, size.height * 0.3);
    canvas.drawPath(path, paint);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Chip de ativo em destaque
class _AssetChip extends StatelessWidget {
  final String name;
  final String value;
  final String change;
  final String icon;
  final bool positive;
  const _AssetChip({required this.name, required this.value, required this.change, required this.icon, required this.positive});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        children: [
          CircleAvatar(backgroundImage: AssetImage(icon), radius: 14),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold)),
              Text(value, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
          const SizedBox(width: 8),
          Text(change, style: TextStyle(color: positive ? Colors.green : Colors.red, fontWeight: FontWeight.bold, fontSize: 13)),
        ],
      ),
    );
  }
}

// Botão de acesso rápido
class _QuickAction extends StatelessWidget {
  final IconData icon;
  final String label;
  const _QuickAction({required this.icon, required this.label});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
          child: Icon(icon, color: Theme.of(context).colorScheme.primary),
        ),
        const SizedBox(height: 4),
        Text(label, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}
