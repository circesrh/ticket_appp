
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_appp/controller/bottom_nav_controller.dart';
import 'package:ticket_appp/provider/bottom_nav_provider.dart';
import 'package:ticket_appp/screens/home/home_screen.dart';
import 'package:ticket_appp/screens/profile/profile.dart';
import 'package:ticket_appp/screens/search/search_screen.dart';
import 'package:ticket_appp/screens/ticket/ticket_screen.dart';
import 'package:get/get.dart';

class BottomNavBar extends ConsumerWidget {
   BottomNavBar({Key? key}) : super(key: key);



  //list is iterated using index
  
  final appScreens = [
    const HomeScreen(),
    const SearchScreen(),
    const TicketScreen(),
    const ProfileScreen()
  ];



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var selectedIndex = ref.watch(bottomNavBarNotifierProvider);
    return Scaffold(

      body: appScreens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: ref.watch(bottomNavBarNotifierProvider.notifier).onItemTapped,
        selectedItemColor: Colors.blueGrey,
        unselectedItemColor: const Color(0xFF526400),
        showSelectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(FluentSystemIcons.ic_fluent_home_regular),
            activeIcon: Icon(FluentSystemIcons.ic_fluent_home_filled),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(FluentSystemIcons.ic_fluent_search_regular),
            activeIcon: Icon(FluentSystemIcons.ic_fluent_search_info_filled),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(FluentSystemIcons.ic_fluent_ticket_regular),
            activeIcon: Icon(FluentSystemIcons.ic_fluent_ticket_filled),
            label: "Tickets",
          ),
          BottomNavigationBarItem(
            icon: Icon(FluentSystemIcons.ic_fluent_person_regular),
            activeIcon: Icon(FluentSystemIcons.ic_fluent_person_filled),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}

