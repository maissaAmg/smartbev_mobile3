import 'package:flutter/material.dart';
import 'package:login/Utils/global_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

class NotificationItem extends StatefulWidget {
  final bool afficher;
  final String contenu;
  final String heureOuDate;
  const NotificationItem(
      {Key? key,
      required this.afficher,
      required this.contenu,
      required this.heureOuDate})
      : super(key: key);

  @override
  State<NotificationItem> createState() => _NotificationItemState();
}

class _NotificationItemState extends State<NotificationItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20, left: 20, bottom: 10, top: 10),
      alignment: Alignment.center,
      height: 90,
      decoration: BoxDecoration(
        border: Border.all(color: HexColor('#D29832')),
        borderRadius: BorderRadius.circular(20),
        color: GlobalColor.mainColor,
        boxShadow: [
          BoxShadow(
            spreadRadius: 2,
            blurRadius: 10,
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Stack(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 12, top: 0),
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  'assets/images/cloche2.svg',
                  height: 50,
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(left: 14),
                  padding: const EdgeInsets.only(top: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: 240,
                          child: Text(
                            widget.contenu,
                            maxLines: 2,
                            softWrap: false,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: GlobalColor.textColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          )),
                      Container(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(widget.heureOuDate,
                            style: TextStyle(
                              color: GlobalColor.textColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            )),
                      )
                    ],
                  )),
            ],
          ),
          Positioned(
              top: 15,
              right: 15,
              child: Visibility(
                visible: widget.afficher,
                child: Icon(Icons.circle, color: HexColor('#D29832')),
              ))
        ],
      ),
    );
  }
}
