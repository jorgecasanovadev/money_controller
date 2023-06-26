import 'package:flutter/material.dart';

class CategorySelectionWidget extends StatefulWidget {
  final Map<String, IconData> categories;
  final Function(String) onValueChanged;

  const CategorySelectionWidget({
    super.key,
    required this.categories,
    required this.onValueChanged,
  });

  @override
  State<CategorySelectionWidget> createState() =>
      _CategorySelectionWidgetState();
}

class CategoryWidget extends StatelessWidget {
  final String name;
  final IconData? icon;
  final bool isSelected;

  const CategoryWidget({
    super.key,
    required this.icon,
    required this.name,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              border: Border.all(
                color: isSelected ? Colors.blueAccent : Colors.grey,
                width: isSelected ? 3.0 : 1.0,
              ),
            ),
            child: Icon(icon),
          ),
          Text(name),
        ],
      ),
    );
  }
}

class _CategorySelectionWidgetState extends State<CategorySelectionWidget> {
  String currentItem = '';

  @override
  Widget build(BuildContext context) {
    var widgets = <Widget>[];

    widget.categories.forEach(
      (name, icon) => widgets.add(
        GestureDetector(
          onTap: () {
            currentItem = name;
            setState(() {});
            widget.onValueChanged(name);
          },
          child: CategoryWidget(
            name: name,
            icon: icon,
            isSelected: name == currentItem,
          ),
        ),
      ),
    );
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: widgets,
      ),
    );
  }
}
