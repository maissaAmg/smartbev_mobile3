import 'package:flutter/material.dart';
import 'package:login/Utils/global_colors.dart';

// ignore: must_be_immutable
class GenderList extends StatefulWidget {
  final String gender;
  final Function(String) onChanged;
  const GenderList({super.key, required this.gender, required this.onChanged});

  @override
  State<GenderList> createState() => _GenderListState();
}

class _GenderListState extends State<GenderList> {
  late String _gender;

  @override
  void initState() {
    super.initState();
    _gender = widget.gender;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0, right: 20, left: 22),
          child: Text(
            "Sexe",
            style: TextStyle(
              color: GlobalColor.textColor,
              fontSize: 12,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(
            left: 56,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Radio(
                        value: "Masculin",
                        groupValue: _gender,
                        onChanged: (value) {
                          setState(() {
                            _gender = value.toString();
                            widget.onChanged(_gender);
                          });
                        }),
                    Text(
                      "Masculin",
                      style: TextStyle(
                        color: GlobalColor.textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Radio(
                        value: "Féminin",
                        groupValue: _gender,
                        onChanged: (value) {
                          setState(() {
                            _gender = value.toString();
                            widget.onChanged(_gender);
                          });
                        }),
                    Text(
                      "Féminin",
                      style: TextStyle(
                        color: GlobalColor.textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
