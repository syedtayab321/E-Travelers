import 'package:e_traverlers/Utils/app_colors.dart';
import 'package:flutter/material.dart';

class HomeAppBarComponent extends StatelessWidget {
  const HomeAppBarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      title: RichText(
        text: const TextSpan(
          children: [
            TextSpan(
              text: "Hello, ",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            TextSpan(
              text: "E Travelers",
              style: TextStyle(
                  color: AppColors.primary, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.favorite, color: AppColors.primary),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.notifications, color: Colors.black),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ],
    );
  }
}
