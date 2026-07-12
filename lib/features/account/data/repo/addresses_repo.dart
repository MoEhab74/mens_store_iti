import 'package:dartz/dartz.dart';
import 'package:mens_store/core/api/api_end_points.dart';
import 'package:mens_store/core/api/dio_helper.dart';
import 'package:mens_store/features/account/data/models/addresses_model.dart';

class AddressesRepo {
  final DioHelper dioHelper;
  AddressesRepo(this.dioHelper);

  Future<Either<String, List<BranchModel>>> getAllAddresses() async {
    try {
      final response = await dioHelper.getRequest(ApiEndPoints.getAddresses);
      final List<BranchModel> addresses = (response.data as List)
          .map((e) => BranchModel.fromJson(e))
          .toList();
      return right(addresses);
    } catch (e) {
      return left(e.toString());
    }
  }
}
