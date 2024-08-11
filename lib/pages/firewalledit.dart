// import 'package:flutter/material.dart';
part of 'pages.dart';

final List<Map<String, dynamic>> firewallData = [
  {
    'name': 'Sanjana',
    'sourceIp': '192.168.1.100',
    'sourcePort': '42261',
    'destIp': '172.16.0.23',
    'destPort': '43364',
    'policy': 'Accept',
    'protocol': 'tcp',
    'addedby': 'xyz',
    'diectiin': 'hxuz',
  },
  {
    'userid': '1002',
    'name': 'Avinash',
    'sourceIp': '192.162.1.100',
    'sourcePort': '42231',
    'destIp': '172.16.0.21',
    'destPort': '42364',
    'policy': 'Accept',
    'protocol': 'ip',
  },
  {
    'userid': '1003',
    'name': 'Varsha',
    'sourceIp': '190.168.1.100',
    'sourcePort': '42261',
    'destIp': '170.16.0.21',
    'destPort': '46364',
    'policy': 'Deny',
    'protocol': 'tcp',
  },
  {
    'userid': '1004',
    'name': 'Sanj',
    'sourceIp': '112.168.1.110',
    'sourcePort': '51261',
    'destIp': '100.11.0.23',
    'destPort': '41264',
    'policy': 'Deny',
    'protocol': 'tcp',
  },
  {
    'userid': '1005',
    'name': 'Niki',
    'sourceIp': '192.188.1.120',
    'sourcePort': '42261',
    'destIp': '177.16.0.19',
    'destPort': '43364',
    'policy': 'Accept',
    'protocol': 'tcp',
  },
];

class FirewallEditor extends HookWidget {
  @override
  Widget build(BuildContext context) {
    // State management using hooks
    final selectedIndex = useState(0);

    // TextEditingControllers managed with hooks
    final nameController = useTextEditingController(
        text: firewallData[selectedIndex.value]['name']);
    final sourceIpController = useTextEditingController(
        text: firewallData[selectedIndex.value]['sourceIp']);
    final sourcePortController = useTextEditingController(
        text: firewallData[selectedIndex.value]['sourcePort']);
    final destIpController = useTextEditingController(
        text: firewallData[selectedIndex.value]['destIp']);
    final destPortController = useTextEditingController(
        text: firewallData[selectedIndex.value]['destPort']);
    final policyController = useTextEditingController(
        text: firewallData[selectedIndex.value]['policy']);
    final protocolController = useTextEditingController(
        text: firewallData[selectedIndex.value]['protocol']);

    void saveData() {
      firewallData[selectedIndex.value]['name'] = nameController.text;
      firewallData[selectedIndex.value]['sourceIp'] = sourceIpController.text;
      firewallData[selectedIndex.value]['sourcePort'] =
          sourcePortController.text;
      firewallData[selectedIndex.value]['destIp'] = destIpController.text;
      firewallData[selectedIndex.value]['destPort'] = destPortController.text;
      firewallData[selectedIndex.value]['policy'] = policyController.text;
      firewallData[selectedIndex.value]['protocol'] = protocolController.text;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Firewall Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: sourceIpController,
                decoration: InputDecoration(labelText: 'Source IP'),
              ),
              TextField(
                controller: sourcePortController,
                decoration: InputDecoration(labelText: 'Source Port'),
              ),
              TextField(
                controller: destIpController,
                decoration: InputDecoration(labelText: 'Destination IP'),
              ),
              TextField(
                controller: destPortController,
                decoration: InputDecoration(labelText: 'Destination Port'),
              ),
              TextField(
                controller: policyController,
                decoration: InputDecoration(labelText: 'Policy'),
              ),
              TextField(
                controller: protocolController,
                decoration: InputDecoration(labelText: 'Protocol'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: saveData,
                child: Text('Save Changes'),
              ),
              SizedBox(height: 20),
              Text(
                'Current Data: ${firewallData[selectedIndex.value]}',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
