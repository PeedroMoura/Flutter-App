import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class MarketsPage extends StatelessWidget {
  const MarketsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      body: Column(
        children: [
          // Header
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF2A6FE8), Color(0xFF3B8BEA)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            padding: const EdgeInsets.only(top: 48, left: 20, right: 20, bottom: 24),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 24,
                  backgroundImage: NetworkImage('https://randomuser.me/api/portraits/men/31.jpg'),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Pedro', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 2),
                    Text('#E28A1F8d', style: TextStyle(color: Colors.white70, fontSize: 13)),
                  ],
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.search, color: Colors.white),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.notifications_none, color: Colors.white),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          // Conteúdo principal
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Mercados', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 20),
                      const _SectionTitle(title: 'Tendência'),
                      const SizedBox(height: 12),
                      Row(
                        children: const [
                          Expanded(
                            child: _MarketCard(
                              icon: AssetImage('assets/eth.png'),
                              name: 'Ethereum',
                              value: 'R\$ 1.544,72',
                              change: '4,05%',
                              changePositive: true,
                              chartColor: Colors.green,
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: _MarketCard(
                              icon: AssetImage('assets/sol.png'),
                              name: 'Solana',
                              value: 'R\$ 959,86',
                              change: '1,63%',
                              changePositive: true,
                              chartColor: Colors.green,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      const _SectionTitle(title: 'Em baixa'),
                      const SizedBox(height: 12),
                      Row(
                        children: const [
                          Expanded(
                            child: _MarketCard(
                              icon: AssetImage('assets/uni.png'),
                              name: 'Uniswap',
                              value: 'R\$ 34,14',
                              change: '6,87%',
                              changePositive: false,
                              chartColor: Colors.red,
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: _MarketCard(
                              icon: AssetImage('assets/shiba.png'),
                              name: 'Shiba',
                              value: 'R\$ 0,000082',
                              change: '4,01%',
                              changePositive: false,
                              chartColor: Colors.red,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      // Pesquisa
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFF1F3F6),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: const TextField(
                          decoration: InputDecoration(
                            icon: Icon(Icons.search, color: Colors.grey),
                            hintText: 'Pesquisar',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Abas de filtro
                      const FilterTabs(),
                      const SizedBox(height: 20),
                      // Lista de moedas
                      _CoinListTile(
                        icon: AssetImage('assets/btc.png'),
                        name: 'BTC',
                        subtitle: 'Bitcoin',
                        value: 'R\$ 497.097,90',
                        favorite: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF2A6FE8),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        currentIndex: 2,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.swap_horiz), label: 'Transações'),
          BottomNavigationBarItem(icon: Icon(Icons.pie_chart), label: 'Mercados'),
          BottomNavigationBarItem(icon: Icon(Icons.verified), label: 'Aprovações'),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle({required this.title});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const Spacer(),
        Icon(Icons.chevron_left, color: Colors.grey[400]),
        Icon(Icons.chevron_right, color: Colors.grey[400]),
      ],
    );
  }
}

class _MarketCard extends StatelessWidget {
  final AssetImage icon;
  final String name;
  final String value;
  final String change;
  final bool changePositive;
  final Color chartColor;
  const _MarketCard({required this.icon, required this.name, required this.value, required this.change, required this.changePositive, required this.chartColor});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(backgroundImage: icon, radius: 16),
                const SizedBox(width: 8),
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 12),
            Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Row(
              children: [
                Text(
                  change,
                  style: TextStyle(
                    color: changePositive ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(width: 4),
                Icon(
                  changePositive ? Icons.arrow_upward : Icons.arrow_downward,
                  color: changePositive ? Colors.green : Colors.red,
                  size: 16,
                ),
              ],
            ),
            const SizedBox(height: 8),
            // Gráfico fake
            SizedBox(
              height: 32,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(show: false),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(0, 1),
                        FlSpot(1, 1.5),
                        FlSpot(2, 1.4),
                        FlSpot(3, 3.4),
                        FlSpot(4, 2),
                        FlSpot(5, 2.2),
                        FlSpot(6, 1.8),
                      ],
                      isCurved: true,
                      color: chartColor, // <- aqui!
                      barWidth: 2,
                      isStrokeCapRound: true,
                      dotData: FlDotData(show: false),
                      belowBarData: BarAreaData(show: false),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ChartPainter extends CustomPainter {
  final Color chartColor;
  final bool positive;
  _ChartPainter({required this.chartColor, required this.positive});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = chartColor
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    final path = Path();
    if (positive) {
      path.moveTo(0, size.height * 0.7);
      path.cubicTo(size.width * 0.2, size.height * 0.5, size.width * 0.5, size.height * 0.2, size.width, size.height * 0.3);
    } else {
      path.moveTo(0, size.height * 0.3);
      path.cubicTo(size.width * 0.2, size.height * 0.5, size.width * 0.5, size.height * 0.8, size.width, size.height * 0.7);
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class FilterTabs extends StatefulWidget {
  const FilterTabs({super.key});

  @override
  State<FilterTabs> createState() => _FilterTabsState();
}

class _FilterTabsState extends State<FilterTabs> {
  int selected = 0;

  final List<_TabData> tabs = const [
    _TabData(icon: Icons.menu, label: 'Todas'),
    _TabData(icon: Icons.add_box, label: 'Nova listagem'),
    _TabData(icon: Icons.emoji_emotions, label: 'Meme'),
    _TabData(icon: Icons.star_border, label: 'Favorito'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF1F3F6),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(4),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(tabs.length, (index) {
            final isSelected = selected == index;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0),
              child: GestureDetector(
                onTap: () => setState(() => selected = index),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  decoration: BoxDecoration(
                    color: isSelected ? const Color(0xFF2A6FE8) : Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        tabs[index].icon,
                        color: isSelected ? Colors.white : Colors.grey,
                        size: 18,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        tabs[index].label,
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.grey,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class _TabData {
  final IconData icon;
  final String label;
  const _TabData({required this.icon, required this.label});
}

class _CoinListTile extends StatelessWidget {
  final AssetImage icon;
  final String name;
  final String subtitle;
  final String value;
  final bool favorite;
  const _CoinListTile({required this.icon, required this.name, required this.subtitle, required this.value, required this.favorite});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(backgroundImage: icon, radius: 18),
        title: Row(
          children: [
            Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
            if (favorite)
              const Padding(
                padding: EdgeInsets.only(left: 4.0),
                child: Icon(Icons.star, color: Color(0xFF2A6FE8), size: 16),
              ),
          ],
        ),
        subtitle: Text(subtitle),
        trailing: Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
} 