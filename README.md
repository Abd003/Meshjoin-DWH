# Meshjoin-Data Warehouse Project

## Project Description
A Data Warehouse Project with implementation of Mesh Join Algorithm to process transactional data of Metro Store. The major steps invloved were,
1) Loading Transactional and Master Data in the MySQL Workbench
2) Designing and Implementing Star Schema Warehouse Architecture according to data
3) Implementing Mesh Join Algorithm to populate data in the warehouse structure
4) Run OLAP queries on the schema structure to analyse sale of the store

## Meshjoin
Meshjoin/R-Meshjoin is an algorithm involving data to be separated into disk buffers(Arrays/Lists) to handle both transactional and product/master data. Later, the transactions is populated into Multi Hashmap and checked according to the current master data partition. The tuple record which is found in the partition is further processed according to sale and later sent to be populated in the already created star schema architecture. 

## How to Run?
Operating Manual:
	1. Run the create_DW.sql file.
	2. Run the Transaction_and_MasterData_Generator.sql file.
	3. Open DWH_project in java.
	4. Run the masterJoin.java file.
	5. In case of lib import failure add exteral libs from the lib folder.
	6. Run the queriesDW.sql file to run required queries.
