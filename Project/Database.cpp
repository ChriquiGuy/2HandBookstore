#include "Database.h"
#include <string>


MySQL::MySQL() {

    mysql = mysql_init(NULL);
    if (!mysql)  cout << "MySQL Initialization Failed";
    mysql = mysql_real_connect(mysql, SERVER, USER, PASSWORD, DATABASE, 0, NULL, 0);
    if (mysql) cout << "Connection Succeeded\n";
    else cout << "Connection Failed\n";
}



void MySQL::displayResult(Query query) {

    switch (query) {
    case Query_1: QueryExe_1(); break;
    case Query_2: QueryExe_2(); break;
    case Query_3: QueryExe_3(); break;
    case Query_4: QueryExe_4(); break;
    case Query_5: QueryExe_5(); break;
    case Query_6: QueryExe_6(); break;
    case Query_7: QueryExe_7(); break;
    case Query_8: QueryExe_8(); break;
    case Query_9: QueryExe_9(); break;
    case Query_10: QueryExe_10(); break;
    case Query_11: QueryExe_11(); break;
    case Query_12: QueryExe_12(); break;
    case Query_13: QueryExe_13(); break;
    case Query_14: QueryExe_14(); break;
    case Query_15: QueryExe_15(); break;
    case Query_16: QueryExe_16(); break;
    case Query_17: QueryExe_17(); break;
    case Query_18: QueryExe_18(); break;
    case Query_19: QueryExe_19(); break;
    case Query_20: QueryExe_20(); break;
    case Query_21: QueryExe_21(); break;
    case Query_22: QueryExe_22(); break;
    case Query_23: QueryExe_23(); break;
    case Query_24: QueryExe_24(); break;
    case Query_25: QueryExe_25(); break;
    case Query_26: QueryExe_26(); break;


    case Exit:break;
    case None_selected:break;
    }
}

bool is_number(const std::string& s)
{
    return !s.empty() && std::find_if(s.begin(),
        s.end(), [](unsigned char c) { return !std::isdigit(c); }) == s.end();
}

void MySQL::setMonthFromUser() {

    dates = new string[1];
    cout << "Please Enter Month (MM): ";
    string month;
    cin >> month;
    cin.ignore(IGNORE_SIZE, '\n');
    cout << "Please Enter Year (YYYY): ";
    string year;
    cin >> year;
    cin.ignore(IGNORE_SIZE, '\n');
    cin.clear();
    dates[0] = year + "-" + month;

}

void MySQL::setDatesFromUser() {

    dates = new string[2];

    cout << "Please Enter Start Date (YYYY-MM-DD): ";
    cin >> dates[0];
    cin.ignore(IGNORE_SIZE, '\n');
    cout << "Please Enter End Date (YYYY-MM-DD): ";
    cin >> dates[1];
    cin.ignore(IGNORE_SIZE, '\n');
    cin.clear();
}

void MySQL::QueryExe_1(){

    string bookName;
    cout << "Enter book name: ";
    getline(cin, bookName);
    cin.clear();

    string q = "SELECT EXISTS ( \
                SELECT *        \
                FROM book       \
                WHERE title = '" + bookName + "' AND(storage_count + storage_count != 0)) as bool; ";


    mysql_query(mysql, q.c_str());
    res_set = mysql_store_result(mysql);

    if ((row = mysql_fetch_row(res_set)) != NULL){
        if (atoi(row[0]) == 1) cout << "Book " + bookName + " exist." << endl;
        else  cout << "Book " + bookName + " dosent exist." << endl;
    }
    else {
        cout << "Problem occur" << endl;
    }
    

}



void MySQL::QueryExe_2(){

    string q = "SELECT id_number, name, join_date\
                FROM client\
                ORDER BY join_date ASC LIMIT 1; ";

    mysql_query(mysql, q.c_str());
    res_set = mysql_store_result(mysql);

    if ((row = mysql_fetch_row(res_set)) != NULL) {
        cout << "The oldest customer is '" + string(row[1]) + "', id number - " + row[0] + ", join date - " + row[2] +  "." << endl;
    }
    else {
        cout << "Problem occur, or ther is no customers in the store data" << endl;
    }
}

void MySQL::QueryExe_3(){

    string q = "SELECT book_id, date, title, author \
                FROM(\
                    SELECT book_id, date\
                    FROM storepurchases\
                    INNER JOIN bookstorepurchases ON bookstorepurchases.store_purchases_id = storepurchases.id) as X\
                INNER JOIN book ON X.book_id = book.id\
                WHERE storage_count + store_count > 0\
                ORDER BY date ASC limit 1";

    mysql_query(mysql, q.c_str());
    res_set = mysql_store_result(mysql);

    if ((row = mysql_fetch_row(res_set)) != NULL) {
        cout << "The oldest book is '" + string(row[2]) + "', serial-number - " + row[0] + ", by  '" + row[3] + "'." << endl;
    }
    else {
        cout << "Problem occur, or ther is no books in the store data" << endl;
    }
}

void MySQL::QueryExe_4(){

    string q = "SELECT * \
                FROM orders \
                WHERE status != 'bought'\
                ORDER BY date ASC; ";

    mysql_query(mysql, q.c_str());
    res_set = mysql_store_result(mysql);

    cout << endl << "Order List : " << endl;
    cout << endl << " id     client number       date            status         message date" << endl;
    cout << endl << "------------------------------------------------------------------------" << endl;

    while ((row = mysql_fetch_row(res_set)) != NULL) {
        cout << " " + string(row[0]) + "      " + string(row[1]) + "      " \
            + string(row[2]) + "      " + string(row[3]) + "      " + ((row[4] != NULL)?string(row[4]):string("       None")) + "      " << endl;
    }
}

void MySQL::QueryExe_5(){

    string bookName;
    cout << "Enter book name: ";
    getline(cin, bookName);
    cin.clear();

    string q = "SELECT id, title, sum(amount) AS sold\
                FROM book\
                LEFT JOIN bookpurchases ON book.id = bookpurchases.book_id\
                WHERE title = '" + bookName + "' ";

    mysql_query(mysql, q.c_str());
    res_set = mysql_store_result(mysql);

    if ((row = mysql_fetch_row(res_set)) != NULL) {
        if (row[2] != NULL) cout << "Book " + bookName + " sold " + string(row[2]) + " times."  << endl;
        else  cout << "Book " + bookName + " dosent exist." << endl;
    }

}

void MySQL::QueryExe_6(){

    setDatesFromUser();

    string q = "SELECT author, sum(amount) AS sold\
                FROM(\
                    SELECT book.id, author, date, amount\
                    FROM book\
                    LEFT JOIN bookpurchases ON book.id = bookpurchases.book_id\
                    LEFT JOIN purchase ON bookpurchases.purchases_id = purchase.id\
                    WHERE(date BETWEEN '" + dates[0] + "' AND '" + dates[1] + "')) AS X\
                GROUP BY author ";

    mysql_query(mysql, q.c_str());
    res_set = mysql_store_result(mysql);

    if ((row = mysql_fetch_row(res_set)) != NULL) {
        if (row[0] != NULL) cout << "The most reader author between those dates is '" + string(row[0]) +\
            "' (sold " + string(row[1]) + " books)." << endl;
    }
}

void MySQL::QueryExe_7(){

    string q = "select id_number, name, sum(amount) as bought\
                from(\
                    SELECT id_number, name, amount\
                    from client\
                    inner join purchase on client.id_number = purchase.client_id\
                    inner join bookpurchases on bookpurchases.purchases_id = purchase.id) as X\
                group by id_number\
                order by bought desc limit 3; ";

    mysql_query(mysql, q.c_str());
    res_set = mysql_store_result(mysql);

    cout << endl << "Order List : " << endl;
    cout << endl << " id number     name       bougth " << endl;
    cout << endl << "---------------------------------" << endl;

    while ((row = mysql_fetch_row(res_set)) != NULL) {
        cout << " " + string(row[0]) << "\t" << string(row[1]) << "\t" << string(row[2]) << "\t" << endl;
    }
}

void MySQL::QueryExe_8(){

    string q = "select id, title , author, count(translator) as translations\
                from book\
                where book.storage_count + book.storage_count != 0\
                group by title\
                order by translations desc limit 1; ";

    mysql_query(mysql, q.c_str());
    res_set = mysql_store_result(mysql);

    if ((row = mysql_fetch_row(res_set)) != NULL) {
        cout << "'" +  string(row[1]) + "' by " + string(row[2]) + " (" \
            + string(row[3]) + " differents translations)."<< endl;
    }
    else {
        cout << "Problem occur" << endl;
    }
}

void MySQL::QueryExe_9(){

    string idNumber;
    cout << "Enter customer id number: ";
    getline(cin, idNumber);
    cin.clear();

    string q = "SELECT id_number, client.name, book_id, title, date, amount, (KG_Price * weight + cost * 1.2) cost, ((KG_Price * weight + cost * 1.2) * amount) total_cost\
                from client\
                inner join purchase on client.id_number = purchase.client_id\
                inner join bookpurchases on bookpurchases.purchases_id = purchase.id\
                inner join delivery on bookpurchases.delivery_id = delivery.id\
                inner join deliverymethod on delivery.method_name = deliverymethod.name\
                inner join book on book.id = bookpurchases.book_id\
                where id_number = '" + idNumber +"'\
                order by date asc; ";

    mysql_query(mysql, q.c_str());
    res_set = mysql_store_result(mysql);

    cout << endl << "Purchase history : " << endl;
    cout << endl << " book id     title       date      amount      cost        total cost " << endl;
    cout << endl << "----------------------------------------------------------------------" << endl;

    while ((row = mysql_fetch_row(res_set)) != NULL) {
        cout << " " + string(row[2]) << "\t" << string(row[3]) << "\t" << string(row[4]) << "\t" \
            << string(row[5]) << "\t" << string(row[6]) << "\t" << string(row[7]) << "\t" << endl;
    }
}

void MySQL::QueryExe_10(){

    string idNumber;
    cout << "Enter customer id number: ";
    getline(cin, idNumber);
    cin.clear();

    string q = "select (date) order_date, status, message_date, title, author\
                from orders\
                inner join bookorder on bookorder.order_id = orders.id\
                inner join client on client.id_number = orders.client_ID\
                inner join book on bookorder.book_id = book.id\
                where id_number = '" + idNumber + "'";

    mysql_query(mysql, q.c_str());
    res_set = mysql_store_result(mysql);

    cout << endl << "Order history : " << endl;
    cout << endl << " order date     status       message date      book title      author " << endl;
    cout << endl << "----------------------------------------------------------------------" << endl;

    while ((row = mysql_fetch_row(res_set)) != NULL) {
        cout << " " + string(row[0]) << "\t" << string(row[1]) << "\t" << string(row[2]) << "\t" \
            << string(row[3]) << "\t" << string(row[4]) << endl;
    }

}

void MySQL::QueryExe_11(){

    cout << "Not available" << endl;

}

void MySQL::QueryExe_12(){

    string idNumber;
    cout << "Enter customer id number: ";
    getline(cin, idNumber);
    cin.clear();

    string q = "select purchases_id, title, author, amount, delivery_id, destination, delivery_type, method_name \
                from bookpurchases\
                inner join delivery on delivery.id = bookpurchases.delivery_id\
                inner join book on book.id = bookpurchases.book_id\
                inner join purchase on bookpurchases.purchases_id = purchase.id\
                inner join client on client.id_number = purchase.client_ID\
                where purchases_id in(\
                    select purchases_id\
                    from bookpurchases\
                    inner join delivery on delivery.id = bookpurchases.delivery_id\
                    group by purchases_id having count(purchases_id) > 1)\
                and client.id_number = '" + idNumber + "'";

    mysql_query(mysql, q.c_str());
    res_set = mysql_store_result(mysql);

    if (mysql_num_rows(res_set) == 0){
        cout << "None of the customers splitted purchase, or customer id dosent exist." << endl;
        return;
    }

    cout << endl << "delivery details: " << endl;
    cout << endl << " purchase id     book title       author      amount      delivery id       destination     type        method " << endl;
    cout << endl << "---------------------------------------------------------------------------------------------------------------" << endl;

    while ((row = mysql_fetch_row(res_set)) != NULL) {
        
        cout << " " + string(row[0]) << "\t" << string(row[1]) << "\t" << string(row[2]) << "\t" \
            << string(row[3]) << "\t" << string(row[4]) << "\t" << string(row[5])\
            << string(row[6]) << "\t" << string(row[7]) << endl;

    }
}

void MySQL::QueryExe_13(){

    string deliveryId;
    cout << "Enter delivery id: ";
    getline(cin, deliveryId);
    cin.clear();

    string q = "select status\
                from delivery\
                where id = " + deliveryId;


    mysql_query(mysql, q.c_str());
    res_set = mysql_store_result(mysql);

    if (mysql_num_rows(res_set) == 0) {
        cout << " delivery id dosent exist." << endl;
        return;
    }

    if ((row = mysql_fetch_row(res_set)) != NULL) {
        cout << "status : " + string(row[0]) << endl;
    }
    else {
        cout << "Problem occur" << endl;
    }
}

void MySQL::QueryExe_14(){
    
    setMonthFromUser();

    string q = "select count(*) deliveres\
                from purchase\
                inner join bookpurchases on bookpurchases.purchases_id = id\
                inner join delivery on bookpurchases.delivery_id = delivery.id\
                where date between '" + dates[0] + "-01' and ('" + dates[0]+ "-01' + interval 1 month) and delivery_type = 'xpress'";


    mysql_query(mysql, q.c_str());
    res_set = mysql_store_result(mysql);

    if ((row = mysql_fetch_row(res_set)) != NULL) {
        cout << "xpress made " + string(row[0]) + " deliveries this month." << endl;
    }
    else {
        cout << "Problem occur" << endl;
    }
}

void MySQL::QueryExe_15(){

    setMonthFromUser();

    string q = "select sum(amount * (cost * 1.2 + KG_Price * weight)) total\
                from purchase\
                inner join bookpurchases on bookpurchases.purchases_id = purchase.id\
                inner join book on book.id = bookpurchases.book_id\
                left join delivery on delivery.id = bookpurchases.delivery_id\
                left join deliverymethod on deliverymethod.name = delivery.method_name\
                where date between '" + dates[0] + "-01' and ('" + dates[0] + "-01' + interval 1 month) and payment_method = 'bit'";


    mysql_query(mysql, q.c_str());
    res_set = mysql_store_result(mysql);

    if ((row = mysql_fetch_row(res_set)) != NULL) {
        cout << "total amount via bit :  " + string(row[0]) + " NS." << endl;
    }
    else {
        cout << "Problem occur" << endl;
    }
}

void MySQL::QueryExe_16(){

    string q = "select purchases_id, date, (amount * cost * 0.2) profit\
                from purchase\
                left join bookpurchases on bookpurchases.purchases_id = purchase.id\
                left join book on book.id = bookpurchases.book_id\
                where(date between(now() - interval 1 year) and now())\
                and (\
                    select avg(amount * cost * 0.2) avg_profit\
                    from purchase\
                    left join bookpurchases on bookpurchases.purchases_id = purchase.id\
                    left join book on book.id = bookpurchases.book_id\
                    where(date between(now() - interval 1 year) and now())) < (amount * cost * 0.2) ";

    mysql_query(mysql, q.c_str());
    res_set = mysql_store_result(mysql);

    cout << endl << "above avrage purchases : " << endl;
    cout << endl << " purchases id     date       profit " << endl;
    cout << endl << "------------------------------------" << endl;

    while ((row = mysql_fetch_row(res_set)) != NULL) {
        cout << "     " + string(row[0]) << "\t" << string(row[1]) << "\t" << string(row[2]) << "\t" << endl;
    }
}

void MySQL::QueryExe_17(){

    string q = "select sum(delivery_type = 'mail') mail_count, sum(delivery_type = 'xpress') xpress_count  \
                from delivery\
                where(status_update_date between(now() - interval 1 year) and now()) ";

    mysql_query(mysql, q.c_str());
    res_set = mysql_store_result(mysql);

    cout << endl << "delivery count : " << endl;
    cout << endl << " mail    xpress " << endl;
    cout << endl << "-----------------" << endl;

    if ((row = mysql_fetch_row(res_set)) != NULL) {
        cout << "   " + string(row[0]) << "\t\t" << string(row[1]) << endl;
    }
}

void MySQL::QueryExe_18(){

    cout << "Not available" << endl;
}

void MySQL::QueryExe_19(){

    string q = "select client_id,  name, mobile_phone, landline, join_date\
                from(\
                    select client_id, max(date) date\
                    from purchase\
                    group by client_id) as T\
                left join client on client.id_number = T.client_id\
                where date not between(now() - interval 2 year) and (now())";

    mysql_query(mysql, q.c_str());
    res_set = mysql_store_result(mysql);


    if (mysql_num_rows(res_set) == 0) {
        cout << " None." << endl;
        return;
    }

    cout << endl << "Order history : " << endl;
    cout << endl << " id number       name          mobile          landline      join date " << endl;
    cout << endl << "-----------------------------------------------------------------------" << endl;

    while ((row = mysql_fetch_row(res_set)) != NULL) {
        cout << " " + string(row[0]) << "\t" << string(row[1]) << "\t" << string(row[2]) << "\t" \
            << string(row[3]) << "\t" << string(row[4]) << endl;
    }
}

void MySQL::QueryExe_20(){

    string q = "select id_number, name\
                from orders\
                left join client on orders.client_ID = client.id_number\
                where(status = 'message-sent') and (message_date between(now() - interval 14 day) and now())";

    mysql_query(mysql, q.c_str());
    res_set = mysql_store_result(mysql);

    if (mysql_num_rows(res_set) == 0) {
        cout << " None." << endl;
        return;
    }

    cout << endl << "delivery count : " << endl;
    cout << endl << " id number    name " << endl;
    cout << endl << "-------------------" << endl;

    while ((row = mysql_fetch_row(res_set)) != NULL) {
        cout << " " + string(row[0]) << "\t" << string(row[1]) << endl;
    }
}

void MySQL::QueryExe_21(){

    cout << "Not available" << endl;
}

void MySQL::QueryExe_22(){

    setDatesFromUser();

    string q = "select sum(cost * amount) total_cost, sum(amount) book_count\
                from(\
                    select id\
                    from storepurchases\
                    where date between '" + dates[0] + "' and '" + dates[1]+ "') as T\
                left join bookstorepurchases on T.id = bookstorepurchases.store_purchases_id\
                left join book on book.id = bookstorepurchases.book_id";

    mysql_query(mysql, q.c_str());
    res_set = mysql_store_result(mysql);

    if ((row = mysql_fetch_row(res_set)) != NULL) {
        cout << "book count : " + string(row[1]) + ", total cost: " + string(row[0]) << endl;
    }
}

void MySQL::QueryExe_23(){

    setMonthFromUser();

    string q = "select (sum(cost) * 0.20 * amount) month_profit\
                from(\
                    select id\
                    from purchase\
                    where date between '" + dates[0] + "-01' and ('" + dates[0] + "-1' + interval 1 month)) as T\
                left join bookpurchases on T.id = bookpurchases.purchases_id\
                left join book on book.id = bookpurchases.book_id";

    mysql_query(mysql, q.c_str());
    res_set = mysql_store_result(mysql);

    if ((row = mysql_fetch_row(res_set)) != NULL) {
        cout << "profit : " + string(row[0]) << endl;
    }
}

void MySQL::QueryExe_24(){

    cout << "Not available" << endl;
}

void MySQL::QueryExe_25(){

    string employee;
    cout << "Enter employee id: ";
    getline(cin, employee);
    cin.clear();

    setMonthFromUser();

    string q = "select (hours * hour_salary) bruto\
                from employeehours\
                left join employee on employee.id = employeehours.employee_id\
                where employee_id = " + employee + " and date = '" + dates[0] + "-01'";

    if (mysql_num_rows(res_set) == 0) {
        cout << " None, or employye dosent exist" << endl;
        return;
    }

    mysql_query(mysql, q.c_str());
    res_set = mysql_store_result(mysql);

    if ((row = mysql_fetch_row(res_set)) != NULL) {
        cout << "bruto : " + string(row[0]) << endl;
    }

}

void MySQL::QueryExe_26(){

    setMonthFromUser();

    string q = "select employee_id, name, count(employee_id) sales\
                from purchase\
                left join employee on employee.id = purchase.employee_id\
                where date between '" + dates[0] + "-01' and ('" + dates[0] + "-01' + interval 1 month)\
                group by employee_id\
                order by sales desc limit 1";

    mysql_query(mysql, q.c_str());
    res_set = mysql_store_result(mysql);

    if (mysql_num_rows(res_set) == 0) {
        cout << " None" << endl;
        return;
    }

    if ((row = mysql_fetch_row(res_set)) != NULL) {
        cout << "employee : " + string(row[1]) + ", sale count : " + string(row[2]) << endl;
    }
}




MySQL :: ~MySQL() {

    mysql_close(mysql);
}
