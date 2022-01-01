import 'package:flutter/material.dart';

import 'app_link.dart';

class AppRouteParser extends RouteInformationParser<AppLink> {
  @override
  Future<AppLink> parseRouteInformation(
      RouteInformation routeInformation) async {
    final link = AppLink.fromLocation(routeInformation.location);
    return link;
  }

  /**
   * This function passes in an AppLink object.
   * You ask AppLink to give you back the URL string.
   * You wrap it in RouteInformation to pass it along.
   */
  @override
  RouteInformation restoreRouteInformation(AppLink appLink) {
    final location = appLink.toLocation();
    return RouteInformation(location: location);
  }
}
