# :robot: IBM school of data engineering 

## :eye::bee::cloud: **IBM Cloud + DB2** :game_die::chains:

<br>

# **Sumário:** :round_pushpin:

- [Conectando com VSCode](#conectando-com-vscode-por-extensao-satelliteglobe_with_meridians)
- [Rodando Queries](#rodando-querys-cyclonelink)    


***

<br>

# **Conectando com VSCode por Extensão:** :satellite::globe_with_meridians:
[:top: ***Voltar ao topo***](#robot-ibm-school-of-data-engineering)

<br>

### **1. Após criação de uma Instância no DB2, vá até o Painel Principal, clique em "Listar recursos"**;
[Caso necessite criar uma instância clique aqui](./../README.md/#instanciando-busts_in_silhouette) :point_left::link:

![](./../imageslistar-recursos.png)

### **2. Na aba de "Database", identificar a instância criada e selecioná-la**;

![](./../imagesdatabase-selecionar.png)


### **3. Selecionar "Credenciais de serviço"**;

![](./../imagescredenciais-selecionar.png)

### **4. Criar "Nova credencial"**;

![](./../imagesnova-credencial.png)

#### 4.1. Configurar nome a gosto e selecionar Função "Gerente";

![](./../imagesnova-credencial-1-conf.png)

#### 4.2. Clicar em "Incluir";

#### 4.3. Expandir informações de credencial nova;
![](./../imagesnova-credencial-2-expansao-chave.png)

#### 4.4. Criar um arquivo .env e copiar as informações da credencial nova: ```username; password; host; port; database.```
```certifique-se que seu arquivo .env esteja no seu gitignore.```

![](./../imagescreating-dot-env-file.png)

### **5. Volte a aba "Gerenciar" e clique em "Open UI"**;

![](./../imagesaba-gerenciar-open-UI.png)

### **6. Clicar na aba "administração"**;

![](./../imagesaba-adm-db2.png)

### **7. Selecionar seu tipo de Sistema Operacional**;
```no meu caso, utilizei Windows.```

![](./../imagestipo-so.png)

### **8. Realizar Download de Certificado**;

![](./../imagesdownload-certificado.png)

#### 8.1. Criar pasta e colar certificado;
```certifique-se de que arquivos .crt estejam no seu gitignore..```

![](./../imagescriar-pasta-colar-certificado.png)

#### 8.2. Adicionar path do certificado ao .env;
![](./../imagesdot-env-file-certificate-path.png)

### **9. No VSCode, baixar extensão "Db2 Connect"**;

![](./../imagesdb2-connect-extension.png)

#### 9.1. Adicione a extensão na sua barra lateral;

![](./../imagesdb2-connect-extension-barra-lateral.png)

### **10. Abra a extensão Db2 Connect**;

![](./../images)

### **11. Clique em "Connect"**;

![](./../imagesdb2-connect-manage-connection-profiles.png)

### **12. Clique em "Option 2"**;

![](./../imagesdb2-connect-criar-novo.png)

### **13. Preencha os campos do formulário com as informações de seu arquivo .env**;

#### 13.1. Habilite o campo "Enable SSl Security" e preencha com a variavel de ambiente "certificate_path";

![](./../imagesenable-ssl-security.png)

### **14. Clicar em "Save and close"**;

<br>

### **15. Verificar sucesso na conexão**;

![](./../imagesdb2-connection-successfully.png)

# **Rodando Querys**: :cyclone::link:
[:top: ***Voltar ao topo***](#robot-ibm-school-of-data-engineering)

### **1. Encontre o Schema com seu user ID e expanda a aba;**

### **2. Coloque o mouse em cima de "Tables" e clique no símbolo de mais à direita;**
#### 2.2. Uma query será aberta para criação de uma tabela padrão;

![](./../imagesnew-table.png)

### 3. Clique com o botão direito na janela da query e depois em "Execute Current SQL File";
```ou Ctrl+Shift+F.```

![](./../imagesrun-query.png)

### 4. Para criar views, vá na aba Views e em seguida no mais à esquerda;
```e assim sucessivamente para cada aba dentro do Schema para o seu Login.```

<br>

***

<br>

* [Voltar ao topo](#robot-ibm-school-of-data-engineering)

<a href="https://github.com/DanScherr">
    <img src='./../../../imagesthe-end-img.png' width=50%>
</a>
