import 'package:flutter/material.dart';

void main() {
  runApp(const RusiApp());
}

class RusiApp extends StatelessWidget {
  const RusiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RUSI - Personal AI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const RusiCommandCenter(),
      },
    );
  }
}

class RusiCommandCenter extends StatelessWidget {
  const RusiCommandCenter({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text('RUSI Command Center'),
        centerTitle: true,
      ),
      body: Row(
        children: [
          if (!isMobile)
            NavigationRail(
              selectedIndex: 0,
              onDestinationSelected: (int index) {},
              labelType: NavigationRailLabelType.all,
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.dashboard),
                  label: Text('Dashboard'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.memory),
                  label: Text('Memory'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.security),
                  label: Text('Security'),
                ),
              ],
            ),
          if (!isMobile) const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Welcome to RUSI - Your Private Personal AI System',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'నియంత్రణ మీ చేతుల్లో ఉంది. RUSI మీ కోసం ఆలోచిస్తుంది, నేర్చుకుంటుంది.',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 24),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      int crossAxisCount = constraints.maxWidth > 800 ? 4 : (constraints.maxWidth > 400 ? 2 : 1);
                      return GridView.count(
                        crossAxisCount: crossAxisCount,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        childAspectRatio: 1.5,
                        children: const [
                          _DashboardCard(icon: Icons.psychology, title: 'Brain & Knowledge', color: Colors.blue),
                          _DashboardCard(icon: Icons.sd_storage, title: 'Memory System', color: Colors.green),
                          _DashboardCard(icon: Icons.extension, title: 'Skills & Tools', color: Colors.orange),
                          _DashboardCard(icon: Icons.task_alt, title: 'Tasks & Planning', color: Colors.purple),
                          _DashboardCard(icon: Icons.folder, title: 'Files & Data', color: Colors.teal),
                          _DashboardCard(icon: Icons.devices, title: 'Devices', color: Colors.cyan),
                          _DashboardCard(icon: Icons.admin_panel_settings, title: 'Security & Privacy', color: Colors.red),
                          _DashboardCard(icon: Icons.settings, title: 'System Controls', color: Colors.blueGrey),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    'Recent Activity',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  const _ActivityList(),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: isMobile
          ? NavigationBar(
              selectedIndex: 0,
              onDestinationSelected: (int index) {},
              destinations: const [
                NavigationDestination(icon: Icon(Icons.dashboard), label: 'Dashboard'),
                NavigationDestination(icon: Icon(Icons.memory), label: 'Memory'),
                NavigationDestination(icon: Icon(Icons.security), label: 'Security'),
              ],
            )
          : null,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: const Icon(Icons.mic),
        label: const Text('Talk to RUSI'),
      ),
    );
  }
}

class _DashboardCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;

  const _DashboardCard({
    required this.icon,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            border: Border(left: BorderSide(color: color, width: 4)),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: color),
              const SizedBox(height: 12),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ActivityList extends StatelessWidget {
  const _ActivityList();

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        ListTile(
          leading: Icon(Icons.search, color: Colors.grey),
          title: Text('Researched "Quantum Computing"'),
          subtitle: Text('Added to Knowledge Base • 2 mins ago'),
        ),
        ListTile(
          leading: Icon(Icons.file_download, color: Colors.grey),
          title: Text('Processed 3 PDF documents'),
          subtitle: Text('Extracted main differences • 1 hour ago'),
        ),
        ListTile(
          leading: Icon(Icons.security, color: Colors.green),
          title: Text('Security Audit Passed'),
          subtitle: Text('No unauthorized access detected • 5 hours ago'),
        ),
      ],
    );
  }
}
