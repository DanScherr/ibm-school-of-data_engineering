# :robot: IBM school of data engineering 
#### :mortar_board: *This folder contains the SQL challenges* :game_die::chains:

***

- # SUMÁRIO: :round_pushpin:
[:top: ***Voltar ao topo***](#robot-ibm-school-of-data-engineering)


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

<br>

- Referências:
1. [PostgreSQL on DockerHUB](https://hub.docker.com/_/postgres/).
2. [pgAdmin on DockerHUB](https://hub.docker.com/r/dpage/pgadmin4/).

<br>

## 2. Docker Compose:
[:top: ***Voltar ao topo***](#robot-ibm-school-of-data-engineering)<br>


``Compose is a tool for defining and running multi-container Docker applications. With Compose, you use a YAML file to configure your application’s services. Then, with a single command, you create and start all the services from your configuration.``

### i. Create docker-compose with YAML:
- [check-code](docker-compose.yml)
- it can be programmed to be restarted every time you get down your services
- it shows the logs live
- It creates automatically bridges networks between services:

``In terms of Docker, a bridge network uses a software bridge which allows containers connected to the same bridge network to communicate, while providing isolation from containers which are not connected to that bridge network.``<sup>1</sup>

### ii. Building docker-compose:
- $ docker-compose -f docker-compose.yml up --remove-orphans<br>
![](./images/running-docker_compose.png)

## 3. Accessing and configurating pgAdmin:
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
![](./images/postgresql-extension.png)

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

1. [Docker Bridge Network](https://docs.docker.com/network/bridge/).

<br>

***

<br>

- # Enunciado: :man_teacher:
[:top: ***Voltar ao topo***](#robot-ibm-school-of-data-engineering)
> pipipipopopo

<br>

***

<br>

- # Exercise solution:
[:top: ***Voltar ao topo***](#robot-ibm-school-of-data-engineering)
- ## DER: DIAGRAMA DE ENTIDADE E RELACIONAMENTO - para resolução dos exercícios.
![imagem-der](./images/der-disney.png)

