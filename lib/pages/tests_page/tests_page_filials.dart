import 'package:flutter/material.dart';
import 'package:ustudy_app_ui/constants/app_color.dart';
import 'package:ustudy_app_ui/pages/tests_page/tests_page_city.dart';
import 'package:ustudy_app_ui/pages/tests_page/tests_page_datas.dart';

class TestsPageFilials extends StatefulWidget {
  final List<Map<String, dynamic>> items;

  TestsPageFilials({required this.items});

  @override
  _TestsPageFilialsState createState() => _TestsPageFilialsState();
}

class _TestsPageFilialsState extends State<TestsPageFilials> {
  late List<Map<String, dynamic>> _mutableItems;

  DateTime _selectedDate = DateTime.now();
  void handleDateTimeSelected(DateTime dateTime) {
    setState(() {
      _selectedDate = dateTime;
    });
  }

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
              'Выберите филиал',
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
                      builder: (context) => TestsPageDatas(
                        initialDate: _selectedDate,
                        initialTime: TimeOfDay.now(),
                        onDateTimeSelected: handleDateTimeSelected,
                      ),
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
