import 'dart:convert';
import 'package:flutter_lilacapp/common/Apiconnect.dart';
import 'package:flutter_lilacapp/models/Homemodel.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardController extends GetxController {
  var homeData = HomeModel().obs; // Observable API Data
  var isLoading = true.obs; // Observable Loading State
  var token = ''.obs; // Observable token
  final String suburl = "vendor/get-total-vehicles"; // API Endpoint

  @override
  void onInit() {
    super.onInit();
    fetchDashboardData();
  }

  Future<void> fetchDashboardData() async {
    try {
      // Show Loading
      // Fetch Token

      final response = await getJson2(suburl,
          "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiOWEyODc4NTEyMWIzZmJjNmQ3ZDcxYmNlOGY0ODZiN2Y4NjM4YjUyMTk4ZWViZTk5NmY4MThhZjQyOTE1NTc4ZjAyOTM4MWI0NTZhZmYyOTkiLCJpYXQiOjE3MzQxNjE3NzUuNzE5MjU3LCJuYmYiOjE3MzQxNjE3NzUuNzE5MjU5LCJleHAiOjE3NjU2OTc3NzUuNzA5MDQxLCJzdWIiOiIzNiIsInNjb3BlcyI6W119.lsavLtFYoUEzavwFINya4FddWVmMzCst56NhqGC47qbz5qa3mbjgkNJBVHpMSojX-IVHA2bGVItpXukbR2Khxp1BWS1Rg2dz614xHr5ETcn79oPa-w8fBI8Et4r6VdEM2Owow_haNjCzDrYtiAWd80ni5OWdaFv6-W4xjDji00jyNuUgj6gRbL4pqBZZvAzvSjqjt1VrQzmZMJjUORdLsUEdXmX0YwMNYadlSYplYwWBB5Clj0Ai4AHkr5Adnr-euD4nyZuoOpc99MbzisiauD9CJn8ADRRmKrYT2d5P4hCWKTNMjw6yfwtvAf1x_QoG-_-rHGiLSBc-Ob6vw1vAru5K0JeYbiMPospBNlBfqgFCSwEh5i8EYR7qu_lQb9Yh6AbMqgNWLNXvqEyax2uvRIpCali-Mju88CzisX-z-fFLhQuyLqcEpz4TaeevErZoWAZn6m-v8dSyTLmIvnVe_TZpHR0Pu6W3HEJqPQ0oPCEURXYMMFAgkaWSbQ_d3wqiYKCf5VKGZ2YQ4DElZN7wwd1rqu9OAhcpIelEydGMmGiFrPaQxbhkTjh84eBRLWNZfLBdembkD7bI1b44KTx2BANxaLl0X5MugS3hkJPdTyQ3Z9-btnDcfq8HH3q2QB7wf6UVb6ewgqa7eMFYHEoOyo-eXG114OIrpO1Sjjbp1IM");
      if (response.statusCode == 200) {
        print("Response Body: ${response.body}");
        final jsonResponse = json.decode(response.body);
        homeData.value = HomeModel.fromJson(jsonResponse);
      } else {
        print("Failed to fetch data. Status: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching data: $e");
    } finally {
      isLoading(false); // Stop Loading
    }
  }

  Future<void> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token.value = prefs.getString('token') ?? '';
    print("Token: ${token.value}");
  }
}
