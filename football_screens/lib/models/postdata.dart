class PostData {
  final String imgUrl;
  final String caption;
  final String date;
  final String text;
  final int likesCount;

  final String profileImgUrl;
  final String nameProfile;
  final String surnameProfile;
  final String profileId;

  PostData(
      {this.date,
      this.caption,
      this.imgUrl,
      this.likesCount,
      this.text,
      this.profileImgUrl,
      this.nameProfile,
      this.surnameProfile,
      this.profileId});
}
