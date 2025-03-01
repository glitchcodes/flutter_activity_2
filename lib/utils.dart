import 'package:sample_project/constants.dart';

class LoginException implements Exception {
  final Map<String, List<String>> errors;

  LoginException(this.errors);

  // @override
  // String toString() => "LoginException: $errors";
}

class Login {
  static final Map<String, List<String>> _errors = {
    'email': [],
    'password': [],
  };

  static void _throwError() {
    throw LoginException(_errors);
  }

  static bool authenticate(String email, String password) {
    _errors['email']!.clear();
    _errors['password']!.clear();

    if (email.isEmpty) {
      _errors['email']!.add('Required');
      _throwError();
    }

    if (password.isEmpty) {
      _errors['password']!.add('Required');
      _throwError();
    }

    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(email)) {
      _errors['email']!.add('Invalid Email.');
      _throwError();
    }

    switch (email) {
      case ('admin@account.root'):
        _errors['email']!.add('Warning. Reserved phrase.');
        _throwError();
      case ('superadmin@account.root'):
        _errors['email']!.add('Warning. Unused reserved phrase.');
        _throwError();
    }

    if (password.length < 8) {
      _errors['password']!.add('Password too short.');
      _throwError();
    }

    if (!credentials.containsKey(email) || credentials[email] != password) {
      _errors['password']!.add('Email and/or password not found.');
    }

    if (_errors['email']!.isNotEmpty || _errors['password']!.isNotEmpty) {
      _throwError();
    }

    return true;
  }
}
