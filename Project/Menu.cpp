#include "Menu.h"


Menu::Menu(){

}


void Menu::play() {

    displayMenu();

    do {
        getUserInput();
        if (selected != None_selected && selected != Exit) {
            executeQuery(selected);
            cout << endl << "Press 'ENTER' to continue" << endl;
            cin.ignore(IGNORE_SIZE, '\n');
            clearConsole();
            displayMenu();
        }
    } while (selected != Exit);

    cout << "Have a great day!" << endl;
    system("pause");
}

void Menu::getUserInput() {

    int input;
    cin >> input;
    cin.clear();
    cin.ignore(IGNORE_SIZE, '\n');

    if (input >= First && input <= Last) {
        selected = Query(input);
    }
    else {
        cout << "Invalid input, please enter a valid option from the menu : ";
        selected = Query(None_selected);
        getUserInput();
    }
}

void Menu::executeQuery(Query q) {
    db.displayResult(q);
}

void Menu::clearConsole() {
    for (int i = 0; i < 100; i++) cout << endl;
}


void Menu::displayMenu() {

    cout << endl
        << "(1)  Check if book Y exist in the store" << endl
        << "(2)  Who is the oldest customer" << endl
        << "(3)  The oldest book" << endl
        << "(4)  Current order list" << endl
        << "(5)  How much copies of Book Y were sold by the store" << endl
        << "(6)  Who is the most read writer in the middle of dates X to Y." << endl
        << "(7)  List of the 3 customers who have purchased the most books over the years" << endl
        << "(8)  Who is the book with the largest number of translations currently in stock" << endl
        << "(9)  Customer X purchase history" << endl
        << "(10) Orders history customer X" << endl
        << "(11) Calculation of shipping cost" << endl
        << "(12) Has customer X ever split a book purchase for multiple shipments" << endl
        << "(13) What is the current status of a particular shipment Y" << endl
        << "(14) What is the amount of shipments made by Xpress in a particular month" << endl
        << "(15) The total money transferred to the store account via the Bit app in month X" << endl
        << "(16) What are the transactions that have been made during the last 12 months, and which have yielded greater profit than the average trading profit in these 12 months" << endl
        << "(17) Number of shipments have been made during the last 12 months" << endl
        << "(18) Data on all shipments made, ever, and including at least 2 editions variety of the same book." << endl
        << "(19) Data on all customers who have previously purchased, at any time, at least one book From the store, and who have not made any purchases during the last 24 months" << endl
        << "(20) Orders that the book’s arrival notice was sent but did not arrive to take for 14 days" << endl
        << "(21) Number of books in the storage on a monthly basis" << endl
        << "(22) How many books did the store purchase between D1 and D2, and what was the payment for them." << endl
        << "(23) The store profits from sales in a particular month" << endl
        << "(24) Average annual transactions in monthly cross-section" << endl
        << "(25) The gross salary of employee Z in a given month" << endl
        << "(26) Who sells with the most trades in month X" << endl
        << "(27) Exit" << endl


        << endl << "Select option : " << flush;

}


Menu::~Menu() {
}