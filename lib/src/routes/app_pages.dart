import 'package:flutter_bloc_lib/src/app.dart';
import 'package:flutter_bloc_lib/src/views/profile/view.dart';
part 'app_routes.dart';

var appPages = {
  Routes.ROOT: (context) => App(),
  Routes.PROFILE: (context) => ProfilePage(),
};
