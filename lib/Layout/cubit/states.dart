

abstract class HomeStates{}

class HomeInitState extends HomeStates{}
class HomeBottomNavState extends HomeStates{}

class HomeLoadingHomeState extends HomeStates{}
class HomeSuccessHomeState extends HomeStates{}
class UserGetDataSuccessState extends HomeStates{}
class UserGetDataLoadingState extends HomeStates{}

class HomeErrorHomeState extends HomeStates{
  final String Error;
  HomeErrorHomeState(this.Error);
}
class UserGetDataErrorState extends HomeStates{
  final String Error;
  UserGetDataErrorState(this.Error);
}

class DeleteFavoriteDataErrorState extends HomeStates{
  final String Error;
  DeleteFavoriteDataErrorState(this.Error);
}
class feedbackAddedErrorState extends HomeStates{
  final String Error;
  feedbackAddedErrorState(this.Error);
}


class CategoriesInitState extends HomeStates{}
class CategoriesLoadingState extends HomeStates{}
class CategoriesSuccessfulState extends HomeStates{}
class PharmaciesSuccessfulState extends HomeStates{}
class PharmaciesChangeDropListItemSuccessfulState extends HomeStates{}
class SearchSuccessfulState extends HomeStates{}
class CreateHistorySuccessState extends HomeStates{}
class ALlCategoriesSuccessfulState extends HomeStates{}
class GetHistoryElementSuccessfulState extends HomeStates{}
class GetHistoryDataSuccessfulState extends HomeStates{}
class GetPrescriptionElementSuccessfulState extends HomeStates{}
class GetPrescriptionDataSuccessfulState extends HomeStates{}
class ChangeFavoriteSuccessfulState extends HomeStates{}
class FavoriteSuccessfulDeletedFromFirebaseState extends HomeStates{}
class FavoriteSuccessfulInsertInFirebaseState extends HomeStates{}
class getFavoritesDataSuccessfulState extends HomeStates{}
class feedbackAddedSuccessfulState extends HomeStates{}
class getFeedbackSuccesfully extends HomeStates{}


