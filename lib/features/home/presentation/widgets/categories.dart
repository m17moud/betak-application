import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/utils/color_manager.dart';
import '../../../../core/utils/styles.dart';

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
          crossAxisSpacing: width * 0.02,
          mainAxisSpacing: height * 0.02,
          childAspectRatio: width < 600 ? 0.8 : 1,
        ),
        itemCount: departmentInfo.length,
        itemBuilder: (BuildContext context, int index) {
          var department = departmentInfo[index];
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: width * 0.4,
                height: height * 0.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey[200],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: department.image != null && department.image!.isNotEmpty
                      ? CachedNetworkImage(
                          imageUrl: department.image!,
                          placeholder: (context, url) => Shimmer.fromColors(
                            baseColor: ColorManager.darkerWhite,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              color: ColorManager.white,
                            ),
                          ),
                          errorWidget: (context, url, error) => const Icon(Icons.error),
                          fit: BoxFit.cover,
                        )
                      : Container(
                          color: Colors.grey[200],
                        ),
                ),
              ),
              const SizedBox(height: 6),
              Padding(
                padding: EdgeInsets.only(right: width * 0.025),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    department.name!,
                    style: Styles.styleBoldInriaSans16.copyWith(
                      fontSize: width * 0.04,
                      color: Styles.flyByNight,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
