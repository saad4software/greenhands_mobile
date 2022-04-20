import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:greenhands_mobile/blocs/generic/generic_bloc.dart';
import 'package:greenhands_mobile/extensions/widget_extension.dart';
import 'package:greenhands_mobile/screens/pick_location_screen.dart';
import 'package:greenhands_mobile/widgets/form_field_widget.dart';
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

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final mobileController = TextEditingController();
  final addressController = TextEditingController();

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
                  FormFieldWidget(
                    controller: emailController,
                    label: "email",
                    validator: (val)=>val.validateEmail(),
                    keyboard: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 16,),

                  FormFieldWidget(
                    controller: passwordController,
                    label: "password",
                    validator: (val)=>val.validateRequired(),
                    isPassword: true,
                  ),
                  const SizedBox(height: 16,),

                  FormFieldWidget(
                    label: "confirm_password",
                    validator: (val)=>val == passwordController.text ? null : "no_match",
                    isPassword: true,
                  ),
                  const SizedBox(height: 16,),

                  FormFieldWidget(
                    controller: firstNameController,
                    label: "first_name",
                    validator: (val)=>val.validateName(),
                  ),
                  const SizedBox(height: 8,),

                  FormFieldWidget(
                    controller: lastNameController,
                    label: "last_name",
                    validator: (val)=>val.validateName(),
                  ),
                  const SizedBox(height: 16,),

                  FormFieldWidget(
                    controller: mobileController,
                    label: "mobile",
                    validator: (val)=>val.validateMobile(),
                  ),
                  const SizedBox(height: 16,),

                  FormFieldWidget(
                    controller: addressController,
                    label: "address",
                    validator: (val)=>val.validateName(),
                  ),
                  const SizedBox(height: 16,),

                  BlocBuilder<GenericBloc, GenericState>(
                    builder: (context, state) {
                      return SizedBox(
                        child: FormField<LatLng>(
                          builder: (state) {
                            return Column(
                              children: [
                                Expanded(
                                  child: MapPositionWidget(
                                    position: position,
                                  ),
                                ),
                              ],
                            );
                          }
                        ),
                        height: 150,
                      );
                    },
                  ),
                  ElevatedButton( child: const Text("pick_location"), onPressed: () async {
                    LatLng result = await widget.gotoScreen(context: context, screen: PickLocationScreen(position: position,));
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

