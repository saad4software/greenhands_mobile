import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:greenhands_mobile/blocs/generic/generic_bloc.dart';
import 'package:greenhands_mobile/extensions/widget_extension.dart';
import 'package:greenhands_mobile/screens/pick_location_screen.dart';
import 'package:greenhands_mobile/widgets/map_position_widget.dart';
import 'package:greenhands_mobile/extensions/validators_extension.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  static const LatLng center = LatLng(-33.86711, 151.1947171);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  LatLng? position;

  final genericBloc = GenericBloc();

  @override
  Widget build(BuildContext context) {
    const appTitle = 'register_organizer';

    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle),
      ),
      body: BlocProvider(
        create: (context) => genericBloc,
        child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ListView(
                children: [
                  const SizedBox(height: 24,),
                  const Text("organizer_register_form", textAlign: TextAlign.center,),
                  const SizedBox(height: 16,),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    autofocus: true,
                    validator: (value)=>value.isValidEmail() ? null : "invalid_email",
                    decoration: const InputDecoration(
                      label: Text("email"),
                      border: OutlineInputBorder(),
                    ),
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16,),

                  TextFormField(
                    textInputAction: TextInputAction.next,
                    obscuringCharacter: '*',
                    obscureText: true,
                    validator: (value)=>value.isValidValue() ? null : "invalid_value",
                    decoration: const InputDecoration(
                      label: Text("password"),
                      border: OutlineInputBorder(),
                    ),
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16,),

                  TextFormField(
                    textInputAction: TextInputAction.next,
                    obscuringCharacter: '*',
                    obscureText: true,
                    validator: (value)=>value.isValidValue() ? null : "invalid_value",
                    decoration: const InputDecoration(
                      label: Text("confirm_password"),
                      border: OutlineInputBorder(),
                    ),
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16,),

                  TextFormField(
                    textInputAction: TextInputAction.next,
                    validator: (value)=>value.isValidValue() ? null : "invalid_value",
                    decoration: const InputDecoration(
                      label: Text("first_name"),
                      border: OutlineInputBorder(),
                    ),
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8,),

                  TextFormField(
                    textInputAction: TextInputAction.next,
                    validator: (value)=>value.isValidValue() ? null : "invalid_value",
                    decoration: const InputDecoration(
                      label: Text("last_name"),
                      border: OutlineInputBorder(),
                    ),
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16,),

                  TextFormField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.phone,
                    validator: (value)=>value.isValidMobile() ? null : "invalid_mobile",
                    decoration: const InputDecoration(
                      label: Text("phone"),
                      border: OutlineInputBorder(),
                    ),
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16,),

                  TextFormField(
                    validator: (value)=>value.isValidValue() ? null : "invalid_value",
                    decoration: const InputDecoration(
                      label: Text("address"),
                      border: OutlineInputBorder(),
                    ),
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16,),

                  BlocBuilder<GenericBloc, GenericState>(
                    builder: (context, state) {
                      return SizedBox(
                        child: MapPositionWidget(
                          position: position,

                        ),
                        height: 150,
                      );
                    },
                  ),
                  ElevatedButton( child: const Text("pick_location"), onPressed: () async {
                    LatLng result = await widget.gotoScreen(context: context, screen: const PickLocationScreen());
                    genericBloc.add(GenericEvent.single((){
                      position = result;
                    }));

                  }),
                  const SizedBox(height: 24,),

                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {

                        widget.toast(context, "nice work");

                      }
                    },
                    child: Text(
                      'Submit',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  const SizedBox(height: 24,),

                ],
              ),
            )
        ),
      ),
    );
  }
}

