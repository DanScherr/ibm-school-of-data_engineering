# :robot: IBM school of data engineering 
#### :mortar_board: *This folder contains the SQL challenges* :game_die::chains:

***

## SUMÁRIO: :round_pushpin:

* [Enunciado](#enunciado-man_teacher)

* 1:
    - [1<sup>o</sup> Enunciado:](#1o-enunciado)
    - [1<sup>a</sup> Resolução:](#1a-resolução)

* 2:
    - [2<sup>o</sup> Enunciado:](#2o-enunciado)
    - [2<sup>a</sup> Resolução:](#2a-resolução)

* 3:
    - [3<sup>o</sup> Enunciado:](#3o-enunciado)
    - [3<sup>a</sup> Resolução:](#3a-resolução)

* 4:
    - [4<sup>o</sup> Enunciado:](#4o-enunciado)
    - [4<sup>a</sup> Resolução:](#4a-resolução)

* 5:
    - [5<sup>o</sup> Enunciado:](#5o-enunciado)
    - [5<sup>a</sup> Resolução:](#5a-resolução)

* 6:
    - [6<sup>o</sup> Enunciado:](#6o-enunciado)
    - [6<sup>a</sup> Resolução:](#6a-resolução)

* 7:
    - [7<sup>o</sup> Enunciado:](#7o-enunciado)
    - [7<sup>a</sup> Resolução:](#7a-resolução)

* 8:
    - [8<sup>o</sup> Enunciado:](#8o-enunciado)
    - [8<sup>a</sup> Resolução:](#8a-resolução)

* 9:
    - [9<sup>o</sup> Enunciado:](#9o-enunciado)
    - [9<sup>a</sup> Resolução:](#9a-resolução)

* 10:
    - [10<sup>o</sup> Enunciado:](#10o-enunciado)
    - [10<sup>a</sup> Resolução:](#10a-resolução)


***

# Enunciado: :man_teacher:
[:top: ***Voltar ao topo***](#robot-ibm-school-of-data-engineering)

:speech_balloon: Meu nome é Maurício sou P.O (Product Owner) de vocês.
<br>- Teremos várias questões que representam os problemas de negócios para resolverem.
Para cada resolução seria interessante justificar o seu desenvolvimento, assim busquem explicar o que fizeram, o porque de cada desenvolvimento
para a equipe de assessores compreenderem seu raciocínio. 
<br>- Então, cada entrega terá duas respostas a primeira o código(script) 
e a segunda um pequeno trecho justificando sua resposta.
<br>- Quando tiverem dúvidas no desenvolvimento podem acionar o P.O 
para compreenderem as regras de negócio.

- ### 1<sup>o</sup> Enunciado:
A nossa empresa é global possui diversos colaboradores e grupos de trabalho ao redor do mundo. 
Recebemos uma solicitação da equipe de RH para a campanha "mulheres na tecnologia", na qual precisamos informar 
a quantidade de funcionários do sexo Feminino dos grupos de trabalho Software Group e Architect Group que temos atualmente na empresa.<br>
[:pencil2: ***Resolução***](#1a-resolução)
<br>[:top: ***Voltar ao topo***](#robot-ibm-school-of-data-engineering)

- ### 2<sup>o</sup> Enunciado:
Anualmente, o RH realiza campanha ligadas a qualidade de vida dos trabalhadores, no mês de novembro é realizado novembro azul ligados
a prevenção do cancêr de prostáta. Dessa forma, precisamos selecionar a lista de funcionários masculinos com idade acima dos 40 anos de idade
para o RH enviar um webmail de convite para a campanha.<br>
[:pencil2: ***Resolução***](#2a-resolução)
<br>[:top: ***Voltar ao topo***](#robot-ibm-school-of-data-engineering)

- ### 3<sup>o</sup> Enunciado:
A empresa está com um novo plano de bonificação de resultado para os funcionários, a nova política PLR(Participação de resultados) nos diz
que quando o funcionário tanto masculino quanto feminino tiver 10 ou mais anos de casa ele receberá com base no salário 
um percentual de 25 % de bonificação (1.25). Assim, construa uma nova coluna com a bonificacao das pessoas selecionadas na regra,
as que estiverem fora mantém o mesmo salário.<br>
[:pencil2: ***Resolução***](#3a-resolução)
<br>[:top: ***Voltar ao topo***](#robot-ibm-school-of-data-engineering)

- ### 4<sup>o</sup> Enunciado:
A empresa presta serviço de consultoria para diversas empresas. Dessa forma, contratamos 3 novos funcionários para ajustar os quadros.
Precisamos incluir no sistema as informações desses novos colaboradores. Os salários seguem as tabelas de remuneração mínima.<br>
[:pencil2: ***Resolução***](#4a-resolução)
<br>[:top: ***Voltar ao topo***](#robot-ibm-school-of-data-engineering)

    > - Nome: Carlos Almeida; NASC: 22/04/1997; SSN: 123420; SEXO: M; Endereço: Avenida Paes de Barros, 2300, Mooca, SP, Brasil; Posição: SCRUM MASTER, MANAGER_ID:30003 <br>
    > - Nome: Amanda Torres; NASC: 22/04/1998; SSN: 123421; SEXO: F; Endereço: R. Industrias , 500, Amadora, Lisboa, Portual; Posição: SCRUM UX Designer, MANAGER_ID:30006 <br>
    > - Nome: Kshulia Zila; NASC: 22/04/1990; SSN: 123422; SEXO: M; Endereço: Zuari Rd, 1450, New Vadden, GOA, INDIA; Posição: Architect Group, MANAGER_ID:30005 

- ### 5<sup>o</sup> Enunciado:
Após inserir os funcionários e juntar novamente as tabelas no tabelão você notou alguns brancos, ou seja, valores nulos nas tabelas.
Explique por que isso ocorreu? Além disso, realize um plano de ação para que que não tenhamos informações nulas na tabela.<br>
[:pencil2: ***Resolução***](#5a-resolução)
<br>[:top: ***Voltar ao topo***](#robot-ibm-school-of-data-engineering)

- ### 6<sup>o</sup> Enunciado:
O RH solicitou para a equipe de desenvolvimento que o Tabelao de registro dos funcionários precisava de um acréscimo de duas colunas, a primeira 
coluna com o ano no qual o funcionário ingressou na empresa, a segunda do ano de nascimento do funcionário.<br>
[:pencil2: ***Resolução***](#6a-resolução)
<br>[:top: ***Voltar ao topo***](#robot-ibm-school-of-data-engineering)

- ### 7<sup>o</sup> Enunciado:
Um desenvolvedor da equipe de FRONT_END da empresa precisa consumir uma coluna que possua o primeiro e o segundo nome dos funcionários da empresa
para o sistema de RH. Assim, construa uma coluna com a concatenação dos nomes e um espaçamento entre eles.<br>
[:pencil2: ***Resolução***](#7a-resolução)
<br>[:top: ***Voltar ao topo***](#robot-ibm-school-of-data-engineering)

- ### 8<sup>o</sup> Enunciado:
A Contabilidade da empresa precisa da média dos salários dos funcionários. Dessa forma, construa uma coluna que tenha a média por grupo de trabalho.<br>
[:pencil2: ***Resolução***](#8a-resolução)
<br>[:top: ***Voltar ao topo***](#robot-ibm-school-of-data-engineering)

- ### 9<sup>o</sup> Enunciado:
A empresa está realizando um grande mapeamento de funcionários, dessa forma, a gerência quer ter ciência de quantos funcionários por país temos 
atualmente.<br>
[:pencil2: ***Resolução***](#9a-resolução)
<br>[:top: ***Voltar ao topo***](#robot-ibm-school-of-data-engineering)

- ### 10<sup>o</sup> Enunciado:
Desafio-Opcional. A equipe de desenvolvimento realizou uma carga de dados, porém precisamos montar uma lógica que confira se os dados já foram carregados
para que não tenhamos duplicidade quando realizar a carga ou recarga. Ou seja, carregar apenas os dados que não estão presentes no tabelao_1.
Para isso será necessário comparar duas tabelas tabelao 1 e 2.<br>
[:pencil2: ***Resolução***](#10a-resolução)
<br>[:top: ***Voltar ao topo***](#robot-ibm-school-of-data-engineering)


***

# Resolução: :man_technologist:
[:top: ***Voltar ao topo***](#robot-ibm-school-of-data-engineering)
- Primeiramente, buildou-se o banco de dados com a [query-inicial](./query-inicial.sql)

- ## Explicação abstrata (geral:
> - Em um banco de dados relacional, os dados são normalizados<sup>i</sup> para obtenção do ACID. Ou seja, para uma tabela T (entidade), evitamos ao máximo atributos de outras tabelas os quais não estão intrinsicamente ligados ao 'cerne' de T (chegar ao cerne de T não é algo subjetivo. Obtem este ao aplicar-se a metodologia de normalização).
>- Quando, em consultas, queremos relacionar entidades diferenças e unir em uma mesma visão atibutos de tabelas distintas, utilizamos as chaves primárias e estrangerias (PRIMARY AND FOREIGN KEY), pois para cada linha de uma X tabela, temos uma chave/código/id especificador. Então, se em A temos uma chave estrangeira, chave primária da tabela B, podemos relacioná-las e obter quaisquer atributos de forma atômica e precisa, desde uma visão micro ao macro.


i. [Normalização](https://medium.com/@diegobmachado/normaliza%C3%A7%C3%A3o-em-banco-de-dados-5647cdf84a12).

- ## Explicações específicas:

    - [x] 1.
        > ### 1<sup>a</sup> Resolução:
        > - RELACIONOU: EMPLOYEES <-> JOB_HISTORY | <-> DEPARTMENTS
        > - FILTRAGEM: "F", "Software Group e Architect Group"
<br>[:top: ***Voltar ao topo***](#robot-ibm-school-of-data-engineering)
<br>[:page_facing_up: ***Enunciado***](#1o-enunciado)

    - [x] 2.
        > ### 2<sup>a</sup> Resolução:
        -  Para conseguirmos saber quantos anos se passaram, a partir de uma determinada data, no padrão pelo qual foi salvo neste schema específico - dd/mm/AAAA, foi necessário usarmos a função ***JULIANDAY()***<sup>i</sup> que aceita apenas um outro padrão de formato - AAAA/mm/dd. Portanto, foi necessario primeiro realizar a transformação da data, para depois usar a função para o cálculo.
        - Primeiramente, para realizar tal feito, criou-se uma tabela temporaria que separou a coluna de data em 3 colunas de DIA, MES e ANO (com a função ***SUBSTR()***<sup>ii</sup>), e manteve-se, também, os IDs relativos à cada data (para conseguir realizar os devidos relacionamentos).
        - Em seguida, criou-se outra tabela também temporaria, para juntar as 3 colunas (DIA, MES e ANO) no formato aceito pela função ***JULIANDAY()***.
        - Por último, utilizou-se a função para chegar no cálculo pretendido.
<br>[:top: ***Voltar ao topo***](#robot-ibm-school-of-data-engineering)
<br>[:page_facing_up: ***Enunciado***](#2o-enunciado)

    - [x] 3.
        > ### 3<sup>a</sup> Resolução:
        -  Para conseguirmos saber quantos anos se passaram, a partir de uma determinada data, no padrão pelo qual foi salvo neste schema específico - dd/mm/AAAA, foi necessário usarmos a função ***JULIANDAY()***<sup>i</sup> que aceita apenas um outro padrão de formato - AAAA/mm/dd. Portanto, foi necessario primeiro realizar a transformação da data, para depois usar a função para o cálculo.
        - Primeiramente, para realizar tal feito, criou-se uma tabela temporaria que separou a coluna de data em 3 colunas de DIA, MES e ANO (com a função ***SUBSTR()***<sup>ii</sup>), e manteve-se, também, os IDs relativos à cada data (para conseguir realizar os devidos relacionamentos).
        - Em seguida, criou-se outra tabela também temporaria, para juntar as 3 colunas (DIA, MES e ANO) no formato aceito pela função ***JULIANDAY()***.
        - Depois, utilizou-se a função para chegar no cálculo pretendido em anos.
        - E, por último, realizou-se os calculos de contribuição com o ***CASE WHEN***<sup>iii</sup>.
<br>[:top: ***Voltar ao topo***](#robot-ibm-school-of-data-engineering)
<br>[:page_facing_up: ***Enunciado***](#3o-enunciado)

    - [x] 4.
        > ### 4<sup>a</sup> Resolução:
        - Devido a termos ***CONSTRAINTS*** na tabela EMPLOYEES, optou-se por criar uma tabela sobressalente chamada ADC_FUNCIONARIOS, que seguirá a mesma estrutura lógica da EMPLOYEES, para serem adicionados os dados sem nenhuma restrição de esquema, para por fim, realizar um INSERT na tabela de EMPLOYEES tendo todos os dados sidos inseridos corretamente e terem passado por todos os testes de validade.
        - Criou-se uma lógica de implementação automática, dinâmica e iterativa do ID para realizar as inserções (primeiro campo a se preencher).
        - Depois, a partir dos IDs preenchidos, realizou-se UPDATE das outras colunas a partir do relacionamento entre tabelas.
<br>[:top: ***Voltar ao topo***](#robot-ibm-school-of-data-engineering)
<br>[:page_facing_up: ***Enunciado***](#4o-enunciado)

    - [x] 5.
        > ### 5<sup>a</sup> Resolução:
        - Resposta:<br>
            - Não há possibilidade de colunas em branco a não ser se não forem inseridos valores na tabela de EMPLOYEES. O que pode acontecer, é de alguns dados (linhas) faltarem, caso as novas linhas adicionadas em EMPLOYEES faltarem alguma chave estrangeira utilizada para relacionar na query que constitui a Tabelona, por ter sido usado inner join.

        - Resposta:
            - O que pode ser feito é adicionar constraints para evitar valores nulos e constraint de chave estrangeira para se criarem vinculos de obrigatoriedade de pertencimento.

            - Como, por exemplo, não foram adicionadas linhas em JOB_HISTORY para os novos empregados. Com isso, a Tabelona só consegue rodar trazendo todos os funcionários, incluindo os novos, caso se adicione novas linhas com seus IDs em JOB_HISTORY.

        - Outra maneira de solucionar este problema seria:
            - Usar o left join na ultima linha da composição do tabelao (como mostrado na query a baixo). Porém, como descreve  o enunciado, esta tabela iria apresentar valores nulos, provenientes da tabela  JOB_HISTORY, que poderia ser solucionado, como já comentado, adicionando a esta  tabela novas linhas com os dados dos novos funcionarios e criar CONSTRAINTS para inserir obrigatoriedades de inserção de dados.
        
        <br>
        
        -> Verificar queries no [arquivo](./query-exercicios.sql). :point_left::computer_mouse:
<br>[:top: ***Voltar ao topo***](#robot-ibm-school-of-data-engineering)
<br>[:page_facing_up: ***Enunciado***](#5o-enunciado)

        <br>

    - [x] 6.
        > ### 6<sup>a</sup> Resolução:
        - Adicionou-se as devidas colunas com o ***ALTER TABLE***, optando-se por utilizar o ***data-type***<sup>iv</sup> de ***INT4*** para restringir o input de dados em apenas 4bytes.
        - E, em seguida, realizou-se o update dos valores dessas colunas com o ***UPDATE SET***.
<br>[:top: ***Voltar ao topo***](#robot-ibm-school-of-data-engineering)
<br>[:page_facing_up: ***Enunciado***](#6o-enunciado)

    - [x] 7.
        > ### 7<sup>a</sup> Resolução:
        - Utilizou-se o método de concatenação entre colunas do SQLite '||', em uma nova coluna, cujo tipo de dado admite a soma dos valores admitidos pela soma das duas colunas concatenadas.
        - Para criação da coluna utilizou-se o ***ALTER TABLE*** e depois para inserção dos dados o ***UPDATE SET***.
<br>[:top: ***Voltar ao topo***](#robot-ibm-school-of-data-engineering)
<br>[:page_facing_up: ***Enunciado***](#7o-enunciado)

    - [x] 8.
        > ### 8<sup>a</sup> Resolução:
        - Utilizou-se o ***GROUP BY*** a partir do DEP_ID (primary key), transformado com a função ***CAST()***<sup>iv</sup> em INTEGER para fins de ordenação - ***ORDER BY***, para trazer a média dos salários (com a função ***AVG()***) de forma arredondada(com a função ***ROUND()***).
<br>[:top: ***Voltar ao topo***](#robot-ibm-school-of-data-engineering)
<br>[:page_facing_up: ***Enunciado***](#8o-enunciado)

    - [x] 9.
        > ### 9<sup>a</sup> Resolução:
        - Utilizou-se o ***GROUP BY*** a partir do COUNTRY_LOC, para trazer a contagem com a função ***COUNT()***.
<br>[:top: ***Voltar ao topo***](#robot-ibm-school-of-data-engineering)
<br>[:page_facing_up: ***Enunciado***](#9o-enunciado)

    - [x] 10.
        > ### 10<sup>a</sup> Resolução:
        - Realizou-se o desafio de duas formas:
            - A primeira, através do ***JOIN*** outer left, trazendo apenas os dados fora da intersecção do lado esquerdo.
            - A segunda, através de uma ***SUBQUERIE*** de ordenação, a qual busca ordenar a tabela de modo decrescente para pegar o último ID inserido na tabela de histórico, para, em seguida, trazer os dados os quais são maiores que estes.
<br>[:top: ***Voltar ao topo***](#robot-ibm-school-of-data-engineering)
<br>[:page_facing_up: ***Enunciado***](#10o-enunciado)

- Referências:<br>
i. [Data and Time SQLite Functions](https://www.sqlite.org/lang_datefunc.html);<br>
ii. [Built-in-Functions](https://www.sqlite.org/lang_corefunc.html#substr);<br>
iii. [SQL-Language-Expressions](https://www.sqlite.org/lang_expr.html);<br>
iv. [Data-types](https://www.sqlite.org/datatype3.html).

***

* [Voltar ao topo](#robot-ibm-school-of-data-engineering)

* [Voltar a pasta SQL](../../5-SQL/)

* [Voltar ao menu principal](https://github.com/DanScherr/ibm-school-of-data_engineering)

***

<a href="https://github.com/DanScherr">
    <img src='../../images/the-end-img.png' width=50%>
</a>
