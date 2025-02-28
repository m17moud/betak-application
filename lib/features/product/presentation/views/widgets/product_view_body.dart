// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:betak/core/utils/routes_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/string_manager.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../category_products/data/models/products_model.dart';

// ignore: must_be_immutable
class ProductViewBody extends StatefulWidget {
  bool isMerchant;
  ProductsModel productsModel;

  ProductViewBody({
    super.key,
    required this.isMerchant,
    required this.productsModel,
  });

  @override
  State<ProductViewBody> createState() => _ProductViewBodyState();
}

class _ProductViewBodyState extends State<ProductViewBody> {
  final PageController _pageController = PageController();
  int _currentPage = 0; // Track the current image

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    double paddingTop = height * 0.02;
    double paddingRight = width * 0.05;

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: height * 0.45,
            child: widget.productsModel.images!.isNotEmpty
                ? Column(
                    children: [
                      Expanded(
                        child: PageView.builder(
                          controller: _pageController,
                          itemCount: widget.productsModel.images!.length,
                          itemBuilder: (context, index) {
                            return Hero(
                              tag: widget.productsModel.id!,
                              child: CachedNetworkImage(
                                imageUrl: widget.productsModel.images![index],
                                fit: BoxFit.contain,
                              ),
                            );
                          },
                          onPageChanged: (index) {
                            setState(() {
                              _currentPage = index;
                            });
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          widget.productsModel.images!.length,
                          (index) => AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            width: _currentPage == index ? 12 : 8,
                            height: _currentPage == index ? 12 : 8,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _currentPage == index
                                  ? Styles.blueSky
                                  : ColorManager.grey,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : Center(
                    child: Text(
                    AppStrings.noImgae.tr(),
                    style: Styles.styleRegularInter16,
                  )),
          ),
          Padding(
            padding: EdgeInsets.only(right: paddingRight, top: paddingTop),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text(
                "${widget.productsModel.pname}",
                style: Styles.styleBoldIrinaSans20.copyWith(
                  fontSize: width * 0.06,
                  color: ColorManager.black,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: paddingRight, top: paddingTop),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: width * 0.4,
                  height: height * 0.06,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorManager.priceBackgorundColor,
                    boxShadow: const [
                      BoxShadow(
                        color: ColorManager.grey,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                        "${widget.productsModel.pPrice.toString()} ${AppStrings.egp.tr()}",
                        style: Styles.styleBoldInriaSans16),
                  ),
                ),
                Container(
                  width: width * 0.4,
                  height: height * 0.06,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Styles.flyByNight,
                    boxShadow: const [
                      BoxShadow(
                        color: ColorManager.grey,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.thumb_up,
                          size: width * 0.047,
                          color: Styles.blueSky,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "${widget.productsModel.likes}",
                          style: TextStyle(
                            fontSize: width * 0.045,
                            fontWeight: FontWeight.bold,
                            color: Styles.blueSky,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: paddingRight, top: paddingTop),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text(
               AppStrings.specifications.tr(),
                style: Styles.styleRegularIrina22.copyWith(
                  fontSize: width * 0.055,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.03,
            ),
            child: ReadMoreText(
              widget.productsModel.pdescribtion!,
              trimMode: TrimMode.Line,
              trimLines: 2,
              colorClickableText: ColorManager.black,
              trimCollapsedText: AppStrings.viewMore.tr(),
              trimExpandedText: AppStrings.viewLess.tr(),
              style: Styles.styleBoldIrinaSans20.copyWith(),
              textAlign: TextAlign.justify,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: paddingRight, top: paddingTop),
            child: Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    Routes.merchantProductForClientRoute,
                    arguments: {
                      'isMerchant': widget.isMerchant,
                      'sellerModel': widget.productsModel.seller,
                      'sellerId': widget.productsModel.sellerid
                    },
                  );
                },
                child: Text(
                  "${AppStrings.theMerchant.tr()} : ${widget.productsModel.seller!.sname}",
                  style: TextStyle(
                    fontSize: width * 0.047,
                    fontWeight: FontWeight.bold,
                    color: ColorManager.blue,
                    decoration: TextDecoration.underline,
                    decorationColor: ColorManager.blue,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
