class Usuario{

  String _nome;
  String _email;
  String _senha;
  String _urlImagem;



  Usuario();

  String get nome => _nome;

  set nome(String value) {
    _nome = value;
  }

  String get email => _email;

  String get urlImagem => _urlImagem;

  set urlImagem(String value) {
    _urlImagem = value;
  }

  String get senha => _senha;

  set senha(String value) {
    _senha = value;
  }

  set email(String value) {
    _email = value;
  }


}


