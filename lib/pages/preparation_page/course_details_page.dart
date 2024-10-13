import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ustudy_app_ui/constants/app_color.dart';
import 'package:ustudy_app_ui/pages/preparation_page/course_details2_page.dart';

class CourseDetailsPage extends StatefulWidget {
  const CourseDetailsPage({super.key});

  @override
  State<CourseDetailsPage> createState() => _CourseDetailsPageState();
}

class _CourseDetailsPageState extends State<CourseDetailsPage> {
  List<bool> _selectedItems = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Подготовка к ЕНТ'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Подготовка к ЕНТ",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Пройдите пробное тестирование, оцените свой уровень подготовки и получите ценные рекомендации.",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Обязательные предметы",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Btn("Математическая грамотность", "cour1"),
            Btn("Грамотность чтения", "cour2"),
            Btn("История Казахстана", "cour3"),
            Padding(
              padding: const EdgeInsets.only(top: 250, left: 10, right: 10),
              child: SizedBox(
                width: 400,
                height: 54,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CourseDetails2Page(
                          items: const [
                            {'name': 'Математика - Физика', 'isChecked': false},
                            {
                              'name': 'Математика - Информатика',
                              'isChecked': false
                            },
                            {
                              'name': 'Математика - География',
                              'isChecked': false
                            },
                            {'name': 'Биология - Химия', 'isChecked': false},
                            {
                              'name': 'Биология - География',
                              'isChecked': false
                            },
                            {
                              'name': 'Иностранный язык - Всемирная история',
                              'isChecked': false
                            },
                          ],
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: AppColor.pinkM,
                  ),
                  child: const Text(
                    "Старт",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget Btn(String soz, String path) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 5),
        ],
      ),
      child: Row(
        children: [
          Center(
            child: ClipOval(
              child: SvgPicture.asset(
                'assets/icons/${path}.svg',
                width: 40,
                height: 40,
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            "${soz}",
            style: const TextStyle(color: AppColor.pinkM, fontSize: 16),
          ),
        ],
      ),
    ),
  );
}
