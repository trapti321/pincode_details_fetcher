import 'package:equatable/equatable.dart';


abstract class PincodeEvent extends Equatable{
  @override
  List<Object> get props => [];
}

class FetchPincodeDetails extends PincodeEvent{
  final String pincode;

  FetchPincodeDetails(this.pincode);

  @override
  List<Object> get props => [pincode];
}