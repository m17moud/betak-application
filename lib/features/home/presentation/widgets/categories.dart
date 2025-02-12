import 'package:betak/core/utils/routes_manager.dart';

import '../../../../core/utils/color_manager.dart';
import '../../../../core/utils/styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Categories extends StatelessWidget {
  const Categories({
    super.key,
    required this.width,
    required this.height,
    required this.departmentInfo,
  });

  final double width;
  final double height;
  final List departmentInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      child: GridView.builder(
        padding: EdgeInsets.only(bottom: height * 0.02, top: height * 0.01),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: width < 600 ? 2 : 3,
          crossAxisSpacing: width * 0.03,
          mainAxisSpacing: height * 0.04,
        ),
        itemCount: departmentInfo.length,
        itemBuilder: (BuildContext context, int index) {
          var department = departmentInfo[index];
          return SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(
                      context,
                      Routes.categorieProducts,
                      arguments: department, // Replace with an actual instance
                    );

                  },
                  child: Container(

                    width: width * 0.35,
                    height: height * 0.18,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey[200],
                    ),
                    child: CachedNetworkImage(
                      imageUrl: department.image!,
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: ColorManager.darkerWhite,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          color: ColorManager.white,
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: EdgeInsets.only(right: width * 0.025),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      department.name!,
                      style: Styles.styleBoldInriaSans16.copyWith(
                        fontSize: width * 0.04,
                        color:  Styles.flyByNight,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
