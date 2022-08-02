

class RecepieModel {
  late String appLabel;
  late String appImgUrl;
  late String appCalories;
  late String appUrl;

  RecepieModel(
      {this.appLabel = "label",
      this.appImgUrl = "Image",
      this.appUrl = "Url",
      this.appCalories = "Calories"});
  factory RecepieModel.fromMap(Map recipe) {
    return RecepieModel(
      appLabel: recipe["label"],
      appCalories: recipe["calories"].toString(),
      appImgUrl: recipe["image"],
      appUrl: recipe["uri"]
    );
  }
}
