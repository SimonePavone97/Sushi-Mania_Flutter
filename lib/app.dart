import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sushi_restaurant_app/routes.dart';
import 'package:sushi_restaurant_app/presentation/bindings/order_binding.dart';

import 'package:sushi_restaurant_app/theme.dart';

import 'data/repositories/menu_repository_impl.dart'; // Importa l'implementazione concreta di MenuRepository
import 'domain/repositories/menu_repository.dart'; // Importa l'interfaccia MenuRepository

void main() async {
  // Inizializza GetX
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Registra sia l'interfaccia che l'implementazione concreta di MenuRepository con GetX
  Get.put<MenuRepository>(MenuRepositoryImpl());

  // Avvia l'app Flutter
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Sushi Restaurant App',
      initialRoute: AppRoutes.home,
      getPages: AppRoutes.routes,
    );
  }
}
