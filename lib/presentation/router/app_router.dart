import 'package:auto_route/annotations.dart';
import 'package:flutter_frontier/presentation/my_page/initial_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: InitialPage, initial: true),
  ],
)
class $AppRouter {}
