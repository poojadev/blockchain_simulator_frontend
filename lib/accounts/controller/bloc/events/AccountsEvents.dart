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


class UpdateAccountTransaction extends AccountsEvents {
  final double amount;
  final String id;

  UpdateAccountTransaction(this.id,this.amount);
}