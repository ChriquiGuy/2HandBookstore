#include <iostream>
#include <mysql.h>
#include "DatabaseDetails.h"

using namespace std;

constexpr auto IGNORE_SIZE = 255;

typedef enum {

    Query_1 = 1, Query_2, Query_3, Query_4, Query_5,
    Query_6, Query_7, Query_8, Query_9, Query_10,
    Query_11, Query_12, Query_13, Query_14, Query_15,
    Query_16, Query_17, Query_18, Query_19, Query_20,
    Query_21, Query_22, Query_23, Query_24, Query_25, Query_26,

    Exit, None_selected = -1,
    First = Query_1,
    Last = Exit

} Query;



class MySQL{

private:

    string * dates = nullptr;

    void QueryExe_1();
    void QueryExe_2();
    void QueryExe_3();
    void QueryExe_4();
    void QueryExe_5();
    void QueryExe_6();
    void QueryExe_7();
    void QueryExe_8();
    void QueryExe_9();
    void QueryExe_10();
    void QueryExe_11();
    void QueryExe_12();
    void QueryExe_13();
    void QueryExe_14();
    void QueryExe_15();
    void QueryExe_16();
    void QueryExe_17();
    void QueryExe_18();
    void QueryExe_19();
    void QueryExe_20();
    void QueryExe_21();
    void QueryExe_22();
    void QueryExe_23();
    void QueryExe_24();
    void QueryExe_25();
    void QueryExe_26();

    void setMonthFromUser();
    void setDatesFromUser();



protected:
    MYSQL * mysql;
    MYSQL_RES * res_set;
    MYSQL_STMT * statment;
    MYSQL_ROW row;
    MYSQL_DATA data;

    unsigned int i;


public:
    MySQL();
    ~MySQL();

    void displayResult(Query query);

};
