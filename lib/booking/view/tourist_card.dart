import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_hotel/booking/view/borderless_text_field.dart';
import 'package:test_hotel/core/view/title_text.dart';

class TouristCard extends StatefulWidget {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController birthDateController;
  final TextEditingController countryController;
  final TextEditingController passportController;
  final TextEditingController passportDateController;

  final bool checkFields;

  TouristCard({
    super.key,
    this.checkFields = false,
    TextEditingController? firstNameController,
    TextEditingController? lastNameController,
    TextEditingController? birthDateController,
    TextEditingController? countryController,
    TextEditingController? passportController,
    TextEditingController? passportDateController,
  })  : firstNameController = firstNameController ?? TextEditingController(),
        lastNameController = lastNameController ?? TextEditingController(),
        birthDateController = birthDateController ?? TextEditingController(),
        countryController = countryController ?? TextEditingController(),
        passportController = passportController ?? TextEditingController(),
        passportDateController =
            passportDateController ?? TextEditingController();

  @override
  State<StatefulWidget> createState() => TouristCardState();

  bool get isValid {
    return firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty &&
        birthDateController.text.isNotEmpty &&
        countryController.text.isNotEmpty &&
        passportController.text.isNotEmpty &&
        passportDateController.text.isNotEmpty;
  }

  TouristCard copyWith(bool checkFields) {
    return TouristCard(
      checkFields: checkFields,
      firstNameController: firstNameController,
      lastNameController: lastNameController,
      birthDateController: birthDateController,
      countryController: countryController,
      passportController: passportController,
      passportDateController: passportDateController,
    );
  }
}

class TouristCardState extends State<TouristCard> {
  bool _isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 10),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          children: [
            Row(
              children: [
                const TitleText(text: 'Первый турист'),
                const Expanded(child: SizedBox()),
                IconButton(
                  style: IconButton.styleFrom(
                      backgroundColor: const Color(0x1A0D72FF),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      )),
                  onPressed: () {
                    setState(() {
                      _isExpanded = !_isExpanded;
                    });
                  },
                  icon: _isExpanded
                      ? SvgPicture.asset('assets/arrow_up.svg')
                      : SvgPicture.asset('assets/arrow_down.svg'),
                ),
              ],
            ),
            _isExpanded ? _expanded() : const SizedBox(),
          ],
        ),
      ),
    );
  }

  Widget _expanded() {
    return Column(
      children: [
        const SizedBox(height: 20),
        BorderlessTextField(
          controller: widget.firstNameController,
          labelText: 'Имя',
          isError:
              widget.firstNameController.text.isEmpty && widget.checkFields,
        ),
        const SizedBox(height: 8),
        BorderlessTextField(
          controller: widget.lastNameController,
          labelText: 'Фамилия',
          isError: widget.lastNameController.text.isEmpty && widget.checkFields,
        ),
        const SizedBox(height: 8),
        BorderlessTextField(
          controller: widget.birthDateController,
          labelText: 'Дата рождения',
          isError:
              widget.birthDateController.text.isEmpty && widget.checkFields,
          keyboardType: TextInputType.datetime,
        ),
        const SizedBox(height: 8),
        BorderlessTextField(
          controller: widget.countryController,
          labelText: 'Гражданство',
          isError: widget.countryController.text.isEmpty && widget.checkFields,
        ),
        const SizedBox(height: 8),
        BorderlessTextField(
          controller: widget.passportController,
          labelText: 'Номер загранпаспорта',
          isError: widget.passportController.text.isEmpty && widget.checkFields,
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 8),
        BorderlessTextField(
          controller: widget.passportDateController,
          labelText: 'Срок действия загранпаспорта',
          isError:
              widget.passportDateController.text.isEmpty && widget.checkFields,
          keyboardType: TextInputType.datetime,
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
