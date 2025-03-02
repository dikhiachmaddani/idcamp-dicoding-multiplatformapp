enum NavigationRoute {
  mainRoute("/main"),
  setting("/setting"),
  search("/search"),
  detailRoute("/detail");

  const NavigationRoute(this.name);
  final String name;
}
