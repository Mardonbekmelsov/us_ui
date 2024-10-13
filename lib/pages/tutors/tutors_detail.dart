import 'package:flutter/material.dart';
import 'package:ustudy_app_ui/constants/app_color.dart';
import 'package:ustudy_app_ui/pages/agreement_page/agreement_page.dart';

class TutorsDetail extends StatefulWidget {
  @override
  _TutorsDetailState createState() => _TutorsDetailState();
}

class _TutorsDetailState extends State<TutorsDetail> {
  final List<Map<String, dynamic>> programs = [
    {'name': 'Математика', 'isChecked': false},
    {'name': 'Казахский язык', 'isChecked': false},
    {'name': 'Русский язык', 'isChecked': false},
    {'name': 'Логика', 'isChecked': false},
    {'name': 'Английский язык', 'isChecked': false},
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
      appBar: AppBar(
        title: Text("Репетиторы"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Выберите предмет ',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
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
                          ? Icon(
                              Icons.check,
                              color: AppColor.pinkM,
                            )
                          : null,
                      onTap: () {
                        selectSingleItem(index);
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AgreementPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: AppColor.pinkM,
                  minimumSize: Size(double.infinity, 54),
                ),
                child: Text('Далее',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
