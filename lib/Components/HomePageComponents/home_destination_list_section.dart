import 'package:flutter/material.dart';

class HomeDestinationListSection extends StatelessWidget {
  const HomeDestinationListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(right: 10),
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: const DecorationImage(
                image: AssetImage("assets/images/banner1.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
