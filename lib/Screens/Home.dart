import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_lilacapp/Screens/Requirments.dart';
import 'package:flutter_lilacapp/common/Apiconnect.dart';
import 'package:flutter_lilacapp/controllers/homeController.dart';
import 'package:flutter_lilacapp/models/Homemodel.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final DashboardController controller = Get.put(DashboardController());
  final List<DashboardItem> dashboardItems = [
    DashboardItem(
        image: "assets/Group 736.png",
        color: Colors.green,
        value: "",
        label: "Total Bookings"),
    DashboardItem(
        image: "assets/Group 736 (1).png",
        color: Colors.green,
        value: "50",
        label: "Total Bookings"),
    DashboardItem(
        image: "assets/Group 736 (2).png",
        color: Colors.red,
        value: "25",
        label: "C2B Concept"),
    DashboardItem(
        image: "assets/Group 736 (3).png",
        color: Colors.blue,
        value: "35",
        label: "Vehicle for Sale"),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.fetchDashboardData();

    controller.homeData.value.data!.length ?? "";
    print(controller.homeData.value.data!.length ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.menu, color: Colors.black),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.notifications, color: Colors.black),
          )
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              InkWell(
                child: DashboardCard(
                    image: "assets/Group 736.png",
                    color: Colors.green,
                    value: controller.homeData.value.data?.length.toString() ??
                        "0",
                    label: "Total Bookings"),
              ),
              DashboardCard(
                  image: "assets/Group 736 (1).png",
                  color: Colors.green,
                  value: "50",
                  label: "Total Bookings"),
            ]),
            SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              DashboardCard(
                  image: "assets/Group 736 (2).png",
                  color: Colors.green,
                  value: "25",
                  label: "C2B Concept"),
              DashboardCard(
                  image: "assets/Group 736.png",
                  color: Colors.green,
                  value: "35",
                  label: "Total Bookings"),
            ])
          ])),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,

        currentIndex: 2, // Index for "Sell" button
        selectedItemColor: const Color(0xFF63192F),
        unselectedItemColor: Colors.grey,
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Image.asset("assets/Message.png", width: 24, height: 24),
              label: "Message"),
          const BottomNavigationBarItem(
              icon: Icon(Icons.attach_money), label: "Sell"),
          BottomNavigationBarItem(
              icon: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return RequirementListScreen();
                  }));
                },
                child: Icon(Icons.assignment),
              ),
              label: "Requirement"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

class DashboardItem {
  String? image;
  final Color color;
  final String value;
  final String label;

  DashboardItem(
      {required this.image,
      required this.color,
      required this.value,
      required this.label});
}

class DashboardCard extends StatelessWidget {
  final String? image;
  final Color color;
  final String value;
  final String label;

  DashboardCard({
    required this.image,
    required this.color,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              image!,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: const TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
