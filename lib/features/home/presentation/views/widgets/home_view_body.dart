import 'package:betak/core/utils/styles.dart';
import 'package:betak/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<String> categoryImages = [
      Assets.imagesCategory1,
      Assets.imagesCategory2,
      Assets.imagesCategory3,
      Assets.imagesCategory4,
      Assets.imagesCategory5,
      Assets.imagesCategory6,
    ];

    List<String> categoryName = [
      'أَرَائِكُ',
      'كراسي',
      'وحدات تلفزيون',
      'طَاوِلَات',
      'مجموعات الغرفة',
      'سراير'
    ];
    double width = MediaQuery.sizeOf(context).width;

    return Column(
      children: [
        Container(
          width: double.infinity,
          color: const Color(0xFF455A64),
          child: SizedBox(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40, bottom: 20),
                  child: SvgPicture.asset(
                    Assets.imagesLogo1,
                    width: 51,
                    height: 53,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 11, top: 9),
          child: Align(
              alignment: Alignment.topRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'الفئات',
                    style: Styles.styleBoldIrinaSans48
                        .copyWith(fontSize: 25, color: const Color(0xFF455A64)),
                  ),
                 
                ],
              )),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GridView.builder(
              padding: const EdgeInsets.only(bottom: 20, top: 10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
                crossAxisSpacing: 10, // Spacing between columns
                mainAxisSpacing: 12,
              ),
              itemCount: categoryImages.length, // Number of items
              itemBuilder: (BuildContext context, int index) {
                return SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(categoryImages[index]),
                      const SizedBox(
                        height: 4,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 10,
                        ),
                        child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              categoryName[index],
                              style: Styles.styleBoldInriaSans16.copyWith(
                                  fontSize: 16, color: const Color(0xFF455A64)),
                            )),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
