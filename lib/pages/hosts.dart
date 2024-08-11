part of 'pages.dart';

class hostdetails extends HookWidget {
  const hostdetails({super.key});

  @override
  Widget build(BuildContext context) {
    void pressHandler() {
      GoRouter.of(context).go("/firewall", extra: firewallData);
    }

    void pressHandler2() {
      GoRouter.of(context).go("/third");
    }

    final fwRules = useQuery(
      ['fw_rules'],
      () async => await PB.get().collection('hosts').getFullList(),
    );

    return Scaffold(
      appBar: AppBar(title: const Text("Hosts details")),
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
      body: Builder(builder: (buildContext) {
        if (!fwRules.isSuccess) {
          return Text(fwRules.error.toString());
        }
        final result = fwRules.data!;
        return Column(
          children: result.map((data) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 150,
                color: Colors.green[50],
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    "Name:           ${data.toJson()["name"]}"),
                                Text("Status:         ${data.toJson()["up"]}"),
                                Text(
                                    "WG IP:          ${data.toJson()["wg_ip"]}"),
                                Text(
                                    "Current IP:      ${data.toJson()["current_ip"]}"),
                                Text(
                                    "Up:                ${data.toJson()["up"]}"),
                                Text(
                                    "Last Alive:     ${data.toJson()["last_alive"]}"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        );
      }),
    );
  }
}
