import 'package:amit_5/dessert_details_screen.dart';
import 'package:amit_5/dessert_list.dart';
import 'package:amit_5/dessert_model.dart';
import 'package:flutter/material.dart';

class DessertRoutePath {
  final int? id;
  final bool isUnknown;
 
  DessertRoutePath.home()
      : id = null,
        isUnknown = false;
 
  DessertRoutePath.details(this.id) : isUnknown = false;
 
  DessertRoutePath.unknown()
      : id = null,
        isUnknown = true;
 
  bool get isHomePage => id == null && !isUnknown;
  bool get isDetailsPage => id != null;
}

class DessertRouterDelegate extends RouterDelegate<DessertRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<DessertRoutePath> {
  @override
  final GlobalKey<NavigatorState> navigatorKey;
  Dessert? _selectedDessert;
  bool show404 = false;
  List<Dessert> desserts = [
    Dessert(
      'Cupcake',
      'A delicious cupcake with a variety of flavors and toppings',
      'assets/l.jpg',
    ),
    Dessert(
      'Donut',
      'A soft and sweet donut, glazed or filled with your favorite flavors',
      'assets/m.png',
    ),
    Dessert(
      'Eclair',
      'A long pastry filled with cream and topped with chocolate icing',
      'assets/x.jpg',
    ),
  ];
  DessertRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Candy Shop',
      home: Navigator(
        pages: [
          MaterialPage(
              key: ValueKey('DessertsPage'),
              child: DessertsListScreen(
                  desserts: desserts, onTapped: _handleDessertTapped)),
          if (_selectedDessert != null)
            MaterialPage(
              key: ValueKey(_selectedDessert),
              child: DessertDetailsScreen(
                dessert: _selectedDessert!,
              ),
            ),
          if (show404)
            const MaterialPage(
              key: ValueKey('UnknownPage'),
              child: Scaffold(
                body: Column(
                  children: [
                    Text('404 NOT FOUND'),
                    Text(
                        'The desert you are looking for is eaten or it was never here! '),
                  ],
                ),
              ),
            )
        ],
        onPopPage: (route, result) {
          if (!route.didPop(result)) {
            return false;
          }
            _selectedDessert = null;
            show404 = false;
            notifyListeners();
          return true;
        },
      ),
    );
  }

  void _handleDessertTapped(Dessert dessert) {
      _selectedDessert = dessert;
      notifyListeners();
  }
  
  @override
    Future<void> setNewRoutePath(DessertRoutePath configuration) async {
    if (configuration.isUnknown) {
      _selectedDessert = null;
      show404 = true;
      return;
    }
    if (configuration.isDetailsPage) {
      if (configuration.id! < 0 || configuration.id! >= desserts.length) {
        show404 = true;
        return;
      }
      _selectedDessert = desserts[configuration.id!];
    } else {
      _selectedDessert = null;
    }
    show404 = false;
}


@override
  DessertRoutePath get currentConfiguration {
    if (show404) {
      return DessertRoutePath.unknown();
    }
    return _selectedDessert == null
        ? DessertRoutePath.home()
        : DessertRoutePath.details(desserts.indexOf(_selectedDessert!));
  }
    }
    
    class  DessertRouteInformationParser extends RouteInformationParser<DessertRoutePath> {
  @override
  Future<DessertRoutePath> parseRouteInformation(RouteInformation routeInformation) async {
    final uri = routeInformation.uri;
    if (uri.pathSegments.isEmpty) {
      return DessertRoutePath.home();
    }
    if (uri.pathSegments.length == 2) {
    if (uri.pathSegments[0] != 'dessert') return DessertRoutePath.unknown();
      var id = int.tryParse(uri.pathSegments[1]);
      if (id == null) return DessertRoutePath.unknown();
      return DessertRoutePath.details(id);
    }
     return DessertRoutePath.unknown();
  }
  @override
  RouteInformation? restoreRouteInformation(DessertRoutePath configuration) {
    if (configuration.isUnknown) {
      return RouteInformation(uri: Uri.parse('/404'));
    }
    if (configuration.isHomePage) {
      return RouteInformation(uri: Uri.parse('/'));
    }
    if (configuration.isDetailsPage) {
      return RouteInformation(uri: Uri.parse('/dessert/${configuration.id}'));
    }
    return null;
  }
    }