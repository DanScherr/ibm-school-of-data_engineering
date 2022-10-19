# importando imagem
FROM redhat/ubi8

# construindo as labels de autor e descrição da imagem
LABEL maintainer="Daniel Scheicher danielscheicher@gmail.com"
LABEL description="A custom Apache container based on UBI 8"

# comando run para instalar o apache, limpar tela e alterar o conteudo padrão da home page no build da imagem
RUN yum install -y httpd && yum clean all
RUN echo "Hello from Dockerfile" > /var/www/html/index.html

# expondo porta 80 do container
EXPOSE 80

# comandos que serão executados quando o container for iniciado
CMD ["httpd", "-D", "FOREGROUND"]
