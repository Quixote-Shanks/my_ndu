import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdvertisementCard {
  final String title;
  final String imagePath;
  final Color backgroundColor;

  AdvertisementCard({
    required this.title,
    required this.imagePath,
    required this.backgroundColor,
  });
}

class AdvertisementController extends GetxController {
  RxList<AdvertisementCard> advertisementCards = <AdvertisementCard>[].obs;
  RxInt currentIndex = 0.obs;
  late PageController pageController;
  late Timer timer;

  @override
  void onInit() {
    fetchAdvertisementData();
    pageController = PageController(initialPage: currentIndex.value);
    startTimer();
    super.onInit();
  }

  Future<void> fetchAdvertisementData() async {
    // Simulating data fetching from a server or JSON file
    await Future.delayed(const Duration(seconds: 2));

    // Mock advertisement data
    var data = <AdvertisementCard>[
      AdvertisementCard(
        title: 'Card 1',
        imagePath: 'assets/card1.jpg',
        backgroundColor: Colors.blue,
      ),
      AdvertisementCard(
        title: 'Card 2',
        imagePath: 'assets/card2.jpg',
        backgroundColor: Colors.orange,
      ),
      AdvertisementCard(
        title: 'Card 3',
        imagePath: 'assets/card3.jpg',
        backgroundColor: Colors.green,
      ),
    ];

    // Assign the data to the advertisementCards list
    advertisementCards.value = data;
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (currentIndex.value < advertisementCards.length - 1) {
        currentIndex.value++;
      } else {
        currentIndex.value = 0;
      }
      pageController.animateToPage(
        currentIndex.value,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  void stopTimer() {
    timer.cancel();
  }

  void onPageChanged(int index) {
    currentIndex.value = index;
    stopTimer();
  }

  @override
  void dispose() {
    pageController.dispose();
    stopTimer();
    super.dispose();
  }
}
