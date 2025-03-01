import 'package:sample_project/constants.dart';

class LoginException implements Exception {
  final Map<String, List<String>> errors;

  LoginException(this.errors);
}

class Login {
  static final Map<String, List<String>> _errors = {
    'email': [],
    'password': [],
  };

  static bool authenticate(String email, String password) {
    _errors['email']!.clear();
    _errors['password']!.clear();

    if (email.isEmpty) {
      _errors['email']!.add('Required');
    }

    if (password.isEmpty) {
      _errors['password']!.add('Required');
    }

    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(email)) {
      _errors['email']!.add('Invalid Email.');
    }

    switch (email) {
      case ('admin@account.root'):
        _errors['email']!.add('Warning. Reserved phrase.');
        break;
      case ('superadmin@account.root'):
        _errors['email']!.add('Warning. Unused reserved phrase.');
        break;
    }

    if (password.length < 8) {
      _errors['password']!.add('Password too short.');
    }

    if (!credentials.containsKey(email) || credentials[email] != password) {
      _errors['password']!.add('Email and/or password not found.');
    }

    if (_errors['email']!.isNotEmpty || _errors['password']!.isNotEmpty) {
      throw LoginException(_errors);
    }

    return true;
  }
}
