import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:registration_form_new/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormProvider extends ChangeNotifier{

  String userName="";
  String password="";
  String? email;
  bool isPasswordSame=false;
  bool matchedCredentials = false;
  bool isLoadingAnimation = true;

 var userDataModel = UserModel();

  void setUserName(String userNamefromTextField){
    userName = userNamefromTextField;
  }

  void setPassword(String passwordfromTextField){
    password = passwordfromTextField;
  }

  Future<bool> saveUserData(String userNameValue,String passwordValue) async {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setString("username", userNameValue);
      sharedPreferences.setString("password", passwordValue);
      return sharedPreferences.commit();
  }


  Future<UserModel> getUserData()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userDataModel.userName=sharedPreferences.getString("username");
    userDataModel.password=sharedPreferences.getString("password");
    return userDataModel;
  }

  void storeData()async{
   //print(await getUserData());
    await getUserData();
  }

  bool checkData(){
    storeData();
    if(userName==userDataModel.userName && userDataModel.password==password){
      return true;
    }
    return false;
  }

  void saveData(String registeredUserName,String registeredPassword){
    saveUserData(registeredUserName,registeredPassword);
  }

  void printData() async{
    await getUserData();
    print(userDataModel.userName);
    print(userName);
}

bool isLoading(){
  Future.delayed(const Duration(milliseconds: 2000),(){
    isLoadingAnimation = false;
    notifyListeners();
  });
  return isLoadingAnimation;
}

bool loadHomeScreen(){
    if(!isLoadingAnimation){
      return true;
    }
    return false;
}
}