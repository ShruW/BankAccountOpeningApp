create database customersdb;

create table Customer(
ID int primary key identity(1,1),
FirstName varchar(20) not null,
LastName varchar (20),
DOB date,
Gender varchar(1),
Email varchar(20),
Phone varchar(12),
CreatedOn datetime,
CreatedBy varchar(20)
)

alter table Customer add Pwd varchar(20);
drop table Customer
select * from Customer

update Customer 
set Pwd='Jim' where id=3

create or alter procedure AddCustomer @FirstName varchar(20),@LastName varchar(20),@DOB date,@Gender varchar(1),@Phone varchar(20),@Email varchar(20),@Pwd varchar(20)
as
insert into Customer(FirstName,LastName,DOB,Gender,Email,Phone,CreatedOn,CreatedBy,Pwd)
values(@FirstName,@LastName,@DOB,@Gender,@Email,@Phone,GETDATE(),CURRENT_USER,@Pwd);

create or alter procedure EditCustomer @ID int, @FirstName varchar(20),@LastName varchar(20),@DOB date,@Gender varchar(1),@Email varchar(20),@Phone varchar(20)
as
if exists(select * from Customer where ID=@ID) 
update Customer
set FirstName=@FirstName,LastName=@LastName,DOB=@DOB,Email=@Email,Phone=@Phone
where ID=@ID;

create or alter procedure ViewCustomer 
as
select * from Employee;

exec ViewCustomer
exec AddEditCustomer 'James','Kurtis','1990-04-12','M','np@gmail.com','9081168118'
 
select PWDENCRYPT('abc@123')=='abc@123'

create table Employee(
EmployeeId int primary key identity,
FirstName varchar(20) not null,
LastName varchar(20) not null,
UserId varchar(20) not null ,
Pwd varchar(20) not null,
EmployeeRole varchar(10) not null
) 

drop table Employee
insert into Employee(FirstName,LastName,UserId,Pwd,EmployeeRole) values ('John', 'Hop','John.H@abc.com','john','Manager')


create or alter procedure ValidateUser @UserId varchar(20),@Pwd varchar(20),@Result int output,@Name varchar(20) output
as
if exists(select * from Employee where UserId=@UserId)
begin
	if exists(select * from Employee where UserId=@UserId and Pwd=@Pwd)
	select @Result=1,@Name=FirstName+' '+LastName from Employee where UserId=@UserId and Pwd=@Pwd;
	else 
	select @Result=-1;
end
else
select @Result=0;


--employee email id:@abc.com / 
create or alter procedure ValidateUser @UserId varchar(20),@Pwd varchar(20),@Result int output,@Name varchar(20) output
as
if (right(@UserId,8)='@abc.com')
begin
	if exists(select * from Employee where UserId=@UserId and Pwd=@Pwd)
	select @Result=1,@Name=FirstName+' '+LastName from Employee where UserId=@UserId and Pwd=@Pwd; 
	else 
	select @Result=-1;
end
else 
begin
	if exists(select * from Customer where Email=@UserId and Pwd=@Pwd)
	select @Result=2,@Name=FirstName+' '+LastName from Customer where Email=@UserId and Pwd=@Pwd
	else
	select @Result=-1;
end

declare @Result int,@Name varchar(20)
exec ValidateUser @UserId='david.@abc.com',@Pwd='david',@Result=@Result output,@Name=@Name output
select @Result,@Name;

select FirstName+' '+LastName from employee

create table Account(
AccNo varchar(10) primary key,
CustomerId int foreign key references Customer(ID),
OpeningBalance money,
AccOpeningDate date,
AccType varchar(10),
AccStatus varchar(10)
);

create or alter procedure AddAccount @CustomerId int,@OpeningBalance money,@AccType varchar(10)
as
insert into Account(AccNo,CustomerId,OpeningBalance,AccOpeningDate,AccType,AccStatus)
values(concat(substring(@AccType,1,3),'000',@CustomerId),@CustomerId,@OpeningBalance,GETDATE(),@AccType,'Active');

exec AddAccount 3,1000,'SAVING'
select * from Account

select AccNo from Account where CustomerId=6

create or alter procedure GetMyDetails @CustomerId int
as
select FirstName,LastName,DOB,Gender,Email,Phone from Customer where ID=@CustomerId

create or alter procedure GetCustIdFromEmail @Email varchar(20)--,@ID int out, @FirstName varchar(20) out
as
select ID,FirstName from Customer where Email=@Email
