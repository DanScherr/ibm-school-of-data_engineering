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
