import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:sample_project/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginException implements Exception {
  final Map<String, List<String>> errors;

  LoginException(this.errors);
}

class _Login {
  static final Map<String, List<String>> _errors = {
    'email': [],
    'password': [],
  };

  /// Logic for testing email and password.
  /// If test fails, returns email and/or password errors in a single
  /// Map&lt;String, List&lt;String&gt;&gt;, otherwise returns bool true.
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

class AuthService {
  static const String _tokenKey = "auth_token";
  static String? _token;

  static bool get _isAuthenticated => _token != null;

  /// Loading tokens from shared prefs
  static Future<void> loadToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _token = prefs.getString(_tokenKey);
  }

  /// Generating tokens
  static String _generateToken() {
    final random = Random.secure();
    final values = List<int>.generate(32, (i) => random.nextInt(256));
    return sha256.convert(values).toString();
  }

  /// Simualting login using tokens
  static Future<bool> login(String email, String password) async {
    try {
      bool isAuthenticated = _Login.authenticate(email, password);
      if (isAuthenticated) {
        _token = _generateToken();

        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString(_tokenKey, _token!);
        _viewToken(prefs);
      }
      return true;
    } on LoginException {
      rethrow;
    }
  }

  /// For logging out and clearing stored token
  static Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
    _token = null;
    _viewToken(prefs);
  }

  static void _viewToken(SharedPreferences prefs) {
    print("Token Key: $_tokenKey");
    print("Stored Token: ${prefs.getString(_tokenKey)}");
  }

  static String? get token => _token;
}

class AuthenticationException implements Exception {
  final String error;

  AuthenticationException(this.error);
}

/// Extend to add authentication check to a logic/function
abstract class AuthenticatedAction {
  // AuthenticatedAction(bool loginRedirect) {
  AuthenticatedAction() {
    if (!AuthService._isAuthenticated) {
      // if (loginRedirect)
      throw AuthenticationException(
          "User must be authenticated to perform this action.");
    }
  }

  void execute();
}
