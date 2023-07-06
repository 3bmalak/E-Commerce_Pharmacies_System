
import 'package:flutter/material.dart';
import '../../Shared/Components/Component.dart';
import '../Register/RegisterScreen.dart';
import 'cubit/LoginCubit.dart';
import 'cubit/LoginStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




class LoginScreen extends StatelessWidget {

  bool user=true;


  @override
  Widget build(BuildContext context) {
    var emailController=TextEditingController();
    var passwordController=TextEditingController();
    bool Loading=false;


    return BlocProvider(
      create: (context) => LoginCubit(),


      child: BlocConsumer<LoginCubit,LoginStates>(
        listener: (context, state) {

          if(state is LoginLoadingState) {
          Loading=true;
          }
          else {
            Loading=false;
          }


        },
        builder: (context, state) {

          var cubit=LoginCubit.get(context);
          var formKey =GlobalKey<FormState>();

          return
            Scaffold(
              appBar: AppBar(

              ),
              body: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('LOGIN',style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.black,),),
                          const SizedBox(height: 30.0,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Container(

                                width : 90.0,
                                decoration:  BoxDecoration(
                                    borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20),
                                    topLeft:  Radius.circular(20),),
                                    color: user? Colors.indigo:Colors.grey[300]
                                ),
                                child:
                                MaterialButton(
                                  onPressed: () {
                                    user=true;
                                    cubit.Changestate();
                                  },
                                  child:  Text(
                                    'User',
                                    style: TextStyle(
                                      color: user ? Colors.white:Colors.black54,
                                      fontSize: 12.0,
                                      fontWeight:FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),

                              Container(

                                width : 90.0,
                                decoration:  BoxDecoration(
                                    borderRadius: const BorderRadius.only(bottomRight: Radius.circular(20),
                                    topRight:  Radius.circular(20),),
                                    color: user? Colors.grey[300]:Colors.indigo
                                ),
                                child:
                                MaterialButton(
                                  onPressed: () {
                                    user=false;
                                    cubit.Changestate();
                                  },
                                  child:  Text(
                                    'Pharmacy',
                                    style: TextStyle(
                                      color: user?Colors.black54:Colors.white,
                                      fontSize: 12.5,
                                      fontWeight:FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
                            IsPassword: cubit.isPasswordIconChecked,
                            Controller: passwordController,
                            Keyboard: TextInputType.visiblePassword,
                            OnSubmit: (value) {
                              if(formKey.currentState!.validate())
                              {


                              }
                            },
                            Validate: (value) {
                              if(value!.isEmpty){
                                return 'Password must not be empty';
                              }
                              return null;
                            },
                            OnChange: (value) {
                              cubit.isCreated;
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
                            text: "LOGIN",
                            function: ()
                            {
                              if(formKey.currentState!.validate())
                              {
                                if(user) {
                                  cubit.userLogin(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  context: context
                                );
                                }
                                else{
                                  cubit.pharmacyLogin(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    context: context
                                  );
                                }

                              }
                            },
                          ),
                          const SizedBox(height: 15.0,),

                          user? Row(
                            mainAxisAlignment: MainAxisAlignment.center,

                            children: [
                              const Text('Don\'t have account?' ),
                              TextButton(
                                child: const Text('REGISTER',style: TextStyle(fontSize: 18.0),),
                                onPressed: () {
                                  navigatorAndFinish(context,  RegisterScreen());
                                },)
                            ],
                          ):Container()
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
        },
      ),
    );
  }
}
