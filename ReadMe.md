[![Coverage Status](https://coveralls.io/repos/github/felerminoali/osoma/badge.svg)](https://coveralls.io/github/felerminoali/osoma)




==============================Como Correr O projecto na maquina Local===================================================
Ferramentas para correr o projecto na maquina local:
	--Java 8 "instalado"
	--MySql instalado e configurado;
	--IDE "intellij de preferencia"
	--Git "instalado, para fazer o clone do projecto na maquina local "

Como ter o projecto na maquina local?

	Obtencao do Projecto:
	--Apos a instalacao do git, fazer o clone pelo terminal(Linux), para windows usar o gitBash para fazer o clone do projecto;
	--Fazer clone com o seguinte comando  "git clone https://github.com/felerminoali/osoma.git"
	--Abrir o projecto clonado com uma IDE "deve estar conectado a internet para o IDE baixar as dependecias necessarias para a execucao do projecto";

	Base de Dados:
	--Criar a base de dados do projecto no MySql com o nome "osoma"
	--Correr o Script da Base de Dados que se encontra na pasta "/osoma/src/main/resources/static/heroku_9a0deeafda252b2.sql"

	No Projecto:
	--Abrir o ficheiro .java responsavel pela conexao da base de dados ao projecto "/osoma/src/main/java/mz/co/osoma/config/Hibernate.java"

	--Fazer alteracao do metodo "dataSource", colocando informacoes neccessarias para a conexao do projecto com a base de dados criada;



	@Bean
    public DriverManagerDataSource dataSource() {
        DriverManagerDataSource dataSource = new DriverManagerDataSource();

       dataSource.setDriverClassName("com.mysql.cj.jdbc.Driver");

       --Base de Dados Local
        dataSource.setUrl("jdbc:mysql://localhost:3306/osoma"); ---> A base de Dados Local
        dataSource.setUsername("nome de usuario mysql na maquina Local");
        dataSource.setPassword("palavra-passe do usuario acima na maquina local");



		-- A base de dados remota "Heroku"
   /*     dataSource.setUrl("jdbc:mysql://us-cdbr-iron-east-03.cleardb.net:3306/heroku_9a0deeafda252b2");
        dataSource.setUsername("bfaa4dbfc34090"); --Nome do usuario da base de dados remota
        dataSource.setPassword("637b79e7");*/ --palavra passe da base de dados remota;

        --Nota: com essa informacao da base de dados remota eh possivel fazer a conexao da base de dados remota com "navicat,workbench e outros " fazendo assim a alteracao da base de dados apartir dessas ferramentas. 



        return dataSource;
    }
Nota: Antes de fazer o push "mandar o projecto para o heroku", eh necessario comentar as linhas que correspondem a base de dados local e descomentar as linhas que correspndem as linhas da base de dados remota.

============================================================================================================================

Qualquer dificuldade que encontrar para correr o projecto, consultar a antiga team

					Team "osoma" 2019
					Rofino Valentim
					Guerzeneldo Marcelino
					Elton Gimo
					Caudencia Chereria







