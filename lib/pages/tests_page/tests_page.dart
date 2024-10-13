import 'package:flutter/material.dart';
import 'package:ustudy_app_ui/constants/app_color.dart';
import 'package:ustudy_app_ui/data/model/tests_model.dart';
import 'package:ustudy_app_ui/widgets/tests_card.dart';

class TestsPage extends StatelessWidget {
  final List<TestModel> tests = [
    TestModel(
      name: "Пробное тестирование (offline)",
      subjects: ["ОЗП", "ЕНТ"],
      color: AppColor.Color1,
    ),
    TestModel(
      name: "Пробное тестирование (online)",
      subjects: ["ОЗП", "ЕНТ"],
      color: AppColor.Color2,
    ),
    TestModel(
      name: "Официальное тестирование",
      subjects: ["GMAT", "GRE", "SAT", "IELTS", "TOEFL"],
      color: AppColor.Color3,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 18.0),
              child: Text(
                "Тесты",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 18.0),
              child: Text(
                "Все ваши тесты в одном месте: пробные тесты и официальные тесты.",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: tests.length,
                itemBuilder: (context, index) {
                  return TestsCard(
                      test: tests[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
