import 'package:blockchain_world/accounts/model/AllAccounts/AllAccountsPOJO.dart';
import 'package:equatable/equatable.dart';

abstract class AccountsEvents extends Equatable {
  const AccountsEvents();

  @override
  List<Object> get props => [];
}

class AccountInit extends AccountsEvents {
  @override
  List<Object> get props => [];
}


class AddAccountEvent extends AccountsEvents {
  final int nodeLength;

  AddAccountEvent(this.nodeLength);
}
class GetAccountCount extends AccountsEvents
{
  final String nodeId;
  GetAccountCount(this.nodeId);
}
class GetAllAccount extends AccountsEvents {
// final AllAccountsPOJO accountsPOJO;
  const GetAllAccount();
}

class UpdateAccountTransaction extends AccountsEvents {
  final int amount;
  final String id;

  UpdateAccountTransaction(this.id,this.amount);
}