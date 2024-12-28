import '../../../generated/assets.dart';
import 'mdodel/on_boarding_model.dart';

class OnBoardingItems {
  List<OnBoardingInfoModel> items = [
    OnBoardingInfoModel(
        title: 'Hello',
        description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non consectetur turpis. Morbi eu eleifend lacus.',
        image: Assets.imagesOnBoarding1),
    OnBoardingInfoModel(
        title: 'About Us',
        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        image: Assets.imagesOnBoarding2),

  ];
}
