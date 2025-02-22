import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/string_manager.dart';
import '../../../../../core/utils/styles.dart';

class Category {
  final String id;
  final String name;

  Category({required this.id, required this.name});

  // Override equality operator and hashCode to ensure unique object comparison
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Category && other.id == id && other.name == name);

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}

class CategoryList extends StatefulWidget {
  final List<Category> departments;
  final ValueChanged<Category> onChanged;

  const CategoryList({
    super.key,
    required this.departments,
    required this.onChanged,
  });

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  Category? _dropDownValue;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: 65,
      width: screenWidth * 0.9,
      decoration: BoxDecoration(
        color: ColorManager.textFormFillColor,
        border: Border.all(color: Colors.transparent),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Styles.flyByNight,
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: DropdownButton<Category>(
            iconSize: 30,
            underline: const SizedBox(),
            isExpanded: true,
            hint: Text(
              AppStrings.chooseCategory.tr(),
              style: const TextStyle(
                color: Styles.flyByNight,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            items: widget.departments.map((Category item) {
              return DropdownMenuItem<Category>(
                value: item,
                child: Text(
                  item.name,
                  style: TextStyle(
                    color: _dropDownValue == item
                        ? ColorManager.error
                        : ColorManager.black,
                    fontWeight: _dropDownValue == item
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              );
            }).toList(),
            onChanged: (Category? newValue) {
              setState(() {
                _dropDownValue = newValue;
              });
              if (newValue != null) {
                widget.onChanged(newValue); // Notify the parent widget
              }
            },
            value: widget.departments.contains(_dropDownValue)
                ? _dropDownValue
                : null,
          ),
        ),
      ),
    );
  }
}
