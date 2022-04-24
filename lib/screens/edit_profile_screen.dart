import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:greenhands_mobile/blocs/api/api_bloc.dart';
import 'package:greenhands_mobile/blocs/generic/generic_bloc.dart';
import 'package:greenhands_mobile/extensions/widget_extension.dart';
import 'package:greenhands_mobile/models/entities/profile_model.dart';
import 'package:greenhands_mobile/screens/pick_location_screen.dart';
import 'package:greenhands_mobile/screens/unconfirmed_account_screen.dart';
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
  final txtEmail = TextEditingController();
  final txtPassword = TextEditingController();
  final txtConfirm = TextEditingController();
  final txtFirstName = TextEditingController();
  final txtLastName = TextEditingController();
  final txtMobile = TextEditingController();
  final txtAddress = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const appTitle = 'register_organizer';

    var apiBloc = BlocProvider.of<ApiBloc>(context);
    final genericBloc = GenericBloc();


    return BlocListener<ApiBloc, ApiState>(
    listener: (context, state) {
      if(state is ApiDataReady && state.getValue<ProfileModel>() != null){
        widget.gotoScreen(context: context, screen:const UnconfirmedAccountScreen());
      }
    },
    child: Scaffold(
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
                    controller: txtEmail,
                    label: "email",
                    validator: (val)=>val.validateEmail(),
                    keyboard: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 16,),

                  FormFieldWidget(
                    controller: txtPassword,
                    label: "password",
                    validator: (val)=>val.validateRequired(),
                    isPassword: true,
                  ),
                  const SizedBox(height: 16,),

                  FormFieldWidget(
                    label: "confirm_password",
                    validator: (val)=>val.isNotEmpty() && val == txtPassword.text ? null : "no_match",
                    isPassword: true,
                  ),
                  const SizedBox(height: 16,),

                  FormFieldWidget(
                    controller: txtFirstName,
                    label: "first_name",
                    validator: (val)=>val.validateName(),
                  ),
                  const SizedBox(height: 8,),

                  FormFieldWidget(
                    controller: txtLastName,
                    label: "last_name",
                    validator: (val)=>val.validateName(),
                  ),
                  const SizedBox(height: 16,),

                  FormFieldWidget(
                    controller: txtMobile,
                    label: "mobile",
                    validator: (val)=>val.validateMobile(),
                  ),
                  const SizedBox(height: 16,),

                  FormFieldWidget(
                    controller: txtAddress,
                    label: "address",
                    validator: (val)=>val.validateName(),
                  ),
                  const SizedBox(height: 16,),

                  BlocBuilder<GenericBloc, GenericState>(
                    builder: (context, state) {
                      return SizedBox(
                        child: FormField<LatLng>(
                          validator: (val)=>position!=null ? null : "invalid_position",
                          builder: (state) {
                            return Column(
                              children: [
                                Expanded(
                                  child: MapPositionWidget(
                                    position: position,
                                  ),
                                ),
                                if (state.hasError)
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8, top: 10),
                                    child: Text(
                                      state.errorText!,
                                      style: TextStyle(
                                          fontStyle: FontStyle.normal,
                                          fontSize: 13,
                                          color: Colors.red[700],
                                          height: 0.5),
                                    ),
                                  )
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
                        apiBloc.add(ApiRequest.single((p0) => p0.register(
                            email: txtEmail.text,
                          password: txtPassword.text,
                          firstName: txtFirstName.text,
                          lastName: txtLastName.text,
                          phone: txtMobile.text,
                          address: txtAddress.text,
                          lat: position?.latitude,
                          lng: position?.longitude

                        )));

                      }
                      else{
                        widget.toast(context, "check_fields");
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
    ),
);
  }
}

