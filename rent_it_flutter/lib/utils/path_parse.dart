String getLocalImagePath(String apiImagePath) {
  String imageName = apiImagePath.split('/').last;
  return 'assets/images/$imageName';
}
