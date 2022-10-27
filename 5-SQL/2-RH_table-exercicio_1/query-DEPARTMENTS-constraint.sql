-- SQLite
-- to efective create a foreign key with hard constraint where null values are not permitted
-- got to specify it on the table schema
DROP TABLE EMPLOYEES;

CREATE TABLE EMPLOYEES (
                          EMP_ID CHAR(9) NOT NULL,
                          F_NAME VARCHAR(15) NOT NULL,
                          L_NAME VARCHAR(15) NOT NULL,
                          SSN CHAR(9),
                          B_DATE DATE,
                          SEX CHAR,
                          ADDRESS VARCHAR(30),
                          JOB_ID CHAR(9),
                          SALARY DECIMAL(10,2),
                          MANAGER_ID CHAR(9) NOT NULL,
                          DEP_ID CHAR(9) NOT NULL,
                          PRIMARY KEY (EMP_ID, MANAGER_ID),
                          FOREIGN KEY (EMP_ID) REFERENCES EMPLOYEES(MANAGER_ID),
                          FOREIGN KEY (JOB_ID) REFERENCES JOB_HISTORY(JOB_ID),
                          FOREIGN KEY (JOB_ID) REFERENCES Jobs(JOB_IDENT),
                          FOREIGN KEY (DEP_ID) REFERENCES Departments(DEPT_ID_DEP)
                        );

INSERT INTO 'Employees' (EMP_ID,F_NAME,L_NAME,SSN,B_DATE,SEX,ADDRESS,JOB_ID,SALARY,MANAGER_ID,DEP_ID) VALUES 
 ('E1001','John','Thomas','123456','01/09/1976','M','5631 Rice, OakPark,IL','100','100000','30001','2'), 
 ('E1002','Alice','James','123457','07/31/1972','F','980 Berry ln, Elgin,IL','200','80000','30002','5'), 
 ('E1003','Steve','Wells','123458','08/10/1980','M','291 Springs, Gary,IL','300','50000','30002','5'), 
 ('E1004','Santosh','Kumar','123459','07/20/1985','M','511 Aurora Av, Aurora,IL','400','60000','30004','5'), 
 ('E1005','Ahmed','Hussain','123410','01/04/1981','M','216 Oak Tree, Geneva,IL','500','70000','30001','2'), 
 ('E1006','Nancy','Allen','123411','02/06/1978','F','111 Green Pl, Elgin,IL','600','90000','30001','2'), 
 ('E1007','Mary','Thomas','123412','05/05/1975','F','100 Rose Pl, Gary,IL','650','65000','30003','7'),
 ('E1008','Bharath','Gupta','123413','05/06/1985','M','145 Berry Ln, Naperville,IL','660','65000','30003','7'), 
 ('E1009','Andrea','Jones','123414','07/09/1990','F','120 Fall Creek, Gary,IL','234','70000','30003','7'), 
 ('E1010','Ann','Jacob','123415','03/30/1982','F','111 Britany Springs,Elgin,IL','220','70000','30004','5'),
 ('E1011','Amanda','Gusmao','123456','01/09/1985','F','1157 Paulista, Tutoia, SP','760','150000','30004','8'), 
 ('E1012','Vanessa','Silva','123457','07/31/1982','F','1157 Paulista, Tutoia, SP','720','90000','30004','8'), 
 ('E1013','Khusia','Ibshia','123458','08/10/1980','M','122005 Bandhwari, Gwal Pahari Village, ND','600','100000','30005','9'), 
 ('E1014','Santosh','Zhash','123459','14/20/1988','M','122005 Bandhwari, Gwal Pahari Village, ND','600','100000','30005','9'), 
 ('E1015','Jorge','Paulo','123410','01/04/1981','M','1157 Paulista, Tutoia, SP','500','70000','30001','8'), 
 ('E1016','Clary','Allen','123411','02/08/1978','F','111 Green Pl, Elgin,IL','600','90000','30001','2'), 
 ('E1017','Amanda','Thomas','123412','05/05/1975','F','100 Rose Pl, Gary,IL','650','65000','30003','7'),
 ('E1018','John ','Harry','123413','05/06/1985','M','145 Berry Ln, Naperville,IL','660','65000','30003','7'), 
 ('E1019','Andrea','Maria','123414','19/09/1990','F','120 Rua do Porto Lisboa,PT','780','70000','30003','10'),
 ('E1020','Roberta','Lima','123415','21/30/1982','F','120 Rua do Porto Lisboa,PT','780','70000','30004','10'),
 ('E1021','Mauricio','Helfstein','123414','19/09/1994','M','120 Rua do Brás, SP','000','70000','30003','00'),
 ('E1022','Lucas','Roberto','123415','21/30/1995','M','120 Rua da Mooca,SP','000','70000','30004','00');



DROP TABLE DEPARTMENTS;

CREATE TABLE DEPARTMENTS (
                            DEPT_ID_DEP CHAR(9) NOT NULL,
                            DEP_NAME VARCHAR(15),
                            MANAGER_ID CHAR(9),
                            LOC_ID CHAR(9),
                            PRIMARY KEY (DEPT_ID_DEP),
                            FOREIGN KEY (LOC_ID) REFERENCES LOCATIONS(LOCT_ID),
                            FOREIGN KEY (MANAGER_ID) REFERENCES EMPLOYEES(MANAGER_ID)
                          );

INSERT INTO 'DEPARTMENTS' (DEPT_ID_DEP,DEP_NAME,MANAGER_ID,LOC_ID) VALUES 
 ('2','Architect Group','30001','L0001'), 
 ('5','Software Group','30002','L0002'), 
 ('7','Design Team','30003','L0003'),
 ('8','Software Group','30004','L0004'),
 ('9','Architect Group','30005','L0005');

 INSERT INTO 'DEPARTMENTS' (DEPT_ID_DEP,DEP_NAME,MANAGER_ID,LOC_ID) VALUES 
 ('10','Design Team','30006','L0006');