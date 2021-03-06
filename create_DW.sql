drop schema if exists METRO_DB; 
create schema METRO_DB;
use METRO_DB;

drop table if exists FACTS;
drop table if exists PRODUCTS;
drop table if exists SUPPLIERS;
drop table if exists STORES;
drop table if exists CUSTOMERS;
drop table if exists TIMEPERIOD;


CREATE TABLE PRODUCTS(
	`PRODUCT_ID` VARCHAR(6) NOT NULL , 
	`PRODUCT_NAME` VARCHAR(30) NOT NULL, 
    `PRICE` DECIMAL(5,2) DEFAULT (0.0) NOT NULL,
  CONSTRAINT PRODUCT_PK PRIMARY KEY (PRODUCT_ID)
);

CREATE TABLE TIMEPERIOD(
	`TIME_ID` INT NOT NULL AUTO_INCREMENT,
	`DAY` INT NOT NULL,
	`MONTH` INT NOT NULL,
    `YEAR` INT NOT NULL,
    `QUARTER` INT NOT NULL,
    `isWEEKEND` BOOLEAN NOT NULL,
    CONSTRAINT TIMEPERIOD_PK PRIMARY KEY (TIME_ID)
);

CREATE TABLE STORES(
	`STORE_ID` VARCHAR(4) NOT NULL, 
	`STORE_NAME` VARCHAR(20) NOT NULL, 
    CONSTRAINT STORE_PK PRIMARY KEY (STORE_ID)
);

CREATE TABLE CUSTOMERS(
	`CUSTOMER_ID` VARCHAR(4) NOT NULL, 
	`CUSTOMER_NAME` VARCHAR(30) NOT NULL, 
	CONSTRAINT CUSTOMER_PK PRIMARY KEY (CUSTOMER_ID)
    
);
  
CREATE TABLE SUPPLIERS(
	`SUPPLIER_ID` VARCHAR(5) NOT NULL, 
	`SUPPLIER_NAME` VARCHAR(30) NOT NULL,
	CONSTRAINT SUPPLIER_PK PRIMARY KEY (SUPPLIER_ID)
);

CREATE TABLE SALES(
	`SALE_ID` INT NOT NULL auto_increment,
	`PRODUCT_ID` VARCHAR(6) NOT NULL,
	`STORE_ID` VARCHAR(4) NOT NULL, 
	`CUSTOMER_ID` VARCHAR(4) NOT NULL, 
	`SUPPLIER_ID` VARCHAR(5) NOT NULL, 
    `TIME_ID` INT NOT NULL,
	`QUANTITY` SMALLINT NOT NULL,
    `TOTAL_SALES` DECIMAL(10,2) DEFAULT (0.0) NOT NULL,
    CONSTRAINT SALE_PK PRIMARY KEY (SALE_ID),
    FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCTS(PRODUCT_ID),
    FOREIGN KEY (STORE_ID) REFERENCES STORES(STORE_ID),
    FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMERS(CUSTOMER_ID),
    FOREIGN KEY (SUPPLIER_ID) REFERENCES SUPPLIERS(SUPPLIER_ID),
    FOREIGN KEY (TIME_ID) REFERENCES TIMEPERIOD(TIME_ID)
);
commit;