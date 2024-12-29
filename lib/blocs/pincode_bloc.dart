import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pincode_fetcher/blocs/pincode_event.dart';
import 'package:pincode_fetcher/blocs/pincode_state.dart';

import '../repositories/pincode_repository.dart';

class PincodeBloc extends Bloc<PincodeEvent, PincodeState> {
  final PincodeRepository repository;

  PincodeBloc(this.repository) : super(PincodeInitial()) {
    on<FetchPincodeDetails>((event, emit) async {
      emit(PincodeLoading());
      try {
        final postOffices =
            await repository.fetchPincodeDetails(event!.pincode);
        emit(PincodeLoaded(postOffices));
      } catch (e) {
        emit(PincodeError(e.toString()));
      }
    });
  }
}
