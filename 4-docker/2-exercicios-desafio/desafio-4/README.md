# :whale: Desafio 4

### 1. 1 Provisione uma aplicacao e persista os dados dela. Vamos utilizar neste exercicio o docker-compose.
- [x] Crie uma pasta para conter a estutura do seu projeto;
- [x] Neste exercicio vamos utilizar uma aplicacao em python e um redis;
- [x] Crie os arquivos:<br>
a) app.py<br>
b) requirements.txt

![imagem-1](./images/1.png)


### 2. Crie um arquivo Dockerfile.
![imagem-2](./images/2.png)

### 3. Crie um arquivo docker-compose.yml. Nele voce deve ter a estrutura para que seja feita o build da sua aplicacao e suba junto uma outra aplicacao que o redis.

![imagem-3](./images/3.png)

### 4. Considerações
* Fique bem atento pois estao faltando varias declaracoes para que suba a sua aplicacao em python e o redis que devem serem executados. Repare que existe uma declaracao de volume. Isso significa que os dados do redis serao armazenados e mesmo que o container se encerre os dados nao serao perdidos;

* Apos a construcao do arquivo, execute o comando necessario para que realize o build da aplicacao e entao suba os dois servicos;

* O resultado final deve ser semelhante ao abaixo:

![Localhost](./imagens/pyredis.png)

* Repare que a cada refresh no seu navegador o numero e modificado;

* Execute o comando para baixar os dois servicos e entao suba novamente o docker-compose e veja se o numero permanece o mesmo ou ele inicia a partir do 1. Se iniciar a partir do 1 ele estara errado. E necessario rever a parte do volume do seu docker-compose.

