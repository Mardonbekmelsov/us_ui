import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ustudy_app_ui/navigation/bottom_nav_bar.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Добро пожаловать \n           в Ustudy",
              style: TextStyle(
                  color: Colors.black, fontSize: 32, fontWeight: FontWeight.bold),
            ),
           const SizedBox(height: 100,),
           SvgPicture.asset('assets/us_icon.svg'),
          const  SizedBox(height: 300,),
            SizedBox(
              width: 318,
              height: 54,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => BottomNavBar()));
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text(
                    "Старт",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),),
            ),
          
          ],
        ),
      ),
    );
  }
}
