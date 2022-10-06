import 'package:flutter/material.dart' show GlobalKey, NavigatorState;

const String initialPage = '/';
const String home = '/home';
const String foodDetails = 'foodDetails';
const String foodOrder = 'foodOrder';
const String toBeImplemented = 'toBeImplemented';

final GlobalKey<NavigatorState> navigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

final GlobalKey<NavigatorState> shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

List<String> routes = [home, '$home/$foodOrder'];
