import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:flutter/widgets.dart';
import 'package:pocketbase/pocketbase.dart';

class PocketBaseApiProvider extends InheritedWidget {
  final PocketBase pocketBaseApi;

  const PocketBaseApiProvider({
    Key? key,
    required Widget child,
    required this.pocketBaseApi,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant PocketBaseApiProvider oldWidget) {
    return oldWidget.pocketBaseApi != pocketBaseApi;
  }

  static PocketBase of(BuildContext context) {
    final PocketBaseApiProvider? result =
        context.dependOnInheritedWidgetOfExactType<PocketBaseApiProvider>();
    assert(result != null, 'No PocketBaseApiProvider found in context');
    return result!.pocketBaseApi;
  }
}

PocketBase usePocketBaseApi() => PocketBaseApiProvider.of(useContext());

class PB {
  static PocketBase? instance;
  static String? url;

  static void set(String baseUrl) {
    url = baseUrl;
  }

  static PocketBase get() {
    if (instance != null) {
      return instance!;
    } else {
      instance = PocketBase("http://mothership.sivaplays.tech:8080");
      instance!.collection('users').authWithPassword(
            'asdf@a.com',
            '12345678',
          );
      return instance!;
    }
  }
}
