CREATE DATABASE Oficina;
USE Oficina;
CREATE TABLE clientes(
    id_cliente INT AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE,
    telefone VARCHAR(20),
    email VARCHAR(100),
    endereco VARCHAR(150),
    PRIMARY KEY (id_cliente)
);
CREATE TABLE veiculos (
    id_veiculo INT AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    placa VARCHAR(10) UNIQUE NOT NULL,
    marca VARCHAR(50),
    modelo VARCHAR(50),
    ano INT,
    PRIMARY KEY(id_veiculo),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);
CREATE TABLE funcionarios (
    id_funcionario INT AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50),
    telefone VARCHAR(20),
    email VARCHAR(100),
    PRIMARY KEY(id_funcionario)
);
CREATE TABLE servicos (
    id_servico INT AUTO_INCREMENT,
    descricao VARCHAR(100) NOT NULL,
    preco_base DECIMAL(10,2),
    PRIMARY KEY(id_servico)
);
CREATE TABLE pecas (
    id_peca INT AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    estoque INT DEFAULT 0,
    PRIMARY KEY(id_peca)
);
CREATE TABLE ordens_servico (
    id_os INT AUTO_INCREMENT,
    id_veiculo INT NOT NULL,
    id_funcionario INT NOT NULL,
    data_abertura DATE NOT NULL,
    data_fechamento DATE,
    status ENUM('ABERTA','EM ANDAMENTO','FECHADA') DEFAULT 'ABERTA',
    observacoes TEXT,
    PRIMARY KEY(id_os),
    FOREIGN KEY (id_veiculo) REFERENCES veiculos(id_veiculo),
    FOREIGN KEY (id_funcionario) REFERENCES funcionarios(id_funcionario)
);
CREATE TABLE servicos_realizados (
    id_sr INT AUTO_INCREMENT,
    id_os INT NOT NULL,
    id_servico INT NOT NULL,
    quantidade INT DEFAULT 1,
    valor_total DECIMAL(10,2),
    PRIMARY KEY(id_sr),
    FOREIGN KEY (id_os) REFERENCES ordens_servico(id_os),
    FOREIGN KEY (id_servico) REFERENCES servicos(id_servico)
);
CREATE TABLE pecas_utilizadas (
    id_pu INT AUTO_INCREMENT,
    id_sr INT NOT NULL,
    id_peca INT NOT NULL,
    quantidade INT DEFAULT 1,
    valor_total DECIMAL(10,2),
    PRIMARY KEY(id_pu),
    FOREIGN KEY (id_sr) REFERENCES servicos_realizados(id_sr),
    FOREIGN KEY (id_peca) REFERENCES pecas(id_peca)
);
show tables;
select * from clientes;
select * from Funcionarios;
select * from ordens_servico;
select * from pecas;
select * from pecas_utilizadas;
select * from servicos;
select * from servicos_realizados;
select * from veiculos;

--- RECUPERANDO DADOS ---

--- Selecionando os clientes e os seus respectivos veiculos
select cpf, nome, telefone, marca, modelo, placa, ano 
from clientes join veiculos on clientes.id_cliente = veiculos.id_cliente
order by nome, ano;

--- Selectionando os dados dos clientes, veiculos e o status da ordem de serviço, com isso, podemos analisar o tempo de atrado dos serviços.
select nome, telefone, modelo, placa, ano, data_abertura, data_fechamento, status, observacoes
from clientes join veiculos join ordens_servico
having status = 'ABERTA'
order by data_abertura;

--- Filtrando os funcionarios e suas ordens de serviços em aberto/andamento.
select nome as funcionario, cargo, modelo, placa, data_abertura, status, observacoes
from ordens_servico as os join veiculos as v
on os.id_veiculo = v.id_veiculo
join funcionarios as f on os.id_funcionario = f.id_funcionario
having status <> 'fechada' 
order by nome;