import 'package:flutter/material.dart';
import 'package:login/View/Widgets/filterButton.dart';

//Une liste des boutons utilisés pour filtrer les résultats. Cette liste est utile pour garder la trace
//du bouton active à chaque fois pour exécuter les exécutions en conséquence (schéma des couleurs)
class FilterButtons extends StatefulWidget {
  const FilterButtons({super.key});

  @override
  State<FilterButtons> createState() => _FilterButtonsState();
}

class _FilterButtonsState extends State<FilterButtons> {
  int selectedIndex = 0;

  void onButtonPressed(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FilterButton(
          text: "Toutes",
          isSelected: selectedIndex == 0,
          onTap: () => onButtonPressed(0),
        ),
        FilterButton(
          text: "A faire",
          isSelected: selectedIndex == 1,
          onTap: () => onButtonPressed(1),
        ),
        FilterButton(
          text: "Faite",
          isSelected: selectedIndex == 2,
          onTap: () => onButtonPressed(2),
        ),
      ],
    );
  }
}
