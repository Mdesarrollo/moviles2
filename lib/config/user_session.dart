class UserSession {
  static String? nombre;
  static String? email;
  static String? role;

  static void clear() {
    nombre = null;
    email = null;
    role = null;
  }
}