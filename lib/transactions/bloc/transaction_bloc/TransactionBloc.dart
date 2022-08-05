import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';

import '../events/TransactionEvents.dart';
import '../states/TransactionStates.dart';
import '../transaction_repository/TransactionRepository.dart';


class TransactionBloc
    extends Bloc<TransactionEvents, TransactionState> {
  final TransactionRepository _transactionRepository;

  TransactionBloc(this._transactionRepository)
      : super(TransactionInitial()) {
    on<TransactionEvents>((event, emit) async {
      if (event is  GetTransactions) {
        print(event);

        _transactionRepository.getTransactions(event.transactionStatusFlag);

      }
      // ignore: unnecessary_type_check
      else if(event is TransactionCreatedEvent){
        print("GetBlockEvent");

        _transactionRepository.addTransactionToBlock(addTransactionPOJO);


      }
      else if(event is GetNodeTransactions)
        {
          _transactionRepository.getNodeTransactions(event.nodePublicKay);
        }


    });
  }
}
