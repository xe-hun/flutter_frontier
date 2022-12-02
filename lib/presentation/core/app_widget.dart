import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_frontier/application/core/ui.dart';
import 'package:flutter_frontier/application/theme/theme_bloc.dart';
import 'package:flutter_frontier/injectable.dart';
import 'package:flutter_frontier/main.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ThemeBloc>()..add(const ThemeEvent.started()),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
              routeInformationParser: appRouter.defaultRouteParser(),
              routerDelegate: appRouter.delegate(),
              debugShowCheckedModeBanner: false,
              theme: state
                  .map(
                    initial: (value) => lightThemeData(context),
                    light: (value) => lightThemeData(context),
                    dark: (value) => darkThemeData(context),
                  )
                  .copyWith(elevatedButtonTheme: elevatedButtonStyle()));
        },
      ),
    );
  }
}













// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_frontier/application/core/ui.dart';
// import 'package:flutter_frontier/application/theme/theme_bloc.dart';
// import 'package:flutter_frontier/injectable.dart';
// import 'package:flutter_frontier/main.dart';

// class AppWidget extends StatelessWidget {
//   const AppWidget({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => getIt<ThemeBloc>()
//         ..add(
//           const ThemeEvent.started(),
//         ),
//       child: BlocBuilder<ThemeBloc, ThemeState>(
//         builder: (context, state) {
//           return state.maybeMap(
//               initial: (value) => const MaterialApp(),
//               orElse: () => MaterialApp.router(
//                   routeInformationParser: appRouter.defaultRouteParser(),
//                   routerDelegate: appRouter.delegate(),
//                   debugShowCheckedModeBanner: false,
//                   theme: state
//                       .mapOrNull(
//                         light: (value) => lightThemeData(context),
//                         dark: (value) => darkThemeData(context),
//                       )!
//                       .copyWith(elevatedButtonTheme: elevatedButtonStyle())));
//         },
//       ),
//     );
//   }
// }

