import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/routes_manager.dart';
import '../../../../../core/utils/string_manager.dart';
import '../../../data/models/products_model.dart';

class Products extends StatefulWidget {
  const Products({
    super.key,
    required this.width,
    required this.isMerchant,
    required this.height,
    required this.departmentProducts,
  });
  final bool isMerchant;
  final double width;
  final double height;
  final List<ProductsModel> departmentProducts;

  @override
  // ignore: library_private_types_in_public_api
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  int? hoveredIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.width * 0.05),
      child: GridView.builder(
        padding: EdgeInsets.only(
            bottom: widget.height * 0.02, top: widget.height * 0.01),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: widget.width < 600 ? 2 : 2,
          crossAxisSpacing: widget.width * 0.03,
          mainAxisSpacing: widget.height * 0.04,
          childAspectRatio: 0.75,
        ),
        itemCount: widget.departmentProducts.length,
        itemBuilder: (BuildContext context, int index) {
          var product = widget.departmentProducts[index];

          return MouseRegion(
            onEnter: (_) => setState(() => hoveredIndex = index),
            onExit: (_) => setState(() => hoveredIndex = null),
            child: GestureDetector(
              onTap: () {
                if (widget.isMerchant) {
                  Navigator.pushNamed(context, Routes.merchantProductRoute,
                      arguments: {
                        'isMerchant': widget.isMerchant,
                        'productsModel': product,
                      });
                } else {
                  Navigator.pushNamed(context, Routes.clientProductRoute,
                      arguments: {
                        'isMerchant': widget.isMerchant,
                        'productsModel': product,
                      });
                }
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                decoration: BoxDecoration(
                  boxShadow: hoveredIndex == index
                      ? [
                          const BoxShadow(
                            color: ColorManager.black,
                            blurRadius: 10,
                            spreadRadius: 2,
                            offset: Offset(0, 4),
                          ),
                        ]
                      : [],
                ),
                child: Card(
                  elevation: hoveredIndex == index ? 8 : 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(12)),
                          child: Hero(
                            tag: product.id!,
                            child: CachedNetworkImage(
                              imageUrl: product.images?.isNotEmpty == true
                                  ? product.images![0]
                                  : 'https://via.placeholder.com/150',
                              placeholder: (context, url) => Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: Container(
                                  width: double.infinity,
                                  color: ColorManager.white,
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                              fit: BoxFit.contain,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.pname ?? AppStrings.unknown.tr(),
                              style: TextStyle(
                                fontSize: widget.width * 0.04,
                                fontWeight: FontWeight.bold,
                                color: ColorManager.black,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              " ${AppStrings.merchant.tr()} : ${product.seller?.sname ?? AppStrings.unknown.tr()}",
                              style: TextStyle(
                                fontSize: widget.width * 0.035,
                                color: Colors.grey[600],
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                Icon(Icons.thumb_up,
                                    color: ColorManager.blue,
                                    size: widget.width * 0.05),
                                const SizedBox(width: 4),
                                Text(
                                  "${product.likes ?? 0}",
                                  style: TextStyle(
                                    fontSize: widget.width * 0.035,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  "${product.pPrice ?? 0} ${AppStrings.egp.tr()}",
                                  style: TextStyle(
                                    fontSize: widget.width * 0.035,
                                    color: ColorManager.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
