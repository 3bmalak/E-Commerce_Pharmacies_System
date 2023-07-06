

abstract class LoginStates{}
 class ShopLoginInitState extends LoginStates{}
 class LoginLoadingState extends LoginStates{}
 class LoginSuccessState extends LoginStates{}
 class LoginErrortState extends LoginStates
 {
 final String error;

  LoginErrortState(this.error);
 }

class isPasswordIconCheckedLoginState extends LoginStates{}
class isPasswordIconCreatedLoginState extends LoginStates{}
class UserGetDataLoadingState extends LoginStates{}

