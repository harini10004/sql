create database Techshop;
use Techshop;

create table customer(
customerid int constraint PK_customerid primary key,
firstname varchar(50),
lastname varchar(50),
Email varchar(50),
phone int ,
customeraddress varchar(50)
);
