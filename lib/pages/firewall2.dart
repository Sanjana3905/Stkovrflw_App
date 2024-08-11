part of 'pages.dart';

class fdetails extends HookWidget {
  const fdetails({super.key});

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
      () async => await PB.get().collection('firewall_rules').getFullList(),
    );

    return Scaffold(
      appBar: AppBar(title: const Text("FireWall details")),
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
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${data.toJson()["name"]}"),
                                  Text(
                                      "${data.toJson()["source"]}:${data.toJson()["source_port"]}"),
                                  Text(
                                      " ${data.toJson()["destination"]}:${data.toJson()["destination_port"]}"),
                                  Text("${data.toJson()["action"]}"),
                                ],
                              ),
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
