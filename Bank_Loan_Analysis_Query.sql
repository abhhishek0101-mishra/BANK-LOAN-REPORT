-- create database bank_loan
-- use bank_loan

-- Total Loan Application
  select count(*) as Total_Loan_Application
from financial_loan;

-- MTD Loan Applications 
select count(id) as MTD_Total_Application
from financial_loan
where month(issue_date) = 12 and year(issue_date) = 2021;

-- PMTD Loan Applications        
SELECT COUNT(id) AS PMTD_Total_Applications FROM financial_loan
WHERE MONTH(issue_date) = 11;

-- Total Funded Amount
select sum(loan_amount) as Total_Funded_Amount
from financial_loan;

-- MTD Total Funded Amount
select sum(loan_amount) as MTD_Total_Funded_Amount
from financial_loan
where month(issue_date) = 12;

-- PMTD Total Funded Amount
select sum(loan_amount) as PMTD_Total_Funded_Amount
from financial_loan
where month(issue_date) = 11;

-- Total Amount Received
select sum(total_payment) as Total_Amount_Collected
from financial_loan;

-- MTD Total Amount Received
select sum(total_payment) as MTD_Total_Amount_Collected
from financial_loan
where month(issue_date) = 12;

-- PMTD Total Amount Received
select sum(total_payment) as PMTD_Total_Amount_Collected
from financial_loan
where month(issue_date) = 11;

-- Average Interest Rate
select avg(int_rate) * 100 as Average_Interest_Rate
from financial_loan;

-- MTD Average Interest
select avg(int_rate) * 100 as MTD_Average_Interest_Rate
from financial_loan
where month(issue_date) = 12;

-- PMTD Average Interest
select avg(int_rate) * 100 as PMTD_Average_Interest_Rate
from financial_loan
where month(issue_date) = 11;

-- Avg DTI
select avg(dti)*100 as Avg_dti 
from financial_loan;

-- MTD Avg DTI
select avg(dti)*100 as MTD_Avg_dti 
from financial_loan
where month(issue_date)= 12;

-- PMTD Avg DTI
select avg(dti)*100 as PMTD_Avg_dti 
from financial_loan
where month(issue_date)= 11financial_loan;

-- Good Loan Percentage
SELECT 
    (COUNT(CASE
        WHEN
            loan_status = 'Fully Paid'
                OR loan_status = 'Current'
        THEN
            id
    END) * 100) / COUNT(id) AS Good_Loan_Percentage
FROM
    financial_loan;

-- Good Loan Applications
select count(id) as Good_Loan_Application
from financial_loan
where loan_status = 'Fully Paid' OR loan_status = 'Current';

-- Good Loan Funded Amount
select sum(loan_amount) AS Good_Loan_Funded_amount from financial_loan
where loan_status = 'Fully Paid' OR loan_status = 'Current';

-- Good Loan Amount Received
select sum(total_payment) AS Good_Loan_amount_received FROM financial_loan
where loan_status = 'Fully Paid' OR loan_status = 'Current';


-- (((((BAD LOAN ISSUED)))))

-- Bad Loan Percentage
select (count(case
when loan_status = 'Charged Off' then id end) *100)/
count(id) as Bad_Loan_Percentage
from financial_loan;

-- Bad Loan Applications
select count(id) AS Bad_Loan_Applications from financial_loan;

-- Bad Loan Funded Amount
select sum(loan_amount) AS Bad_Loan_Funded_amount from financial_loan
where loan_status = 'Charged Off';

-- Bad Loan Amount Received
select sum(total_payment) as Bad_Loan_amount_received from financial_loan
where loan_status = 'Charged Off';

-- LOAN STATUS
SELECT loan_status, COUNT(id) AS LoanCount,
SUM(total_payment) AS Total_Amount_Received, SUM(loan_amount) AS Total_Funded_Amount,
AVG(int_rate * 100) AS Interest_Rate, AVG(dti * 100) AS DTI
from financial_loan
group by loan_status;

SELECT loan_status, 
SUM(total_payment) AS MTD_Total_Amount_Received, SUM(loan_amount) AS MTD_Total_Funded_Amount 
FROM financial_loan
WHERE MONTH(issue_date) = 12 
GROUP BY loan_status;

-- ((((BANK LOAN REPORT | OVERVIEW))))

-- MONTH
Select month(issue_date) as Month_Munber, date_format(issue_date, '%M') AS Month_name, 
count(id) AS Total_Loan_Applications,
sum(loan_amount) as Total_Funded_Amount,
sum(total_payment) as Total_Amount_Received
from financial_loan;

-- STATE
Select address_state as State, count(id) AS Total_Loan_Applications,
sum(loan_amount) AS Total_Funded_Amount, sum(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY address_state
ORDER BY address_state;

-- TERM
Select term as Term, count(id) as Total_Loan_Applications,
sum(loan_amount) as Total_Funded_Amount,
sum(total_payment) as Total_Amount_Received
from financial_loan
group by term
ORDER BY term;

-- EMPLOYEE LENGTH
Select emp_length as Employee_Length, count(id) as Total_Loan_Applications,
sum(loan_amount) as Total_Funded_Amount, 
sum(total_payment) as Total_Amount_Received
from financial_loan
group by emp_length
order by emp_length;

-- PURPOSE
select purpose AS PURPOSE, count(id) as Total_Loan_Applications,
sum(loan_amount) as Total_Funded_Amount, 
sum(total_payment) as Total_Amount_Received
from financial_loan
group by purpose
order by purpose;

-- HOME OWNERSHIP
Select home_ownership as Home_Ownership, 
count(id) as Total_Loan_Applications,
sum(loan_amount) as Total_Funded_Amount,
sum(total_payment) as Total_Amount_Received
from financial_loan
group by home_ownership
order by home_ownership;






   









