create table Accounts(
		srno int NOT NULL,
		start_date date NOT NULL,
		start_order_no int NOT NULL,
		Total_Amount int NOT NULL,
		primary key(srno)
);

create table Accountsd(
		srno int NOT NULL,
		date date NOT NULL,
		start_order int NOT NULL,
		Total_Amount int NOT NULL,
		primary key(srno)
);

create table attendance(
		srno int NOT NULL,
		id varchar(15) NOT NULL,
		login_date date NOT NULL,
		login_time time NOT NULL,
		logout_date date,
		logout_time time,
		primary key(srno)
);

create table Base_menu (
    		Menu_id int NOT NULL,
    		Category_id int NOT NULL,
    		Category varchar(20) NOT NULL,
    		Starting_price int NOT NULL,
    		Sub_category varchar(20),
		primary key(Menu_id)
);

create table Bill(
		Order_no int NOT NULL,
		Amount int NOT NULL,
		Table_no int NOT NULL,
		Customer_id varchar(15) NOT NULL,
		Cashier_id varchar(15),
		Date date NOT NULL,
		Time time NOT NULL,
		flag int NOT NULL,
		feedback int NOT NULL,
		primary key(order_no)
);

create table Cashier(
		Cashier_id varchar(15) NOT NULL,
		Cashier_name varchar(20) NOT NULL,
		cashier_password varchar(20) NOT NULL,
         	Contact_no char(10) NOT NULL, 
		Cashier_salary Numeric(10,2) NOT NULL, 
		Cashier_p int NOT NULL,
		primary key(Cashier_id), 
		check(Cashier_salary>0)
);

create table Chef(
		Chef_id varchar(15)NOT NULL,
		Chef_name varchar(20)NOT NULL, 
		Chef_password varchar(20)NOT NULL,
		Chef_salary Numeric(10,2)NOT NULL, 
		Chef_p int NOT NULL,
		Chef_s int NOT NULL,
		Chef_b int NOT NULL,
		primary key(Chef_id), 
		check(Chef_salary>0)
);

create table Customer(
		Customer_id varchar(15) NOT NULL, 
		Customer_password varchar(16)NOT NULL, 
		Customer_name varchar(20)NOT NULL, 
		Address varchar(30),
        	primary key(Customer_id)
);

create table Customer_contact(
		Customer_id varchar(15) NOT NULL, 
		Phone_number char(10), 
		primary key(Phone_number)
);

create table Dish_order(
		Order_no int NOT NULL,
		Dish_id int NOT NULL,
		Quantity int NOT NULL,
		primary key(Order_no,Dish_id)
);

create table Feedback(
		srno int NOT NULL,
		date date NOT NULL,
		Chef_id varchar(15) NOT NULL,
		waiter_id varchar(15) NOT NULL,
		primary key(srno)
);

create table Login(
		Order_no int NOT NULL,
		Customer_id varchar(15) NOT NULL,
		Table_no int,
		primary key(Order_no)
);

create table Manager(
		Manager_id varchar(15) NOT NULL,
		Manager_name varchar(20)NOT NULL,
		Manager_password varchar(16)NOT NULL,
		Contact_no char(10) NOT NULL , 
		Manager_salary Numeric(10,2)NOT NULL,
		Manager_p int NOT NULL,
		primary key(Manager_id), 
		check(Manager_salary>0)
);

create table manager_id(
		manager_id varchar(15) NOT NULL,
		primary key(manager_id)
);

create table Menu(
		Dish_id int NOT NULL,
		Dish_name varchar(30) NOT NULL, 
		Dish_price int NOT NULL,
		Dish_type varchar(20),
		primary key(Dish_id)
);

create table Ready(
		Srno int NOT NULL,
		Order_no int NOT NULL,
		Dish_id int NOT NULL,
		Quantity int NOT NULL,
		Description varchar(30),
		Counter int NOT NULL,
		Chef_id varchar(15) NOT NULL,
		flag int NOT NULL,
		primary key(Srno)
);

create table Serves(
		srno int NOT NULL,
		Order_no int NOT NULL,
		Counter int NOT NULL,
		Waiter_id varchar(15)NOT NULL,
		flag int NOT NULL,
		primary key(Order_no,Counter)
);

create table Tables(
		Table_no int NOT NULL, 
		Table_size int NOT NULL, 
                Vacancy int NOT NULL,
		Category int NOT NULL,
                primary key(Table_no)
);

create table Temp_order(
		Order_no int NOT NULL,
		Dish_id int NOT NULL,
		Quantity int NOT NULL,
		Description varchar(30),
		primary key(Order_no,Dish_id)
);

create table Waiter(
		Waiter_id varchar(15)NOT NULL, 
		Waiter_name varchar(20)NOT NULL,
		Waiter_password varchar(20)NOT NULL, 
		Waiter_salary Numeric(10,2)NOT NULL, 
		Waiter_p int NOT NULL,
		Waiter_a int NOT NULL,
		Waiter_b int NOT NULL,
		primary key(Waiter_id), 
		check(Waiter_salary>0)
);