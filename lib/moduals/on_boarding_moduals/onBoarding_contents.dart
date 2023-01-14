class OnBoardingContents {
  final String title;
  final String image;
  final String desc;

  OnBoardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnBoardingContents> contents = [
  OnBoardingContents(
    title: "إنشاء المهام اليومية بسهولة",
    image: "assets/images/image1.png",
    desc: "يمكنك إدخال المهام والمهام الفرعيةوالمهام اليومية المتكررة",
  ),
  OnBoardingContents(
    title: " تنظيم وقتك بالشكل الذي تراه مناسب لك",
    image: "assets/images/image2.png",
    desc:
        "يمكنك تنظيم وقتك من خلال كتابة مهامك محدده بالوقت اللازم لإنهائها",
  ),
  OnBoardingContents(
    title: "ثيمات مخصصة",
    image: "assets/images/image3.png",
    desc:
        "يمكنك تغيير الألوان الخاصة بكل مهمه علي حده بالأضافة الي التغيير للوضع الليلي المريح للعين",
  ),
];
