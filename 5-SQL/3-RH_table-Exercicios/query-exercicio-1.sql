-----------------------------------------------------------------------------------
--DDL statement for table 'HR' database--
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
-- EX 1 ---------------------------------------------------------------------------
-----------------------------------------------------------------------------------
-- 1. A nossa empresa é global possui diversos colaboradores e grupos de trabalho
--  ao redor do mundo. 
-- Recebemos uma solicitação da equipe de RH para a campanha "mulheres na 
-- tecnologia", na qual precisamos informar a quantidade de funcionários do sexo
-- Feminino dos grupos de trabalho Software Group e Architect Group que temos 
-- atualmente na empresa.
-----------------------------------------------------------------------------------
SELECT DEP_NAME, COUNT(F_NAME) AS "CONTAGEM" FROM EMPLOYEES AS E
JOIN JOB_HISTORY AS JH
  ON E.EMP_ID = JH.EMPL_ID
  JOIN DEPARTMENTS AS D
    ON JH.DEPT_ID = D.DEPT_ID_DEP
WHERE   
  SEX = "F"
  AND DEP_NAME IN ("Software Group", "Architect Group")
GROUP BY
  DEP_NAME
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
-- EX 2 ---------------------------------------------------------------------------
-----------------------------------------------------------------------------------
-- 2. Anualmente, o RH realiza campanhas ligadas a qualidade de vida dos 
-- trabalhadores. No mês de novembro é realizado o novembro azul, ligados a 
-- prevenção do cancêr de prostáta. 
-- Dessa forma, precisamos selecionar a lista de funcionários masculinos com idade
-- acima dos 40 anos de idade para o RH enviar um webmail de convite para a campanha.
-----------------------------------------------------------------------------------
-- DROP TABLE IF NEEDED
DROP TABLE IF EXISTS TEMP_E_B_DAY;

-- CREATE TABLE TO INSERT DATE
CREATE TEMPORARY TABLE IF NOT EXISTS TEMP_E_B_DAY (
  EMP_ID CHAR(9) NOT NULL,
  DIA CHAR(2) NOT NULL,
  MES CHAR(2) NOT NULL,
  ANO CHAR(4) NOT NULL,
  PRIMARY KEY (EMP_ID),
  FOREIGN KEY (EMP_ID) REFERENCES EMPLOYEES(EMP_ID)
);

-- INSERTING DATA INTO TABLE
INSERT INTO TEMP_E_B_DAY
SELECT 
  EMP_ID, substr(B_DATE, 4, 2) AS DIA, substr(B_DATE, 1, 2) AS MES, 
  substr(B_DATE, 7, 4) AS ANO
FROM 
  EMPLOYEES;

-- DROP TABLE IF NEEDED
DROP TABLE IF EXISTS TEMP_E_B_DATE;

-- RELACIONA COM TABELA ORIGINAL TRANSFORMANDO A DATA
CREATE TEMPORARY TABLE IF NOT EXISTS 'TEMP_E_B_DATE' AS
  SELECT 
    E.EMP_ID, DATE(ANO || "-" || MES || "-" || DIA) AS DATA_T,
    F_NAME || ' ' || L_NAME AS FULL_NAME
  FROM 
    EMPLOYEES AS E
  JOIN 
    TEMP_E_B_DAY AS TB
  ON
    E.EMP_ID = TB.EMP_ID;

-- CALCULA IDADE E MOSTRA HOMENS ACIMA DE 40 ANOS
SELECT
  EMP_ID, FULL_NAME,
  ROUND((JULIANDAY(DATE('now')) - JULIANDAY(DATA_T)) / 365) AS IDADE
FROM 
  TEMP_E_B_DATE;

-- DROPING TEMP TABLES
DROP TABLE IF EXISTS TEMP_E_B_DATE;

--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------
-- EX 3 ------------------------------------------------------------------------------
--------------------------------------------------------------------------------------
-- 3. A empresa está com um novo plano de bonificação de resultado para os funcionários
-- , a nova política PLR(Participação de resultados) nos diz que quando o funcionário 
-- tanto masculino quanto feminino tiver 10 ou mais anos de casa ele receberá com base no 
-- salário um percentual de 25 % de bonificação (1.25). Assim, construa uma nova coluna 
-- com a bonificacao das pessoas selecionadas na regra, as que estiverem fora mantém o mesmo 
-- salário.
--------------------------------------------------------------------------------------
-- DROP TABLE IF NEEDED
DROP TABLE IF EXISTS TEMP_E_S_DAY;

-- CREATE TABLE TO INSERT DATE
CREATE TEMPORARY TABLE IF NOT EXISTS TEMP_E_S_DAY (
  EMPL_ID CHAR(9) NOT NULL,
  DIA CHAR(2) NOT NULL,
  MES CHAR(2) NOT NULL,
  ANO CHAR(4) NOT NULL,
  PRIMARY KEY (EMPL_ID),
  FOREIGN KEY (EMPL_ID) REFERENCES EMPLOYEES(EMP_ID)
);

-- INSERTING DATA INTO TABLE
INSERT INTO TEMP_E_S_DAY
SELECT 
  EMPL_ID, substr(START_DATE, 4, 2) AS DIA, substr(START_DATE, 1, 2) AS MES, 
  substr(START_DATE, 7, 4) AS ANO
FROM 
  JOB_HISTORY;

-- DROP TABLE IF NEEDED
DROP TABLE IF EXISTS TEMP_E_S_DATE;

-- RELACIONA COM TABELA ORIGINAL TRANSFORMANDO A DATA
CREATE TEMPORARY TABLE IF NOT EXISTS 'TEMP_E_S_DATE' AS
  SELECT 
    E.EMP_ID, DATE(ANO || "-" || MES || "-" || DIA) AS DATA,
    F_NAME || ' ' || L_NAME AS FULL_NAME, SALARY
  FROM 
    EMPLOYEES AS E
  JOIN 
    TEMP_E_S_DAY AS TS
  ON
    E.EMP_ID = TS.EMPL_ID;

-- DROP TABLE IF NEEDED
DROP TABLE IF EXISTS TEMP_E_CONTIBUICAO;

-- CREATE TABLE COM COLUNA DE CONTRIBUICAO
CREATE TEMPORARY TABLE IF NOT EXISTS TEMP_E_CONTIBUICAO AS
  SELECT
    EMP_ID, FULL_NAME, DATA, SALARY,
    (ROUND((JULIANDAY(DATE('now')) - JULIANDAY(DATA)) / 365)) AS CONTRIBUICAO
  FROM 
    TEMP_E_S_DATE;

-- CALCULA SALARIO EM ANOS E PERCENTUAL DA PLR
SELECT
  EMP_ID, FULL_NAME,
CASE
  WHEN CONTRIBUICAO < 10  THEN 0
    ELSE ((CONTRIBUICAO - 10) * 1.25)
  END  AS PLR
FROM 
  TEMP_E_CONTIBUICAO;

-- DROPING CREATED TABLE
DROP TABLE IF EXISTS TEMP_E_S_DAY;
DROP TABLE IF EXISTS TEMP_E_S_DATE;
DROP TABLE IF EXISTS TEMP_E_CONTIBUICAO;

--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------
-- EX 4 ------------------------------------------------------------------------------
--------------------------------------------------------------------------------------
-- 4. A empresa presta serviço de consultoria para diversas empresas. Dessa forma, 
-- contratamos 3 novos funcionários para ajustar os quadros. Precisamos incluir no
-- sistema as informações desses novos colaboradores. Os salários seguem as tabelas
-- de remuneração jos mínima.
--    > - Nome: Carlos Almeida; NASC: 22/04/1997; SSN: 123420; SEXO: M; Endereço: 
--    Avenida Paes de Barros, 2300, Mooca, SP, Brasil; Posição: SCRUM MASTER, 
--    MANAGER_ID:30003 <br>
--    > - Nome: Amanda Torres; NASC: 22/04/1998; SSN: 123421; SEXO: F; Endereço:
--    R. Industrias , 500, Amadora, Lisboa, Portual; Posição: UX Designer, 
--    MANAGER_ID:30006 <br>
--    > - Nome: Kshulia Zila; NASC: 22/04/1990; SSN: 123422; SEXO: M; Endereço: 
--    Zuari Rd, 1450, New Vadden, GOA, INDIA; Posição: Architect Group, MANAGER_ID:30005
-------------------------------------------------------------------------------------
-- DROP IF NEEDED
DROP TABLE IF EXISTS ADC_FUNCIONARIOS;

-- CREATE TEMP TABLE FOR THE 3 COL -> MESMO SCHEMA DO EMPLOYEES
CREATE TEMPORARY TABLE IF NOT EXISTS ADC_FUNCIONARIOS (
                          EMP_ID CHAR(9) NOT NULL,
                          F_NAME VARCHAR(15) NOT NULL,
                          L_NAME VARCHAR(15) NOT NULL,
                          SSN CHAR(9),
                          B_DATE DATE,
                          SEX CHAR,
                          ADDRESS VARCHAR(30),
                          JOB_ID CHAR(9),
                          SALARY DECIMAL(10,2), 
                          MANAGER_ID CHAR(9),
                          DEP_ID CHAR(9),
                          PRIMARY KEY (EMP_ID),
                          FOREIGN KEY (JOB_ID) REFERENCES JOB_HISTORY(JOB_ID),
                          FOREIGN KEY (JOB_ID) REFERENCES Jobs(JOB_IDENT),
                          FOREIGN KEY (DEP_ID) REFERENCES Departments(DEPT_ID_DEP)
                        );

-- INSERIR NA TABELA RECEM CRIADA OS 3 FUNCIONARIOS SEM O SALARIO (PODE SER NULL)
INSERT INTO 
  ADC_FUNCIONARIOS
VALUES
( 'E1021', 'Carlos', 'Almeida', '123420','22/04/1997', 'M', 'Avenida Paes de Barros, 2300, Mooca, SP, Brasil', NULL, NULL,30003, NULL),
( 'E1022', 'Amanda', 'Torres', '123421', '22/04/1998', 'F', 'R. Industrias , 500, Amadora, Lisboa, Portugal', NULL, NULL, '30006', NULL),
( 'E1023', 'Kshulia', 'Zila', '123422', '22/04/1990', 'M', 'Zuari Rd, 1450, New Vadden, GOA, INDIA', NULL, NULL, '30005', NULL);

-- CALCULATE MIN VALUE FOR THEIR JOBS
----- INSERTING MIN SALARIES
-- E1021
UPDATE ADC_FUNCIONARIOS SET SALARY = (
  SELECT
    MIN(MIN_SALARY)
  FROM 
    JOBS
  WHERE
    JOB_TITLE LIKE "%Scrum%"
)
WHERE 
  EMP_ID = 'E1021';

-- E1022
UPDATE ADC_FUNCIONARIOS SET SALARY = (
  SELECT
    MIN(MIN_SALARY)
  FROM 
    JOBS
  WHERE
    JOB_TITLE LIKE "%UX Designer%"
)
WHERE 
  EMP_ID = 'E1022';

-- E1023
UPDATE ADC_FUNCIONARIOS SET SALARY = (
  SELECT
    MIN(MIN_SALARY)
  FROM 
    JOBS
  WHERE
    JOB_TITLE LIKE "%Architect%"
)
WHERE 
  EMP_ID = 'E1023';

----- INSERTING DEPARTMENTS
-- E1021
UPDATE ADC_FUNCIONARIOS SET DEP_ID = (
  SELECT
    R.DEPT_ID_DEP
  FROM 
    ADC_FUNCIONARIOS AS L
  JOIN 
    DEPARTMENTS AS R
  ON
    L.MANAGER_ID = R.MANAGER_ID
  WHERE
    L.EMP_ID = 'E1021'
)
WHERE 
  EMP_ID = 'E1021';

-- E1022
UPDATE ADC_FUNCIONARIOS SET DEP_ID = (
  SELECT
    R.DEPT_ID_DEP
  FROM 
    ADC_FUNCIONARIOS AS L
  JOIN 
    DEPARTMENTS AS R
  ON
    L.MANAGER_ID = R.MANAGER_ID
  WHERE
    L.EMP_ID = 'E1022'
)
WHERE 
  EMP_ID = 'E1022';

-- E1023
UPDATE ADC_FUNCIONARIOS SET DEP_ID = (
  SELECT
    R.DEPT_ID_DEP
  FROM 
    ADC_FUNCIONARIOS AS L
  JOIN 
    DEPARTMENTS AS R
  ON
    L.MANAGER_ID = R.MANAGER_ID
  WHERE
    L.EMP_ID = 'E1023'
)
WHERE 
  EMP_ID = 'E1023';

-- INSERT INTO TABLE
INSERT INTO EMPLOYEES
SELECT * FROM ADC_FUNCIONARIOS;

-- DROP IF NEEDED
DROP TABLE IF EXISTS ADC_FUNCIONARIOS;
-------------------------------------------------------------------------------------