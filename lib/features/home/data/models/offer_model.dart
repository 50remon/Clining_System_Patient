class OfferModel {
  final String offerText;
  final String? offerImage;
  final String id;
  final String title;

  OfferModel(
      {required this.offerText,
      this.offerImage,
      required this.id,
      required this.title});
}
