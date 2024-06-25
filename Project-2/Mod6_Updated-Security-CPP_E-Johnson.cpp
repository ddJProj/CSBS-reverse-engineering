// Created by Edward Johnson 06/16/24
// SNHU - CS410 - Project 2

#include <cstdint>
#include <iostream>
#include <limits>
#include <stdexcept>
#include <string>
#include <utility>
#include <vector>
#include <openssl/evp.h>
#include <sstream>
#include <iomanip>

// FIXME: Comment for professor:
// password is the same as it was in non-secure (hard-coded) version "123"
// hash of the password is = "a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3"
// see storedHash of authenticator class for more info. This is to be later replaced by salting + secure disk/DB storage of hashes.


/*
 **************************************************
 *     GENERAL FUNC. & CONSTANT DECLARATIONS
 **************************************************
 */

// Login / auth:
void Authentication();

// Setup / menu fns:
int32_t menuChoiceHandler();
void populateClientList();
void DisplayMenu();
void DisplayClients();

//Action fns:
void customerChoiceHandler();
int32_t selectValidClient();
int32_t selectValidService();

// Input fns:
int32_t getIntegerInput();
std::string getStringInput();
bool invalidInputChars(std::string& input);



// Control flow constants:
const int32_t DEFAULT_MENU_VALUE = -1;
const int32_t RETURN_PREV_MENU = 0;
const int32_t PRINT_CLIENT_LIST = 1;
const int32_t CHANGE_SERVICE_CHOICE = 2;
const int32_t EXIT_PROGRAM = 3;

const int32_t MENU_SERVICE_ONE = 1;
const int32_t MENU_SERVICE_TWO = 2;


// Authentication:
const int32_t VALID_AUTHENTICATION = 9269348;
const int32_t INVALID_AUTHENTICATION = 9237892;

const int32_t MAXIMUM_AUTH_ATTEMPTS = 5;
const int32_t NO_AUTH_ATTEMPTS = 0;



/*
 **************************************************
 *              CLIENT CLASS
 **************************************************
 * Classes created without cin/cout usage so they can be used with non-console interfaces
 * I would ideally separate classes into their own files/headers
 */

/**
 * Client class to protect/encapsulate client information
 */
class Client {
public:

    /**@constructor
     * automatically increments id # by +1 for new Clients, using nextValidId#.
     * move name str instead of copying from param (no need/more efficient when passing in a str)
     * @param - string - name of client
     * @param - int32_t - service client selected
     */
    Client(std::string clientName, int32_t clientService)
            : clientId(nextValidId++), clientName(std::move(clientName)),
              clientService(clientService) {}

    /**@setClientService
     * mutator / set method for clientService number selected
     * @param - int32_t - selected service for a client
     */
    void setClientService(int32_t serviceChoice) {
        this->clientService = serviceChoice;
    }

    /**
     * Getter method for clientName
     * @return: const int clientName
     */
    std::string getClientname() const { // use const as value will not change
        return this->clientName;
    }

    /**
     * Getter method for clientId number
     * @return: const int clientId
     */
    int32_t getClientId() const { // use const as value will not change
        return this->clientId;
    }

    /**
     * Getter method for clientService number selected
     * @return: const int clientService
     */
    int32_t getClientService() const { // use const as value will not change
        return this->clientService;
    }

private:
    int32_t clientId;
    std::string clientName;
    int32_t clientService;

    static int32_t
            nextValidId; // static value to track and assign an ID# to each client
};

// Starting value for id num's.
// creating a new Client object auto increments the value
int32_t Client::nextValidId = 1;



/*
 **************************************************
 *           CLIENTLIST CLASS
 **************************************************
 */

/**
 * Singleton ClientList class to encapsulate Client objects/data
 *
 */
class ClientList {
public:
    /**@getClientListInstance
     * Getter / retrieval method for our singleton ClientList object
     * @return: ClientList singleton containing added Clients
     */
    static ClientList &getClientListInstance() {
        static ClientList clientListInstance;    // static singleton clientList object
        return clientListInstance; // return our singleton list
    }

    /*
     * Reference used in this section:
     * https://stackoverflow.com/questions/1008019/how-do-you-implement-the-singleton-design-pattern
     * Deleting copy+copy assign, move+move assign constructors.
     */
    ClientList(const ClientList &) = delete;
    ClientList(ClientList &&) = delete;
    ClientList &operator=(const ClientList &) = delete;
    ClientList &operator=(ClientList &&) = delete;

    /**@getClientsList
     * Retrieval method for vector list of Client objects
     * @return: vector<Client> - clientList (vector of Client objects)
     */
    std::vector<Client> &getClientsList() {
        // return the vector containing Client Objects
        return clientsList;
    }

    /**@addToClientList
     * Inserts a Client object into the ClientList
     *  @param - const Client object - client object as a ref
     */
    void addToClientList(const Client &client) {
        // push Client object into the clientsList vector
        clientsList.push_back(client);
    }

    /**@newClient
     * Creates new client object, then adds to clientList
     *  @param - string - reference to name of client string
     *  @param - int32_t - selected service for the client instance
     */
    void newClient(const std::string &clientName, int clientService) {
        Client newClient = Client(clientName, clientService); // creates new Client object using args
        addToClientList(newClient); // call method to push new Client into existing list
    }

    /**@isClientIdValid
     * Method to check if user input for Client ID matches a Client object
     * @param - const int32_t - client id # input by user
     * @return: boolean isInputIDValid
     */
    bool isClientIdValid(const int32_t inputClientId) {
        bool isIdValid = false; // initialize bool to false
        // for each client object in the clientlist (use auto to determine class
        // object type)
        for (const auto &client : clientsList) {
            // if the current client object's id matches inputID
            if (client.getClientId() == inputClientId) {
                // the input ID is valid
                isIdValid = true;
            }
        }
        return isIdValid; // return the id number validity state
    }


private:
    ClientList() {}  // private constructor to limit # of lists to 1
    ~ClientList()= default; // prevent accidental deletion of singleton

    std::vector<Client> clientsList; // vector list to hold our Client objects
};


/*
 **************************************************
 *           AUTHENTICATOR CLASS
 **************************************************
 */
/**
 * Authenticator class to encapsulate and validate user login
 * Still needs salting + a longterm storage method for password hashes
 * to pair passw with usernames add map + add username to relevant fns
 * Would need account auth status + thread safety implemented also
 *
 * Started off using old openSSH implementation but wouldn't work / was depreciated:
 * https://stackoverflow.com/questions/13784434/how-to-use-openssls-sha256-functions
 *
 * Needed to use these sources to create working hash fn:
 * https://wiki.openssl.org/index.php/EVP_Symmetric_Encryption_and_Decryption
 * https://www.openssl.org/docs/man1.0.2/man3/EVP_sha256.html
 * https://linux.die.net/man/3/evp_sha256
 * https://cpp.hotexamples.com/examples/-/-/EVP_DigestInit/cpp-evp_digestinit-function-examples.html
 */
class Authenticator{
private:
    int32_t authStatus = INVALID_AUTHENTICATION; // set base auth state
    int32_t authAttempts = NO_AUTH_ATTEMPTS; // set base auth attempts

    // this would typically be in a sep. class that handles pulling data from db / storage
    // this is the same value as the initial program's password, but as a hash
    std::string storedHash = "a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3"; // the stored password hash

    /**@constructor - private
     *
     */
    Authenticator(){}

    ~Authenticator()= default; // private destructor

    /**@hashFunction
    * hash function to take input string / pass and hash it
    * @param - const string - reference to the password string
    * @return: string - hashed password after processing
    */
    std::string hashFunction(const std::string& pass) const {
        unsigned char hash[EVP_MAX_MD_SIZE];
        unsigned int lengthOfHash = 0;

        EVP_MD_CTX *context = EVP_MD_CTX_new();

        // EVP_MD_CTX_new operation failed, context = nullptr
        if (context == nullptr) {
            throw std::runtime_error("Failure calling EVP_MD_CTX_new. Returned null.");
        }

        const EVP_MD* md = EVP_get_digestbyname("sha256"); //setting hash method

        if (md == nullptr){
            EVP_MD_CTX_free(context);
            throw std::runtime_error("Failure calling EVP_get_digestbyname. Returned null.");
        }

        // Initialise encryption operation. Uses sha256.
        if (EVP_DigestInit_ex(context, md, nullptr) != 1){
            EVP_MD_CTX_free(context);
            throw std::runtime_error("Failure calling EVP_DigestInit_ex. Returned null.");
        }
        // Provide the message to be encrypted, obtain encrypted output.
        if (EVP_DigestUpdate(context, pass.c_str(), pass.size()) != 1){
            EVP_MD_CTX_free(context);
            throw std::runtime_error("Failure calling EVP_DigestUpdate.");
        }
        // Finalize encryption.
        if (EVP_DigestFinal_ex(context, hash, &lengthOfHash) != 1){
            EVP_MD_CTX_free(context);
            throw std::runtime_error("Failure calling EVP_DigestFinal_ex.");
        }

        EVP_MD_CTX_free(context); // clean up

        std::stringstream ss;
        for (unsigned int i = 0; i < lengthOfHash; i++){
            ss << std::hex << std::setw(2) << std::setfill('0') << static_cast<int>(hash[i]);
        }
        return ss.str();
    }


    /**@setAuthStatus
     * to update authStatus if user provides correct credentials
     * @param - const int32_t - status of authentication for program
     */
    void setAuthStatus(int32_t const status){
        authStatus = status;
    }

    /**@constantCompareTime
     * Compares hashed input pass against stored hash using constant time O(1)
     * To help avoid timing comparison attacks
     * @param - const string - first string to compare
     * @param - const string - second string to compare
     * @return - bool - false if strings not equal, true if equal
     */
    bool constantCompareTime(const std:: string& x, const std::string& y) const{
        if (x.length() != y.length()) {
            return false;
        }
        unsigned char answer = 0;
        for (size_t i = 0; i < x.length(); i++){
            // if char x[i] and y[i] same, XOR = 0, not equal returns a non-zero value
            // |= (OR) operator changes value of answer if any of the char comparisons are different
            answer |= (x[i] ^ y[i]);
        }
        // answer after looping will be non-zero if any chars were different
        // if answer is not 0, then we return false
        // if strings equal, answer is still 0 so we return true
        return answer == 0;

    }

    /**@setPasswordHash
     * Sets the storedHash value to be the hash of our password
     * Moved to private to prevent use after sys setup.
     * Can be integrated into instanced user account / password creation.
     * @param - const string - reference to the hashed password string
     */
    void setPasswordHash(const std::string& passHash){
        storedHash = passHash;
    }
    /**@outputPassHash
     * Used in initial creation of a password hash
     * if called outputs hash of string arg to console
     * @param - const string - ref to password string
     */
    void outputPassHash(const std::string& pass) const {
        std::cout << "Hash:" << hashFunction(pass) <<std::endl;
    }

public:
    /*
     * Deletes copy+copy assign & move+move assign constructors.
     */
    Authenticator(const Authenticator &) = delete;
    Authenticator(Authenticator &&) = delete;
    Authenticator &operator=(const Authenticator &) = delete;
    Authenticator &operator=(Authenticator &&) = delete;

    /**@getInstance
     * Getter / retrieval method for our singleton authenticator class instance
     * @return: Authenticator - singleton instance of authenticator class
     */
    static Authenticator& getInstance(){
        static Authenticator authInstance;
        return authInstance;
    }

    /**@authenticate
     * Checks the hashed input password against our stored / disk password hash
     * @param - const string - ref to input password string
     * @return: boolean - isPasswordValid?
     */
    bool authenticate(const std::string& pass) {
        authAttempts++; // increment attempts for each time auth is called
        if (constantCompareTime(storedHash, hashFunction(pass))){
            setAuthStatus(VALID_AUTHENTICATION); // sets auth status to valid
            authAttempts = NO_AUTH_ATTEMPTS; // reset auth attempts to 0 on success
            return true;
        }
        setAuthStatus(INVALID_AUTHENTICATION); // sets auth status to invalid
        return false;
    }

    /**@getAuthAttempts
     * Getter / retrieval method for amount of auth attempts made
     * @return: Authenticator - singleton instance of authenticator class
     */
    int32_t getAuthAttempts() const{
        return authAttempts;
    }

    /**@getAuthStatus
     * Getter / retrieval method for state of authStatus
     * @return: Authenticator - singleton instance of authenticator class
     */
    int32_t getAuthStatus() const{
        return authStatus;
    }

};


/*
 **************************************************
 *           MAIN METHOD
 **************************************************
 */
int main() {


    Authenticator& authInstance = Authenticator::getInstance();

    std::cout << "Edward Johnson - SNHU - CS410: Project 2\n";
    std::cout << "Hello! Welcome to our Investment Company\n";

    // generates Client objects using current  client data
    populateClientList(); // this will be replaced by DB / disk storage of client data

    int32_t choice = 0; // user menu choice / selection

    // Authentication looping:
    do{
        Authentication(); // call program authentication handler
        // continue authentication while invalid status & auth attempts less than max attepts
    } while (authInstance.getAuthStatus() == INVALID_AUTHENTICATION &&
             authInstance.getAuthAttempts() < MAXIMUM_AUTH_ATTEMPTS);

    // Main program loop:
    // if MAXIMUM_AUTH_ATTEMPTS reached, or EXIT_PROGRAM selected, ends the program main loop
    while (choice != EXIT_PROGRAM && authInstance.getAuthAttempts() < MAXIMUM_AUTH_ATTEMPTS){
        choice = menuChoiceHandler(); // call main menu handler
    }
    return 0;
}

/** @menuChoiceHandler
 * handles main menu selections & actions
 * @return int32_t - the selected menu choice
 */
int32_t menuChoiceHandler(){

    int32_t choice = DEFAULT_MENU_VALUE; // the menu selection

    // Updated to use single call to DisplayMenu function
    DisplayMenu();

    choice = getIntegerInput();    // get new menu selection / choice.

    // main menu switch uses constants instead of magic numbers
    switch (choice) {
        case PRINT_CLIENT_LIST:
            std::cout << "You chose option: " << choice << std::endl;
            DisplayClients();
            break;
        case CHANGE_SERVICE_CHOICE:
            std::cout << "You chose option: " << choice << std::endl;
            customerChoiceHandler();
            break;
        case EXIT_PROGRAM:
            std::cout << "Goodbye." << choice << std::endl;
            break;
        default:
            std::cout << "Select a valid menu option." << std::endl;
            break;
    }
    return choice;
}


/** @Authentication
 * authenticates user login session
 * sets authenticator object instance value to valid when successful
 */
void Authentication(){
    // this gets instance of auth api, could reference a db / stored account pass hashes
    Authenticator& authInstance = Authenticator::getInstance();

    // local var memory is freed before function return
    std::string username = "";
    // local var memory is freed before function return
    std::string password = "";

    std::cout << "Enter your username: \n";
    username = getStringInput();

    std::cout << "Enter your password: \n";
    password = getStringInput();

    // for initially getting hash to use as password
    // authInstance.outputPassHash(password);

    // call authentication method of auth class w/ password input
    authInstance.authenticate(password);

    // uses constants instead of magic numbers
    if (authInstance.getAuthStatus() == INVALID_AUTHENTICATION){
        std::cout << "Invalid Password. Please try again" << std::endl;
        std::cout << "You have " << MAXIMUM_AUTH_ATTEMPTS - authInstance.getAuthAttempts();
        std::cout << " attempts remaining." << std::endl;
    }
}


/** @customerChoiceHandler
 *  handles selection of clients, and service changes
 */
void customerChoiceHandler() {
    bool returnToMenu = false;
    // retrieve reference to the singleton ClientList instance
    ClientList &clientsInstance = ClientList::getClientListInstance();
    // use auto type, retrieve reference to our vector of Clients objects
    auto &clientsList = clientsInstance.getClientsList();

    int32_t clientChoice = DEFAULT_MENU_VALUE; // initialize value for client to change
    int32_t newService = DEFAULT_MENU_VALUE;   // initialize value for new service choice
    clientChoice = selectValidClient(); // set client selected to return from selectValidClient
    if (clientChoice == RETURN_PREV_MENU){
        // end function looping
        returnToMenu = true;
    } else { // when clientChoice isn't 0 (return to main menu)

        // get input for updated service from selectValidService
        newService = selectValidService();

        // if return to main menu selected
        if (newService == RETURN_PREV_MENU) {
            // end function looping
            returnToMenu = true;
        }
    }
    // to prevent out of bounds if 0 given for either selection, skip + return to prev menu
    if (clientChoice != RETURN_PREV_MENU && newService != RETURN_PREV_MENU) {

        try { // attempt to change the service of a client Object
            // modify the service of selected client to updated value
            // use clientchoice-1 because index starts at 1 ! 0
            clientsList.at(clientChoice - 1).setClientService(newService);

        } catch (const std::out_of_range &except) { // if exception occurs (client id out of range)
            std::cerr << "An exception occurred while updating service for client ID: ";
            std::cerr << clientChoice << std::endl;
            std::cerr << except.what() << std::endl;
        }
    }
}

/** @selectValidClient
 * Validates user inputs for clientIds, only allows matching clientId values
 * @return clientId - the valid clientId to use
 */
int32_t selectValidClient() {
    int32_t clientId = DEFAULT_MENU_VALUE; // initialize client selected to -1
    bool doneLooping = false;
    // retrieve reference to the singleton ClientList instance
    ClientList &clientsInstance = ClientList::getClientListInstance();

    // while entered client ID is not valid continue looping
    while (!doneLooping) {
        std::cout << "\nEnter the number of the client that you wish to change" << std::endl;
        std::cout << "Or enter 0 to return to previous menu." << std::endl;
        clientId = getIntegerInput(); // get a valid integer input

        // if input = RETURN_PREV_MENU , or matching id found / client
        if (clientId == RETURN_PREV_MENU || clientsInstance.isClientIdValid(clientId)) {
            doneLooping = true;
        }else {
            std::cout << "Matching Client ID was not found. Try again." << std::endl;
        }
    }
    return clientId;
}

/** @selectValidService
 * Modifies and validates Client service selections
 * @return selectedService - the updated client service selection
 */
int32_t selectValidService() {
    int32_t selectedService = DEFAULT_MENU_VALUE; // initialize service variable to -1

    // while input is not 0, 1 or 2, continue looping
    while(selectedService != MENU_SERVICE_ONE && selectedService != MENU_SERVICE_TWO && selectedService != RETURN_PREV_MENU){
        std::cout << "Please enter the client's new service choice (1 = Brokerage, 2 = Retirement)" << std::endl;
        std::cout << "Enter 0 to return to previous menu." << std::endl;

        // get an input integer for service selection
        selectedService = getIntegerInput();
        if (selectedService != MENU_SERVICE_ONE && selectedService != MENU_SERVICE_TWO && selectedService != RETURN_PREV_MENU) {
            std::cout << "Valid options are: 0, 1, or 2. Please enter a valid selection." << std::endl;
        }
    }
    return selectedService;
}

/** @getIntegerInput
 * Provides general integer input validation
 * This is our primary way to provide enhanced input security.
 * Prevent xss by only allowing valid inputs.
 *
 * @return int32_t userInput
 */
int32_t getIntegerInput() {
    int64_t userInput = DEFAULT_MENU_VALUE;
    bool doneLooping = false;

    while (!doneLooping) {
        // checks that input integer is within the range of values for a 32bit integer, and that cin is successful
        if (std::cin >> userInput && (userInput >= std::numeric_limits<int32_t>::min() + 1) && (userInput <= std::numeric_limits<int32_t>::max() - 1)) {
            doneLooping = true;
        }
        else {      // if cin fails / is not a valid int
            std::cin.clear(); // clear any cin errors
            std::cin.ignore(std::numeric_limits<std::streamsize>::max(),
                            '\n'); // clear out input buffer
            std::cout << "\nYou must enter a valid integer." << std::endl;
        }
    }
    // cast the integer back to 32bit once confirmed valid
    return static_cast<int32_t>(userInput);
}


/** @getStringInput
 * Provides general string input validation
 * Primary way to provide enhanced input security.
 * Prevent xss by only allowing valid inputs.
 * @return string userInput
 */
std::string getStringInput() {
    std::string userInput = "";
    bool doneLooping = false;
    while (!doneLooping) {
        // if input is valid
        if (std::getline(std::cin, userInput)) {

            // if invalidInputChars returns true OR userInput is emtpy
            if (invalidInputChars(userInput) || userInput.empty()){
                std::cout << "Not a valid input attempt." << std::endl;
                std::cout << "Inputs cannot contain the following characters: ";
                std::cout << R"( \ ! $ @ ( ) % ^ # * & < > / "\ , . | ; ~ ` : ' )" << std::endl;

            } else if(userInput.length() > 12) { // if input length is greater than 12 characters
                std::cout << "Not a valid input attempt." << std::endl;
                std::cout << "Input length cannot exceed 12 characters. Please try again." << std::endl;
            }else { // otherwise return the string
                doneLooping = true;
            }
        } else {   // if cin fails / is not a valid string
            std::cin.clear(); // clear any cin errors
            std::cin.ignore(std::numeric_limits<std::streamsize>::max(),
                            '\n'); // clear out input buffer
            std::cout << "Not a valid input attempt." << std::endl;
            std::cout << "You must enter a valid string." << std::endl;
        }
    }
    return userInput;
}

/** @invalidInputChars
 * Detects if a string contains bad characters
 * returns true if bad chars detected, false for not
 * @param - string - user input string
 * @return boolean true/false - is string valid
 */
bool invalidInputChars(std::string& input){
    const std::string invalidCharacters = R"(\!$@()#%^&*<>/"\,.|;~`:' )";
    // https://cplusplus.com/reference/string/string/find_first_of/
    // use findfirstof to search for invalid chars in our username / password.
    // return true / false if invalid chars were found in string arg
    return input.find_first_of(invalidCharacters) != std::string::npos;
}

/** @DisplayMenu
 * Outputs the main menu for program
 */
void DisplayMenu() {
    std::cout << "\nWhat would you like to do?\n";
    std::cout << "DISPLAY the client list (enter 1)\n";
    std::cout << "CHANGE a client's choice (enter 2)\n";
    std::cout << "Exit the program.. (enter 3)\n";
}

/** @DisplayClients
* Display method. Iterate through list of Client objects, outputting each.
*/
void DisplayClients() { // use const as value will not change
    // initialize/retrieve reference to the singleton ClientList instance
    ClientList &clients = ClientList::getClientListInstance();
    // use auto type, retrieve reference to our vector of Clients objects
    auto &clientsList = clients.getClientsList();
    std::cout << "\nID# | Client's Name | Service Selected (1 = Brokerage, 2 = Retirement)" << std::endl;
    std::cout << "¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯" << std::endl;

    // for each client object in the clientlist (use auto to determine class object type)
    for (const auto &client : clientsList) {
        // output the details of the client object
        std::cout << client.getClientId() << ".  | ";
        std::cout << client.getClientname();
        std::cout << "   selected option " << client.getClientService() << std::endl;
    }
}

/** @populateClientList
* creates Client objects using the provided client names / selected services
* would be done using a file / database in future iterations
*
*/
void populateClientList(){
    // initialize/retrieve reference to the singleton ClientList instance
    ClientList &clients = ClientList::getClientListInstance();

    // creates our initial Client objects
    // accepts a client name and service selected
    // adds each client to the singleton list
    clients.newClient("Bob Jones  ", 1);
    clients.newClient("Sarah Davis", 2);
    clients.newClient("Amy Friendly", 1);
    clients.newClient("Johnny Smith", 1);
    clients.newClient("Carol Spears", 2);

}


