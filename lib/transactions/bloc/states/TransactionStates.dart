import 'package:equatable/equatable.dart';

abstract class TransactionState extends Equatable {
  const TransactionState();

  @override
  List<Object?> get props => [];
}

class TransactionInitial extends TransactionState {
  @override
  List<Object?> get props => [];
}

class TransactionSuccess extends TransactionState {
  final String? message;
  const TransactionSuccess({this.message});

  @override
  List<Object?> get props => [message];
}

class TransactionFailure extends TransactionState {
  @override
  List<Object?> get props => [];
}