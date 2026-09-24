-- Gera��o de Modelo f�sico
-- Sql ANSI 2003 - brModelo.

CREATE TABLE clientes (
    id_clientes INT NOT NULL AUTO_INCREMENT,
    nome_cliente VARCHAR(50) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    telefone_cliente VARCHAR(15) NOT NULL,
    email_cliente VARCHAR(50) UNIQUE,
    data_cadastro DATE NOT NULL,
    PRIMARY KEY (id_clientes)
);

CREATE TABLE programa_de_fidelidadee (
    id_fidelidade INT NOT NULL AUTO_INCREMENT,
    nivel_categoria VARCHAR(40) NOT NULL,
    saldo_pontos INT NOT NULL DEFAULT 0,
    pontos_acumulados INT NOT NULL DEFAULT 0,
    data_ultima_atualizacao DATE NOT NULL,
    historico_resgastes TEXT,
    PRIMARY KEY (id_fidelidade)
);

CREATE TABLE categoriaa (
    id_categoria INT NOT NULL AUTO_INCREMENT,
    nome_categoria VARCHAR(50) NOT NULL,
    descricao VARCHAR(300),
    setor_cafeteria VARCHAR(50),
    status_ativo VARCHAR(20) NOT NULL,
    data_cadastro DATE NOT NULL,
    PRIMARY KEY (id_categoria)
);

CREATE TABLE fornecedorr (
    id_fornecedor INT NOT NULL AUTO_INCREMENT,
    razao_social VARCHAR(50) NOT NULL,
    endereco VARCHAR(50),
    cnpj VARCHAR(20) NOT NULL UNIQUE,
    email_contato VARCHAR(50),
    telefone_contato VARCHAR(20),
    PRIMARY KEY (id_fornecedor)
);

CREATE TABLE deliveryy (
    id_delivery INT NOT NULL AUTO_INCREMENT,
    taxa_entrega DECIMAL(10,2) NOT NULL,
    status_entrega VARCHAR(30) NOT NULL,
    data_hora_saida TIME,
    endereco_entrega VARCHAR(100) NOT NULL,
    nome_entregador VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_delivery)
);

CREATE TABLE funcionarios (
    id_funcionarios INT NOT NULL AUTO_INCREMENT,
    cargo VARCHAR(50) NOT NULL,
    cpf_funcionario VARCHAR(14) NOT NULL UNIQUE,
    salario DECIMAL(10,2) NOT NULL,
    nome_funcionario VARCHAR(50) NOT NULL,
    data_admissao DATE NOT NULL,
    PRIMARY KEY (id_funcionarios)
);

CREATE TABLE produto (
    id_produto INT NOT NULL AUTO_INCREMENT,
    nome_produto VARCHAR(50) NOT NULL,
    descricao VARCHAR(100),
    preco_unitario DECIMAL(10,2) NOT NULL,
    categoria VARCHAR(30),
    status_produto VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_produto)
);

CREATE TABLE estoque (
    id_insumo INT NOT NULL AUTO_INCREMENT,
    nome_insumo VARCHAR(50) NOT NULL,
    quantidade_atual INT NOT NULL DEFAULT 0,
    unidade_medida VARCHAR(20) NOT NULL,
    quantidade_minima INT NOT NULL DEFAULT 0,
    status_estoque VARCHAR(20) NOT NULL,
    PRIMARY KEY (id_insumo)
);

CREATE TABLE pedidos (
    id_pedidos INT NOT NULL AUTO_INCREMENT,
    valor_total DECIMAL(10,2) NOT NULL,
    data_hora DATETIME NOT NULL,
    status_pedido VARCHAR(30) NOT NULL,
    tipo_pedido VARCHAR(20) NOT NULL,
    obs VARCHAR(50),
    id_clientes INT NOT NULL,
    id_funcionarios INT NOT NULL,
    id_delivery INT,
    PRIMARY KEY (id_pedidos),
    FOREIGN KEY (id_clientes) REFERENCES clientes(id_clientes),
    FOREIGN KEY (id_funcionarios) REFERENCES funcionarios(id_funcionarios),
    FOREIGN KEY (id_delivery) REFERENCES delivery(id_delivery)
);

CREATE TABLE pagamento (
    id_pagamentos INT NOT NULL AUTO_INCREMENT,
    valor_pago DECIMAL(10,2) NOT NULL,
    data_pagamento DATETIME NOT NULL,
    status_pagamento VARCHAR(50) NOT NULL,
    comprovante VARCHAR(50),
    forma_pagamento VARCHAR(20) NOT NULL,
    id_pedidos INT NOT NULL UNIQUE,
    PRIMARY KEY (id_pagamentos),
    FOREIGN KEY (id_pedidos) REFERENCES pedidos(id_pedidos)
);

CREATE TABLE consome (
    id_insumo INT NOT NULL,
    id_produto INT NOT NULL,
    PRIMARY KEY (id_insumo, id_produto),
    FOREIGN KEY (id_insumo) REFERENCES estoque(id_insumo),
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto)
);

CREATE TABLE fornece (
    id_insumo INT NOT NULL,
    id_fornecedor INT NOT NULL,
    PRIMARY KEY (id_insumo, id_fornecedor),
    FOREIGN KEY (id_insumo) REFERENCES estoque(id_insumo),
    FOREIGN KEY (id_fornecedor) REFERENCES fornecedor(id_fornecedor)
);

CREATE TABLE entrega (
    id_funcionarios INT NOT NULL,
    id_delivery INT NOT NULL,
    PRIMARY KEY (id_funcionarios, id_delivery),
    FOREIGN KEY (id_funcionarios) REFERENCES funcionarios(id_funcionarios),
    FOREIGN KEY (id_delivery) REFERENCES delivery(id_delivery)
);

CREATE TABLE classifica (
    id_produto INT NOT NULL,
    id_categoria INT NOT NULL,
    PRIMARY KEY (id_produto, id_categoria),
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto),
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
);

CREATE TABLE contem (
    id_pedidos INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    preco_historico DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id_pedidos, id_produto),
    FOREIGN KEY (id_pedidos) REFERENCES pedidos(id_pedidos),
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto)
);

CREATE TABLE realiza (
    id_pedidos INT NOT NULL,
    id_clientes INT NOT NULL,
    PRIMARY KEY (id_pedidos, id_clientes),
    FOREIGN KEY (id_pedidos) REFERENCES pedidos(id_pedidos),
    FOREIGN KEY (id_clientes) REFERENCES clientes(id_clientes)
);

CREATE TABLE utiliza (
    id_produto INT NOT NULL,
    id_insumo INT NOT NULL,
    PRIMARY KEY (id_produto, id_insumo),
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto),
    FOREIGN KEY (id_insumo) REFERENCES estoque(id_insumo)
);

CREATE TABLE atende (
    id_pagamentos INT NOT NULL,
    id_pedidos INT NOT NULL,
    id_funcionarios INT NOT NULL,
    PRIMARY KEY (id_pagamentos, id_pedidos, id_funcionarios),
    FOREIGN KEY (id_pagamentos) REFERENCES pagamento(id_pagamentos),
    FOREIGN KEY (id_pedidos) REFERENCES pedidos(id_pedidos),
    FOREIGN KEY (id_funcionarios) REFERENCES funcionarios(id_funcionarios)
);



