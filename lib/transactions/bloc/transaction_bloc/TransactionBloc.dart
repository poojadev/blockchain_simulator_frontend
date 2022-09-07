import 'package:bloc/bloc.dart';
import 'package:blockchain_world/transactions/model/AddTransactionPOJO.dart';

import 'package:equatable/equatable.dart';

import '../events/TransactionEvents.dart';
import '../states/TransactionStates.dart';
import '../transaction_repository/TransactionRepository.dart';


class TransactionBloc
    extends Bloc<TransactionEvents, TransactionState> {
  final TransactionRepository _transactionRepository;
  AddTransactionPOJO? addTransactionPOJO;

  TransactionBloc(this._transactionRepository)
      : super(TransactionInitial()) {
    on<TransactionEvents>((event, emit) async {
      if (event is  GetTransactions) {
        print(event);


        _transactionRepository.getTransactionList();

      }
      // ignore: unnecessary_type_check
      else if(event is TransactionCreatedEvent){
        print("GetBlockEvent");

      //  _transactionRepository.addTransactionToBlockNode1(addTransactionPOJO);


      }

    });
  }

}
