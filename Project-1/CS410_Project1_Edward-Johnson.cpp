// Created by Edward Johnson 06/05/24
// SNHU - CS410 - Project 1

#include <iostream>
#include <string>

// function declarations
int CheckUserPermissionAccess();
void DisplayInfo();
void ChangeCustomerChoice();

int64_t answer = 0; // authentication status
int64_t choice = 0; // user menu choice / selection

// client service choices
int64_t num1 = 1;
int64_t num2 = 2;
int64_t num3 = 1;
int64_t num4 = 1;
int64_t num5 = 2;

// client names
std::string name1 = "Bob Jones";
std::string name2 = "Sarah Davis";
std::string name3 = "Amy Friendly";
std::string name4 = "Johnny Smith";
std::string name5 = "Carol Spears";

/**
 * The main method
 *
 */
int main() {
  std::cout << "Edward Johnson - SNHU - CS410\n";

  std::cout << "Hello! Welcome to our Investment Company\n";

  do { // authentication loop

    // assign answer the return value from CheckUserPermissionAccess()
    answer = CheckUserPermissionAccess();

    // if the return value from CheckUserPermissionAccess does not equal 1 
    if (answer != 1) {
      std::cout << "Invalid Password. Please try again\n";
    }

  } while (answer != 1); // continue looping while authentication not valid

  do { // menu options loop

    std::cout << "What would you like to do?\n";
    std::cout << "DISPLAY the client list (enter 1)\n";
    std::cout << "CHANGE a client's choice (enter 2)\n";
    std::cout << "Exit the program.. (enter 3)\n";

    // get user menu selection / choice.
    std::cin >> choice;
    std::cout << "You chose " << choice << std::endl;

    // if choice is option 1
    if (choice == 1) {
      DisplayInfo();
    } else if (choice == 2) { // else if choice is option 2
      ChangeCustomerChoice();
    }
  } while (choice != 3); // when choice 3, program ends

  return 0;
}

/**
 * authenticates user login session; 1 = valid password, 2 = invalid password
 * @return int answer (auth status)
 */
int CheckUserPermissionAccess() {

  int localAnswer = 2;

  // memory is freed before function return
  std::string username;
  // memory freed before function return
  std::string password;

  std::cout << "Enter your username: \n";
  std::cin >> username;

  std::cout << "Enter your password: \n";
  std::cin >> password;

  if (password == "123") {
    localAnswer = 1;
  } else {
    localAnswer = 2;
  }
  return localAnswer;
}

/**
 * Prints the client list to console
 */
void DisplayInfo() {

  std::cout
      << "  Client's Name    Service Selected (1 = Brokerage, 2 = Retirement)"
      << std::endl;
  std::cout << "1. " << name1 << " selected option " << num1 << std::endl;
  std::cout << "2. " << name2 << " selected option " << num2 << std::endl;
  std::cout << "3. " << name3 << " selected option " << num3 << std::endl;
  std::cout << "4. " << name4 << " selected option " << num4 << std::endl;
  std::cout << "5. " << name5 << " selected option " << num5 << std::endl;
}

/**
 * Allows modification of the service assigned to a client
 */
void ChangeCustomerChoice() {

  int64_t changechoice; // the client selected to change
  int64_t newservice;   // the service to change to

  std::cout << "Enter the number of the client that you wish to change"
            << std::endl;
  std::cin >> changechoice;

  std::cout << "Please enter the client's new service choice (1 = Brokerage, 2 "
               "= Retirement)"
            << std::endl;
  std::cin >> newservice;

  // uses client number as control var
  switch (changechoice) {
  case 1:
    // set client 1's service to equal newservice
    num1 = newservice;
    break;
  case 2:
    // set client 2's service to equal newservice
    num2 = newservice;
    break;
  case 3:
    // set client 3's service to equal newservice
    num3 = newservice;
    break;
  case 4:
    // set client 4's service to equal newservice
    num4 = newservice;
    break;
  case 5:
    // set client 5's service to equal newservice
    num5 = newservice;
    break;
  default:
    break;
  }
}
