import 'package:flutter/material.dart';
import 'package:ustudy_app_ui/constants/app_color.dart';
import 'package:ustudy_app_ui/pages/agreement_page/agreement_page.dart';
import 'package:ustudy_app_ui/pages/tests_page/tests_page_city.dart';

class TestsPageDetails extends StatefulWidget {
  final List<Map<String, dynamic>> items;

  TestsPageDetails({required this.items});

  @override
  _TestsPageDetailsState createState() => _TestsPageDetailsState();
}

class _TestsPageDetailsState extends State<TestsPageDetails> {
  late List<Map<String, dynamic>> _mutableItems;

  @override
  void initState() {
    super.initState();
    _mutableItems = List<Map<String, dynamic>>.from(
        widget.items.map((item) => Map<String, dynamic>.from(item)));
  }

  void selectSingleItem(int selectedIndex) {
    setState(() {
      for (int i = 0; i < _mutableItems.length; i++) {
        _mutableItems[i]['isChecked'] = i == selectedIndex;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Пробное тестирование"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Пробное тестирование',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Пройдите пробный тест оффлайн в условиях, максимально приближенных к реальному экзамену в официальных тест центрах',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _mutableItems.length,
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
                      title: Text(_mutableItems[index]['name']),
                      trailing: _mutableItems[index]['isChecked']
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
            ),
            SizedBox(
              width: 400,
              height: 54,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TestsPageCity(items: [
                          {'name': 'Алматы', 'isChecked': false},
                          {'name': 'Астана', 'isChecked': false},
                          {'name': 'Шымкент', 'isChecked': false},
                          {'name': 'Абай', 'isChecked': false},
                          {'name': 'Акмола', 'isChecked': false},
                          {'name': 'Актобе', 'isChecked': false},
                          {'name': 'Атырау', 'isChecked': false},
                          {'name': 'ШҚО', 'isChecked': false},
                          {'name': 'Жамбыл', 'isChecked': false},
                          {'name': 'Жетісу', 'isChecked': false},
                          {'name': 'Қарағанды', 'isChecked': false},
                          {'name': 'Қостанай', 'isChecked': false},
                          {'name': 'Қызылорда', 'isChecked': false},
                          {'name': 'Маңғыстау', 'isChecked': false},
                          {'name': 'Павлодар', 'isChecked': false},
                          {'name': 'СҚОҰлытау', 'isChecked': false},
                          {'name': 'Ұлытау', 'isChecked': false},
                          {'name': 'Түркістан', 'isChecked': false},
                        ],),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: AppColor.pinkM,
                ),
                child: const Text(
                  "Далее",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
