import 'package:betak/features/on_boarding/data/mdodel/on_boarding_model.dart';
import 'package:betak/generated/assets.dart';

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
