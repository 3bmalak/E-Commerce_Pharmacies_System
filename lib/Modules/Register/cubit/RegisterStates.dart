
abstract class RegisterStates{}
class RegisterInitState extends RegisterStates{}
class RegisterLoadingState extends RegisterStates{}
class RegisterSuccessState extends RegisterStates{}
class CreateUserSuccessState extends RegisterStates{}
class CreatePharmacySuccessState extends RegisterStates{}
class CreateHistorySuccessState extends RegisterStates{}
class AddPharmacyToSheet2SuccessState extends RegisterStates{}

class RegisterErrortState extends RegisterStates
{
 final String error;

 RegisterErrortState(this.error);
}
class CreateUserErrortState extends RegisterStates
{
 final String error;

 CreateUserErrortState(this.error);
}
class CreatePharmacyErrorState extends RegisterStates
{
 final String error;

 CreatePharmacyErrorState(this.error);
}
class AddPharmacyToSheet2ErrorState extends RegisterStates
{
 final String error;

 AddPharmacyToSheet2ErrorState(this.error);
}

class HistoryErrortState extends RegisterStates
{
 final String error;

 HistoryErrortState(this.error);
}

class isPasswordIconCheckedRegisterState extends RegisterStates{}

