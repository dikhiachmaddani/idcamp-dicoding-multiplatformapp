enum NavigationRoute {
  mainRoute("/main"),
  search("/search"),
  detailRoute("/detail");

  const NavigationRoute(this.name);
  final String name;
}