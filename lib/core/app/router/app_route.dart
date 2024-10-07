enum Routes {
  splashScreen("/splashscreen"),

  /// Home Page
  home("/home"),
  cources("/cources"),
  search("/search"),
  account("/account"),

  // Auth Page
  login("/auth/login"),
  register("/auth/register"),
  ;

  const Routes(this.path);

  final String path;
}
