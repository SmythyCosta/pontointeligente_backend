
[![Build Status](https://travis-ci.org/SmythyCosta/pontointeligente_backend.svg?branch=master)](https://travis-ci.org/SmythyCosta/pontointeligente_backend)

## PontoInteligente Backend

## Erros 

### Travis, Correcao de erros no arquivo. 
	https://github.com/travis-ci/travis-ci/issues/6298

### Erros com dados do tipo Optional
	<!-- Correcao de Bug dados do tipo Optional  -->
	<dependency>
		<groupId>com.fasterxml.jackson.datatype</groupId>
		<artifactId>jackson-datatype-jdk8</artifactId>
	</dependency>
	
### Dependencia para Enums
	<dependency>
		<groupId>org.apache.commons</groupId>
		<artifactId>commons-lang3</artifactId>
		<version>3.6</version>
	</dependency>
	
## End-Points

#### POST http://localhost:8080/api/cadastrar-pj
	{
	    "nome": "user",
	    "email": "user@email.com",
	    "senha": "123456",
	    "cpf": "123456",
	    "razaoSocial": "123456",
	    "cnpj": "123456"
	}

#### POST http://localhost:8080/api/cadastrar-pf
	{
	    "nome": "user",
	    "email": "user@email.com",
	    "senha": "123456",
	    "cpf": "123456",
	    "valorHora": "50",
	    "cnpj": "123456"
	}
	
#### GET http://localhost:8080/api/empresas/cnpj/1212121212

#### PUT http://localhost:8080/api/funcionarios/2
	{
	    "nome": "user",
	    "valorHora": "70",
	    "qtdHorasTrabalhoDia": "8.5",   
	    "email": "user@eamil.com"
	}

#### POST http://localhost:8080/api/lancamentos
	{
	    "data": "24-04-2019 01:06:00",
	    "tipo": "INICIO_TRABALHO",
	    "descricao": "INICIO de TRABALHO",   
	    "localizacao": "1.12121.121212",
	    "funcionarioId": "2",
	}

#### PUT http://localhost:8080/api/lancamentos/2
	{
	    "data": "24-04-2019 01:06:00",
	    "tipo": "INICIO_TRABALHO",
	    "descricao": "INICIO de TRABALHO",   
	    "localizacao": "1.12121.121212",
	    "funcionarioId": "2",
	}
	
#### GET http://localhost:8080/api/lancamentos/1
#### DELETE http://localhost:8080/api/lancamentos/{id}
#### GET http://localhost:8080/api/lancamentos/funcionario/2?dir=ASC&pag=0

#### POST http://localhost:8080/auth
	{
    	"email": "pf2@email.com",
    	"senha": "123456"
	}
	

## Swagger-ui
```
Ferramenta para acessar a api de forma mais interativa, http://localhost:8080/swagger-ui.html. Na classe SwaggerConfig deves configurar o usuario que ira ser autenticado para ser ajetado no Hearder das requisicoes.
```
