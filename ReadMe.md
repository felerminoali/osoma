[![Coverage Status](https://coveralls.io/repos/github/felerminoali/osoma/badge.svg)](https://coveralls.io/github/felerminoali/osoma)

==============================Como Correr O projeto na maquina Local===================================================
Ferramentas para correr o projeto na maquina local:
    --Java 8 "instalado"
    --MySql instalado e configurado;
    --IDE "intellij de preferência"
    --Git "instalado, para fazer o clone do projeto na maquina local "

Como ter o projeto na maquina local?

    Obtenção do Projeto:
    --Apos a instalação do git, fazer o clone pelo terminal(Linux), para windows usar o gitBash para fazer o clone do projeto;
    --Fazer clone com o seguinte comando  "git clone https://github.com/felerminoali/osoma.git"
    --Abrir o projeto clonado com uma IDE "deve estar conectado a internet para o IDE baixar as dependências necessárias para a execução do projeto";

    Base de Dados:
    --Criar a base de dados do projeto no MySql com o nome "osoma"
    --Correr o Script da Base de Dados que se encontra na pasta "/osoma/src/main/resources/static/heroku_9a0deeafda252b2.sql"

    No Projecto:
    --Abrir o ficheiro .java responsável pela conexão da base de dados ao projeto "/osoma/src/main/java/mz/co/osoma/config/Hibernate.java"

    --Fazer alteração do método "dataSource", colocando informações necessárias para a conexão do projeto com a base de dados criada;


    @Bean
    public DriverManagerDataSource dataSource() {
        DriverManagerDataSource dataSource = new DriverManagerDataSource();

       dataSource.setDriverClassName("com.mysql.cj.jdbc.Driver");

       --Base de Dados Local
        dataSource.setUrl("jdbc:mysql://localhost:3306/osoma"); ---> A base de Dados Local
        dataSource.setUsername("nome de usuario mysql na maquina Local");
        dataSource.setPassword("palavra-passe do usuário acima na maquina local");


        -- A base de dados remota "Heroku"
   /*     dataSource.setUrl("jdbc:mysql://us-cdbr-iron-east-03.cleardb.net:3306/heroku_9a0deeafda252b2");
        dataSource.setUsername("bfaa4dbfc34090"); --Nome do usuário da base de dados remota
        dataSource.setPassword("637b79e7");*/ --palavra passe da base de dados remota;

        --Nota: com essa informação da base de dados remota eh possível fazer a conexão da base de dados remota com "navicat,workbench e outros " fazendo assim a alteração da base de dados a partir dessas ferramentas. 


        return dataSource;
    }

    ===========Cobertura de código============
    Para configurar a cobertura de código no projeto é necessário acrescentar algumas dependências no projeto através do ficheiro pom.xml
    Os passos para a configuração das dependências para a cobertura de código são:
    
    1 - Acrescentar as dependências do plugin coveralls no ficheiro pom.xml
         __________pom.xml_________________________________________
        |                                                           |
        |   <plugin>                                                |
        |       <groupId>org.eluder.coveralls</groupId>             |
        |       <artifactId>coveralls-maven-plugin</artifactId>     |
        |        <version>4.3.0</version>                           |
        |    </plugin>                                              |
        | <plugin>                                                  |
        |       <groupId>org.jacoco</groupId>                       |
        |        <artifactId>jacoco-maven-plugin</artifactId>       |
        |        <version>0.7.6.201602180812</version>              |
        |        <executions>                                       |
        |            <execution>                                    |
        |                <id>prepare-agent</id>                     |
        |                <goals>                                    |
        |                    <goal>prepare-agent</goal>             |
        |                </goals>                                   |
        |            </execution>                                   |
        |        </executions>                                      |
        |    </plugin>                                              |
        |___________________________________________________________|

    2 - Adicionar o comando de execução automática de cobertura de código apos o sucesso do Build No travis-ci,         ficheiro .travis.yml

         ___________.travis.yml_____________________________________
        |                                                           |
        |   after_success:                                          |
        |       - mvn clean test jacoco:report coveralls:report     |                                       |
        |___________________________________________________________|

    3 - Aceder o site Coverals.io, entrar no site com as credenciais do seu git, e adicionar a cobertura de código o    seu repositório.
    
    4 - Configuração concluída.

    Existem varias formas de verificar a cobertura de codigo, explicaremos duas dessas formas :
    
    1- Entrar no repositório do github "https://github.com/felerminoali/osoma"
        Clicar sobre o ícone "coverage|%" será redirecionado ao site coverals.io e poderá ver a estatística global
        de cobertura.
    2- Entrar no site "coverals.io" com as credenciais do git de Felermino Ali, terá o mesmo resultado que no passo 1
   
        
Nota: Antes de fazer o push "carregar o projeto para o heroku", é necessário comentar as linhas que correspondem a base de dados local e descomentar as linhas que correspondem as linhas da base de dados remota.

============================================================================================================================

Qualquer dificuldade que encontrar para correr o projeto, consultar a equipe anterior.

                    Team "osoma" 2019
                    
                    Membros da equipa           |Contacto
                    ____________________________|__________________________
                    Rofino Valentim             | rvalentim@unilurio.ac.mz
                    Guerzeneldo Marcelino       | gfernando@unilurio.ac.mz
                    Elton Gimo                  | egimo@unilurio.ac.mz
                    Caudencia Chereria          | cchereria@unilurio.ac.mz
