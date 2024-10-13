import 'package:flutter/material.dart';
import 'package:ustudy_app_ui/constants/app_color.dart';
import 'package:ustudy_app_ui/data/model/model.dart';
import 'package:ustudy_app_ui/widgets/course_card.dart';

class PreparationPage extends StatelessWidget {
  final List<Courses> courses = [
    Courses(
      name: "Подготовка к ЕНТ",
      i1: "9 месяцев",
      i2: "150 уроков",
      col: AppColor.Color1,
    ),
    Courses(
      name: "Подготовка к школе",
      i1: "9 месяцев",
      i2: "150 уроков",
      col: AppColor.Color2,
    ),
    Courses(
      name: "Подготовка к Универ",
      i1: "9 месяцев",
      i2: "150 уроков",
      col: AppColor.Color3,
    ),
    Courses(
      name: "Подготовка к Ктл",
      i1: "9 месяцев",
      i2: "150 уроков",
      col: AppColor.Color4,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const Padding(
              padding: EdgeInsets.only(left: 18),
              child: Text(
                "Направления\nдеятельности",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: courses.length,
                itemBuilder: (context, index) {
                  return CoursesCard(course: courses[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
