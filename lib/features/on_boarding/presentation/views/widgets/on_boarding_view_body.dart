import 'package:betak/core/utils/styles.dart';
import 'package:betak/features/on_boarding/presentation/views/on_boarding_secondary_view.dart';
import 'package:betak/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({
    super.key,
  });

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  bool _isFirstPage = true;

  int index =0;
  void _togglePage() {
    setState(() {
      index++;
      _isFirstPage = !_isFirstPage;

    });
    setState(() {
      if(index == 2){
        index=0;
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const OnBoardingSecondaryView()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenHeight = constraints.maxHeight;
        double screenWidth = constraints.maxWidth;

        return Column(
          children: <Widget>[
            Container(
              height: screenHeight * 0.5,
              width: double.infinity,
              color: const Color(0xFFFFF6E9),
              padding: EdgeInsets.only(top: screenHeight * 0.18),
              child: Image.asset(
                _isFirstPage
                    ? Assets.imagesOnBoarding1
                    : Assets.imagesOnBoarding2, // Change the path as needed
                width: screenWidth * (_isFirstPage ? 0.8 : 0.75),
                height: screenHeight * (_isFirstPage ? 0.3 : 0.35),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: Styles.styleBoldIrinaSans32,
                    children: [
                      TextSpan(
                        text: _isFirstPage ? 'تبحث عن ' : 'جميعها يتم ',
                        style: Styles.styleBoldIrinaSans32.copyWith(color: Colors.black)
                      ),
                      TextSpan(
                        text: _isFirstPage ? 'صفقة' : 'تسليمها',
                        style: const TextStyle(color: Colors.blue),
                      ),
                      TextSpan(
                        text: _isFirstPage ? ' ؟' : ' إلى\nالباب الخاص بك',
                          style: Styles.styleBoldIrinaSans32.copyWith(color: Colors.black)

                      ),
                    ],
                  )),
            ),
            const SizedBox(height: 2),
            Text(
              _isFirstPage
                  ? 'في مكان ما لشراء سلع رخيصة\nوجيدة الحالة وقريبة؟'
                  : 'أضف جميع العناصر إلى عربتك\n للتسوق وسيتم تسليمها إلى\n باب منزلك.',
              style: Styles.styleRegularIrina22,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.1),
                  child: IconButton(
                    icon: SvgPicture.asset(Assets.imagesIconButtonArrow,width: 60,height: 60,),
                    onPressed: _togglePage,
                  ),
                ),
                const Spacer(),
                Container(
                  width: 20,
                  height: 5,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: (_isFirstPage) ? Colors.black12 : Colors.black,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: screenWidth * 0.1),
                  child: Container(
                    width: 20,
                    height: 5,
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: !_isFirstPage ? Colors.black12 : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        );
      },
    );
  }
}
