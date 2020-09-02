import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'themeprovider.dart';

class AppProvider {
  static AppProvider _instance;
  static AppProvider get instance {
    if (_instance == null) _instance = AppProvider._init();
    return _instance;
  }

  AppProvider._init();

  List<SingleChildWidget> providers = [
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
    ),
  ];
}
