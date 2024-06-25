/* Created by Edward Johnson
 * SNHU - CS410
 * Module 6 Binary to C++ : with Security Vulnerabilities
 * 06/13/24
 */

#include <cstdint>
#include <exception>
#include <iostream>
#include <limits>
#include <ostream>
#include <stdexcept>
#include <cassert>
//---------------------------------------------------
//          Program setup:
//---------------------------------------------------

// constant, min value allowed as 32bit input integer, -2147483648
const int32_t MIN_VALID_INT = std::numeric_limits<std::int32_t>::min();
// constant, max value allowed as 32bit input integer, 2147483648
const int32_t MAX_VALID_INT = std::numeric_limits<std::int32_t>::max();
// Declare internal menu operation constants
const int SUBTRACTION = 1;
const int ADDITION = 2;
const int DIVISION = 3;
const int MULTIPLICATION = 4;
const int EXIT = 5;

void DisplayMenu();      // declaration of menu output function
int32_t getValidInput(); // declaration of input integer validation function
// declaration of fn preventing unsafe calculations
void isCalculationValid(int32_t inputChoice);

// declaration of arithmetic functions
bool SubtractValues(int32_t inputOne, int32_t inputTwo);
bool DivideValues(int32_t inputOne, int32_t inputTwo);
bool MultiplyValues(int32_t inputOne, int32_t inputTwo);
bool AddValues(int32_t inputOne, int32_t inputTwo);
//---------------------------------------------------
//          End setup:
//---------------------------------------------------


/**
 * @main method for program
 */
int32_t main() {

  int32_t inputChoice = 0; // initialized with value 0

  do { // to ensure our first loop attempt is executed

    // Using wrong operators & output not best practices
    // minus was initially the only math operator used in output statements
    // std::string minus = " - ";

    // Removed: duplicated code, DisplayMenu() was never called

    // Fixed: Add single fn call to output menu
    DisplayMenu();

    std::cout << "Select a menu option:" << std::endl;
    // Fixed: condensed int inputs into fn call, returns sanitized / validated
    inputChoice = getValidInput();

    // Exit Program selected
    if (inputChoice == EXIT) {
      std::cout << "Goodbye." << std::endl;
    }
    // When valid arithmetic operation is selected (integer input between 1 and 4)
    else if (inputChoice >= SUBTRACTION && inputChoice <= MULTIPLICATION) {

      // moved program branching to control function, arithmetic ops to individual functions
      // done to improve maintainability, readability, and security (validation added)
      isCalculationValid(inputChoice); // passes menu selection to calculation fn call
    }

    // Handles when matching menu option not selected
    else { // when matching menu operation not selected  (not 1-4, or 5)
      std::cout << "Please select a listed menu option." << std::endl;
    }
  } while (inputChoice != 5); // while input choice != 5 looping will continue
  return 0;
}

/**
 * Function to print menu option
 * Added the missing / incorrectly printing options
 * Corrected menu to match program output calculations
 */
void DisplayMenu() {
  std::cout << "----------------" << std::endl;
  std::cout << "- 1)Subtract -" << std::endl;
  std::cout << "- 2)Add -" << std::endl;
  std::cout << "- 3)Divide -" << std::endl;
  std::cout << "- 4)Multiply -" << std::endl;
  std::cout << "- 5)Exit -" << std::endl;
  std::cout << "----------------" << std::endl;
}

/**
 * @getValidInput
 * Provides general integer input validation
 * This is our primary way to provide enhanced input security.
 * Prevent xss by only allowing valid inputs.
 * @return int32_t userInput
 */
int32_t getValidInput() {

  int32_t userInput = 0;
  bool doneLooping = false;

  while (!doneLooping) {

    // exception block added for potential runtime edgecases
    try {  // for edge cases (shouldn't be any)

      // FIX: limit input to fall into 32bit range
      if (std::cin >> userInput && userInput >= MIN_VALID_INT && userInput <= MAX_VALID_INT) {

        doneLooping = true; // when valid input, done with function

      } else {  // if cin fails / is not a valid int

        std::cin.clear(); // clear any cin errors
        std::cin.ignore(std::numeric_limits<std::streamsize>::max(),'\n'); // clear out input buffer
        std::cout << "\nYou must enter a valid integer." << std::endl;
      }
    } catch (const std::runtime_error &except) { // for edge cases (shouldn't be any)
      std::cin.clear(); // clear any cin errors
      std::cin.ignore(std::numeric_limits<std::streamsize>::max(),'\n'); // clear out input buffer
      std::cout << "An exception occurred during input operations." << std::endl;
      //std::cout << except.what() << std::endl; // not generally needed
    }
  }
    // assert(userInput >= MIN_VALID_INT && userInput <= MAX_VALID_INT);

    return userInput;
}

/**
 * @isCalculationValid
 * Manages calculations safely + exception handling
 * Added checks to insure integer overflow / underflow is prevented.
 * Added due to integer over/underflows occurring
 * @param - 32b int selected menu option
 */
void isCalculationValid(int32_t menuChoice) {
  //initializing all vars
  int32_t inputOne = 0;
  int32_t inputTwo = 0;

  // Fixed: simplified / removed additional input calls in each branch
  // Fixed: gets two validated, sanitized inputs
  std::cout << "Enter first integer:" << std::endl;
  inputOne = getValidInput();

  std::cout << "Enter second integer:" << std::endl;
  inputTwo = getValidInput();

  bool validCalculation = false; // using pessimistic logic

  // FIXED: added block to catch thrown overflow excepts before they happen
  try {
    switch (menuChoice) {  // initial input decides calculation

    // SUBTRACTION selected
    case SUBTRACTION: // Fixed menu to reflect program operations
      validCalculation = SubtractValues(inputOne, inputTwo);
      break;

    // ADDITION selected
    case ADDITION: // Fixed menu to reflect program operations
      validCalculation = AddValues(inputOne, inputTwo);
      break;

    // DIVISION selected
    case DIVISION:
      validCalculation = DivideValues(inputOne, inputTwo);
      break;

    // MULTIPLICATION selected
    case MULTIPLICATION:
      validCalculation = MultiplyValues(inputOne, inputTwo);
      break;

    default:
      break;
    }
  } catch (const std::exception &except) { // ADDED catch excepts thrown during calcs (for testing overflows)
    std::cout << "An exception occurred during arithmetic operations." << std::endl;
    std::cout << except.what() << std::endl;
  }
  // added confirmation when an invalid calculation is attempted
  if (!validCalculation) {
    std::cout << "Could not compute. Try your inputs again." << std::endl;
  }
}

/**
 * @SubtractValues
 * Added to consolidate subtraction arithmetic operations
 * Ensures integer over/underflow cant occur
 * Outputs calculated values if valid
 * returns confirmation of operations
 * @param - 32b int first input
 * @param - 32b int second input
 * @return - bool isOperationValid
 */
bool SubtractValues(int32_t inputOne, int32_t inputTwo) {
  int32_t inOneDiff = 0;
  int32_t inTwoDiff = 0;

  // FIX: Ensures input2 not greater than MAX - input1
  // and that input1 not less than sum of input2 + MIN
  // Prevents integer over/underflow from occurring
  inOneDiff = MAX_VALID_INT - inputOne;
  inTwoDiff = MIN_VALID_INT + inputTwo;
  bool validOperation = false;

  // FIXED: if overflow would occur, throw overflow except instead and don't attempt
  if (inputTwo > inOneDiff || inputOne < inTwoDiff) {
    throw std::overflow_error("Value would exceed maximum allocated bits.");

  } else { // otherwise, calculate as normal.
    // corrected sign outputs to reflect corrected operations
    std::cout << inputOne << " - " << inputTwo << " = ";
    std::cout << inputOne - inputTwo << std::endl;
    validOperation = true;
  }
    // assert(validOperation==true);
    return validOperation;
}

/**
 * @AddValues
 * Added to consolidate addition arithmetic operations
 * Ensures integer over/underflow cant occur
 * Outputs calculated values if valid
 * returns confirmation of operations
 * @param - 32b int first input
 * @param - 32b int second input
 * @return - bool isOperationValid
 */
bool AddValues(int32_t inputOne, int32_t inputTwo) {
  int32_t inOneDiff = 0;
  int32_t inTwoDiff = 0;
  // FIX: uses difference to verify values cant exceed min/max for int buffer.
  //  input1 cant be less than MIN - input2;
  //  input2 cant be greater than MAX - input1;
  inOneDiff = MAX_VALID_INT - inputOne;
  inTwoDiff = MIN_VALID_INT - inputTwo;

  bool validOperation = false;  // using pessimistic logic

  // FIXED: if overflow would occur, throw overflow except instead and don't attempt
  if (inputTwo > inOneDiff || inputOne < inTwoDiff) {
    throw std::overflow_error("Value would exceed maximum allocated bits.");

  } else { // otherwise, calculate as normal.
    // corrected sign outputs to reflect corrected operations
    std::cout << inputOne << " + " << inputTwo << " = ";
    std::cout << inputOne + inputTwo << std::endl;
    validOperation = true;
  }
    // assert(validOperation==true);
    return validOperation;
}

/**
 * @DivideValues
 * Added to consolidate division arithmetic operations
 * Ensures integer over/underflow cant occur
 * Outputs calculated values if valid
 * returns confirmation of operations
 * @param - 32b int first input
 * @param - 32b int second input
 * @return - bool isOperationValid
 */
bool DivideValues(int32_t inputOne, int32_t inputTwo) {
    bool validOperation = false;  // using pessimistic logic

    // FIX: prevents division by 0
    if (inputTwo == 0) {
        throw std::invalid_argument("No dividing by 0!");

    // FIXED: if overflow would occur, throw overflow except instead and don't attempt
    } else if (inputOne == MIN_VALID_INT && inputTwo == -1) {
        throw std::overflow_error("Value would exceed maximum allocated bits.");

    } else { // otherwise, calculate as normal.
        // corrected sign outputs to reflect corrected operations
        std::cout << inputOne << " / " << inputTwo << " = ";
        std::cout << inputOne / inputTwo << std::endl;
        validOperation = true;
    }
    // assert(validOperation==true);
    return validOperation;
}


/**
 * @MultiplyValues
 * Added to consolidate multiplication arithmetic operations
 * checks to ensure that no integer over/underflow can occur.
 * Outputs calculated values if valid
 * returns confirmation of operations
 * @param - 32b int first input
 * @param - 32b int second input
 * @return - bool isOperationValid
 */
bool MultiplyValues(int32_t inputOne, int32_t inputTwo) {
  bool validOperation = false;  // using pessimistic logic

  int32_t product = 0;

  // added to handle multpying by 0
  if (inputOne == 0 || inputTwo == 0){
      validOperation = true;
  }
  // FIXED: if overflow would occur, throw overflow except instead and don't attempt
  /* Initial implementations were messy, reworked to use cast. Sources:
   * https://cplusplus.com/articles/DE18T05o/    &
   * https://stackoverflow.com/questions/5542037/avoiding-overflow-in-integer-multiplication-followed-by-division
   */
  else {
      /** cast input 1 & 2 to 64bit to test if they would cause integer over/underflow
       * max val either 32bit could be is +-2147483647
       * max val of a 64bit integer is 9223372036854775807
       * and 2147483647 * 2147483647 = 4611686014000000000
       * simplest way to prevent overflow
       */
      // cast both 32bit inputs to 64bit integers before multiplying them.
      int64_t chkProduct = int64_t(inputOne) * int64_t(inputTwo);

      // check if the calculated value of our two 32bit vars would cause an overflow
      // if the 64bit integer is greater than our max/min value, throw overflow except
      if (chkProduct > MAX_VALID_INT || chkProduct < MIN_VALID_INT) {
          throw std::overflow_error("Value would exceed maximum allocated bits.");
      } else { // no overflow
          // cast the value of calculated product back to 32bit integer if it would not overflow
          product = int32_t(chkProduct);
          validOperation = true;
      }
  }
  // corrected sign outputs to reflect corrected operations
  std::cout << inputOne << " * " << inputTwo << " = " << product << std::endl;

  // assert(validOperation==true);
  return validOperation;
}

