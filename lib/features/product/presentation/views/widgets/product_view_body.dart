
import '../../../../categorie_products/data/models/products_model.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../../generated/assets.dart';

// ignore: must_be_immutable
class ProductViewBody extends StatefulWidget {
  ProductsModel productsModel;

   ProductViewBody({super.key,required this.productsModel});

  @override
  State<ProductViewBody> createState() => _ProductViewBodyState();
}

class _ProductViewBodyState extends State<ProductViewBody> {
  bool isLiked = false; // State for like button

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(
                Assets.imagesProduct,
                fit: BoxFit.fill,
              ),

            ],
          ),
          const Padding(
            padding: EdgeInsets.only(right: 12, top: 7),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text(
                'بلوزه ساده بأكمام طويله',
                style:Styles.styleBoldIrinaSans20,
              ),
            ),
          ),

         Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                const Padding(
                padding: EdgeInsets.only(right: 12, top: 5),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    'البائع: احمد محمد', // Seller name added
                    style: Styles.styleBoldInriaSans16
                  ),
                ),
              ),
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
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(right: 12, top: 20),
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

                SizedBox(
                  width: width * 0.25, // Responsive width
                  height: height * 0.06, // Responsive height

                  child: Center(
                    child:
                    IconButton(
                      icon: Icon(size: 45,
                        isLiked ? Icons.favorite : Icons.favorite_border,
                        color: isLiked ? Colors.red : Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          isLiked = !isLiked;
                        });
                      },
                    ),),
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

                  icon: const Icon(Icons.facebook, color: Colors.white,size: 30, ),
                  label: Center(
                      child: Text(
                        'التواصل عبر الفيسبوك',
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
