create database CareerHub
use CareerHub

create table Companies (
companyid int primary key identity(1,1),
companyname varchar(50),
companyloc varchar(70) 
);

create table Jobs(
jobid int primary key identity(100,1),
jobtitle varchar(70),
jobdescription text,
joblocation varchar(70),
salary decimal(10,2),
jobtype varchar(40),
posteddate datetime,
companyid int foreign key(companyid) references Companies(companyid) on delete cascade
);


create table Applicants(
applicantid int primary key identity(200,1),
firstname varchar(50),
lastname varchar(50),
Email varchar(50),
phone varchar(50),
applicant_resume text
)

create table Applications(
applicationid int primary key identity(300,1),
applicationdate datetime,
covertletter text,
applicantid int foreign key(applicantid) references Applicants(applicantid) on delete cascade,
jobid int foreign key(jobid) references Jobs(jobid) on delete cascade
);

insert into Companies values('Hexaware','mumbai')
insert into Companies values('Hexaware','chennai')
insert into Companies values('Hexaware','pune')
insert into Companies values('Hexaware','banglore')
insert into Companies values('Tcs','coimbatore')
insert into Companies values('Tcs','chennai')
insert into Companies values('Capgemini','banglore')
insert into Companies values('Capgemini','chennai')
insert into Companies values('Accenture','chennai')
insert into Companies values('Accenture','coimbatore');
select * from Companies


insert into Jobs values('Accountant','Accountant who completed m.com with 80 percent and willing to recolate to the recpective location with no history of arrear',
'mumbai',20000.00,'full-time','2025-03-10 01:35:00',1);
insert into Jobs values('Accountant','Accountant who completed B.com with 80 percent and willing to recolate to the recpective location with no history of arrear',
'chennai',20000.00,'full-time','2025-03-5 02:30:00',2);
insert into Jobs values('full stack developer','developer who completed B.E and have strong coding skills in both frontend and backend with 80 percent and willing to recolate to the recpective location with no history of arrear',
'banglore',40000.00,'full-time','2025-02-28 02:30:00',3);
insert into Jobs values('front end developer','developer who completed B.E and have know htms css and java script with 80 percent and willing to recolate to the recpective location with no history of arrear',
'pune',32000.00,'full-time','2025-02-21 02:30:00',4);
insert into Jobs values('finance','Accountant who completed B.com with 80 percent and willing to recolate to the recpective location with no history of arrear',
'chennai',20000.00,'full-time','2025-02-10 02:30:00',5);
insert into Jobs values('SDE','developer who completed B.E and have strong probelm solving skill with 80 percent and willing to recolate to the recpective location with no history of arrear',
'mumbai',30000.00,'full-time','2025-02-05 11:30',6);
insert into Jobs values('software testing','developer who completed B.E and have strong skill of any one programming language with 80 percent and willing to recolate to the recpective location with no history of arrear',
'banglore',35000.00,'full-time','2025-01-28 12:30',7);
insert into Jobs values('data analyst','developer who completed B.E and have strong knowledge in sql and aws with 80 percent and willing to recolate to the recpective location with no history of arrear',
'chennai',25000.00,'full-time','2025-01-25 06:07',8);
insert into Jobs values('Accountant','Accountant who completed m.com with 80 percent and willing to recolate to the recpective location with no history of arrear',
'coimbatore',20000.00,'full-time','2025-01-21 1:20',9);
insert into Jobs values('SDE','developer who completed B.E and  have strong probelm solving skill with 80 percent and willing to recolate to the recpective location with no history of arrear',
'chennai',30000.00,'full-time','2025-01-20 12:30',10);


insert into Applicants values('akila','s','akilas@gmail.com','1234567899','pakilas.resume');
insert into Applicants values('anu','p','anu12@gmail.com','9876543201','anup.resume');
insert into Applicants values('arthi','s','arthi@gmail.com','2345678091','arthis.resume');
insert into Applicants values('divya','v','divyav@gmail.com','3456789125','divya.resume');
insert into Applicants values('bhoomika','s','bhoomika@gmail.com','4567809123','bhoonikas.resume');
insert into Applicants values('pooja','k','poojak@gmail.com','5678910234','pooja.resume');
insert into Applicants values('aarthi','kc','aarthikc@gmail.com','6789123045','aarthikc.resume');
insert into Applicants values('akshaya','p','akshaya@gmail.com','7891234560','akshaya.resume');
insert into Applicants values('kaviya','G','kaviyag@gmail.com','8912345607','kaviyag.resume')
insert into Applicants values('parvathi','c','parvathi@gmail.com','9123456780','paravathi.resume')

insert into Applications(applicationdate,covertletter,applicantid,jobid) values('2025-01-02 02:30','Accountant cover letter',200,100)
insert into Applications values('2025-02-02 03:30','SDE cover letter',201,101)
insert into Applications values('2025-01-02 04:30','SDE cover letter',202,102)
insert into Applications values('2025-01-02 05:30','full stack developer cover letter',203,103)
insert into Applications values('2025-01-02 06:30','full stack developer cover letter',204,104)
insert into Applications values('2025-01-02 12:30','data analyst cover letter',205,105)
insert into Applications values('2025-01-02 11:30','software testing cover letter',206,106)
insert into Applications values('2025-01-02 01:30','finance cover letter',207,107)
insert into Applications values('2025-01-02 11:35','Accountant cover letter',208,108)
insert into Applications values('2025-01-02 02:30','front end developer cover letter',209,109)
 
 select * from Applicants
 select * from Companies
 select * from Jobs

 select * from Applications

 --5. Write an SQL query to count the number of applications received for each job listing in the  "Jobs" table.
 --Display the job title and the corresponding application count. Ensure that it lists all  jobs, even if they have no applications. 


select j.jobtitle, COUNT(a.applicationid) as total from Jobs j
left join Applications a on j.jobid = a.jobid
GROUP BY j.jobtitle;

--6. Develop an SQL query that retrieves job listings from the "Jobs" table within a specified salary  range. Allow parameters for the minimum and maximum salary values.
--Display the job title, company name, location, and salary for each matching job. 

declare @min decimal(10,2) = 20000;
declare @max decimal(10,2) = 30000;

select j.jobtitle, c.companyname, j.joblocation, j.salary,j.jobid
from Jobs j
join Companies c on j.companyid = c.companyid
where j.salary between @min AND @max

--7. Write an SQL query that retrieves the job application history for a specific applicant. Allow a 
--parameter for the ApplicantID, and return a result set with the job titles, company names, and 
--application dates for all the jobs the applicant has applied to. 


declare @applicantid int =200

select j.jobtitle,j.jobid,c.companyname,a.applicationdate from Applications a
join Jobs j on a.jobid=j.jobid
join  Companies c on j.companyid=c.companyid
where a.applicantid=@applicantid

--8.Create an SQL query that calculates and displays the average salary offered by all companies for 
--job listings in the "Jobs" table. Ensure that the query filters out jobs with a salary of zero. 

select jobtitle ,avg(salary) as total from jobs
group by jobtitle

--9. Write an SQL query to identify the company that has posted the most job listings. Display the 
--company name along with the count of job listings they have posted. Handle ties if multiple 
--companies have the same maximum count. 

select top 1 with ties c.companyname, count(j.jobid) as jobcount
from Jobs j
join Companies c ON j.companyid = c.companyid
group by c.companyname
order by jobcount desc;

--10. Find the applicants who have applied for positions in companies located in 'CityX' and have at 
--least 3 years of experience. 

alter table Applicants add experience int;

update Applicants 
set experience = 
    case 
        when applicantid = 200 then 4
        when applicantid = 201 then 2
        when applicantid = 202 then 5
        when applicantid = 203 then 1
        when applicantid = 204 then 3
		when applicantid = 205 then 6
        when applicantid = 206 then 2
        when applicantid = 207 then 3
        when applicantid = 208 then 4
        when applicantid = 209 then 5
    end;

	select * from Applicants

select distinct a.firstname, a.lastname, a.email, a.experience
from applications app
join applicants a on app.applicantid = a.applicantid
join jobs j on app.jobid = j.jobid
join companies c on j.companyid = c.companyid
where c.companyloc = 'chennai' and a.experience >= 3;




--11. Retrieve a list of distinct job titles with salaries between $60,000 and $80,000. 

select distinct jobtitle from jobs 
where salary between 20000 and 40000;
select * from Jobs

--12. Find the jobs that have not received any applications.

select j.jobtitle 
from jobs j 
left join Applications ap on j.jobid = ap.jobid 
where ap.jobid is null;

--13. Retrieve a list of job applicants along with the companies they have applied to and the positions 
--they have applied for.

select ap.firstname, ap.lastname, c.companyname, j.jobtitle 
from Applications a 
join Applicants ap on a.applicantid = ap.applicantid 
join jobs j on a.jobid = j.jobid 
join Companies c on j.companyid = c.companyid;

--14. Retrieve a list of companies along with the count of jobs they have posted, even if they have not 
--received any applications.

select c.companyname, count(j.jobid) as total 
from Companies c 
left join jobs j on c.companyid = j.companyid 
group by c.companyname;

--15. List all applicants along with the companies and positions they have applied for, including those 
--who have not applied.
select a.firstname, a.lastname, coalesce(c.companyname, 'no company applied'), coalesce(j.jobtitle, 'no job applied') from Applicants a 
left join Applications app on a.applicantid = app.applicantid 
left join jobs j on app.jobid = j.jobid 
left join companies c on j.companyid = c.companyid;

--16. Find companies that have posted jobs with a salary higher than the average salary of all jobs. 
select distinct c.companyname from Companies c 
join jobs j on c.companyid = j.companyid 
where j.salary > (select avg(salary) from jobs where salary > 0);

--17. Display a list of applicants with their names and a concatenated string of their city and state. 



--18. Retrieve a list of jobs with titles containing either 'Developer' or 'Engineer'. 
select jobtitle 
from jobs 
where jobtitle like '%SDE%' or jobtitle like '%Accountant%';

--19. Retrieve a list of applicants and the jobs they have applied for, including those who have not 
--applied and jobs without applicants. 
select a.firstname, a.lastname, coalesce(j.jobtitle, 'no job applied') 
from Applicants a 
full join Applications ap on a.applicantid = ap.applicantid 
full join jobs j on ap.jobid = j.jobid;

--20. List all combinations of applicants and companies where the company is in a specific city and the 
--applicant has more than 2 years of experience. For example: city=Chennai
select  distinct a.firstname, a.lastname, c.companyname, c.companyloc
from Applicants a
cross join companies c
where c.companyloc = 'chennai' and a.experience > 2;

select * from Applicants



