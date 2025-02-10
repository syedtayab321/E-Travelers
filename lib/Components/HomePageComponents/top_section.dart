import 'package:e_traverlers/Utils/app_colors.dart';
import 'package:flutter/material.dart';
import '../../CustomWidgets/custom_text_widget.dart';
import '../../CustomWidgets/custom_textformfield.dart';

class TopSection extends StatelessWidget {
  const TopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 350,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background3.jpg'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Builder(
                builder: (context) => IconButton(
                  icon: const Icon(Icons.menu, color: Colors.white, size: 30),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
              ),
              const CircleAvatar(
                backgroundImage: AssetImage('assets/images/logo.png'),
                radius: 22,
              ),
            ],
          ),
        ),
        const Positioned(
          top: 150,
          left: 20,
          child: CustomTextWidget(
            text:  "Travel is never\na matter of money",
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        Positioned(
          top: 230,
          left: 20,
          right: 20,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 10),
              ],
            ),
            child: CustomTextFormField(
              hintText: 'Find your trip',
              borderColor: Colors.transparent,
              prefixIcon: Icons.search,
              suffixIcon: IconButton(
                icon:const Icon(Icons.tune),
                color: AppColors.accent,
                onPressed: () {  },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
