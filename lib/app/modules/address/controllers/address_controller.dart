import 'package:appstore/app/models/address.dart';
import 'package:appstore/app/repositories/address_repository.dart';

class AddressController {

  AddressRepository _addressRepository = AddressRepository();

  Future<List<Address>> getAll() async {
    return await _addressRepository.getAll();
  }
}