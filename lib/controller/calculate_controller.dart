import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculateController extends GetxController{
  /*
  UserInput = What User entered with the keyboard .
  UserOutput = Calculate the numbers that the user entered and put into userOutPut variable.
  */
  var userInput = "";
  var userOutput = "";

  //equal button pressed function
 equalPressed(){
   String userInputFC = userInput;
   userInputFC = userInputFC.replaceAll("x","*" );
   Parser parser = Parser();
   Expression expression = parser.parse(userInputFC);
   ContextModel contextModel = ContextModel();
   double evaluate = expression.evaluate(EvaluationType.REAL, contextModel);

   userOutput = evaluate.toString();
   update();
 }

  /// Clear Button Pressed Func
  clearInputAndOutput() {
    userInput = "";
    userOutput = "";
    update();
  }

  /// Delete Button Pressed Function
  deleteBtnAction() {
    userInput = userInput.substring(0, userInput.length - 1);
    update();
  }

  /// on Number Button Tapped
  onBtnTapped(List<String> buttons, int index) {
    userInput += buttons[index];
    update();
  }


}