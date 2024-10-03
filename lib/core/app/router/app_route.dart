enum Routes {
  root("/"),
  splashScreen("/splashscreen"),

  /// Home Page
  dashboard("/dashboard"),
  settings("/settings"),

  // Auth Page
  login("/auth/login"),
  register("/auth/register"),
  ;

  const Routes(this.path);

  final String path;
}