import 'package:flutter/material.dart';
import 'package:login/Utils/global_colors.dart';

// ignore: must_be_immutable
class GenderList extends StatefulWidget {
  String gender;
  GenderList({super.key, required this.gender});

  @override
  State<GenderList> createState() => _GenderListState();
}

class _GenderListState extends State<GenderList> {
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
                        value: "Homme",
                        groupValue: widget.gender,
                        onChanged: (value) {
                          setState(() {
                            widget.gender = value.toString();
                          });
                        }),
                    Text(
                      "Homme",
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
                        value: "Femme",
                        groupValue: widget.gender,
                        onChanged: (value) {
                          setState(() {
                            widget.gender = value.toString();
                          });
                        }),
                    Text(
                      "Femme",
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
