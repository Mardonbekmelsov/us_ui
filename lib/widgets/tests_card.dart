import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ustudy_app_ui/data/model/tests_model.dart'; 
import 'package:ustudy_app_ui/pages/tests_page/tests_page_details.dart';

class TestsCard extends StatelessWidget {
  final TestModel test;

  const TestsCard({super.key, required this.test});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: test.color,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 5),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            test.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(height: 10),
        
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Wrap(
                  spacing: 5.0,
                  runSpacing: 5.0,
                  children: test.subjects
                      .map((subject) => SubjectChip(text: subject))
                      .toList(),
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TestsPageDetails(
                          items: const [
                            {'name': 'ЕНТ', 'isChecked': false},
                            {
                              'name': 'ОЗП',
                              'isChecked': false
                            },
                          ],
                        ),
                  ),
                ),
                child: SvgPicture.asset(
                  'assets/icons/button_to.svg',
                  height: 70,
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}

class SubjectChip extends StatelessWidget {
  final String text;

  const SubjectChip({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin:
          const EdgeInsets.only(right: 5.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 5),
        ],
      ),
      child: Text(text),
    );
  }
}
