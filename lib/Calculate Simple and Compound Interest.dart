import 'dart:math';

//calculate compound interest
var calculateCompoundInterest = (double principleAmount, int tenure, double interestRate) {
  return (principleAmount * pow(1 + interestRate / 100, tenure) - principleAmount) + principleAmount;
};

//calculate simple interest
var calculateSimpleInterest = (double principleAmount, int tenure, double interestRate) {
  return ((principleAmount * interestRate * tenure) / 100 + principleAmount);
};

// calculate yearly interest
var yearlyInterest = (double principleAmount, int tenure, double interestRate) {
  return ((principleAmount * (tenure / 12) * interestRate) / 100) +
      principleAmount;
};

// two parameter list from data list, and function which one is oparetion simple, compunded etc.
var calculateInterest = (List data, Function interestCalculator) {
  for (var item in data) {
    var principleAmount = item['principleAmount'];
    var tenure = item['tenure'];
    var interestRate = item['interestRate'];

    var totalInterest = interestCalculator(principleAmount, tenure, interestRate);

    print("principle Amount: $principleAmount   Tenure: $tenure  Interest Rate: $interestRate  Total Amount: $totalInterest");
  }
};

void main() {
  List datas = [
    {'principleAmount': 100000.0, 'tenure': 10, 'interestRate': 7.0},
    {'principleAmount': 200000.0, 'tenure': 11, 'interestRate': 8.0},
    {'principleAmount': 400000.0, 'tenure': 12, 'interestRate': 6.0},
    {'principleAmount': 600000.0, 'tenure': 10, 'interestRate': 7.0},
    {'principleAmount': 900000.0, 'tenure': 12, 'interestRate': 8.0},
  ];

  print('this is for compouded interest calculation');
  calculateInterest(datas, calculateCompoundInterest);
  print('============================================================================================');


  print('This is for simple interest calculation');
  calculateInterest(datas, calculateSimpleInterest);
  print('============================================================================================');


  print('this is monthly interest + principle Amount');
  calculateInterest(datas, yearlyInterest);
}