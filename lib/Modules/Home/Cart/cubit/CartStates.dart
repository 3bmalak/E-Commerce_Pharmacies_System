

abstract class CartStates{}
 class CartInitState extends CartStates{}
 class CartLoadingState extends CartStates{}
 class CartSuccessState extends CartStates{}
 class CartChangePaymentState extends CartStates{}
 class CartChangeCountState extends CartStates{}
 class CreateUserSuccessState extends CartStates{}
 class CreatePrescriptionSuccessState extends CartStates{}
 class CreateHistorySuccessState extends CartStates{}
 class Sofaaa extends CartStates{}
class CartErrortState extends CartStates
{
 final String error;

 CartErrortState(this.error);
}
class HistoryErrortState extends CartStates
{
 final String error;

 HistoryErrortState(this.error);
}
 class CreateUserErrortState extends CartStates
 {
  final String error;

  CreateUserErrortState(this.error);
 }

