import 'package:imen_moj/core/helper/theme_provider.dart';
import 'package:imen_moj/core/utils/loading_provider.dart';
import 'package:imen_moj/main.dart';
import 'package:provider/provider.dart';

MultiProvider providers() {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => ThemeProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => LoadingProvider(),
      ),
    ],
    child: const MyApp(),
  );
}
