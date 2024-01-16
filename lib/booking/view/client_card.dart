import 'package:flutter/material.dart';
import 'package:test_hotel/booking/config/phone_input_formatter.dart';
import 'package:test_hotel/core/view/title_text.dart';

class ClientCard extends StatefulWidget {
  const ClientCard({super.key});

  @override
  State<StatefulWidget> createState() => ClientCardState();
}

class ClientCardState extends State<ClientCard> {
  late TextEditingController _phoneController;
  late TextEditingController _emailController;

  bool _emailValidated = true;
  bool _phoneValidated = true;

  @override
  void initState() {
    _phoneController = TextEditingController();
    _emailController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 10),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TitleText(text: 'Информация о покупателе'),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF6F6F9),
                border: !_phoneValidated ? Border.all(color: Colors.red) : null,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: TextField(
                onSubmitted: (value) {
                  _checkPhone();
                },
                onEditingComplete: () {
                  _checkPhone();
                },
                onChanged: (value) {
                  if (!_phoneValidated) {
                    _checkPhone();
                  }
                },
                inputFormatters: [NumberTextInputFormatter()],
                keyboardType: TextInputType.phone,
                style: const TextStyle(
                  color: Color(0xFF14142B),
                  fontWeight: FontWeight.w400,
                ),
                controller: _phoneController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  labelText: 'Номер телефона',
                  hintText: '+7 (***) ***-**-**',
                  labelStyle: TextStyle(
                      color: _phoneValidated
                          ? const Color(0xFFA9ABB7)
                          : Colors.red),
                  border: InputBorder.none,
                ),
              ),
            ),
            //BorderlessTextField(
            //  controller: _phoneController,
            //  keyboardType: TextInputType.phone,
            //  inputFormatters: [NumberTextInputFormatter()],
            //  labelText: 'Номер телефона',
            //  hintText: '+7 (***) ***-**-**',
            //),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF6F6F9),
                border: !_emailValidated ? Border.all(color: Colors.red) : null,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: TextField(
                onSubmitted: (value) {
                  _checkEmail();
                },
                onEditingComplete: () {
                  _checkEmail();
                },
                onChanged: (value) {
                  if (!_emailValidated) {
                    _checkEmail();
                  }
                },
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(
                  color: Color(0xFF14142B),
                  fontWeight: FontWeight.w400,
                ),
                controller: _emailController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  labelText: _emailValidated
                      ? 'Почта'
                      : 'Введите правильный адрес почты',
                  labelStyle: TextStyle(
                      color: _emailValidated
                          ? const Color(0xFFA9ABB7)
                          : Colors.red),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Эти данные никому не передаются. '
              'После оплаты мы вышлим чек на '
              'указанный вами номер и почту',
              style: TextStyle(color: Color(0xFF828796)),
            ),
          ],
        ),
      ),
    );
  }

  void _checkEmail() {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);
    if (_emailController.text.isNotEmpty &&
        !regex.hasMatch(_emailController.text)) {
      setState(() {
        _emailValidated = false;
      });
    } else {
      setState(() {
        _emailValidated = true;
      });
    }
  }

  void _checkPhone() {
    if (_phoneController.text.isNotEmpty &&
        _phoneController.text.contains('*')) {
      setState(() {
        _phoneValidated = false;
      });
    } else {
      setState(() {
        _phoneValidated = true;
      });
    }
  }
}
