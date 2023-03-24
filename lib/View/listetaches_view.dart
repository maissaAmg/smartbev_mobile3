import 'package:flutter/material.dart';
import 'package:login/Utils/global_colors.dart';
import 'package:login/View/Widgets/roundprogressbar..dart';
import 'package:login/View/Widgets/task_item.dart';
import 'package:login/View/Widgets/listetaches.dart';
import 'package:login/View/Widgets/menu.dart';

class ListeTacheView extends StatefulWidget {
  final TasksList tasksList;
  const ListeTacheView({super.key, required this.tasksList});

  @override
  State<ListeTacheView> createState() => _ListeTacheViewState();
}

class _ListeTacheViewState extends State<ListeTacheView> {
  @override
  Widget build(BuildContext context) {
    Menu.buildDrawer(context);
    return Scaffold(
      backgroundColor: GlobalColor.mainColor,
      appBar: Menu(
        title: 'Liste des taches',
        leftIcon: Icons.arrow_back_ios,
        rightIcon: Icons.menu,
        onLeftIconPressed: () => Navigator.pop(context),
        // ignore: avoid_print
        onRightIconPressed: () => print('Icon menu pressed'),
      ),
      endDrawer: Menu.buildDrawer(context),
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 20,
          ),
          //Progress bar
          const RoundProgressBar(progress: 0.9),
          //Liste des Taches
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.tasksList.myTasks.length,
            itemBuilder: (BuildContext context, int index) {
              return TaskItem(
                contenu: widget.tasksList.myTasks[index].contenu,
                numTask: widget.tasksList.myTasks[index].numTask,
                checked: widget.tasksList.myTasks[index].checked,
              );
            },
          ),
        ]),
      ),
    );
  }
}
