import 'package:flutter/material.dart';
import 'package:ustudy_app_ui/constants/app_color.dart';
import 'package:ustudy_app_ui/pages/tutors/tutors_detail.dart';

class TutorsPage extends StatefulWidget {
  @override
  _TutorsPageState createState() => _TutorsPageState();
}

class _TutorsPageState extends State<TutorsPage> {
  final List<Map<String, dynamic>> programs = [
    {'name': 'Подготовка к школе', 'isChecked': false},
    {'name': 'Подготовка к ЕНТ', 'isChecked': false},
    {'name': 'Подготовка к бакалавриату', 'isChecked': false},
    {'name': 'Подготовка к магистратуре', 'isChecked': false},
  ];

  void selectSingleItem(int selectedIndex) {
    setState(() {
      for (int i = 0; i < programs.length; i++) {
        programs[i]['isChecked'] = i == selectedIndex;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Репетиторы',
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10.0),
              Text(
                'Наши курсы включают видеоуроки, практические тесты и групповые занятия, что помогает студентам успешно подготовиться к поступлению в престижные магистерские программы.',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
             Row(children: [ Text(
                'Стоимость репетиторства: ',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
                Text(
                  '15 000 ТГ',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: AppColor.pinkM),
                ),
              ]),
              SizedBox(height: 16.0),
              Text(
                'Выберите программу',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              ListView.builder(
                shrinkWrap: true,
                itemCount: programs.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ListTile(
                      title: Text(programs[index]['name']),
                      trailing: programs[index]['isChecked']
                          ? const Icon(Icons.check, color: AppColor.pinkM)
                          : null,
                      onTap: () {
                        selectSingleItem(index);
                      },
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 80.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TutorsDetail(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: AppColor.pinkM,
                    minimumSize: Size(
                        double.infinity, 54),
                  ),
                  child: Text('Далее',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
