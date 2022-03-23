abstract class NetworkPath {
  static const String _host = "http://XYZ.com";

  static String findTeacherById(int id) => "$_host/GetTeacher?id=$id";
}
