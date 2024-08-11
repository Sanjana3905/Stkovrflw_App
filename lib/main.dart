import 'package:flutter/material.dart';
import 'package:fquery/fquery.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:storm_guard/components/pbApi.dart';
import 'pages/pages.dart';

// import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

part 'static_data.dart';
part 'routes.dart';

void main() {
  final pb = new PocketBase("http://10.147.20.69:8080");
  pb.collection('users').authWithPassword("asdf@a.com", "12345678");

  runApp(PocketBaseApiProvider(
    pocketBaseApi: pb,
    child: QueryClientProvider(
      child: const MyApp(),
      queryClient: QueryClient(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: routerConfig,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      // home: FirewallPage(firewallData: firewallData),
    );
  }
}
