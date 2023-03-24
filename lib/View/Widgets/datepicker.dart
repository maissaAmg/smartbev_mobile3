import 'package:flutter/material.dart';
import 'package:login/Utils/global_colors.dart';
import 'package:intl/intl.dart';

class MyDatePicker extends StatefulWidget {
  final DateTime initialDate;
  const MyDatePicker({super.key, required this.initialDate});

  @override
  State<MyDatePicker> createState() => _MyDatePickerState();
}

class _MyDatePickerState extends State<MyDatePicker> {
  TextEditingController date = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: TextField(
            controller: date,
            decoration: InputDecoration(
                labelText: "Date de naissance",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: "01/10/2001",
                hintStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: GlobalColor.textColor,
                )),
          ),
        ),
        Positioned(
            top: 18,
            right: 22,
            child: SizedBox(
                height: 40,
                width: 40,
                child: IconButton(
                  onPressed: () async {
                    DateTime? pickDate = await showDatePicker(
                        context: context,
                        initialDate: widget.initialDate,
                        firstDate: DateTime(1960),
                        lastDate: DateTime(2101));
                    if (pickDate != null) {
                      setState(() {
                        date.text = DateFormat('dd/MM/yyyy').format(pickDate);
                      });
                    }
                  },
                  icon: Icon(Icons.calendar_today_outlined,
                      color: GlobalColor.textColor.withOpacity(0.3)),
                )))
      ],
    );
  }
}
