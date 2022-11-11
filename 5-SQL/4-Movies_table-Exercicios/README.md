# :robot: IBM school of data engineering 
#### :mortar_board: *This folder contains the SQL challenges* :game_die::chains:

***

- # SUMÁRIO: :round_pushpin:
[:top: ***Voltar ao topo***](#robot-ibm-school-of-data-engineering)

- [AMBIENTAÇÃO:](#ambientação):
    - [PULL de imagens](#1-pull-de-imagens);
    - [Docker compose](#2-docker-compose);
    - [Accessing and Configurating pgAdmin](#3-accessing-and-configurating-pgadmin);
    - [Connecting to VsCode](#4-connecting-to-vscode);
    - [Running query and CREATEing table](#5-running-query-and-createing-table);
    - [Referências](#6-referências).

<br>

- [ENUNCIADO](#enunciado-man_teacher):
    - [Contexto](#1-contexto);
    - [Exercícios de normalização](#2-exercícios-de-normalização);
    - [Exercícios de casos de uso](#3-exercícios-de-casos-de-uso).

<br>

- [Exercise solution](#exercise-solution):
    - [DER - para resolução de exercícios](#1-der-diagrama-de-entidade-e-relacionamento---para-resolução-dos-exercícios);

***

<br>

- # AMBIENTAÇÃO:
[:top: ***Voltar ao topo***](#robot-ibm-school-of-data-engineering)
- ## Docker + PostgreSQL + pgAdmin

<br>

### 1. PULL de imagens:
[:top: ***Voltar ao topo***](#robot-ibm-school-of-data-engineering)<br>

obs: pulling the images is optional, because they can be pulled atomatically when you execute ***step ()***.

i. PostgreSQL<sup>1</sup>
-  $ docker pull postgres

ii. pgAdmin<sup>2</sup>
- $ docker pull dpage/pgadmin


## 2. Docker Compose<sup>3</sup>:
[:top: ***Voltar ao topo***](#robot-ibm-school-of-data-engineering)<br>


``Compose is a tool for defining and running multi-container Docker applications. With Compose, you use a YAML file to configure your application’s services. Then, with a single command, you create and start all the services from your configuration.``

### i. Create docker-compose with YAML:
- [check-code](docker-compose.yml)
- it can be programmed to be restarted every time you get down your services
- it shows the logs live
- It creates automatically bridges networks between services:

``In terms of Docker, a bridge network uses a software bridge which allows containers connected to the same bridge network to communicate, while providing isolation from containers which are not connected to that bridge network.``<sup>4</sup>

### ii. Building docker-compose:
- $ docker-compose -f docker-compose.yml up --remove-orphans<br>
![](./images/running-docker_compose.png)

## 3. Accessing and configurating pgAdmin<sup>5</sup>:
[:top: ***Voltar ao topo***](#robot-ibm-school-of-data-engineering)<br>

### i. Accessing pgAdmin:
- You must access via browser on: [localhost:8080](localhost:8080).<br>
![](./images/accessing-pgadmin.png)
- You must insert the e-mail you gave on the docker-compose and password to login.<br>
![](./images/inside-pgadmin.png)

### ii. Registering server:
- RIght-click on Servers -> Register -> Server...<br>
![](./images/click-to-register-server.png)
- Type-in a name on General tab.<br>
![](./images/entering-server-name.png)
- Type-in
    - Host-name (container name from docker-compose)
    - Port (port configured on the postgre container on docker-compose)
    - Username (setted on environment on docker-compose)
    - Password (setted on environment on docker-compose)<br>
    ![](./images/entering-connection-informations.png)

## 4. Connecting to VsCode:
[:top: ***Voltar ao topo***](#robot-ibm-school-of-data-engineering)<br>

### i. Open VsCode.
### ii. Download PostgreSQL extension.
![Extensão do PostgreSQL](./images/postgresql-extension.png).

### iii. Connecting to server
- crtl + shift + P -> new query<br>
![](./images/new-query.png)
- Type server name as localhost<br>
![](./images/localhost-vscode.png)
- No need to insert database (optional).
- Username (postgres like given on docker-compose - and its the postgresql .deffault)<br>
![](./images/username-query.png)
- Insert password (like given on docker-compose).<br>
![](./images/insert-password-query.png)
- Insert door (host door given on docker-compose - 8001).<br>
![](./images/port-query.png)
- Check the connection successfully pop-up !<br>
![](./images/query-connection-successfully.png)

## 5. Running query and CREATEing TABLE:
[:top: ***Voltar ao topo***](#robot-ibm-school-of-data-engineering)<br>

### i. Run CREATE, INSERT TABLE query:
- [Check query](./queries/disney_plus_titles-create-insert-table.sql).<br>
![](./images/run-disney_plus_titles-create-insert-table.png)

### ii. Run SELECT query to check it's creation:
- [Check query.](./queries/disney_plus_titles-select-table.sql)<br>
![](./images/run-disney_plus_titles-select-table.png)

## 6. Referências:
[:top: ***Voltar ao topo***](#robot-ibm-school-of-data-engineering)<br>

1. [PostgreSQL docker-hub image](https://hub.docker.com/_/postgres)
2. [pgAdmin docker-hub image](https://hub.docker.com/r/dpage/pgadmin4)
3. [Docker compose](https://docs.docker.com/compose/)
4. [Docker Bridge Network](https://docs.docker.com/network/bridge/).
5. [pgAdmin home page](https://www.pgadmin.org/)

<br>

***

<br>

- # Enunciado: :man_teacher:
[:top: ***Voltar ao topo***](#robot-ibm-school-of-data-engineering)
<br>

## 1. Contexto: <br>
``Somos uma empresa de Streaming que conseguiu um contrato para retransmitir dos nossos parceiros netflix, disney_plus e amazon_prime os seus conteúdos. A equipe de dados solicitou ao time diversas entregas que precisam ser realizadas para ajustes na base assim como as regras de negócio.``

## 2. Exercícios de normalização: <br>
1. ``A base possui diversos valores nulos. Preencha nas colunas onde os valores são nulls com 'NAN'.``
2. ``Normalize a coluna CAST criando uma nova tabela 'cast_table' de modo que tenhamos separadamente, ou seja, uma coluna com o nome do elenco de cada filme.``<br><br>
Exemplo:<br>
Linha: n1 joao, maria, roberto<br><br>
coluna:<br>
id CAST <br>
n1 joao<br>
n1 maria<br>
n1 roberto<br>

3. ``Normalize a coluna listed_in criando uma nova tabela  genre_table' de modo que tenhamos separadamente os gêneros de cada programação.`` <br><br>
Exemplo:<br>
Linha: n1 Ação, Aventura, Comédia<br><br>
coluna:<br>
n1 Ação<br>
n1 Comédia<br>
n1 Aventura<br>

4. ``Normalize a coluna listed_in criando uma nova tabela 'genre_table' de modo que tenhamos separadamente os gêneros
de cada programação.`` <br><br>
Exemplo:<br>
Linha: n1 Ação, Aventura, Comédia<br><br>
coluna:<br>
n1 Ação<br>
n1 Comédia<br>
n1 Aventura<br>

5. ``Normalize a coluna date_added em uma nova base 'date_table' e construa as seguintes colunas:``<br>
coluna day: DD<br>
coluna mouth: MM<br>
coluna year: YY<br>
coluna iso_date_1: YYYY-MM-DD<br>
coluna iso_date_2: YYYY/MM/DD<br>
coluna iso_date_3: YYMMDD<br>
coluna iso_date_4: YYYYMMDD<br>

6. ``Normalize a coluna duration e construa uma nova base 'time_table' e faça as seguintes conversões.``
- Converta a coluna duration para horas e crie a coluna hours hh. Obs. A média de cada 
season TV SHOW é 10 horas, assim também converta para horas
- Converta todas as horas para minutos e armazena na coluna minutes mm.<br>

7.  ``Normalize a coluna country criando uma nova tabela 'country_table' de modo que tenhamos separadamente uma coluna com o nome do país de cada filme.``
<br>

## 3. Exercícios de casos de uso: <br>

8. Qual o filme de duração máxima em minutos ?

9.  Qual o filme de duraçã mínima em minutos ?

10. Qual a série de duração máxima em minutos ?

11. Qual a série de duração mínima em minutos ?

12. Qual a média de tempo de duração dos filmes?

13. Qual a média de tempo de duração das series?

14. Qual a lista de filmes o ator Leonardo DiCaprio participa?

15. Quantas vezes o ator Tom Hanks apareceu nas telas do netflix, ou seja, tanto série quanto filmes?

16. Quantas produções séries e filmes brasileiras já foram ao ar no netflix?

17. Quantos filmes americanos já foram para o ar no netflix?

18. Crie uma nova coluna com o nome last_name_director com uma nova formatação para o nome dos diretores, por exemplo.
João Roberto para Roberto, João.

19. Procure a lista de conteúdos que tenha como temática a segunda guerra mundial (WWII)?

20. Conte o número de produções dos países que apresentaram conteúdos no netflix?


<br>

***

<br>

- # Exercise solution:
[:top: ***Voltar ao topo***](#robot-ibm-school-of-data-engineering)
## 1. DER: DIAGRAMA DE ENTIDADE E RELACIONAMENTO - para resolução dos exercícios.
![imagem-der](./images/der-disney.png)

