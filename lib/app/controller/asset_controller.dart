import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:calenbine/app/api/model/asset_model.dart';
import 'package:calenbine/app/api/repository/asset_repo.dart';

import '../locator.dart';

class AssetController {
  Future<List<Assets>> getRequest(BuildContext context) async {
    final result = await locator.get<AssetRepo>().getRequest();
    final AssetModel _assets = AssetModel.fromJson(json.decode(result));
    return _assets.assets;
  }
}



// final assetsProvider = FutureProvider<List<Assets>>((ref) async {
//   final result = await locator.get<AssetRepo>().getRequest();
//   final List<Assets> _assets = json.decode(result)['assets'];
//   print(_assets);
//   return _assets;
// });
