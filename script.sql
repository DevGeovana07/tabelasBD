-- CREATE DATABASE IF NOT EXISTS vendas;
USE vendas;
CREATE TABLE IF NOT EXISTS PRODUTO(
codigo_produto smallint not null unique,
unidade char(9),
descricao char(45),
valor_unitario double,
CONSTRAINT PK_Produto Primary Key (codigo_produto)
);

CREATE TABLE IF NOT EXISTS VENDEDOR(
codigo_vendedor smallint not null unique,
nome char(25),
salario_fixo double,
faixa_de_comissao char(30),
comissao_maxima char (25),
CONSTRAINT PK_Vendedor Primary Key (codigo_vendedor)
);

CREATE TABLE IF NOT EXISTS vendas.CLIENTE
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

CREATE TABLE IF NOT EXISTS PEDIDO(
numero_do_pedido smallint not null unique,
prazo_de_entrega int(10),
codigo_cliente smallint not null unique,
codigo_do_vendedor smallint not null unique,
CONSTRAINT PK_Pedido Primary Key (numero_do_pedido),
CONSTRAINT FK_Cliente Foreign Key (codigo_cliente) REFERENCES cliente(codigo_cliente),
CONSTRAINT FK_Vendedor Foreign Key (codigo_vendedor) REFERENCES vendedor(codigo_vendedor),
); 

CREATE TABLE IF NOT EXISTS ITEM_DE_PEDIDO(
numero_do_pedido smallint not null unique,
codigo_do_produto smallint not null unique,
quantidade int(10),
CONSTRAINT PK_Pedido Primary Key (numero_do_pedido, codigo_do_produto),
CONSTRAINT FK_Cliente Foreign Key (numero_do_pedido) REFERENCES pedido(numero_cliente),
CONSTRAINT FK_Cliente Foreign Key (codigo_do_produto) REFERENCES produto(codigo_do_produto),

);

