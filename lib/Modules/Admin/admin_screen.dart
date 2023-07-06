import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduatio_project/Modules/Register/cubit/RegisterCubit.dart';
import 'package:graduatio_project/Modules/Register/cubit/RegisterStates.dart';

import '../../Shared/Components/Component.dart';

class AddPharmacyScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController pharmacyNameController = TextEditingController();
  final TextEditingController locationLinkController = TextEditingController();
  final TextEditingController locationTextController = TextEditingController();
  final TextEditingController telephoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit,RegisterStates>(
      listener: (context, state) {


      },
      builder: (context, state) {
        RegisterCubit cubit =RegisterCubit.get(context);
        var formKey =GlobalKey<FormState>();
        bool Loading=false;
        if(state is RegisterLoadingState) {
          Loading=true;
        }
        else {
          Loading=false;
        }

        return  Scaffold(
          appBar: AppBar(
            title: const Text('Add New Pharmacy'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 16),
                    DefaultEmptyTFF(
                      Controller: emailController,
                      Keyboard: TextInputType.emailAddress,
                      Validate: (value) {
                        if (value!.isEmpty) {
                          return 'Email is required';
                        } else if (!value.contains('@')) {
                          return 'Invalid email';
                        }
                        return null;
                      },
                      Label: 'Email',
                    ),
                    const SizedBox(height: 16),
                    DefaultTFF(
                      IsPassword: cubit.isPasswordIconChecked,
                      Controller: passwordController,
                      Keyboard: TextInputType.visiblePassword,
                      Validate: (value) {
                        if(value!.isEmpty){
                          return 'Password must not be empty';
                        }
                        return null;
                      },
                      PrefixIcon: Icons.lock,
                      Label: 'Password',
                      SufffixIcon: cubit.isPasswordIconChecked ? Icons.remove_red_eye:Icons.visibility_off_sharp,
                      SuffixFunction: ()
                      {
                        print(cubit.isPasswordIconChecked);
                        cubit.ChangePasswordVisability();
                      },
                    ),
                    const SizedBox(height: 16),
                    DefaultEmptyTFF(
                      Controller: districtController,
                      Keyboard: TextInputType.text,
                      Validate: (value) {
                        if (value!.isEmpty) {
                          return 'District is required';
                        }
                        return null;
                      },
                      Label: 'District',
                    ),
                    const SizedBox(height: 16),
                    DefaultEmptyTFF(
                      Controller: pharmacyNameController,
                      Keyboard: TextInputType.text,
                      Validate: (value) {
                        if (value!.isEmpty) {
                          return 'Pharmacy Name is required';
                        }
                        return null;
                      },
                      Label: 'Pharmacy Name',
                    ),
                    const SizedBox(height: 16),
                    DefaultEmptyTFF(
                      Controller: locationLinkController,
                      Keyboard: TextInputType.text,
                      Validate: (value) {
                        if (value!.isEmpty) {
                          return 'Location Link is required';
                        }
                        return null;
                      },
                      Label: 'Location Link',
                    ),
                    const SizedBox(height: 16),
                    DefaultEmptyTFF(
                      Controller: locationTextController,
                      Keyboard: TextInputType.text,
                      Validate: (value) {
                        if (value!.isEmpty) {
                          return 'Location Text is required';
                        }
                        return null;
                      },
                      Label: 'Location Text',
                    ),
                    const SizedBox(height: 16),
                    DefaultEmptyTFF(
                      Controller: telephoneNumberController,
                      Keyboard: TextInputType.phone,
                      Validate: (value) {
                        if (value!.isEmpty) {
                          return 'Telephone Number is required';
                        }
                        return null;
                      },
                      Label: 'Telephone Number',
                    ),
                    const SizedBox(height: 16),
                    Loading? const Center(child: CircularProgressIndicator()):DefaultButton(
                      text: "Add Pharmacy",
                      function: ()
                      {
                        if(formKey.currentState!.validate())
                        {
                          cubit.pharmacyRegister(
                              email: emailController.text,
                              password: passwordController.text,
                              district: districtController.text,
                              pharmacyname: pharmacyNameController.text,
                              locationlink: locationLinkController.text,
                              locationtext: locationTextController.text,
                              telephonenumber: telephoneNumberController.text,
                              rate: 0.0);
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          ),);
      },
    );
  }
}