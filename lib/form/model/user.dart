class User {
  String firstName;
  String lastName;
  Map<String, bool> passions = {
    'cooking': false,
    'hiking': false,
    'traveling': false
  };
  bool newsletter;

  User({this.firstName = '', this.lastName = '', this.newsletter = false});

  void save() {
    print('Saving user');
  }
}
