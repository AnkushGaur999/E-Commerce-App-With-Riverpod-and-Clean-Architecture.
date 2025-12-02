import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RouteObserver extends NavigatorObserver {


  @override
  void didStartUserGesture(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (kDebugMode) {
      print("didStartUserGesture() Called, Route is $route, Previous Route: $previousRoute");
    }
    super.didStartUserGesture(route, previousRoute);
  }

  @override
  void didChangeTop(Route<dynamic> topRoute, Route<dynamic>? previousTopRoute) {
    if (kDebugMode) {
      print("didChangeTop() Called, Top Route is $topRoute, Previous Route: $previousTopRoute");
    }
    super.didChangeTop(topRoute, previousTopRoute);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    if (kDebugMode) {
      print("didReplace() Called, New Route is $newRoute, Old Route: $oldRoute");
    }
    super.didReplace();
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (kDebugMode) {
      print("didRemove() Called, New Route is $route, Previous Route: $previousRoute");
    }
    super.didRemove(route, previousRoute);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (kDebugMode) {
      print("didRemove() Called, Pop Route is $route, Previous Route: $previousRoute");
    }
    super.didPop(route, previousRoute);
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (kDebugMode) {
      print("didPush() Called, Push Route is $route, Previous Route: $previousRoute");
    }
    super.didPush(route, previousRoute);
  }
}