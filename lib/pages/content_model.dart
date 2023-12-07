class UnboardingContent {
  String top;
  String image;
  String title;
  String description;

  UnboardingContent(
      {required this.top, required this.image, required this.title, required this.description});
}

List<UnboardingContent> contents = [
  UnboardingContent(
      top: 'assets/images/onboarding_assets/top.png',
      title: 'Mudah dan Cepat',
      image: 'assets/images/onboarding_assets/onboarding_pic1.png',
      description:
          "JasaRumahku akan membantu kamu mengatasi kesulitan di dalam rumah tanpa perlu ribet keluar rumah. Cukup pesan dan atur jadwal."),
  UnboardingContent(
      top: 'assets/images/onboarding_assets/top.png',
      title: 'Aman dan Terpercaya',
      image: 'assets/images/onboarding_assets/onboarding_pic2.png',
      description:
          "Seluruh barang yang ada di dalam rumah akan dijamin asuransi sehingga kamu tak perlu khawatir barang kamu akan rusak atau hilang."),
  UnboardingContent(
      top: 'assets/images/onboarding_assets/top.png',
      title: 'Layanan Terlengkap',
      image: 'assets/images/onboarding_assets/onboarding_pic3.png',
      description:
          "Temukan jasa dengan layanan yang cocok untuk rumahmu seperti perbaikan saluran listrik, pipa bocor, dan banyak lagi. \nYuk, coba beragam layanannya sekarang!"),
];
