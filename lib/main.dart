import 'package:flutter/material.dart';
import 'package:hotel_booking_admin_panel/main_layout.dart';
import 'package:hotel_booking_admin_panel/providers/hotel_form_provider.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const firebaseConfig = {
    "apiKey": "AIzaSyBudjos4hArypi0UX7LMw1KI_NR3ZuJs7A",
    "authDomain": "hotel-booking-system-17.firebaseapp.com",
    "projectId": "hotel-booking-system-17",
    "storageBucket": "hotel-booking-system-17.appspot.com",
    "messagingSenderId": "878597558802",
    "appId": "1:878597558802:web:17d793ec18c604e4853ecb"
  };
//const app = initializeApp(firebaseConfig);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.web,
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => HotelFormProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Hotel Booking App Admin Panel',
      home: MainLayout(),
    );
  }
}
