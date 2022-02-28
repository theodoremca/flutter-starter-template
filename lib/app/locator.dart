import 'package:get_it/get_it.dart';
import 'package:calenbine/app/controller/asset_controller.dart';

import 'api/repository/asset_repo.dart';

final GetIt locator = GetIt.instance;
void setUp() {
  locator.registerLazySingleton<AssetRepo>(
    () => AssetRepo(),
  );
  locator.registerLazySingleton<AssetController>(
    () => AssetController(),
  );
}
