abstract class NetworkPath {
  // Hosts
  static const String _host = "http://XYZ.com";
  static const String _identityHost = "https://ids.ibazzar.net";

  // Main APIs
  static String findTeacherById(int id) => "$_host/GetTeacher?id=$id";

  // Identity APIs
  static const String token = "$_identityHost/connect/token";
}
