part of 'models.dart';

class FirewallRule {
  final String name;
  final String sourceIp;
  final String sourcePort;
  final String destIp;
  final String destPort;
  final String action;
  final String protocol;

  // Constructor
  FirewallRule({
    required this.name,
    required this.sourceIp,
    required this.sourcePort,
    required this.destIp,
    required this.destPort,
    required this.action,
    required this.protocol,
  });

  // fromJson constructor
  factory FirewallRule.fromJson(Map<String, dynamic> json) {
    return FirewallRule(
      name: json['name'],
      sourceIp: json['source'],
      sourcePort: json['source_port'],
      destIp: json['destination'],
      destPort: json['destination_port'],
      action: json['action'],
      protocol: json['protocol'],
    );
  }

  get destination => null;

  // Optionally, you can add a toJson method as well
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'source': sourceIp,
      'source_port': sourcePort,
      'destination': destIp,
      'destination_port': destPort,
      'action': action,
      'protocol': protocol,
    };
  }
}
