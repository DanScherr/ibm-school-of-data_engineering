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
  TEMP_E_B_DATE
WHERE
  IDADE >= 40;

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
                          EMP_ID CHAR(9),
                          F_NAME VARCHAR(15),
                          L_NAME VARCHAR(15),
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
( '1', 'Carlos', 'Almeida', '123420','22/04/1997', 'M', 'Avenida Paes de Barros, 2300, Mooca, SP, Brasil', NULL, NULL,30003, NULL),
( '2', 'Amanda', 'Torres', '123421', '22/04/1998', 'F', 'R. Industrias , 500, Amadora, Lisboa, Portugal', NULL, NULL, '30006', NULL),
( '3', 'Kshulia', 'Zila', '123422', '22/04/1990', 'M', 'Zuari Rd, 1450, New Vadden, GOA, INDIA', NULL, NULL, '30005', NULL);

-- CALCULATE MIN VALUE FOR THEIR JOBS
-- INSERTING EMP_ID
-- FIRST ONE
UPDATE ADC_FUNCIONARIOS SET EMP_ID = (
  SELECT 
    SUBSTR(EMP_ID, 0, 5) || CAST(SUBSTR(EMP_ID, -1, 1) + 1 AS TEXT) AS EMP_ID
  FROM 
    EMPLOYEES
  ORDER BY EMP_ID DESC
  LIMIT 1
)
WHERE 
  EMP_ID = '1';

-- SECOND ONE
UPDATE ADC_FUNCIONARIOS SET EMP_ID = (
  SELECT 
    SUBSTR(EMP_ID, 0, 5) || CAST(SUBSTR(EMP_ID, -1, 1) + 1 AS TEXT) AS EMP_ID
  FROM 
    ADC_FUNCIONARIOS
  ORDER BY EMP_ID DESC
  LIMIT 1
)
WHERE 
  EMP_ID = '2';

-- THIRD ONE
UPDATE ADC_FUNCIONARIOS SET EMP_ID = (
  SELECT 
    SUBSTR(EMP_ID, 0, 5) || CAST(SUBSTR(EMP_ID, -1, 1) + 1 AS TEXT) AS EMP_ID
  FROM 
    ADC_FUNCIONARIOS
  ORDER BY EMP_ID DESC
  LIMIT 1
)
WHERE 
  EMP_ID = '3';

----- INSERTING JOBS_IDs
-- E1021
UPDATE ADC_FUNCIONARIOS SET JOB_ID = (
  SELECT
    JOB_IDENT
  FROM 
    JOBS
  WHERE
    JOB_TITLE LIKE "%Scrum%"
)
WHERE 
  EMP_ID = 'E1021';

-- E1022
UPDATE ADC_FUNCIONARIOS SET JOB_ID = (
  SELECT
    JOB_IDENT
  FROM 
    JOBS
  WHERE
    JOB_TITLE LIKE "%UX Designer%"
)
WHERE 
  EMP_ID = 'E1022';

-- E1023
UPDATE ADC_FUNCIONARIOS SET JOB_ID = (
  SELECT
    JOB_IDENT
  FROM 
    JOBS
  WHERE
    JOB_TITLE LIKE "%Architect%"
)
WHERE 
  EMP_ID = 'E1023';

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
--------------------------------------------------------------------------------------
-- EX 5 ------------------------------------------------------------------------------
--------------------------------------------------------------------------------------
-- 5. Após inserir os funcionários e juntar novamente as tabelas no tabelão você notou
-- alguns brancos, ou seja, valores nulos nas tabelas.
-- Explique por que isso ocorreu? Além disso, realize um plano de ação para que que 
-- não tenhamos informações nulas na tabela.
--------------------------------------------------------------------------------------
-- DROP TABEL if needed
DROP TABLE IF EXISTS 'A_TABELAO';

-- CRIANDO TABELA COM VÁRIOS JOINS
CREATE TABLE 'A_TABELAO' AS 
SELECT * FROM EMPLOYEES as e
INNER JOIN DEPARTMENTS as d ON e.dep_id = d.DEPT_ID_DEP
INNER JOIN LOCATIONS as l ON d.LOC_ID = l.LOCT_ID
INNER JOIN JOBS as f ON E.JOB_ID = f.JOB_IDENT
INNER JOIN JOB_HISTORY as j ON e.EMP_ID = j.EMPL_ID;

-- Resposta:
-- Não há possibilidade de colunas em branco a não ser se não forem inseridos valores
-- na tabela de EMPLOYEES. O que pode acontecer, é de alguns dados (linhas) faltarem, 
-- caso as novas linhas adicionadas em EMPLOYEES faltarem alguma chave estrangeira 
-- utilizada para relacionar na query que constitui a Tabelona, por ter sido usado
-- inner join.

-- Resposta:
-- O que pode ser feito é adicionar constraints para evitar valores nulos e constraint
-- de chave estrangeira para se criarem vinculos de obrigatoriedade de pertencimento

-- Como, por exemplo, não foram adicionadas linhas em JOB_HISTORY para os novos
-- empregados. Com isso, a Tabelona só consegue rodar trazendo todos os funcionários,
-- incluindo os novos, caso se adicione novas linhas com seus IDs em JOB_HISTORY

-- Outra maneira de solucionar este problema seria usar o left join na ultima linha
-- da composição do tabelao (como mostrado na query a baixo). Porém, como descreve 
-- o enunciado, esta tabela iria apresentar valores nulos, provenientes da tabela 
-- JOB_HISTORY, que poderia ser solucionado, como já comentado, adicionando a esta 
-- tabela novas linhas com os dados dos novos funcionarios e criar CONSTRAINTS para 
-- inserir obrigatoriedades de inserção de dados.

-- DROP TABEL if needed
DROP TABLE IF EXISTS 'A_TABELAO';

-- CRIANDO TABELA COM VÁRIOS JOINS
CREATE TABLE 'A_TABELAO' AS 
SELECT * FROM EMPLOYEES as e
INNER JOIN DEPARTMENTS as d ON e.dep_id = d.DEPT_ID_DEP
INNER JOIN LOCATIONS as l ON d.LOC_ID = l.LOCT_ID
INNER JOIN JOBS as f ON E.JOB_ID = f.JOB_IDENT
LEFT JOIN JOB_HISTORY as j ON e.EMP_ID = j.EMPL_ID;


-- DROPING IF NEEDED
DROP TABLE ADC_JOBS_HISTORY;

-- INSERTING NEW LINES ON JOB_HISTORY
CREATE TABLE IF NOT EXISTS 
  ADC_JOBS_HISTORY (
                    EMPL_ID CHAR(9),
                    START_DATE DATE,
                    JOBS_ID CHAR(9),
                    DEPT_ID CHAR(9),
                    PRIMARY KEY (EMPL_ID,JOBS_ID),
                    FOREIGN KEY (JOBS_ID) REFERENCES JOBS(JOB_IDENT)
                  );

-- INSERTING DATA THAT IS MISSING TO ADC_JOBS_HISTORY FROM EMPLOYEES
INSERT INTO 
  ADC_JOBS_HISTORY (EMPL_ID, JOBS_ID, DEPT_ID)
  SELECT
    EMP_ID, JOB_ID, DEP_ID
  FROM
    EMPLOYEES AS E
  OUTER LEFT JOIN 
    JOB_HISTORY AS JH
  ON
    E.EMP_ID = JH.EMPL_ID
  WHERE 
    JH.EMPL_ID IS NULL;

-- UPDATING DATE COLUMN THAT IS MISSING (THIS WOULD HAVE BEEN UPDATED FROM A
-- BACK END APP)
UPDATE ADC_JOBS_HISTORY SET START_DATE = strftime('%d/%m/%Y', 'now')

-- INSERTING INTO JOBS_HISTORY
INSERT INTO 
  JOB_HISTORY
  SELECT 
    *
  FROM
    ADC_JOBS_HISTORY

-- RODANDO NOVAMENTE A QUERY INICIAL DO TABELAO COM TUDO ATUALIZADO SEM NULLs
-- DROP TABEL if needed
DROP TABLE IF EXISTS 'A_TABELAO';

-- CRIANDO TABELA COM VÁRIOS JOINS
CREATE TABLE 'A_TABELAO' AS 
SELECT * FROM EMPLOYEES as e
INNER JOIN DEPARTMENTS as d ON e.dep_id = d.DEPT_ID_DEP
INNER JOIN LOCATIONS as l ON d.LOC_ID = l.LOCT_ID
INNER JOIN JOBS as f ON E.JOB_ID = f.JOB_IDENT
INNER JOIN JOB_HISTORY as j ON e.EMP_ID = j.EMPL_ID;

-------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------
-- EX 6 ------------------------------------------------------------------------------
--------------------------------------------------------------------------------------
-- 6. O RH solicitou para a equipe de desenvolvimento que o Tabelao de registro dos 
-- funcionários precisava de um acréscimo de duas colunas, a primeira coluna com o 
-- ano no qual o funcionário ingressou na empresa, a segunda do ano de nascimento 
-- do funcionário.
--------------------------------------------------------------------------------------

-- ADDING NEW COLUMNS
ALTER TABLE A_TABELAO
  ADD COLUMN
    ANO_NASC INT4;

ALTER TABLE A_TABELAO
  ADD COLUMN
    ANO_ING INT4;

-- UPDATING COLUMNS
UPDATE 
  A_TABELAO 
SET 
  ANO_NASC = SUBSTR(B_DATE, 7, 4),
  ANO_ING = SUBSTR(START_DATE, 7, 4);

-------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------
-- EX 7 ------------------------------------------------------------------------------
--------------------------------------------------------------------------------------
-- 7. Um desenvolvedor da equipe de FRONT_END da empresa precisa consumir uma coluna
--  que possua o primeiro e o segundo nome dos funcionários da empresa para o sistema
-- de RH. Assim, construa uma coluna com a concatenação dos nomes e um espaçamento 
-- entre eles.
-------------------------------------------------------------------------------------
-- ADDING NEW COLUMN
ALTER TABLE A_TABELAO
  ADD COLUMN
    FULL_NAME CHAR(30);

-- UPDATING NEW COLUMN
UPDATE 
  A_TABELAO
SET
  FULL_NAME = F_NAME || ' ' || L_NAME;

-------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------
-- EX 8 ------------------------------------------------------------------------------
--------------------------------------------------------------------------------------
-- 8. A Contabilidade da empresa precisa da média dos salários dos funcionários. Dessa
-- forma, construa uma coluna que tenha a média por grupo de trabalho.
-------------------------------------------------------------------------------------
SELECT
  CAST(DEP_ID AS INTEGER) AS DEP_ID,
  ROUND(AVG(SALARY), 2) AS AVG_SALARY
FROM
  A_TABELAO
GROUP BY
  DEP_ID
ORDER BY
  DEP_ID ASC;
-------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------
-- EX 9 ------------------------------------------------------------------------------
--------------------------------------------------------------------------------------
-- 9. A empresa está realizando um grande mapeamento de funcionários, dessa forma, a 
-- gerência quer ter ciência de quantos funcionários por país temos atualmente.
--------------------------------------------------------------------------------------
SELECT
  COUNTRY_LOC,
  COUNT(EMP_ID)
FROM
  A_TABELAO
GROUP BY
  COUNTRY_LOC;
-------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------
-- EX 10 -----------------------------------------------------------------------------
--------------------------------------------------------------------------------------
-- 10. Desafio-Opcional. 
-- A equipe de desenvolvimento realizou uma carga de dados, porém
-- precisamos montar uma lógica que confira se os dados já foram carregados para que 
-- não tenhamos duplicidade quando realizar a carga ou recarga. Ou seja, carregar 
-- apenas os dados que não estão presentes no tabelao_1. Para isso será necessário 
-- comparar duas tabelas tabelao 1 e 2.
--------------------------------------------------------------------------------------
-- ONE WAY
SELECT
  A.*
FROM
  A_TABELAO AS A
LEFT JOIN
  B_TABELAO AS B
ON
  A.EMP_ID = B.EMP_ID
WHERE
  B.EMP_ID IS NULL;

-- ANOTHER WAY
SELECT
  *
FROM
  A_TABELAO
WHERE
  EMP_ID > (
    SELECT
      EMP_ID
    FROM
      B_TABELAO
    ORDER BY
      EMP_ID DESC
    LIMIT 1
  );
-------------------------------------------------------------------------------------
-- with nome_tabela
--...

-- select coluna,
--        (select outra_coluna_com_subselect)

-- create or replace table (
--  with
--  ...

--   ...
-- )
-------------------------------------------------------------------------------------