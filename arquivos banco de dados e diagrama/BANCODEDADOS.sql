CREATE TABLE movimentacoes (
    id SERIAL PRIMARY KEY,
    id_produto INTEGER NOT NULL,
    id_usuario INTEGER NOT NULL,
    tipo VARCHAR(10) NOT NULL CHECK (tipo IN ('entrada', 'saida')),
    quantidade INTEGER NOT NULL CHECK (quantidade > 0),
    data_movimentacao TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    observacao TEXT,
    
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto) ON DELETE CASCADE,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id) ON DELETE CASCADE
);

CREATE TABLE usuarios (
    id_usuario SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL
);

-- Inserir usuário de teste
INSERT INTO usuarios (nome, email, senha) VALUES 
('Administrador', 'ana@empresa.com', '1234'),

CREATE TABLE produtos (
    id_produto SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    quantidade INTEGER DEFAULT 0 CHECK (quantidade >= 0),
    estoque_minimo INTEGER DEFAULT 0 CHECK (estoque_minimo >= 0),
);

-- Inserir produtos de teste (equipamentos de academia)
INSERT INTO produtos (nome, descricao, quantidade, estoque_minimo) VALUES 
('Halteres 5kg', 'Par de halteres de 5kg cada', 20, 5),