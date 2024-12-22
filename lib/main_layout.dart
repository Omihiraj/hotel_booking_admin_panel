import 'package:flutter/material.dart';
import 'package:hotel_booking_admin_panel/screens/booking_screen.dart';
import 'package:hotel_booking_admin_panel/screens/hotel_screen.dart';
import 'package:hotel_booking_admin_panel/screens/notification_screen.dart';
import 'widgets/side_bar_button.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int index = 0;
  List<Widget> screens = const [
    HotelScreen(),
    BookingScreen(),
    NotificationScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Container(
              color: const Color.fromARGB(33, 0, 0, 0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40, bottom: 80),
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.amberAccent,
                        borderRadius: BorderRadius.circular(
                          200,
                        ),
                      ),
                    ),
                  ),
                  SideBarButton(
                    buttonText: "Hotels",
                    onTap: () {
                      setState(() {
                        index = 0;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  SideBarButton(
                    buttonText: "Bookings",
                    onTap: () {
                      setState(() {
                        index = 1;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  SideBarButton(
                    buttonText: "Notifications",
                    onTap: () {
                      setState(() {
                        index = 2;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 4,
            fit: FlexFit.tight,
            child: Container(
              color: Colors.white54,
              child: screens[index],
            ),
          )
        ],
      ),
    );
  }
}
