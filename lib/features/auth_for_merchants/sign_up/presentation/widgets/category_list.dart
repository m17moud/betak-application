// import 'package:flutter/material.dart';

// class CategoryList extends StatefulWidget {
//   const CategoryList({super.key});

//   @override
//   State<CategoryList> createState() => _CategoryListState();
// }

// class _CategoryListState extends State<CategoryList> {
//   var _dropDownValue = 'ازياء نسائيه';
//   final _departments = [
//     'ازياء نسائيه',
//     'اجهزه اللابتوب',
//     'العاب الفيديو',
//     'اثاث',
//     'اجهزه منزليه',
//     'الالكترونيات'
//   ];
//   @override
//   Widget build(BuildContext context) {
//     var screenWidth = MediaQuery.of(context).size.width;

//     return Container(
//       height: 65,
//       width: screenWidth * 9,
//       decoration: BoxDecoration(
//         color: const Color(0xFFE0E3E8),
//         border: Border.all(color: Colors.transparent),
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(12),
//           child: DropdownButton(
//             iconSize: 30,
//             underline: const SizedBox(),
//             isExpanded: true,
//             departments: _departments.map((String item) {
//               return DropdownMenuItem(
//                 value: item,
//                 child: Text(item),
//               );
//             }).toList(),
//             onChanged: (String? newValue) {
//               setState(() {
//                 _dropDownValue = newValue!;
//               });
//             },
//             value: _dropDownValue,
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:betak/core/utils/color_manager.dart';
import 'package:betak/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatefulWidget {
  final List<String?>
      departments; // The list of departments passed through the constructor
  final ValueChanged<String>
      onChanged; // A callback to notify the selected value

  const CategoryList({
    super.key,
    required this.departments,
    required this.onChanged,
  });

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  String? _dropDownValue;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: 65,
      width: screenWidth * 0.9, // Fixed width ratio
      decoration: BoxDecoration(
        color: Styles.whiteSmoke,
        border: Border.all(color: Colors.transparent),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Styles.flyByNight,
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: DropdownButton<String>(
            iconSize: 30,
            underline: const SizedBox(),
            isExpanded: true,
            hint: Text(
              'اختر الفئة',
              style: TextStyle(
                color: Styles.flyByNight,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            items: widget.departments.map((String? item) {
              return DropdownMenuItem(
                value: item,
                child: Text(
                  item!,
                  style: TextStyle(
                    color: _dropDownValue == item ? Styles.blueSky : ColorManager.black,
                    fontWeight: _dropDownValue == item
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _dropDownValue = newValue;
              });
              widget.onChanged(newValue!); // Notify the parent widget
            },
            value: _dropDownValue,
          ),
        ),
      ),
    );
  }
}
