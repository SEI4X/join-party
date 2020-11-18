User user = User(
  firstName: 'Tamerlan',
  secondName: 'Saparbaev',
);

class User {
  final int id;
  final String password;
  final String email;
  final String phone;
  final String firstName;
  final String secondName;
  final String imageUrl;
  final int colorScheme;
  final String country;
  final String city;
  final String tiktokUrl;
  final String vkUrl;
  final String instagramUrl;
  final String twitterUrl;

  User(
      {this.id,
      this.password,
      this.email,
      this.phone,
      this.firstName,
      this.secondName,
      this.imageUrl,
      this.colorScheme,
      this.country,
      this.city,
      this.tiktokUrl,
      this.vkUrl,
      this.instagramUrl,
      this.twitterUrl});
}
