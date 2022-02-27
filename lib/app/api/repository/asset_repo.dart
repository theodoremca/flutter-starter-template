import 'package:dio/dio.dart';
import 'package:nft/services/rest/rest_api_handler_data.dart';

class AssetRepo {
  Future getRequest() async{
    final response = await RestApiHandlerData.getData('Retrieving_assets');
    return response;
  }
    Future gen(FormData formData) async {
    // final response = await RestApiHandlerData.postData('category/store', formData);
    // return response;
  }
}

