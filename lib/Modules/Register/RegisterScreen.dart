
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Layout/Home_Layout.dart';
import '../../Shared/Components/Component.dart';
import '../login/LoginScreen.dart';
import 'cubit/RegisterCubit.dart';
import 'cubit/RegisterStates.dart';




class RegisterScreen extends StatelessWidget {




  @override
  Widget build(BuildContext context) {
    var emailController=TextEditingController();
    var passwordController=TextEditingController();
    var phoneController=TextEditingController();
    var nameController=TextEditingController();
    bool Loading=false;


    return BlocConsumer<RegisterCubit,RegisterStates>(
      listener: (context, state) {

       if(state is RegisterLoadingState) {
         Loading=true;
       }
       else {
         Loading=false;
       }
       if(state is CreateUserSuccessState) {
         navigatorAndFinish(context,  HomeLayout());
       }
      },
      builder: (context, state) {

        var cubit=RegisterCubit.get(context);
        var formKey =GlobalKey<FormState>();

        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Register',
                        style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.black,),),
                      const SizedBox(height: 40.0,),
                      DefaultTFF(

                        Controller: nameController,
                        Keyboard: TextInputType.name,
                        Validate: (value) {
                          bool at=false;
                          if(value!.isEmpty){
                            return 'Name Address must not be empty';
                          }
                          return null;
                        },
                        PrefixIcon: Icons.email_outlined,
                        Label: 'Name ',
                      ),
                      const SizedBox(height: 30.0,),
                      DefaultTFF(
                        Controller: emailController,
                        Keyboard: TextInputType.emailAddress,
                        Validate: (value) {
                          bool at=false;
                          if(value!.isEmpty){
                            return 'Email Address must not be empty';
                          }
                          return null;
                        },
                        PrefixIcon: Icons.email_outlined,
                        Label: 'Email Address',
                      ),
                      const SizedBox(height: 30.0,),
                      DefaultTFF(
                        Controller: phoneController,
                        Keyboard: TextInputType.phone,
                        Validate: (value) {
                          bool at=false;
                          if(value!.isEmpty){
                            return 'phone Address must not be empty';
                          }
                          return null;
                        },
                        PrefixIcon: Icons.phone,
                        Label: 'phone',
                      ),
                      const SizedBox(height: 30.0,),

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
                      const SizedBox(height: 30.0,),

                      Loading? const Center(child: CircularProgressIndicator()):DefaultButton(
                        text: "REGISTER",
                        function: ()
                        {
                          if(formKey.currentState!.validate())
                          {
                            cubit.userRegister(
                                email: emailController.text,
                                password: passwordController.text,
                                name: nameController.text,
                                phone: phoneController.text
                            );
                          }
                        },
                      ),

                      const SizedBox(height: 15.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          const Text('Already have an account' ),
                          TextButton(
                            child: const Text('Login',style: TextStyle(fontSize: 18.0),),
                            onPressed: () {
                              navigatorAndFinish(context, LoginScreen());
                            },)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
