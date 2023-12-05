/* ModeloLogico_AgenciaVeiculos: */

CREATE TABLE CLIENTES (
    CPF INT PRIMARY KEY,
    endereco VARCHAR,
    email VARCHAR,
    nome VARCHAR,
    telefone VARCHAR
);

CREATE TABLE VEICULOS (
    placa VARCHAR PRIMARY KEY,
    ano INT,
    KmRodados FLOAT,
    FK_MODELOS_idModelo INT
);

CREATE TABLE FUNCIONARIOS_MOVIMENTO_ALUGUEL_RETIRADA_DEVOLVOLUCAO (
    idMatricula VARCHAR,
    cargo VARCHAR,
    idContrato INT,
    valor DECIMAL,
    data DATE,
    idAluguel INT,
    idRetirada INT,
    status TINYINT,
    idDevolucao INT,
    PRIMARY KEY (idMatricula, idContrato, idAluguel, idRetirada, idDevolucao)
);

CREATE TABLE OFICINA (
    endereco VARCHAR,
    nome VARCHAR,
    idOficina INT PRIMARY KEY
);

CREATE TABLE LAVAGEM (
    valorLavagem DECIMAL,
    data DATE,
    idLavagem INT PRIMARY KEY
);

CREATE TABLE MANUTENCAO (
    idManutencao INT PRIMARY KEY,
    data DATE,
    valorManutencao DECIMAL
);

CREATE TABLE CORES_MODELOS_MARCA (
    idCor INT,
    nome VARCHAR,
    idModelo INT,
    idMarca INT,
    PRIMARY KEY (idCor, idModelo, idMarca)
);

CREATE TABLE recebe (
    fk_VEICULOS_placa VARCHAR,
    fk_OFICINA_idOficina INT
);

CREATE TABLE realiza (
    fk_OFICINA_idOficina INT,
    fk_LAVAGEM_idLavagem INT
);

CREATE TABLE realiza (
    fk_OFICINA_idOficina INT,
    fk_MANUTENCAO_idManutencao INT
);

CREATE TABLE solicita (
    fk_CLIENTES_CPF INT,
    fk_MOVIMENTO_idContrato INT
);

CREATE TABLE possui (
    fk_VEICULOS_placa VARCHAR,
    fk_MOVIMENTO_idContrato INT
);
 
ALTER TABLE VEICULOS ADD CONSTRAINT FK_VEICULOS_2
    FOREIGN KEY (FK_MODELOS_idModelo)
    REFERENCES ??? (???);
 
ALTER TABLE recebe ADD CONSTRAINT FK_recebe_1
    FOREIGN KEY (fk_VEICULOS_placa)
    REFERENCES VEICULOS (placa)
    ON DELETE RESTRICT;
 
ALTER TABLE recebe ADD CONSTRAINT FK_recebe_2
    FOREIGN KEY (fk_OFICINA_idOficina)
    REFERENCES OFICINA (idOficina)
    ON DELETE RESTRICT;
 
ALTER TABLE realiza ADD CONSTRAINT FK_realiza_1
    FOREIGN KEY (fk_OFICINA_idOficina)
    REFERENCES OFICINA (idOficina)
    ON DELETE RESTRICT;
 
ALTER TABLE realiza ADD CONSTRAINT FK_realiza_2
    FOREIGN KEY (fk_LAVAGEM_idLavagem)
    REFERENCES LAVAGEM (idLavagem)
    ON DELETE RESTRICT;
 
ALTER TABLE realiza ADD CONSTRAINT FK_realiza_1
    FOREIGN KEY (fk_OFICINA_idOficina)
    REFERENCES OFICINA (idOficina)
    ON DELETE RESTRICT;
 
ALTER TABLE realiza ADD CONSTRAINT FK_realiza_2
    FOREIGN KEY (fk_MANUTENCAO_idManutencao)
    REFERENCES MANUTENCAO (idManutencao)
    ON DELETE RESTRICT;
 
ALTER TABLE solicita ADD CONSTRAINT FK_solicita_1
    FOREIGN KEY (fk_CLIENTES_CPF)
    REFERENCES CLIENTES (CPF)
    ON DELETE RESTRICT;
 
ALTER TABLE solicita ADD CONSTRAINT FK_solicita_2
    FOREIGN KEY (fk_MOVIMENTO_idContrato)
    REFERENCES ??? (???);
 
ALTER TABLE possui ADD CONSTRAINT FK_possui_1
    FOREIGN KEY (fk_VEICULOS_placa)
    REFERENCES VEICULOS (placa)
    ON DELETE RESTRICT;
 
ALTER TABLE possui ADD CONSTRAINT FK_possui_2
    FOREIGN KEY (fk_MOVIMENTO_idContrato)
    REFERENCES ??? (???);