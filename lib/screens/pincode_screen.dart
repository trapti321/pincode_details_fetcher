
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/pincode_bloc.dart';
import '../blocs/pincode_event.dart';
import '../blocs/pincode_state.dart';

class PincodeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pincode Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter Pincode',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (pincode) {
                context.read<PincodeBloc>().add(FetchPincodeDetails(pincode));
              },
            ),

            SizedBox(height: 20),
            Expanded(
              child: BlocBuilder<PincodeBloc, PincodeState>(
                builder: (context, state) {
                  if (state is PincodeLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is PincodeLoaded) {
                    return ListView.builder(
                      itemCount: state.postOffices.length,
                      itemBuilder: (context, index) {
                        final office = state.postOffices[index];
                        return ListTile(
                          title: Text("${office.name}, ${office.division}, ${office.state}"),
                          subtitle: Text(office.district),
                        );
                      },
                    );
                  } else if (state is PincodeError) {
                    return Center(child: Text(state.message));
                  }
                  return Center(child: Text('Enter a pincode to fetch details.'));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
