# :robot: IBM school of data engineering 
#### :mortar_board: *This folder contains the SQL challenges* :game_die::chains:

***

# Enunciado::man_teacher:

:speech_balloon: Meu nome é Maurício sou P.O (Product Owner) de vocês.
<br>- Teremos várias questões que representam os problemas de negócios para resolverem.
Para cada resolução seria interessante justificar o seu desenvolvimento, assim busquem explicar o que fizeram, o porque de cada desenvolvimento
para a equipe de assessores compreenderem seu raciocínio. 
<br>- Então, cada entrega terá duas respostas a primeira o código(script) 
e a segunda um pequeno trecho justificando sua resposta.
<br>- Quando tiverem dúvidas no desenvolvimento podem acionar o P.O 
para compreenderem as regras de negócio.

1. A nossa empresa é global possui diversos colaboradores e grupos de trabalho ao redor do mundo. 
Recebemos uma solicitação da equipe de RH para a campanha "mulheres na tecnologia", na qual precisamos informar 
a quantidade de funcionários do sexo Feminino dos grupos de trabalho Software Group e Architect Group que temos atualmente na empresa.<br>
[-> Resolução](#1a-explicação)

2. Anualmente, o RH realiza campanha ligadas a qualidade de vida dos trabalhadores, no mês de novembro é realizado novembro azul ligados
a prevenção do cancêr de prostáta. Dessa forma, precisamos selecionar a lista de funcionários masculinos com idade acima dos 40 anos de idade
para o RH enviar um webmail de convite para a campanha.<br>
[-> Resolução](#2a-explicação)

3. A empresa está com um novo plano de bonificação de resultado para os funcionários, a nova política PLR(Participação de resultados) nos diz
que quando o funcionário tanto masculino quanto feminino tiver 10 ou mais anos de casa ele receberá com base no salário 
um percentual de 25 % de bonificação (1.25). Assim, construa uma nova coluna com a bonificacao das pessoas selecionadas na regra,
as que estiverem fora mantém o mesmo salário.<br>
[-> Resolução](#3a-explicação)

4. A empresa presta serviço de consultoria para diversas empresas. Dessa forma, contratamos 3 novos funcionários para ajustar os quadros.
Precisamos incluir no sistema as informações desses novos colaboradores. Os salários seguem as tabelas de remuneração jos mínima.<br>
[-> Resolução](#4a-explicação)

    > - Nome: Carlos Almeida; NASC: 22/04/1997; SSN: 123420; SEXO: M; Endereço: Avenida Paes de Barros, 2300, Mooca, SP, Brasil; Posição: SCRUM MASTER, MANAGER_ID:30003 <br>
    > - Nome: Amanda Torres; NASC: 22/04/1998; SSN: 123421; SEXO: F; Endereço: R. Industrias , 500, Amadora, Lisboa, Portual; Posição: SCRUM UX Designer, MANAGER_ID:30006 <br>
    > - Nome: Kshulia Zila; NASC: 22/04/1990; SSN: 123422; SEXO: M; Endereço: Zuari Rd, 1450, New Vadden, GOA, INDIA; Posição: Architect Group, MANAGER_ID:30005 

5. Após inserir os funcionários e juntar novamente as tabelas no tabelão você notou alguns brancos, ou seja, valores nulos nas tabelas.
Explique por que isso ocorreu? Além disso, realize um plano de ação para que que não tenhamos informações nulas na tabela.<br>
[-> Resolução](#5a-explicação)

6. O RH solicitou para a equipe de desenvolvimento que o Tabelao de registro dos funcionários precisava de um acréscimo de duas colunas, a primeira 
coluna com o ano no qual o funcionário ingressou na empresa, a segunda do ano de nascimento do funcionário.<br>
[-> Resolução](#6a-explicação)

7. Um desenvolvedor da equipe de FRONT_END da empresa precisa consumir uma coluna que possua o primeiro e o segundo nome dos funcionários da empresa
para o sistema de RH. Assim, construa uma coluna com a concatenação dos nomes e um espaçamento entre eles.<br>
[-> Resolução](#7a-explicação)

8. A Contabilidade da empresa precisa da média dos salários dos funcionários. Dessa forma, construa uma coluna que tenha a média por grupo de trabalho.<br>
[-> Resolução](#8a-explicação)

9. A empresa está realizando um grande mapeamento de funcionários, dessa forma, a gerência quer ter ciência de quantos funcionários por país temos 
atualmente.<br>
[-> Resolução](#9a-explicação)

10. Desafio-Opcional. A equipe de desenvolvimento realizou uma carga de dados, porém precisamos montar uma lógica que confira se os dados já foram carregados
para que não tenhamos duplicidade quando realizar a carga ou recarga. Ou seja, carregar apenas os dados que não estão presentes no tabelao_1.
Para isso será necessário comparar duas tabelas tabelao 1 e 2.<br>
[-> Resolução](#10a-explicação)


***

# Resolução: :man_technologist:

- Primeiramente, buildou-se o banco de dados com a [query-inicial](./query-inicial.sql)

- Explicação abstrata (geral:
> - Em um banco de dados relacional, os dados são normalizados<sup>i</sup> para obtenção do ACID. Ou seja, para uma tabela T (entidade), evitamos ao máximo atributos de outras tabelas os quais não estão intrinsicamente ligados ao 'cerne' de T (chegar ao cerne de T não é algo subjetivo. Obtem este ao aplicar-se a metodologia de normalização).
>- Quando, em consultas, queremos relacionar entidades diferenças e unir em uma mesma visão atibutos de tabelas distintas, utilizamos as chaves primárias e estrangerias (PRIMARY AND FOREIGN KEY), pois para cada linha de uma X tabela, temos uma chave/código/id especificador. Então, se em A temos uma chave estrangeira, chave primária da tabela B, podemos relacioná-las e obter quaisquer atributos de forma atômica e precisa, desde uma visão micro ao macro.


i. [Normalização](https://medium.com/@diegobmachado/normaliza%C3%A7%C3%A3o-em-banco-de-dados-5647cdf84a12).

- Explicações específicas, caso necessário.

    - [x] 1.
        > ### 1<sup>a</sup> Explicação: 
        > - RELACIONOU: EMPLOYEES <-> JOB_HISTORY | <-> DEPARTMENTS
        > - FILTRAGEM: "F", "Software Group e Architect Group"

    - [x] 2.
        > ### 2<sup>a</sup> Explicação:
        -  Para conseguirmos saber quantos anos se passaram, a partir de uma determinada data, no padrão pelo qual foi salvo neste schema específico - dd/mm/AAAA, foi necessário usarmos a função ***JULIANDAY()***<sup>i</sup> que aceita apenas um outro padrão de formato - AAAA/mm/dd. Portanto, foi necessario primeiro realizar a transformação da data, para depois usar a função para o cálculo.
        - Primeiramente, para realizar tal feito, criou-se uma tabela temporaria que separou a coluna de data em 3 colunas de DIA, MES e ANO (com a função ***SUBSTR()***<sup>ii</sup>), e manteve-se, também, os IDs relativos à cada data (para conseguir realizar os devidos relacionamentos).
        - Em seguida, criou-se outra tabela também temporaria, para juntar as 3 colunas (DIA, MES e ANO) no formato aceito pela função ***JULIANDAY()***.
        - Por último, utilizou-se a função para chegar no cálculo pretendido.

    - [x] 3.
        > ### 3<sup>a</sup> Explicação:
        -  Para conseguirmos saber quantos anos se passaram, a partir de uma determinada data, no padrão pelo qual foi salvo neste schema específico - dd/mm/AAAA, foi necessário usarmos a função ***JULIANDAY()***<sup>i</sup> que aceita apenas um outro padrão de formato - AAAA/mm/dd. Portanto, foi necessario primeiro realizar a transformação da data, para depois usar a função para o cálculo.
        - Primeiramente, para realizar tal feito, criou-se uma tabela temporaria que separou a coluna de data em 3 colunas de DIA, MES e ANO (com a função ***SUBSTR()***<sup>ii</sup>), e manteve-se, também, os IDs relativos à cada data (para conseguir realizar os devidos relacionamentos).
        - Em seguida, criou-se outra tabela também temporaria, para juntar as 3 colunas (DIA, MES e ANO) no formato aceito pela função ***JULIANDAY()***.
        - Depois, utilizou-se a função para chegar no cálculo pretendido em anos.
        - E, por último, realizou-se os calculos de contribuição com o ***CASE WHEN***<sup>iii</sup>.

    - [x] 4.
        > ### 4<sup>a</sup> Explicação:
        - 

    - [x] 5.
        > ### 5<sup>a</sup> Explicação:
        - 

    - [x] 6.
        > ### 6<sup>a</sup> Explicação:
        - 

    - [x] 7.
        > ### 7<sup>a</sup> Explicação:
        - 

    - [x] 8.
        > ### 8<sup>a</sup> Explicação:
        - 

    - [x] 9.
        > ### 9<sup>a</sup> Explicação:
        - 

    - [x] 10.
        > ### 10<sup>a</sup> Explicação:
        - 

- Referências:<br>
i. [Data and Time SQLite Functions](https://www.sqlite.org/lang_datefunc.html).<br>
ii. [Built-in-Functions](https://www.sqlite.org/lang_corefunc.html#substr).<br>
iii. [SQL-Language-Expressions](https://www.sqlite.org/lang_expr.html)

***

* [Voltar ao topo](#robot-ibm-school-of-data-engineering)

* [Voltar ao menu principal](https://github.com/DanScherr/ibm-school-of-data_engineering)


<a href="https://github.com/DanScherr">
    <img src='../../images/the-end-img.png' width=50%>
</a>
