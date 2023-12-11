class UnboardingContent {
  String image;
  String title;
  String description;

  UnboardingContent(
      {required this.image, required this.title, required this.description});
}

List<UnboardingContent> contents = [
  UnboardingContent(
      title: 'JasaRumahku',
      image: 'assets/images/onboarding_assets/splash_pic1.png',
      description:
          "JasaRumahku Akan Membantu Kamu Saat Kesulitan Untuk Pindahan Rumah"),
  UnboardingContent(
      title: 'Mudah dan Cepat',
      image: 'assets/images/onboarding_assets/splash_pic2.png',
      description:
          "Pindahan Kamu Terasa Lebih menyenangkan Karena Dibantu Oleh Kami Dengan Cepat Dan Tinggal Terima Jadi"),
  UnboardingContent(
      title: 'Aman dan Terpercaya',
      image: 'assets/images/onboarding_assets/splash_pic3.png',
      description:
          "Seluruh Barang Yang Akan Dipindahkan Dijamin Asuransi Sehingga Kamu Tak Perlu Khawatir Barang Kamu Akan Rusak atau Bahkan Hilang"),
];
