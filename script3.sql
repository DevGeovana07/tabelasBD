-- criando um banco de dados
create database if not exists vendas;
USE vendas;

CREATE TABLE IF NOT EXISTS CLIENTE
(codigo_cliente smallint not null unique,
nome_cliente char(20),
endereco char(30),
cidade char(15),
CEP char(8),
UF char(2),
CNPJ char(20),
IE char(20),
CONSTRAINT PK_Cliente Primary Key (codigo_cliente)
);
-- inserindo dados
insert into CLIENTE values(2,'Marcos','Rua Rejane Soares de Alencar','João Pessoa','58063480','PB','52313487/0001','nada');

-- exibir as tabelas
select * from CLIENTE;

-- DESCOBRINDO COMO É UMA ESTRTUTA DA TABELA
desc CLIENTE;

CREATE TABLE IF NOT EXISTS PRODUTO(
codigo_produto smallint not null unique,
unidade char(9),
descricao char(45),
comissao_maxima char(25),
CONSTRAINT PK_Vendedor Primary Key (codigo_produto)
);

CREATE TABLE IF NOT EXISTS Vendedor(
	codigo_vendedor smallint not null unique,
	nome_vendedor varchar(20) not null,
	salario_fixo double,
	faixa_de_comissao char(1),
-- 'comissao_maxima' vai ser do tipo 'double' e recebe o 'salario * 2'
	comissao_maxima DOUBLE AS (salario_fixo * 2),
	Primary key (codigo_vendedor)
);


CREATE TABLE IF NOT EXISTS Pedido(
	numero_pedido int not null unique,
	prazo_de_entrega smallint not null,
	codigo_cliente smallint not null,
	codigo_vendedor smallint not null,
	FOREIGN KEY (codigo_cliente) REFERENCES Cliente(codigo_cliente),
	/* FOREIGN KEY (codigo_cliente) REFERENCES Cliente(codigo_cliente): 
	Define uma chave estrangeira na coluna codigo_cliente da tabela Pedido,
	que referencia a coluna codigo_cliente da tabela Cliente. Isso garante 
	que cada valor na coluna codigo_cliente da tabela Pedido corresponda a 
	um valor existente na coluna codigo_cliente da tabela Cliente. */
	FOREIGN KEY (codigo_vendedor) REFERENCES Vendedor(codigo_vendedor)
	/* FOREIGN KEY (codigo_vendedor) REFERENCES Vendedor(codigo_vendedor): 
	Similar à linha anterior, essa instrução define uma chave estrangeira 
	na coluna codigo_vendedor da tabela Pedido, que referencia a coluna 
	codigo_vendedor da tabela Vendedor. Isso garante que cada valor na coluna 
	codigo_vendedor da tabela Pedido corresponda a um valor existente na 
	coluna codigo_vendedor da tabela Vendedor.
	*/
);

CREATE TABLE IF NOT EXISTS Item_de_pedido(
	numero_pedido int not null unique,
	codigo_produto smallint not null unique,
	quantidade decimal,
    /* Chave Primária (PRIMARY KEY): CONSTRAINT é usado para definir uma 
    chave primária em uma tabela, garantindo que cada linha tenha um 
    valor único na coluna especificada ou nas colunas combinadas, 
    conforme necessário.
    Exemplo:
	CONSTRAINT PK_EXEMPLO PRIMARY KEY (coluna) */
	CONSTRAINT PK_ITEM_DE_PEDIDO
		Primary key (numero_pedido, codigo_produto),
        
	/* Chave Estrangeira (FOREIGN KEY): CONSTRAINT também é usado para criar chaves estrangeiras, 
    que estabelecem relações entre duas tabelas, garantindo que os valores em uma coluna 
    correspondam aos valores existentes em outra coluna de outra tabela.
    Exemplo:
	CONSTRAINT FK_EXEMPLO FOREIGN KEY (coluna) REFERENCES outra_tabela (outra_coluna) */
    CONSTRAINT PK_PEDIDO
		FOREIGN KEY (numero_pedido) REFERENCES Pedido(numero_pedido),
	CONSTRAINT PK_PRODUTO
		FOREIGN KEY (codigo_produto) REFERENCES Produto(codigo_produto)
);





