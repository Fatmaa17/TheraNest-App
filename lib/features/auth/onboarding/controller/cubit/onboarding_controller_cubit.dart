import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:therapy_app/features/auth/onboarding/model/OnboardingModel.dart';

part 'onboarding_controller_state.dart';

class OnboardingControllerCubit extends Cubit<OnboardingControllerState> {
  OnboardingControllerCubit() : super(OnboardingControllerInitial());

  List images = [
    'assets/images/01.jpeg',
    'assets/images/02.jpeg',
    'assets/images/03.jpeg'
  ];
  //Beige : dfbd90
  //Black : 050200
  List titles = [
    'Welcome to TheraNest',
    'Your Wellness Space',
    'Qualified Professionals'
  ];
  List subTitles = [
    'Begin your mental wellness journey online. Take the next step towards leading a healthier, more balanced life.',
    'Equipped with services, tools, and resources to guide you on your wellness journey.',
    'Our network is made up of culturally-relevant, bilingual, highly-trained professionals, qualified to support you.'
  ];

  List data = [
    OnboardingModel(
        image: 'assets/images/01.jpeg',
        title: 'Welcome to TheraNest',
        subTitle:
            'Begin your mental wellness journey online. Take the next step towards leading a healthier, more balanced life.'),
    OnboardingModel(
        image: 'assets/images/02.jpeg',
        title: 'Your Wellness Space',
        subTitle:
            'Equipped with services, tools, and resources to guide you on your wellness journey.'),
    OnboardingModel(
        image: 'assets/images/03.jpeg',
        title: 'Qualified Professionals',
        subTitle:
            'Our network is made up of culturally-relevant, bilingual, highly-trained professionals, qualified to support you.'),
  ];
}
