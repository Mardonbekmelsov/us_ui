import 'package:flutter/material.dart';
import 'package:ustudy_app_ui/constants/app_color.dart';
import 'package:ustudy_app_ui/pages/agreement_page/agreement_page.dart';
import 'package:ustudy_app_ui/pages/tests_page/tests_page_filials.dart';

class TestsPageCity extends StatefulWidget {
  final List<Map<String, dynamic>> items;

  TestsPageCity({required this.items});

  @override
  _TestsPageCityState createState() => _TestsPageCityState();
}

class _TestsPageCityState extends State<TestsPageCity> {
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
              'Выберите город',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
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
                      builder: (context) => TestsPageFilials(items: [
                         {'name': 'ул. Темирбек Жургенова 18/2', 'isChecked': false},
                          {'name': 'район Сарыарка, ул. К.Мухамедханова 37 а', 'isChecked': false},
                      ],),
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
          ],
        ),
      ),
    );
  }
}
