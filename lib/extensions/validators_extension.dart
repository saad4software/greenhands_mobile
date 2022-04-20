
extension ValidatorsExtension on String? {

  bool isValidEmail() {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this ?? '');
  }

  bool isValidValue() {
    return (this ?? "").length > 3;
  }

  bool isNotEmpty() {
    return (this ?? "").isNotEmpty;
  }

  bool isValidMobile() {
    return ((this ?? "").length == 10) && RegExp(
        r'(^(?:[+0]9)?[0-9]{10,12}$)')
        .hasMatch(this ?? "");
  }

  String? validateEmail(){
    return isValidEmail() ? null : "invalid_email";
  }

  String? validateName(){
    return isValidValue() ? null : "invalid_value";
  }

  String? validateMobile(){
    return isValidMobile() ? null : "invalid_mobile";
  }

  String? validateRequired(){
    return isNotEmpty() ? null : "required";
  }


}