import 'package:flutter/material.dart';
import 'package:flutter_frontier/injectable.dart';
import 'package:flutter_frontier/presentation/core/init_widget.dart';
import 'package:flutter_frontier/presentation/router/app_router.gr.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();

  runApp(const InitWidget());
}

final AppRouter appRouter = AppRouter();
