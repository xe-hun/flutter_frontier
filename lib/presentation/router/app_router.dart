import 'package:auto_route/auto_route.dart';
import 'package:flutter_frontier/presentation/app_page/app_page.dart';
import 'package:flutter_frontier/presentation/init_page/init_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    CustomRoute(
        page: AppPage,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        durationInMilliseconds: 400),
    AutoRoute(page: InitPage, initial: true)
  ],
)
class $AppRouter {}
