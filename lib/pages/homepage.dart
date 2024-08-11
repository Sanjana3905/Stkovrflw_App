part of 'pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    void pressHandler() {
      GoRouter.of(context).go("/firewall", extra: firewallData);
    }

    void pressHandler2() {
      GoRouter.of(context).go("/third");
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(
          255, 241, 238, 238), // Change background to black
      appBar: AppBar(
        title: const Text('stormguardd'),
        // leading: const Icon(Icons.menu),
        actions: const [
          Icon(Icons.more_vert),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(
              height: 100,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                ),
                child: Text(
                  'Drawer Header',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text('Firewall', style: TextStyle(fontSize: 16)),
              dense: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              onTap: () {
                pressHandler();
              },
            ),
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text('Hosts', style: TextStyle(fontSize: 16)),
              dense: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              onTap: () {
                pressHandler2();
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Azure Services Card
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Storm Guard Services',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5.0),
                      GridView.count(
                        crossAxisCount:
                            2, // Adjust this to change the number of columns
                        shrinkWrap:
                            true, // Prevents GridView from taking infinite height
                        physics:
                            NeverScrollableScrollPhysics(), // Prevents scrolling within GridView
                        children: [
                          _buildServiceIcon(Icons.computer, 'Firewalls'),
                          _buildServiceIcon(Icons.person, 'Hosts'),
                          _buildServiceIcon(Icons.language, 'Virtual Hosts'),
                          _buildServiceIcon(Icons.chat, 'Chat Bot'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Latest Alerts Card
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Latest alerts',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text('SEE ALL', style: TextStyle(color: Colors.blue)),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Text('Chart view'),
                          Switch(value: false, onChanged: (value) {}),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Center(
                        child: Column(
                          children: [
                            Icon(Icons.notifications_off,
                                size: 50, color: Colors.grey),
                            SizedBox(height: 8),
                            Text('No alerts in the last 24 hours.'),
                            SizedBox(height: 8),
                            Text(
                              'Your latest fired alerts will show here. To learn how to configure alerts, click here.',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.blue),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Recent Resources Card
              const Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Recent resources',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text('SEE ALL', style: TextStyle(color: Colors.blue)),
                        ],
                      ),
                      SizedBox(height: 16),
                      ListTile(
                        leading: Icon(Icons.cloud, color: Colors.blue),
                        title: Text('Virtual machine'),
                        subtitle: Text('stkovrflw'),
                        trailing: Icon(Icons.check_circle, color: Colors.green),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Service Health Card
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Service Health',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      GridView.count(
                        crossAxisCount: 1,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          _buildHealthTile(
                              Icons.error_outline, 'Service issues', '0'),
                          _buildHealthTile(
                              Icons.schedule, 'Planned maintenance', '0'),
                          _buildHealthTile(
                              Icons.favorite_outline, 'Health advisories', '0'),
                          _buildHealthTile(
                              Icons.security, 'Security advisories', '0'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Additional Cards for Cloud Shell and Dashboards
              const Row(
                children: [
                  Expanded(
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Icon(Icons.code, color: Colors.blue),
                            SizedBox(height: 8),
                            Text('Cloud Shell', textAlign: TextAlign.center),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Icon(Icons.dashboard, color: Colors.blue),
                            SizedBox(height: 8),
                            Text('Dashboards\n(preview)',
                                textAlign: TextAlign.center),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Microsoft Entra ID Card
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Microsoft Entra ID',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      Center(
                        child: Image.asset(
                          'assets/entra_id_logo.png', // Update with the actual path of the logo
                          height: 50,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Privileged Identity Management Card
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Privileged Identity Management',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      Center(
                        child: Image.asset(
                          'assets/privileged_identity_management_logo.png', // Update with the actual path of the logo
                          height: 50,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Favorites Card
              const Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Favorites',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text('SEE ALL', style: TextStyle(color: Colors.blue)),
                        ],
                      ),
                      SizedBox(height: 16),
                      Center(
                        child: Column(
                          children: [
                            Icon(Icons.star_border,
                                size: 50, color: Colors.grey),
                            SizedBox(height: 8),
                            Text(
                                'You don\'t have any favorite resources yet. Try changing your filters.'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // Bottom Navigation Bar
    );
  }

  Widget _buildServiceIcon(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, size: 50, color: Colors.blue),
        const SizedBox(height: 8),
        Text(label, textAlign: TextAlign.center),
      ],
    );
  }

  Widget _buildHealthTile(IconData icon, String title, String value) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(icon, color: Colors.blue),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Text(value,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
