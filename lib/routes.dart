part of 'main.dart';

final routerConfig = GoRouter(
  // initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => LoginPage(),
    ),
    GoRoute(
      path: '/',
      builder: (context, state) => HomePage(),
      routes: [
        GoRoute(
            path: 'firewall',
            builder: (context, state) {
              final firewallData = state.extra as List<Map<String, dynamic>>;
              return fdetails();
            },
            routes: [
              GoRoute(
                path: 'edit',
                builder: (context, state) => FirewallEditor(),
              )
            ]),
        GoRoute(
          path: 'third',
          builder: (context, state) => const hostdetails(),
        ),
      ],
    ),
  ],
);
