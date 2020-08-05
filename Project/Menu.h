
#include "Database.h"
using namespace std;


class Menu{

private:
    MySQL db;
    Query selected = None_selected;
    void getUserInput();
    void executeQuery(Query q);
    void clearConsole();
    void displayMenu();

public:
    Menu();
    ~Menu();
    void play();


};
