import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:nft/app/api/model/asset_model.dart';
import 'package:nft/app/api/repository/asset_repo.dart';


import '../locator.dart';

class AssetController {
  getRequest(BuildContext context) async {
    final result = await locator.get<AssetRepo>().getRequest();
    final AssetModel _assets = AssetModel.fromJson(json.decode(result));
    return _assets;
  }
}

// final assetsProvider = FutureProvider<List<Assets>>((ref) async {
//   final result = await locator.get<AssetRepo>().getRequest();
//   final List<Assets> _assets = json.decode(result)['assets'];
//   print(_assets);
//   return _assets;
// });
