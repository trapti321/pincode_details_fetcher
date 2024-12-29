import 'package:equatable/equatable.dart';
import 'package:pincode_fetcher/models/pincode_model.dart';

abstract class PincodeState extends Equatable {
  @override
  List<Object> get props => [];
}

class PincodeInitial extends PincodeState {}

class PincodeLoading extends PincodeState {}

class PincodeLoaded extends PincodeState {
  List<PostOffice> postOffices;

  PincodeLoaded(this.postOffices);

  @override
  List<Object> get props => [postOffices];
}

class PincodeError extends PincodeState {
  final String message;

  PincodeError(this.message);

  @override
  List<Object> get props => [message];
}
