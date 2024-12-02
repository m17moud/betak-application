import 'package:flutter/material.dart';
import 'package:betak/core/utils/styles.dart';
import 'package:betak/features/product/presentation/views/widgets/custom_amount_button.dart';
import 'package:betak/generated/assets.dart';

class ProductViewBody extends StatefulWidget {
  const ProductViewBody({super.key});

  @override
  State<ProductViewBody> createState() => _ProductViewBodyState();
}

class _ProductViewBodyState extends State<ProductViewBody> {
  num x = 0;
  String selectedSize = 'L'; // Default selected size

  final List<String> sizes = ['S', 'M', 'L', 'XL', 'XXL'];

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            Assets.imagesProduct,
            fit: BoxFit.fill,
          ),
          const Padding(
            padding: EdgeInsets.only(right: 12, top: 7),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text(
                'بلوزه ساده بأكمام طويله',
                style: Styles.styleBoldIrinaSans20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12, left: 16, top: 18),
            child: Row(
              children: [
                Container(
                  // width: width * 0.18, // Responsive width
                  // height: height * 0.03, // Responsive height
                    width:75,
                  height: 22,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: const Color(0xFF999999))),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top:.5, bottom:.5),
                        child: CustomIconButton(
                          color: const Color(0xFF999999),
                          icon: const Icon(
                            Icons.remove,
                            color: Colors.white,
                            size: 20,
                          ),
                          onTap: () {
                            setState(() {
                              if (x == 0) {
                                x = 0;
                              } else {
                                x--;
                              }
                            });
                          },
                        ),
                      ),
                      const Spacer(),
                      Text('$x'),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(top: .5, bottom: .5),
                        child: CustomIconButton(
                          color: const Color(0xFF455A64),
                          icon: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 20,
                          ),
                          onTap: () {
                            setState(() {
                              x++;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'المقاس',
                    style: Styles.styleBoldIrinaSans20
                        .copyWith(fontWeight: FontWeight.w300),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 22,
          ),
          SafeArea(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: sizes.map((size) {
                  bool isSelected = size == selectedSize;
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: width * 0.02),
                    // Adjusted margin
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedSize = size;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(width * 0.18, height * 0.05),
                        // Responsive button size
                        backgroundColor:
                            isSelected ? Colors.white : Styles.blueSky,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: height * 0.015,
                            horizontal: width * 0.05), // Adjusted padding
                      ),
                      child: Text(
                        size,
                        style: TextStyle(
                          fontSize: width * 0.03, // Responsive font size
                          color: isSelected
                              ? const Color(0xFF455A64)
                              : Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12, top: 21),
            child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  'المواصفات',
                  style: Styles.styleRegularIrina22.copyWith(fontSize: 20),
                )),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: height * 0.02,horizontal: height*.03), // Responsive vertical padding
            child: Text(
              'بلوزة أنيقة مصممة بعناية لتناسب جميع الأذواق. تتميز بقصة عصرية وجذابة، مع تفاصيل دقيقة تضيف لمسة من الفخامة. مصنوعة من قماش ناعم وعالي الجودة يضمن الراحة والمرونة طوال اليوم. متوفرة بألوان متعددة لتتناسب مع جميع المناسبات، سواء كانت رسمية أو كاجوال',
              style: Styles.styleRegularRoboto16
                  .copyWith(fontFamily: 'Irina Sans'),
              textAlign: TextAlign.justify,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: width * 0.02, right: width * 0.02, bottom: height * 0.04),
            // Responsive padding
            child: Row(
              children: [
                Container(
                  width: width * 0.25, // Responsive width
                  height: height * 0.05, // Responsive height
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: const Color(0xFFE4E4E4),
                      )),
                  child: Center(
                      child: Text(
                    '500 LE',
                    style:
                        Styles.styleMediumInter13.copyWith(color: Colors.black),
                  )),
                ),
                const Spacer(),
                ElevatedButton.icon(
                  onPressed: () {
                    // Add your onPressed action here
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(width * 0.7, height * 0.05),
                    // Responsive button size
                    backgroundColor: const Color(0xFF80CFFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  icon: Image.asset(Assets.imagesShoppingCart),
                  label: Center(
                      child: Text(
                    'اضافه الي عربه التسوق',
                    style: Styles.styleBoldIrinaSans20.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        height: 1),
                    textAlign: TextAlign.center,
                  )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
