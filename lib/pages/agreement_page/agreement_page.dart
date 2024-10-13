import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ustudy_app_ui/constants/app_color.dart';
import 'package:ustudy_app_ui/pages/preparation_page/preparation_page.dart';

class AgreementPage extends StatefulWidget {
  @override
  _AgreementPageState createState() => _AgreementPageState();
}

class _AgreementPageState extends State<AgreementPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isChecked = false;
  String name = '';
  String phoneNumber = '';
  bool _isSubmitted = false;

  void _showRejectionAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Ошибка'),
          content:
              Text('Необходимо принять условия соглашения, чтобы продолжить.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Заявка успешно отправлена!'),
          content: Text('В ближайшее время мы вам перезвоним'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Text('Закрыть'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Согласие на обработку данных'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Введите ваше имя:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
               Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Имя',
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                    ),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      return null;
                    },
                    onSaved: (value) {
                    },
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Введите ваш номер телефона:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),


                Container(
                  decoration: BoxDecoration(
                    color: Colors.white, 
                    borderRadius: BorderRadius.circular(
                        12),
                  ),
                  padding: EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 8),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Номер телефона',
                      border:
                          InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                    ),
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      return null;
                    },
                    onSaved: (value) {
                      phoneNumber = value ?? '';
                    },
                  ),
                ),


                SizedBox(height: 16),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isChecked = !_isChecked;
                        });
                      },
                      child: SvgPicture.asset(
                        _isChecked
                            ? 'assets/icons/checked.svg'
                            : 'assets/icons/unchecked.svg',
                        height: 25,
                        width: 25,
                      ),
                    ),
                    SizedBox(width: 5,),
                    Expanded(
                      child: Text(
                        "Нажимая кнопку, принимаю условия соглашения и даю согласие на обработку своих персональных данных на условиях политики конфиденциальности.",
                        style: TextStyle(fontSize: 14),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: ElevatedButton(
                    onPressed: _isChecked
                        ? () {
                            if (_formKey.currentState?.validate() ?? false) {
                              _formKey.currentState?.save();
                              _showAlertDialog(context);
                              setState(() {
                                _isSubmitted = true;
                              });
                            }
                          }
                        : () {
                            _showRejectionAlertDialog(context);
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.pinkM,
                      foregroundColor: AppColor.whiteColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      "Оставить заявку",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
