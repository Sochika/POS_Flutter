import 'package:six_pos/data/api/api_client.dart';
import 'package:get/get.dart';
import 'package:six_pos/util/app_constants.dart';




class PosRepo{
  ApiClient apiClient;
  PosRepo({required this.apiClient});

  Future<Response> getCustomerList(int offset) async {
    return await apiClient.getData('${AppConstants.getCustomerListUri}?limit=10&offset=$offset');
  }


}