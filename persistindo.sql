INSERT INTO clientes (nome, cpf, telefone, email, endereco) VALUES
	('Caio Silva', '123.432.789-01', '(11) 91234-5678', 'carlos.silva@email.com', 'Rua das Flores, 123 - São Paulo'),
	('Marilia Oliveira', '987.542.321-00', '(21) 99876-5432', 'maria.oliveira@email.com', 'Av. Brasil, 456 - Rio de Janeiro'),
	('Jonas Souza', '321.654.987-42', '(31) 97777-8888', 'joao.souza@email.com', 'Rua Minas, 890 - Belo Horizonte'),
	('Fabricia Costa', '555.444.543-22', '(41) 96666-5555', 'fernanda.costa@email.com', 'Rua Paraná, 250 - Curitiba'),
	('Paulo Santos', '222.333.434-55', '(51) 95555-4444', 'pedro.santos@email.com', 'Rua Bento Gonçalves, 12 - Porto Alegre');

INSERT INTO veiculos (id_cliente, placa, marca, modelo, ano) VALUES
	(1, 'ABC1A23', 'Volkswagen', 'Gol', 2018),
	(1, 'XYZ9B88', 'Honda', 'Civic', 2020),
	(2, 'KLM2C33', 'Fiat', 'Argo', 2019),
	(3, 'DEF3D44', 'Chevrolet', 'Onix', 2021),
	(4, 'GHI4E55', 'Toyota', 'Corolla', 2022),
	(5, 'JKL5F66', 'Ford', 'Ka', 2017);

INSERT INTO funcionarios (nome, cargo, telefone, email) VALUES
	('Rogério Almeida', 'Mecânico', '(11) 94567-1234', 'rogerio.almeida@oficina.com'),
	('André Carvalho', 'Mecânico', '(21) 93456-2234', 'andre.carvalho@oficina.com'),
	('Luciana Pereira', 'Atendente', '(31) 95678-3345', 'luciana.pereira@oficina.com'),
	('Marcos Lima', 'Gerente', '(41) 96789-4456', 'marcos.lima@oficina.com');

INSERT INTO servicos (descricao, preco_base) VALUES
	('Troca de óleo', 120.00),
	('Alinhamento e balanceamento', 150.00),
	('Troca de pastilhas de freio', 200.00),
	('Revisão geral', 350.00),
	('Troca de filtro de ar', 80.00);

INSERT INTO pecas (nome, preco_unitario, estoque) VALUES
	('Óleo 5W30', 45.00, 50),
	('Filtro de óleo', 30.00, 40),
	('Filtro de ar', 60.00, 25),
	('Pastilha de freio', 180.00, 30),
	('Pneu 175/65 R14', 350.00, 20);

INSERT INTO ordens_servico (id_veiculo, id_funcionario, data_abertura, data_fechamento, status, observacoes) VALUES
	(1, 1, '2025-10-20', '2025-10-21', 'FECHADA', 'Troca de óleo e revisão rápida'),
	(2, 2, '2025-10-22', NULL, 'EM ANDAMENTO', 'Cliente pediu revisão completa'),
	(3, 1, '2025-10-25', NULL, 'ABERTA', 'Agendada para amanhã'),
	(4, 3, '2025-10-19', '2025-10-20', 'FECHADA', 'Troca de pastilhas de freio'),
	(5, 2, '2025-10-18', '2025-10-19', 'FECHADA', 'Troca de óleo e filtro');

INSERT INTO servicos_realizados (id_os, id_servico, quantidade, valor_total) VALUES
	(1, 1, 1, 120.00), 
	(1, 5, 1, 80.00),  
	(2, 4, 1, 350.00),  
	(4, 3, 1, 200.00),  
	(5, 1, 1, 120.00),  
	(5, 2, 1, 150.00);  

INSERT INTO pecas_utilizadas (id_sr, id_peca, quantidade, valor_total) VALUES
	(1, 1, 4, 180.00),   
	(1, 2, 1, 30.00), 
	(2, 3, 1, 60.00),    
	(4, 4, 1, 180.00),   
	(5, 1, 4, 180.00),   
	(6, 5, 4, 1400.00);  
    
select * from clientes;
select * from Funcionarios;
select * from ordens_servico;
select * from pecas;
select * from pecas_utilizadas;
select * from servicos;
select * from servicos_realizados;
select * from veiculos;