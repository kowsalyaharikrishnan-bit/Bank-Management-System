CREATE TABLE CUSTOMER (
    customer_id     NUMBER PRIMARY KEY,
    customer_name   VARCHAR2(50) NOT NULL,
    phone           VARCHAR2(15) UNIQUE NOT NULL,
    email           VARCHAR2(50) UNIQUE,
    city            VARCHAR2(50)
);

CREATE TABLE BRANCH (
    branch_id     NUMBER PRIMARY KEY,
    branch_name   VARCHAR2(50) NOT NULL,
    city          VARCHAR2(50) NOT NULL
);

CREATE TABLE ACCOUNT (
    account_id      NUMBER PRIMARY KEY,
    customer_id     NUMBER NOT NULL,
    branch_id       NUMBER NOT NULL,
    account_type    VARCHAR2(20) NOT NULL CHECK (account_type IN ('SAVINGS','CURRENT')),
    balance         NUMBER(12,2) NOT NULL CHECK (balance >= 0),
    opening_date    DATE NOT NULL,
    CONSTRAINT fk_account_customer FOREIGN KEY (customer_id) REFERENCES CUSTOMER(customer_id),
    CONSTRAINT fk_account_branch   FOREIGN KEY (branch_id)   REFERENCES BRANCH(branch_id)
);

CREATE TABLE EMPLOYEE (
    employee_id     NUMBER PRIMARY KEY,
    employee_name   VARCHAR2(50) NOT NULL,
    branch_id       NUMBER NOT NULL,
    designation     VARCHAR2(30) NOT NULL,
    salary          NUMBER(10,2) NOT NULL CHECK (salary > 0),
    CONSTRAINT fk_employee_branch FOREIGN KEY (branch_id) REFERENCES BRANCH(branch_id)
);

CREATE TABLE BANK_TRANSACTION (
    transaction_id    NUMBER PRIMARY KEY,
    account_id        NUMBER NOT NULL,
    transaction_type  VARCHAR2(20) NOT NULL CHECK (transaction_type IN ('DEPOSIT','WITHDRAWAL')),
    amount            NUMBER(12,2) NOT NULL CHECK (amount > 0),
    transaction_date  DATE NOT NULL,
    CONSTRAINT fk_transaction_account FOREIGN KEY (account_id) REFERENCES ACCOUNT(account_id)
);

ALTER TABLE CUSTOMER ADD (customer_status VARCHAR2(20));
ALTER TABLE EMPLOYEE MODIFY (designation VARCHAR2(40));

INSERT INTO BRANCH VALUES (1, 'Chennai Main', 'Chennai');
INSERT INTO BRANCH VALUES (2, 'Bengaluru MG Road', 'Bengaluru');
INSERT INTO BRANCH VALUES (3, 'Karaikal Branch', 'Karaikal');

INSERT INTO CUSTOMER VALUES (1, 'Arun Kumar', '9876543210', 'arun@mail.com', 'Chennai', 'ACTIVE');
INSERT INTO CUSTOMER VALUES (2, 'Divya Sri', '9876543211', 'divya@mail.com', 'Bengaluru', 'ACTIVE');
INSERT INTO CUSTOMER VALUES (3, 'Kowsalya P', '9876543212', 'kowsalya@mail.com', 'Karaikal', 'ACTIVE');
INSERT INTO CUSTOMER VALUES (4, 'Ravi Shankar', '9876543213', 'ravi@mail.com', 'Chennai', 'ACTIVE');
INSERT INTO CUSTOMER VALUES (5, 'Meena Loshini', '9876543214', 'meena@mail.com', 'Pondicherry', 'INACTIVE');
INSERT INTO CUSTOMER VALUES (6, 'Suresh Babu', '9876543215', 'suresh@mail.com', 'Bengaluru', 'ACTIVE');
INSERT INTO CUSTOMER VALUES (7, 'Priya Dharshini', '9876543216', 'priya@mail.com', 'Chennai', 'ACTIVE');
INSERT INTO CUSTOMER VALUES (8, 'Karthik Raja', '9876543217', 'karthik@mail.com', 'Karaikal', 'ACTIVE');
INSERT INTO CUSTOMER VALUES (9, 'Lakshmi Narayanan', '9876543218', 'lakshmi@mail.com', 'Bengaluru', 'INACTIVE');
INSERT INTO CUSTOMER VALUES (10, 'Vignesh Waran', '9876543219', 'vignesh@mail.com', 'Chennai', 'ACTIVE');

INSERT INTO ACCOUNT VALUES (101, 1, 1, 'SAVINGS', 25000, DATE '2022-01-15');
INSERT INTO ACCOUNT VALUES (102, 2, 2, 'CURRENT', 150000, DATE '2021-06-10');
INSERT INTO ACCOUNT VALUES (103, 3, 3, 'SAVINGS', 8000, DATE '2023-03-22');
INSERT INTO ACCOUNT VALUES (104, 4, 1, 'SAVINGS', 45000, DATE '2020-11-05');
INSERT INTO ACCOUNT VALUES (105, 5, 2, 'CURRENT', 2000, DATE '2023-07-19');
INSERT INTO ACCOUNT VALUES (106, 6, 2, 'SAVINGS', 62000, DATE '2019-09-30');
INSERT INTO ACCOUNT VALUES (107, 7, 1, 'SAVINGS', 15500, DATE '2022-12-01');
INSERT INTO ACCOUNT VALUES (108, 8, 3, 'CURRENT', 98000, DATE '2021-02-14');
INSERT INTO ACCOUNT VALUES (109, 9, 2, 'SAVINGS', 3200, DATE '2023-05-08');
INSERT INTO ACCOUNT VALUES (110, 10, 1, 'SAVINGS', 71000, DATE '2020-08-25');

INSERT INTO EMPLOYEE VALUES (201, 'Anitha Rangan', 1, 'Branch Manager', 65000);
INSERT INTO EMPLOYEE VALUES (202, 'Balaji Murugan', 1, 'Clerk', 28000);
INSERT INTO EMPLOYEE VALUES (203, 'Chitra Selvam', 2, 'Branch Manager', 70000);
INSERT INTO EMPLOYEE VALUES (204, 'Dinesh Kanna', 2, 'Cashier', 26000);
INSERT INTO EMPLOYEE VALUES (205, 'Elavarasi M', 2, 'Clerk', 27000);
INSERT INTO EMPLOYEE VALUES (206, 'Gopinath S', 3, 'Branch Manager', 60000);
INSERT INTO EMPLOYEE VALUES (207, 'Hema Latha', 3, 'Cashier', 25000);
INSERT INTO EMPLOYEE VALUES (208, 'Iniya Bharathi', 1, 'Cashier', 26500);

INSERT INTO BANK_TRANSACTION VALUES (1001, 101, 'DEPOSIT', 5000, DATE '2024-01-05');
INSERT INTO BANK_TRANSACTION VALUES (1002, 101, 'WITHDRAWAL', 2000, DATE '2024-01-10');
INSERT INTO BANK_TRANSACTION VALUES (1003, 102, 'DEPOSIT', 20000, DATE '2024-01-12');
INSERT INTO BANK_TRANSACTION VALUES (1004, 102, 'WITHDRAWAL', 5000, DATE '2024-01-15');
INSERT INTO BANK_TRANSACTION VALUES (1005, 103, 'DEPOSIT', 1000, DATE '2024-01-18');
INSERT INTO BANK_TRANSACTION VALUES (1006, 104, 'DEPOSIT', 8000, DATE '2024-01-20');
INSERT INTO BANK_TRANSACTION VALUES (1007, 104, 'WITHDRAWAL', 3000, DATE '2024-01-22');
INSERT INTO BANK_TRANSACTION VALUES (1008, 105, 'DEPOSIT', 500, DATE '2024-01-25');
INSERT INTO BANK_TRANSACTION VALUES (1009, 106, 'DEPOSIT', 12000, DATE '2024-02-01');
INSERT INTO BANK_TRANSACTION VALUES (1010, 106, 'WITHDRAWAL', 4000, DATE '2024-02-03');
INSERT INTO BANK_TRANSACTION VALUES (1011, 107, 'DEPOSIT', 2500, DATE '2024-02-05');
INSERT INTO BANK_TRANSACTION VALUES (1012, 108, 'DEPOSIT', 15000, DATE '2024-02-08');
INSERT INTO BANK_TRANSACTION VALUES (1013, 108, 'WITHDRAWAL', 6000, DATE '2024-02-10');
INSERT INTO BANK_TRANSACTION VALUES (1014, 109, 'DEPOSIT', 800, DATE '2024-02-12');
INSERT INTO BANK_TRANSACTION VALUES (1015, 110, 'DEPOSIT', 10000, DATE '2024-02-15');
INSERT INTO BANK_TRANSACTION VALUES (1016, 110, 'WITHDRAWAL', 2500, DATE '2024-02-18');
INSERT INTO BANK_TRANSACTION VALUES (1017, 101, 'DEPOSIT', 3000, DATE '2024-02-20');
INSERT INTO BANK_TRANSACTION VALUES (1018, 102, 'DEPOSIT', 10000, DATE '2024-02-22');
INSERT INTO BANK_TRANSACTION VALUES (1019, 103, 'WITHDRAWAL', 500, DATE '2024-02-25');
INSERT INTO BANK_TRANSACTION VALUES (1020, 104, 'DEPOSIT', 6000, DATE '2024-03-01');
INSERT INTO BANK_TRANSACTION VALUES (1021, 105, 'WITHDRAWAL', 200, DATE '2024-03-03');
INSERT INTO BANK_TRANSACTION VALUES (1022, 106, 'DEPOSIT', 9000, DATE '2024-03-05');
INSERT INTO BANK_TRANSACTION VALUES (1023, 107, 'WITHDRAWAL', 1000, DATE '2024-03-08');
INSERT INTO BANK_TRANSACTION VALUES (1024, 109, 'DEPOSIT', 1500, DATE '2024-03-10');
INSERT INTO BANK_TRANSACTION VALUES (1025, 110, 'DEPOSIT', 5000, DATE '2024-03-12');

COMMIT;

UPDATE ACCOUNT SET balance = balance + 5000 WHERE account_id = 101;

SAVEPOINT before_delete;

DELETE FROM BANK_TRANSACTION WHERE transaction_id = 1025;

ROLLBACK TO before_delete;

COMMIT; 

SELECT * FROM CUSTOMER;

SELECT customer_name, phone, city FROM CUSTOMER;

SELECT * FROM CUSTOMER WHERE city = 'Chennai';

SELECT * FROM ACCOUNT WHERE balance > 50000;

SELECT * FROM ACCOUNT WHERE balance BETWEEN 10000 AND 60000;

SELECT * FROM ACCOUNT WHERE account_type = 'SAVINGS';

SELECT * FROM BANK_TRANSACTION WHERE transaction_type = 'WITHDRAWAL';

SELECT * FROM ACCOUNT WHERE account_type = 'SAVINGS' AND balance > 20000;
SELECT * FROM ACCOUNT WHERE account_type = 'SAVINGS' OR balance > 90000;
SELECT * FROM ACCOUNT WHERE NOT account_type = 'CURRENT';

SELECT * FROM ACCOUNT WHERE balance = 25000;
SELECT * FROM ACCOUNT WHERE balance <> 25000;
SELECT * FROM ACCOUNT WHERE balance > 25000;
SELECT * FROM ACCOUNT WHERE balance < 25000;
SELECT * FROM ACCOUNT WHERE balance >= 25000;
SELECT * FROM ACCOUNT WHERE balance <= 25000;

SELECT * FROM CUSTOMER WHERE city IN ('Chennai','Karaikal');
SELECT * FROM ACCOUNT WHERE balance BETWEEN 20000 AND 70000;
SELECT * FROM CUSTOMER WHERE customer_name LIKE 'K%';

SELECT * FROM ACCOUNT ORDER BY balance ASC;
SELECT * FROM ACCOUNT ORDER BY balance DESC;

SELECT UPPER(customer_name) AS upper_name, LOWER(customer_name) AS lower_name FROM CUSTOMER;

SELECT customer_name, LENGTH(customer_name) AS name_length, SUBSTR(customer_name, 1, 3) AS short_name
FROM CUSTOMER;

SELECT account_id, balance, ROUND(balance, -3) AS rounded_balance, MOD(account_id, 2) AS id_mod
FROM ACCOUNT;

SELECT account_id, opening_date, opening_date + 30 AS after_30_days,
    SYSDATE - opening_date AS days_since_opening
FROM ACCOUNT;

SELECT account_id, TO_CHAR(opening_date, 'DD-MON-YYYY') AS formatted_date FROM ACCOUNT;

SELECT customer_name, NVL(email, 'NOT PROVIDED') AS email_display FROM CUSTOMER;

SELECT account_id, balance,
       CASE
           WHEN balance < 10000 THEN 'LOW'
           WHEN balance BETWEEN 10000 AND 50000 THEN 'MEDIUM'
           ELSE 'HIGH'
       END AS balance_category
FROM ACCOUNT;

SELECT (SELECT COUNT(*) FROM CUSTOMER) AS total_customers,
       (SELECT COUNT(*) FROM ACCOUNT) AS total_accounts
FROM DUAL;

SELECT SUM(balance) AS total_balance, AVG(balance) AS avg_balance,
       MAX(balance) AS highest_balance, MIN(balance) AS lowest_balance
FROM ACCOUNT;

SELECT city, COUNT(*) AS customer_count FROM CUSTOMER GROUP BY city;

SELECT account_type, COUNT(*) AS account_count FROM ACCOUNT GROUP BY account_type;

SELECT account_type, SUM(balance) AS total_balance FROM ACCOUNT GROUP BY account_type;

SELECT branch_id, AVG(salary) AS avg_salary FROM EMPLOYEE GROUP BY branch_id;

SELECT account_type, SUM(balance) AS total_balance
FROM ACCOUNT
GROUP BY account_type
HAVING SUM(balance) > 100000;

SELECT c.customer_name, a.account_id, a.balance
FROM CUSTOMER c
JOIN ACCOUNT a ON c.customer_id = a.customer_id;

SELECT c.customer_name, a.account_type, b.branch_name
FROM CUSTOMER c
JOIN ACCOUNT a ON c.customer_id = a.customer_id
JOIN BRANCH b ON a.branch_id = b.branch_id;

SELECT e.employee_name, e.designation, b.branch_name
FROM EMPLOYEE e
JOIN BRANCH b ON e.branch_id = b.branch_id;

SELECT t.transaction_id, t.transaction_type, t.amount, a.account_id, a.account_type
FROM BANK_TRANSACTION t
JOIN ACCOUNT a ON t.account_id = a.account_id;

SELECT c.customer_name, a.account_id
FROM CUSTOMER c
LEFT OUTER JOIN ACCOUNT a ON c.customer_id = a.customer_id;

SELECT b.branch_name, e.employee_name
FROM BRANCH b
LEFT OUTER JOIN EMPLOYEE e ON b.branch_id = e.branch_id;

SELECT account_id, balance, RANK() OVER (ORDER BY balance DESC) AS balance_rank
FROM ACCOUNT;

SELECT account_id, balance, ROW_NUMBER() OVER (ORDER BY balance DESC) AS row_num
FROM ACCOUNT;

SELECT employee_name, branch_id, salary,
       RANK() OVER (PARTITION BY branch_id ORDER BY salary DESC) AS salary_rank_in_branch
FROM EMPLOYEE;

SELECT transaction_id, account_id, amount,
       SUM(amount) OVER (ORDER BY transaction_date) AS running_total
FROM BANK_TRANSACTION;

SELECT transaction_id, account_id, amount,
       LAG(amount) OVER (PARTITION BY account_id ORDER BY transaction_date) AS previous_amount,
       LEAD(amount) OVER (PARTITION BY account_id ORDER BY transaction_date) AS next_amount
FROM BANK_TRANSACTION;

WITH balance_by_type AS (
    SELECT account_type, SUM(balance) AS total_balance
    FROM ACCOUNT
    GROUP BY account_type
)
SELECT * FROM balance_by_type;

WITH txn_totals AS (
    SELECT account_id, SUM(amount) AS total_txn_amount
    FROM BANK_TRANSACTION
    GROUP BY account_id
)
SELECT a.account_id, a.account_type, t.total_txn_amount
FROM ACCOUNT a
JOIN txn_totals t ON a.account_id = t.account_id;

WITH avg_salary_by_branch AS (
    SELECT branch_id, AVG(salary) AS avg_salary
    FROM EMPLOYEE
    GROUP BY branch_id
)
SELECT b.branch_name, s.avg_salary
FROM BRANCH b
JOIN avg_salary_by_branch s ON b.branch_id = s.branch_id;

WITH customer_accounts AS (
    SELECT c.customer_id, c.customer_name, a.account_id, a.account_type, a.balance
    FROM CUSTOMER c
    JOIN ACCOUNT a ON c.customer_id = a.customer_id
),
account_txn_summary AS (
    SELECT account_id, COUNT(*) AS txn_count, SUM(amount) AS total_txn_amount
    FROM BANK_TRANSACTION
    GROUP BY account_id
)
SELECT ca.customer_name, ca.account_id, ca.account_type, ca.balance,
       ats.txn_count, ats.total_txn_amount
FROM customer_accounts ca
LEFT JOIN account_txn_summary ats ON ca.account_id = ats.account_id;







