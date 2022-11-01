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
CREATE TABLE IF NOT EXISTS TEMP_E_B_DAY (
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
CREATE TABLE IF NOT EXISTS 'TEMP_E_B_DATE' AS
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
DROP TABLE IF EXISTS TEMP_E_B_DAY;
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
SELECT
  *
FROM
  EMPLOYEES
CASE 