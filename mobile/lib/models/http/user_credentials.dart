class UserCredentials {
  String login;
  String senha;

  UserCredentials(this.login, this.senha);


  Map<String, dynamic> toJson() =>
      {
        'login': login,
        'senha': senha,
      };


}