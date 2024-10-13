import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ustudy_app_ui/data/model/model.dart';
import 'package:ustudy_app_ui/pages/preparation_page/course_details_page.dart';

class CoursesCard extends StatelessWidget {
  final Courses course;

  const CoursesCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: course.col,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 5),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            course.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Cont(course.i1),
              Cont(course.i2),
              GestureDetector(
                onTap:() =>  Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CourseDetailsPage())),
                child: 
              SvgPicture.asset(
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

Widget Cont(String soz) {
  return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 5),
        ],
      ),
      child: Text(soz));
}
