import 'package:flutter/material.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  var _dropDownValue = 'ازياء نسائيه';
  final _items = [
    'ازياء نسائيه',
    'اجهزه اللابتوب',
    'العاب الفيديو',
    'اثاث',
    'اجهزه منزليه',
    'الالكترونيات'
  ];
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: 65,
      width: screenWidth * 9,
      decoration: BoxDecoration(
        color: const Color(0xFFE0E3E8),
        border: Border.all(color: Colors.transparent),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: DropdownButton(
            iconSize: 30,
            underline: const SizedBox(),
            isExpanded: true,
            items: _items.map((String item) {
              return DropdownMenuItem(
                value: item,
                child: Text(item),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _dropDownValue = newValue!;
              });
            },
            value: _dropDownValue,
          ),
        ),
      ),
    );
  }
}
