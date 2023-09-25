import 'dart:io';
import 'dart:math';


// Calculate compound interest
var calculateCompoundInterest = (double principleAmount, int tenure, double interestRate) {
  return (principleAmount * pow(1 + interestRate / 100, tenure) - principleAmount) + principleAmount;
};

// Calculate simple interest
var calculateSimpleInterest = (double principleAmount, int tenure, double interestRate) {
  return ((principleAmount * interestRate * tenure) / 100 + principleAmount);
};

// // Calculate yearly interest
// var yearlyInterest = (double principleAmount, int tenure, double interestRate) {
//   return ((principleAmount  (tenure / 12)  interestRate) / 100) +
//       principleAmount;
// };


// two parameter list from data list, and function which one is oparetion simple, compunded etc.
var calculateInterest = (List data, Function interestCalculator) {
  for (var item in data) {
    var principleAmount = item['principleAmount'];
    var tenure = item['tenure'];
    var interestRate = item['interestRate'];

    var totalInterest = interestCalculator(principleAmount, tenure, interestRate);


    print(" $principleAmount        $tenure            $interestRate         $totalInterest");
  }
};


// Generate random data for scenarios
List<Map<String, dynamic>> generateRandomData(int numOfcountloop) {
  var random = Random();
  List<Map<String, dynamic>> data = [];

  for (int i = 0; i < numOfcountloop; i++) {
    var principleAmount = 100000 + random.nextDouble() * 900000;
    var tenure = random.nextInt(10) + 5;
    var interestRate = 5 + random.nextDouble() * 15;

    data.add({
      'principleAmount': principleAmount,
      'tenure': tenure,
      'interestRate': interestRate,
    });
  }

  return data;
}

void main() {


  var data = generateRandomData(5);

  // Call calculateInterest with your random data and the appropriate interest calculation function
  print("Compound Interest:");
  print("  principle Amount       Tenure           Interest Rate           Total Amount");
  calculateInterest(data, calculateCompoundInterest);
  print('=======================================================================================');
  print("\nSimple Interest:");
  print("  principle Amount       Tenure           Interest Rate           Total Amount");
  calculateInterest(data, calculateSimpleInterest);


}
