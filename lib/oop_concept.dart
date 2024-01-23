class User {
  String? username;
  String? password;
  User(String username, String password) {
    this.username = username;
    this.password = password;
  }
  void login(String name, String pass) {
    if (username == name && password == pass) {
      print('verified');
    } else {
      print('not verified');
    }
  }
}

void main() {
  User user = User("sakib", "1234");
  // user.username = 'sakib';
  // User.password = '1234';
  user.login('sakib', '1234');
  // User.password = '123';
  user.login('sakib', '1234');
}
