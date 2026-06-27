-- =============================================================
-- SEEDS - LOJA DE CALCADOS
-- Ordem respeitando dependencias de FK
-- =============================================================

-- ----------------------------
-- 01. CARGOS
-- ----------------------------
INSERT INTO CARGOS (NOME) VALUES
    ('Gerente'),
    ('Vendedor'),
    ('Estoquista'),
    ('Caixa'),
    ('Auxiliar Administrativo');

-- ----------------------------
-- 02. FUNCIONARIOS
-- ----------------------------
INSERT INTO FUNCIONARIOS (CRACHA, NOME, CPF, DATA_NASCIMENTO, DATA_ADMISSAO, ID_CARGO, SALARIO) VALUES
    ('F001', 'Ricardo Almeida Santos',    '011.222.333-44', '1985-03-12', '2019-01-10', 1, 4800.00),
    ('F002', 'Mariana Costa Ferreira',    '022.333.444-55', '1992-07-25', '2020-03-01', 2, 2200.00),
    ('F003', 'Bruno Henrique Oliveira',   '033.444.555-66', '1990-11-08', '2020-03-01', 2, 2200.00),
    ('F004', 'Juliana Ramos Pereira',     '044.555.666-77', '1995-04-17', '2021-06-15', 4, 2000.00),
    ('F005', 'Carlos Eduardo Lima',       '055.666.777-88', '1988-09-30', '2022-02-01', 3, 1900.00);

-- ----------------------------
-- 03. FUNCIONARIO_CONTATO
-- ----------------------------
INSERT INTO FUNCIONARIO_CONTATO (ID_FUNCIONARIO, TIPO, VALOR) VALUES
    (1, 'TELEFONE', '(51) 99111-0001'),
    (1, 'EMAIL',    'ricardo.almeida@loja.com'),
    (2, 'TELEFONE', '(51) 99222-0002'),
    (2, 'WHATSAPP', '(51) 99222-0002'),
    (2, 'EMAIL',    'mariana.costa@loja.com'),
    (3, 'TELEFONE', '(51) 99333-0003'),
    (3, 'EMAIL',    'bruno.oliveira@loja.com'),
    (4, 'TELEFONE', '(51) 99444-0004'),
    (4, 'EMAIL',    'juliana.ramos@loja.com'),
    (5, 'TELEFONE', '(51) 99555-0005'),
    (5, 'EMAIL',    'carlos.lima@loja.com');

-- ----------------------------
-- 04. FUNCIONARIO_ENDERECO
-- ----------------------------
INSERT INTO FUNCIONARIO_ENDERECO (ID_FUNCIONARIO, LOGRADOURO, NUMERO, COMPLEMENTO, BAIRRO, CIDADE, ESTADO, CEP) VALUES
    (1, 'Rua das Flores',       '120',  'Apto 301', 'Centro',          'Porto Alegre', 'RS', '90010-140'),
    (2, 'Av. Ipiranga',         '880',  NULL,        'Azenha',          'Porto Alegre', 'RS', '90160-093'),
    (3, 'Rua Garibaldi',        '45',   'Casa',      'Bom Fim',         'Porto Alegre', 'RS', '90035-050'),
    (4, 'Rua Sete de Setembro', '200',  'Apto 12',  'Centro',          'Canoas',       'RS', '92010-230'),
    (5, 'Av. Farroupilha',      '1500', NULL,        'São Geraldo',     'Porto Alegre', 'RS', '90230-020');

-- ----------------------------
-- 05. CLIENTE
-- ----------------------------
INSERT INTO CLIENTE (NOME, CPF, DATA_NASCIMENTO) VALUES
    ('Ana Paula Silveira',      '111.222.333-01', '1990-05-14'),
    ('Fernando Gomes Souza',    '111.222.333-02', '1985-08-22'),
    ('Patricia Mendes Rocha',   '111.222.333-03', '1993-11-03'),
    ('Lucas Teixeira Cardoso',  '111.222.333-04', '1998-01-30'),
    ('Beatriz Nunes Faria',     '111.222.333-05', '1987-06-19'),
    ('Rodrigo Campos Viana',    '111.222.333-06', '2000-09-07'),
    ('Camila Borges Martins',   '111.222.333-07', '1995-03-25'),
    ('Diego Lopes Azevedo',     '111.222.333-08', '1991-12-11'),
    ('Fernanda Castro Dias',    '111.222.333-09', '1983-04-02'),
    ('Thiago Pinto Barbosa',    '111.222.333-10', '1996-07-18');

-- ----------------------------
-- 06. CLIENTE_CONTATO
-- ----------------------------
INSERT INTO CLIENTE_CONTATO (ID_CLIENTE, TIPO, VALOR) VALUES
    (1,  'TELEFONE', '(51) 98001-1001'),
    (1,  'EMAIL',    'ana.silveira@email.com'),
    (2,  'TELEFONE', '(51) 98001-1002'),
    (2,  'WHATSAPP', '(51) 98001-1002'),
    (3,  'EMAIL',    'patricia.rocha@email.com'),
    (3,  'TELEFONE', '(51) 98001-1003'),
    (4,  'WHATSAPP', '(51) 98001-1004'),
    (4,  'EMAIL',    'lucas.cardoso@email.com'),
    (5,  'TELEFONE', '(51) 98001-1005'),
    (6,  'EMAIL',    'rodrigo.viana@email.com'),
    (6,  'TELEFONE', '(51) 98001-1006'),
    (7,  'WHATSAPP', '(51) 98001-1007'),
    (7,  'EMAIL',    'camila.martins@email.com'),
    (8,  'TELEFONE', '(51) 98001-1008'),
    (9,  'EMAIL',    'fernanda.dias@email.com'),
    (10, 'TELEFONE', '(51) 98001-1010'),
    (10, 'WHATSAPP', '(51) 98001-1010');

-- ----------------------------
-- 07. CLIENTE_ENDERECO
-- ----------------------------
INSERT INTO CLIENTE_ENDERECO (ID_CLIENTE, LOGRADOURO, NUMERO, COMPLEMENTO, BAIRRO, CIDADE, ESTADO, CEP, PAIS) VALUES
    (1,  'Rua Lima e Silva',      '350', 'Apto 5',  'Cidade Baixa',  'Porto Alegre', 'RS', '90050-100', 'Brasil'),
    (2,  'Av. Protásio Alves',    '900', NULL,       'Petrópolis',    'Porto Alegre', 'RS', '90410-000', 'Brasil'),
    (3,  'Rua Osvaldo Aranha',    '210', 'Casa 2',  'Bom Fim',       'Porto Alegre', 'RS', '90035-190', 'Brasil'),
    (4,  'Rua Vieira de Castro',  '80',  NULL,       'Auxiliadora',   'Porto Alegre', 'RS', '90540-040', 'Brasil'),
    (5,  'Av. Nilo Peçanha',      '1200','Apto 301','Boa Vista',      'Porto Alegre', 'RS', '91330-001', 'Brasil'),
    (6,  'Rua Fernandes Vieira',  '55',  NULL,       'Bela Vista',    'Porto Alegre', 'RS', '90350-220', 'Brasil'),
    (7,  'Av. Independência',     '777', 'Apto 11', 'Independência', 'Porto Alegre', 'RS', '90035-072', 'Brasil'),
    (8,  'Rua João Alfredo',      '430', NULL,       'Cidade Baixa',  'Porto Alegre', 'RS', '90050-230', 'Brasil'),
    (9,  'Av. Carlos Gomes',      '1500','Sala 3',  'Três Figueiras','Porto Alegre', 'RS', '90480-003', 'Brasil'),
    (10, 'Rua Barão do Gravataí', '90',  NULL,       'Santana',       'Porto Alegre', 'RS', '90040-370', 'Brasil');

-- ----------------------------
-- 08. CATEGORIA
-- ----------------------------
INSERT INTO CATEGORIA (NOME, DESCRICAO, ATIVO) VALUES
    ('Tênis Esportivo',   'Calçados para prática de esportes e academia',  'A'),
    ('Sapato Social',     'Calçados formais para uso profissional e eventos','A'),
    ('Bota',              'Botas masculinas e femininas, cano curto e longo','A'),
    ('Sandália',          'Sandálias e rasteiras femininas',                'A'),
    ('Chinelo',           'Chinelos e slides para uso casual',              'A'),
    ('Sapatilha',         'Sapatilhas e calçados femininos rasos',          'A'),
    ('Infantil',          'Calçados para crianças de todas as idades',      'A'),
    ('Acessórios',        'Meias, palmilhas e cadarços',                    'I');

-- ----------------------------
-- 09. FORNECEDOR
-- ----------------------------
INSERT INTO FORNECEDOR (NOME_FANTASIA) VALUES
    ('Calçados Beira Rio'),
    ('Grendene Distribuidora'),
    ('Via Marte Atacado');

-- ----------------------------
-- 10. FORNECEDOR_UNIDADE
-- ----------------------------
INSERT INTO FORNECEDOR_UNIDADE (ID_EMPRESA, CNPJ, RAZAO_SOCIAL, INSCRICAO_ESTADUAL, DESC_UNIDADE, ATIVO) VALUES
    (1, '10.000.001/0001-91', 'Beira Rio Calçados Ltda',           '001/1234567',  'Matriz - Novo Hamburgo/RS',  'A'),
    (1, '10.000.001/0002-72', 'Beira Rio Calçados Ltda',           '001/9876543',  'Filial - Porto Alegre/RS',   'A'),
    (2, '20.000.002/0001-83', 'Grendene S.A.',                     '002/1122334',  'Matriz - Farroupilha/RS',    'A'),
    (3, '30.000.003/0001-74', 'Via Marte Comércio de Calçados SA', '003/5566778',  'Matriz - São Paulo/SP',      'A'),
    (3, '30.000.003/0002-55', 'Via Marte Comércio de Calçados SA', '003/9900112',  'CD - Gravataí/RS',           'I');

-- ----------------------------
-- 11. FORNECEDOR_ENDERECO
-- ----------------------------
INSERT INTO FORNECEDOR_ENDERECO (ID_FORNECEDOR_UNIDADE, TIPO_ENDERECO, LOGRADOURO, NUMERO, COMPLEMENTO, BAIRRO, CIDADE, ESTADO, CEP) VALUES
    (1, 'Comercial', 'Av. Victor Hugo Kunz',    '1200', NULL,      'Industrial', 'Novo Hamburgo', 'RS', '93310-250'),
    (2, 'Comercial', 'Rua dos Andradas',         '500',  'Loja 2', 'Centro',     'Porto Alegre',  'RS', '90020-005'),
    (3, 'Comercial', 'Rua Eng. Luis Englert',    '80',   NULL,      'Centro',    'Farroupilha',   'RS', '95180-000'),
    (4, 'Comercial', 'Av. das Nações Unidas',    '12555','Bloco A', 'Brooklin',  'São Paulo',     'SP', '04578-000'),
    (4, 'Entrega',   'Av. das Nações Unidas',    '12555','Bloco B', 'Brooklin',  'São Paulo',     'SP', '04578-000'),
    (5, 'Comercial', 'Av. Presidente Vargas',    '800',  NULL,      'Industrial','Gravataí',      'RS', '94110-020');

-- ----------------------------
-- 12. FORNECEDOR_CONTATO
-- ----------------------------
INSERT INTO FORNECEDOR_CONTATO (ID_FORNECEDOR_UNIDADE, NOME, CARGO, TELEFONE, EMAIL) VALUES
    (1, 'Sandro Menezes',    'Representante Comercial', '(51) 3222-1001', 'sandro@beirario.com.br'),
    (2, 'Tatiana Alves',     'Gerente de Contas',        '(51) 3333-2002', 'tatiana@beirario.com.br'),
    (3, 'Paulo Henrique',    'Executivo de Vendas',      '(54) 3266-3003', 'ph.vendas@grendene.com.br'),
    (4, 'Renata Machado',    'Representante SP',         '(11) 4000-4004', 'renata@viamarte.com.br'),
    (5, 'Gilberto Souza',    'Coordenador Logístico',   '(51) 3500-5005', 'gilberto@viamarte.com.br');

-- ----------------------------
-- 13. PRODUTOS
-- ----------------------------
INSERT INTO PRODUTOS (NOME, PRECO, ID_CATEGORIA, ID_FORNECEDOR_UNIDADE, ATIVO) VALUES
    ('Tênis Running Pro 3.0',        299.90, 1, 1, 'A'),
    ('Tênis Crossfit Max',           349.90, 1, 1, 'A'),
    ('Tênis Casual Street',          189.90, 1, 2, 'A'),
    ('Sapato Social Oxford Couro',   399.90, 2, 4, 'A'),
    ('Sapato Social Derby Marrom',   379.90, 2, 4, 'A'),
    ('Bota Couro Cano Curto',        459.90, 3, 1, 'A'),
    ('Bota Western Feminina',        419.90, 3, 2, 'A'),
    ('Sandália Flatform',            159.90, 4, 3, 'A'),
    ('Sandália Tiras Dourada',       189.90, 4, 3, 'A'),
    ('Chinelo Slide Comfort',         79.90, 5, 3, 'A'),
    ('Chinelo Dedo Masculino',        59.90, 5, 3, 'A'),
    ('Sapatilha Ballet Verniz',      149.90, 6, 4, 'A'),
    ('Sapatilha Couro Flexível',     169.90, 6, 4, 'A'),
    ('Tênis Infantil Velcro',        149.90, 7, 2, 'A'),
    ('Sandália Infantil Menina',      99.90, 7, 3, 'A');

-- ----------------------------
-- 14. LOCAL_ESTOQUE
-- ----------------------------
INSERT INTO LOCAL_ESTOQUE (DESCRICAO) VALUES
    ('Estoque Principal - Loja'),
    ('Depósito Fundos'),
    ('Vitrine/Exposição');

-- ----------------------------
-- 15. ESTOQUE
-- ----------------------------
INSERT INTO ESTOQUE (ID_PRODUTO, QUANTIDADE, QUANTIDADE_MAXIMA, QUANTIDADE_MINIMA, ID_LOCAL) VALUES
    (1,  40, 60, 10, 1),
    (2,  35, 60, 10, 1),
    (3,  50, 80, 15, 1),
    (4,  20, 40,  5, 1),
    (5,  18, 40,  5, 1),
    (6,  25, 50,  8, 1),
    (7,  22, 50,  8, 1),
    (8,  60, 100,20, 1),
    (9,  45, 100,20, 1),
    (10, 80, 120,30, 1),
    (11, 70, 120,30, 1),
    (12, 30, 60, 10, 1),
    (13, 28, 60, 10, 1),
    (14, 35, 60, 15, 1),
    (15, 40, 80, 15, 1),
    (1,   5, 10,  2, 3),
    (2,   4, 10,  2, 3),
    (4,   3,  6,  1, 3),
    (6,   4,  8,  1, 3),
    (8,   8, 15,  3, 3);

-- ----------------------------
-- 16. FORMA_PAGAMENTO
-- ----------------------------
INSERT INTO FORMA_PAGAMENTO (NOME) VALUES
    ('Dinheiro'),
    ('PIX'),
    ('Cartão de Débito'),
    ('Cartão de Crédito'),
    ('Boleto');

-- ----------------------------
-- 17. TIPO_MOVIMENTO_ESTOQUE
-- ----------------------------
INSERT INTO TIPO_MOVIMENTO_ESTOQUE (MOVIMENTO) VALUES
    ('Entrada por Compra'),
    ('Saída por Venda'),
    ('Ajuste Positivo'),
    ('Ajuste Negativo'),
    ('Transferência entre Locais');

-- ----------------------------
-- 18. VENDA
-- ----------------------------
INSERT INTO VENDA (ID_CLIENTE, ID_FUNCIONARIO, DATA_VENDA, STATUS, VALOR_BRUTO, VALOR_DESCONTO, OBSERVACAO) VALUES
    (1,  2, '2026-05-02', 'CONCLUIDA', 299.90,  0.00,   NULL),
    (2,  3, '2026-05-05', 'CONCLUIDA', 779.80, 50.00,   'Desconto fidelidade'),
    (3,  2, '2026-05-08', 'CONCLUIDA', 159.90,  0.00,   NULL),
    (4,  3, '2026-05-10', 'CONCLUIDA', 459.90, 30.00,   NULL),
    (5,  2, '2026-05-12', 'CONCLUIDA', 399.90,  0.00,   NULL),
    (6,  3, '2026-05-15', 'CANCELADA', 189.90,  0.00,   'Cliente desistiu na entrega'),
    (7,  2, '2026-05-18', 'CONCLUIDA', 538.80, 40.00,   NULL),
    (8,  3, '2026-05-20', 'CONCLUIDA', 149.90,  0.00,   NULL),
    (9,  2, '2026-05-22', 'CONCLUIDA', 629.80, 20.00,   NULL),
    (10, 3, '2026-05-25', 'CONCLUIDA', 299.90,  0.00,   NULL),
    (1,  2, '2026-06-02', 'CONCLUIDA', 189.90, 10.00,   NULL),
    (3,  3, '2026-06-05', 'CONCLUIDA', 349.90,  0.00,   NULL),
    (5,  2, '2026-06-10', 'ABERTA',    459.90,  0.00,   'Aguardando retirada'),
    (7,  3, '2026-06-15', 'CONCLUIDA', 169.90,  0.00,   NULL),
    (9,  2, '2026-06-20', 'CONCLUIDA', 379.90, 15.00,   'Cliente VIP');

-- ----------------------------
-- 19. VENDA_ITEM
-- ----------------------------
INSERT INTO VENDA_ITEM (ID_VENDA, ID_PRODUTO, QUANTIDADE, PRECO_UNITARIO, VALOR_DESCONTO) VALUES
    (1,  1,  1, 299.90,  0.00),
    (2,  4,  1, 399.90, 30.00),
    (2,  10, 2,  79.90, 10.00),
    (2,  11, 1,  59.90, 10.00),
    (3,  8,  1, 159.90,  0.00),
    (4,  6,  1, 459.90, 30.00),
    (5,  4,  1, 399.90,  0.00),
    (6,  3,  1, 189.90,  0.00),
    (7,  13, 1, 169.90, 20.00),
    (7,  9,  2, 189.90, 10.00),
    (8,  14, 1, 149.90,  0.00),
    (9,  2,  1, 349.90, 10.00),
    (9,  12, 1, 149.90,  0.00),
    (9,  15, 1,  99.90, 10.00),
    (10, 1,  1, 299.90,  0.00),
    (11, 3,  1, 189.90, 10.00),
    (12, 2,  1, 349.90,  0.00),
    (13, 6,  1, 459.90,  0.00),
    (14, 13, 1, 169.90,  0.00),
    (15, 5,  1, 379.90, 15.00);

-- ----------------------------
-- 20. PAGAMENTO
-- ----------------------------
INSERT INTO PAGAMENTO (ID_VENDA, ID_FORMA_PAGAMENTO, VALOR_PAGO, STATUS, DATA_PAGAMENTO) VALUES
    (1,   2, 299.90, 'PAGO',     '2026-05-02'),
    (2,   4, 729.80, 'PAGO',     '2026-05-05'),
    (3,   1, 159.90, 'PAGO',     '2026-05-08'),
    (4,   2, 429.90, 'PAGO',     '2026-05-10'),
    (5,   4, 399.90, 'PAGO',     '2026-05-12'),
    (7,   3, 498.80, 'PAGO',     '2026-05-18'),
    (8,   2, 149.90, 'PAGO',     '2026-05-20'),
    (9,   4, 609.80, 'PAGO',     '2026-05-22'),
    (10,  1, 299.90, 'PAGO',     '2026-05-25'),
    (11,  2, 179.90, 'PAGO',     '2026-06-02'),
    (12,  3, 349.90, 'PAGO',     '2026-06-05'),
    (13,  4, 459.90, 'PENDENTE', '2026-06-10'),
    (14,  2, 169.90, 'PAGO',     '2026-06-15'),
    (15,  4, 364.90, 'PAGO',     '2026-06-20');

-- ----------------------------
-- 21. MOVIMENTO_ESTOQUE
-- Entradas iniciais de estoque (ID_VENDA_ITEM = NULL = compra de fornecedor)
-- Saídas atreladas às vendas concluídas
-- ----------------------------
INSERT INTO MOVIMENTO_ESTOQUE (ID_PRODUTO, ID_VENDA_ITEM, ID_TIPO_MOVIMENTO, QUANTIDADE, OBSERVACAO) VALUES
    -- Entradas por compra (sem venda_item)
    (1,  NULL, 1, 50, 'Compra inicial - Beira Rio'),
    (2,  NULL, 1, 40, 'Compra inicial - Beira Rio'),
    (3,  NULL, 1, 60, 'Compra inicial - Beira Rio Filial'),
    (4,  NULL, 1, 25, 'Compra inicial - Via Marte'),
    (5,  NULL, 1, 22, 'Compra inicial - Via Marte'),
    (6,  NULL, 1, 30, 'Compra inicial - Beira Rio'),
    (7,  NULL, 1, 28, 'Compra inicial - Beira Rio Filial'),
    (8,  NULL, 1, 70, 'Compra inicial - Grendene'),
    (9,  NULL, 1, 55, 'Compra inicial - Grendene'),
    (10, NULL, 1, 90, 'Compra inicial - Grendene'),
    (11, NULL, 1, 80, 'Compra inicial - Grendene'),
    (12, NULL, 1, 38, 'Compra inicial - Via Marte'),
    (13, NULL, 1, 35, 'Compra inicial - Via Marte'),
    (14, NULL, 1, 42, 'Compra inicial - Grendene'),
    (15, NULL, 1, 50, 'Compra inicial - Grendene'),
    -- Saídas por venda
    (1,  1,  2, 1, NULL),
    (4,  2,  2, 1, NULL),
    (10, 3,  2, 2, NULL),
    (11, 4,  2, 1, NULL),
    (8,  5,  2, 1, NULL),
    (6,  6,  2, 1, NULL),
    (4,  7,  2, 1, NULL),
    (13, 9,  2, 1, NULL),
    (9,  10, 2, 2, NULL),
    (14, 11, 2, 1, NULL),
    (2,  12, 2, 1, NULL),
    (12, 13, 2, 1, NULL),
    (15, 14, 2, 1, NULL),
    (1,  15, 2, 1, NULL),
    (3,  16, 2, 1, NULL),
    (2,  17, 2, 1, NULL),
    (6,  18, 2, 1, NULL),
    (13, 19, 2, 1, NULL),
    (5,  20, 2, 1, NULL),
    -- Ajuste de inventário
    (7,  NULL, 3, 2, 'Ajuste após contagem física - jun/2026');