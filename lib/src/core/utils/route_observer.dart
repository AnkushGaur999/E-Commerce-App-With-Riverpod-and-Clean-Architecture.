
import 'package:flutter/material.dart';

class RouteObserver extends NavigatorObserver {


  @override
  void didStopUserGesture() {
    super.didStopUserGesture();
  }

  @override
  void didStartUserGesture(Route<dynamic> route, Route<dynamic>? previousRoute) {
    print("didStartUserGesture() Called, Route is $route, Previous Route: $previousRoute");
    super.didStartUserGesture(route, previousRoute);
  }

  @override
  void didChangeTop(Route<dynamic> topRoute, Route<dynamic>? previousTopRoute) {
    print("didChangeTop() Called, Top Route is $topRoute, Previous Route: $previousTopRoute");
    super.didChangeTop(topRoute, previousTopRoute);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    print("didReplace() Called, New Route is $newRoute, Old Route: $oldRoute");
    super.didReplace();
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    print("didRemove() Called, New Route is $route, Previous Route: $previousRoute");
    super.didRemove(route, previousRoute);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    print("didRemove() Called, Pop Route is $route, Previous Route: $previousRoute");
    super.didPop(route, previousRoute);
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    print("didPush() Called, Push Route is $route, Previous Route: $previousRoute");
    super.didPush(route, previousRoute);
  }
}