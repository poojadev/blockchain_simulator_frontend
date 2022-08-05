import 'package:equatable/equatable.dart';


abstract class TransactionEvents extends Equatable {
  const TransactionEvents();

  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class TransactionsInitial extends  TransactionEvents {


}

 class GetTransactions extends  TransactionEvents {
late int transactionStatusFlag;
GetTransactions(this.transactionStatusFlag);

}

class GetNodeTransactions extends  TransactionEvents {
  late String nodePublicKay;
  GetNodeTransactions(this.nodePublicKay);

}
class TransactionCreatedEvent extends TransactionEvents {
  //final int nodeLength;
  //GetChainPOJO? getChainPOJO;
 late  String senderId;
 late String receiverId;
 late double amount;
  TransactionCreatedEvent(this.senderId,this.receiverId,this.amount);
}
