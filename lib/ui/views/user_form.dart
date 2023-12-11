import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:tour_app/const/colors.dart';
import 'package:tour_app/ui/styles/styles.dart';
import 'package:tour_app/ui/widgets/button.dart';
import 'package:intl/intl.dart';
import 'package:tour_app/ui/widgets/text_field.dart';

import '../route/routes.dart';

class User_form extends StatelessWidget {
  TextEditingController _nameController = TextEditingController();

  TextEditingController _phoneNoController = TextEditingController();

  TextEditingController _addressController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  Rx<TextEditingController> _dobController = TextEditingController().obs;
  //  DateTime selectedDate=DateTime.now();
  Rx<DateTime> selectedDate = DateTime.now().obs;

  _selectDate(BuildContext context) async {
    final selected = await showDatePicker(
        context: context,
        initialDate: DateTime(2023),
        firstDate: DateTime(1990),
        lastDate: DateTime(2023));

    if (selected != null && selected != selectedDate) {
      _dobController.value.text =
          "${selected.day}-${selected.month}-${selected.year}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 80.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Tell Us More About You.",
              style: TextStyle(fontSize: 36.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 12.h,
            ),
            Text(
              "We will not share your information outside this application.",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 80.h,
            ),
            FormField(_nameController, TextInputType.name, 'Full Name'),
            FormField(_phoneNoController, TextInputType.visiblePassword,
                'Phone Number'),
            FormField(
                _addressController, TextInputType.emailAddress, 'Address'),
            Obx(
              () => TextFormField(
                controller: _dobController.value,
                readOnly: true,
                decoration: InputDecoration(
                    hintText: "Date of Birth",
                    hintStyle: TextStyle(
                      fontSize: 15.sp,
                    ),
                    suffixIcon: IconButton(
                        onPressed: () => _selectDate(context),
                        icon: Icon(Icons.calendar_month_rounded))),
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            ToggleSwitch(
                initialLabelIndex: 0,
                totalSwitches: 2,
                labels: ['Male', 'Female'],
                onToggle: (index) {
                  print('switched to: $index');
                }),
            SizedBox(
              height: 60.h,
            ),
            VioletButton("Submit", () {
              Get.toNamed(privacypolicy);
            }),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      )),
    );
  }
}

Widget FormField(controller, inputType, hint) {
  return TextField(
    keyboardType: inputType,
    controller: controller,
    decoration: AppStyle().textFieldDecoration(hint),
  );
}
