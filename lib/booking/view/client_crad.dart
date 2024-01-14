import 'package:flutter/material.dart';
import 'package:test_hotel/core/phone_input_formatter.dart';
import 'package:test_hotel/core/view/title_text.dart';

class ClientCard extends StatelessWidget {
  ClientCard({super.key});

  final _phoneController = TextEditingController();

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
              decoration: const BoxDecoration(
                color: Color(0xFFF6F6F9),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: TextField(
                style: const TextStyle(
                  color: Color(0xFF14142B),
                  fontWeight: FontWeight.w400,
                ),
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                inputFormatters: [NumberTextInputFormatter()],
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  labelText: 'Номер телефона',
                  labelStyle: TextStyle(color: Color(0xFFA9ABB7)),
                  border: InputBorder.none,
                  hintText: '+7 (***) ***-**-**',
                  hintStyle: TextStyle(
                    color: Color(0xFF14142B),
                    fontWeight: FontWeight.w400,
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
