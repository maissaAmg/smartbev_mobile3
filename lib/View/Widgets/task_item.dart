import 'package:flutter/material.dart';
import 'package:login/Utils/global_colors.dart';

// ignore: must_be_immutable
class TaskItem extends StatefulWidget {
  final int numTask;
  final String contenu;
  bool checked;
  TaskItem(
      {super.key,
      required this.numTask,
      required this.contenu,
      required this.checked});

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20, left: 20, bottom: 10, top: 10),
      alignment: Alignment.center,
      height: 90,
      decoration: BoxDecoration(
        border: Border.all(color: widget.checked ? Colors.green : Colors.red),
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 14),
                  padding: const EdgeInsets.only(top: 12),
                  child: Text(
                    "Tache ${widget.numTask}",
                    style: TextStyle(
                      color: GlobalColor.textColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  margin: const EdgeInsets.only(left: 14),
                  child: Text(
                    widget.contenu,
                    maxLines: 2,
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: GlobalColor.textColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: InkWell(
              onTap: () {
                // ignore: todo
                // TODO: Handle checked/unchecked state
              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: widget.checked ? Colors.green : Colors.red),
                  color: widget.checked ? Colors.green : GlobalColor.mainColor,
                ),
                child: widget.checked
                    ? SizedBox(
                        height: 30,
                        child: IconButton(
                            onPressed: () {
                              setState(() {
                                widget.checked = !widget.checked;
                              });
                            },
                            icon: Icon(
                              Icons.check,
                              color: GlobalColor.mainColor,
                              size: 18,
                            )),
                      )
                    : SizedBox(
                        height: 30,
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              widget.checked = !widget.checked;
                            });
                          },
                          icon: Icon(
                            Icons.circle_outlined,
                            color: GlobalColor.mainColor,
                            size: 20,
                          ),
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
