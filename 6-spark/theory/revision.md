## **1. Transformação de dados:**

- ### **Condição**
    - case when

- ### **String**
    - substring
    - lpad
    - rpad
    - upper
    - lower
    - pow

- ### **Data/Time**
    - datediff
    - year
    - month
    - dayofmonth
    - date_add
    - add_months
    - last_day
    - from_unixtime

***

## **2. Filtros:**
- where
- having

***

## **3. Funções de agregação:**
Necessário o uso de **group by**.

- max
- min
- avg
- sum
- count

***

## **4. Transact-SQL:**
Necessário o uso de **over partition by**.

- ### Funções de classificação:
    - **RANK**
    - DENSE_RANK
    - NTILE
    - **ROW_NUMBER**

- ### Funções de agregação:
    - APPROX_COUNT_DISTINCT
    - AVG
    - CHECKSUM_AGG
    - COUNT
    - COUNT_BIG
    - GROUPING
    - GROUPING_ID
    - MAX
    - MIN
    - STDEV
    - STDEVP
    - STRING_AGG
    - SUM
    - VAR
    - VARP

    - ```Com exceção de count, as funções de agregação ignoram valores nulos```

- ### Funções analíticas:
    - CUME_DIST (Transact-SQL)
    - FIRST_VALUE (Transact-SQL)
    - **LAG** (Transact-SQL)
    - LAST_VALUE (Transact-SQL)
    - **LEAD** (Transact-SQL)
    - PERCENT_RANK (Transact-SQL)
    - PERCENTILE_CONT (Transact-SQL)  
    - PERCENTILE_DISC (Transact-SQL)

- ### Função NEXT VALUE FOR.

- #### Funções solicitadas pela gestora como atenção:
    - lead
    - lag
    - rank
    - row_number