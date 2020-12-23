
CREATE SCHEMA IF NOT EXISTS `controledecompras` DEFAULT CHARACTER SET utf8 ;
USE `controledecompras` ;

-- -----------------------------------------------------
-- Table `controledecompras`.`tb_produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `controledecompras`.`tb_produto` (
  `id_produto` INT NOT NULL AUTO_INCREMENT,
  `nm_produto` VARCHAR(45) NOT NULL,
  `ds_codigo_de_barras` VARCHAR(50) NOT NULL,
  `ds_produto` VARCHAR(45) NOT NULL,
  `vl_preco` DECIMAL(15,2) NOT NULL,
  `nm_marca` VARCHAR(45) NOT NULL,
  `dt_compra` DATETIME NOT NULL,
  `bt_disponivel` TINYINT NOT NULL,
  `nm_fornecedor` VARCHAR(45) NOT NULL,
  `nm_pais_de_fabricacao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_produto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `controledecompras`.`tb_fornecedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `controledecompras`.`tb_fornecedor` (
  `id_fornecedor` INT NOT NULL AUTO_INCREMENT,
  `nm_fornecedor` VARCHAR(45) NOT NULL,
  `ds_telefone` VARCHAR(45) NOT NULL,
  `ds_endereco` VARCHAR(45) NOT NULL,
  `id_servico` INT NOT NULL,
  `hr_reposicao` TIME NOT NULL,
  `ds_contrato` VARCHAR(45) NOT NULL,
  `tp_produto` VARCHAR(45) NOT NULL,
  `ds_nota_do_produto` VARCHAR(45) NOT NULL,
  `ds_cep` VARCHAR(45) NOT NULL,
  `nr_estabelecimento` INT NOT NULL,
  `ds_complemento` VARCHAR(45) NOT NULL,
  `id_produto` INT NOT NULL,
  PRIMARY KEY (`id_fornecedor`),
  INDEX `fk_tb_fornecedor_tb_produto1_idx` (`id_produto` ASC) VISIBLE,
  CONSTRAINT `fk_tb_fornecedor_tb_produto1`
    FOREIGN KEY (`id_produto`)
    REFERENCES `controledecompras`.`tb_produto` (`id_produto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `controledecompras`.`tb_compra_servico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `controledecompras`.`tb_compra_servico` (
  `id_compra_servico` INT NOT NULL AUTO_INCREMENT,
  `ds_servico` VARCHAR(45) NOT NULL,
  `vl_preco_servico` DECIMAL NOT NULL,
  `tp_pagamento` VARCHAR(45) NOT NULL,
  `vl_fim_garantia` DATETIME NOT NULL,
  PRIMARY KEY (`id_compra_servico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `controledecompras`.`tb_item_produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `controledecompras`.`tb_item_produto`(
  `id_item_produto` INT NOT NULL AUTO_INCREMENT,
  `ds_quantidade` VARCHAR(45),
  `id_produto` INT NOT NULL,
  PRIMARY KEY (`id_item_produto`),
  INDEX `fk_tb_item_produto_tb_produto1_idx` (`id_produto` ASC) VISIBLE,
  CONSTRAINT `fk_tb_item_produto_tb_produto1`
    FOREIGN KEY (`id_produto`)
    REFERENCES `controledecompras`.`tb_produto` (`id_produto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `controledecompras`.`tb_controle_compra_produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `controledecompras`.`tb_controle_compra_produto` (
  `id_controle_compra_produto` INT NOT NULL AUTO_INCREMENT,
  `ds_nota_fiscal` VARCHAR(45) NOT NULL,
  `dt_compra` DATETIME NOT NULL,
  `bt_aprovado` TINYINT NOT NULL,
  `vl_preco` DECIMAL NOT NULL,
  `tp_pagamento` VARCHAR(45) NOT NULL,
  `nr_quantidade` VARCHAR(45) NOT NULL,
  `nr_compra` VARCHAR(45) NOT NULL,
  `vl_total_da_compra` VARCHAR(45) NOT NULL,
  `id_compra_servico` INT NOT NULL,
  `id_fornecedor` INT NOT NULL,
  `id_produto` INT NOT NULL,
  `id_item_produto` INT NOT NULL,
  PRIMARY KEY (`id_controle_compra_produto`),
  INDEX `fk_tb_controle_compra_produto_tb_compra_servico1_idx` (`id_compra_servico` ASC) VISIBLE,
  INDEX `fk_tb_controle_compra_produto_tb_fornecedor1_idx` (`id_fornecedor` ASC) VISIBLE,
  INDEX `fk_tb_controle_compra_produto_tb_produto1_idx` (`id_produto` ASC) VISIBLE,
  INDEX `fk_tb_controle_compra_produto_tb_item_produto1_idx` (`id_item_produto` ASC) VISIBLE,
  CONSTRAINT `fk_tb_controle_compra_produto_tb_compra_servico1`
    FOREIGN KEY (`id_compra_servico`)
    REFERENCES `controledecompras`.`tb_compra_servico` (`id_compra_servico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_controle_compra_produto_tb_fornecedor1`
    FOREIGN KEY (`id_fornecedor`)
    REFERENCES `controledecompras`.`tb_fornecedor` (`id_fornecedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_controle_compra_produto_tb_produto1`
    FOREIGN KEY (`id_produto`)
    REFERENCES `controledecompras`.`tb_produto` (`id_produto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_controle_compra_produto_tb_item_produto1`
    FOREIGN KEY (`id_item_produto`)
    REFERENCES `controledecompras`.`tb_item_produto` (`id_item_produto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

select * from tb_produto;


select * from tb_item_produto;


select * from tb_controle_compra_produto;



select * from tb_compra_servico;


select * from tb_fornecedor;

INSERT INTO tb_produto(nm_produto,ds_codigo_de_barras,ds_produto,vl_Preco,nm_marca,dt_compra,bt_disponivel,nm_fornecedor,nm_pais_de_fabricacao)
VALUES ("long sleeve t-shirt" , "3F55G" , "Inverno" , 120.00,"Nike",'2002-12-30' , true ,  "Nike Fornecer" , "Polonia" );


INSERT INTO tb_produto(nm_produto,ds_codigo_de_barras,ds_produto,vl_Preco,nm_marca,dt_compra,bt_disponivel,nm_fornecedor,nm_pais_de_fabricacao)
VALUES ("T-shirt Barcelona" , "3F677G" , "Inverno" , 190.00,"Nike",'2002-12-29' , true ,  "Nike Fornecer" , "Polonia" );


INSERT INTO tb_produto(nm_produto,ds_codigo_de_barras,ds_produto,vl_Preco,nm_marca,dt_compra,bt_disponivel,nm_fornecedor,nm_pais_de_fabricacao)
VALUES ("Shorts for GoalKeepers" , "4D45G" , "Sport" , 80.00,"Adidas",'2020-11-23' , true ,  "Adidas Indutries" , "Azerbjao" );


INSERT INTO tb_produto(nm_produto,ds_codigo_de_barras,ds_produto,vl_Preco,nm_marca,dt_compra,bt_disponivel,nm_fornecedor,nm_pais_de_fabricacao)
VALUES ("Blusa Lan Grega" , "045K5G" , "OutFit" , 2030.00,"Gucci Grifing",'2018-12-30' , true ,  "Gucci" , "Brazil" );




INSERT INTO tb_item_produto(ds_quantidade,id_produto)
VALUES ("8000",1);

INSERT INTO tb_item_produto(ds_quantidade,id_produto)
VALUES ("670",2);

INSERT INTO tb_item_produto(ds_quantidade,id_produto)
VALUES ("120",3);

INSERT INTO tb_item_produto(ds_quantidade,id_produto)
VALUES ("5",4);



INSERT INTO tb_fornecedor(nm_fornecedor, ds_telefone ,ds_endereco , id_servico , hr_reposicao , ds_contrato , tp_produto , ds_nota_do_produto , ds_cep , nr_estabelecimento , ds_complemento,id_produto)
VALUES ("Atlantis Industries","94970-2143" , "Rua Abelinda/Jardim Azul 23" , 2 , '23:00' , "Artigos NIKE" , "Peças NIKE" , "2NIKE33" , "04411-521" , 344 , "Terceira Rua",1);


INSERT INTO tb_fornecedor(nm_fornecedor, ds_telefone ,ds_endereco , id_servico , hr_reposicao , ds_contrato , tp_produto , ds_nota_do_produto , ds_cep , nr_estabelecimento , ds_complemento,id_produto)
VALUES ("Atlantis Industries","94970-2143" , "Rua Abelinda/Jardim Azul 23" , 3 , '21:00' , "Artigos Adidas" , "Conjuntos Adidas" , "ADIDASBR33" , "04411-521" , 344 , "Terceira Rua",2);


INSERT INTO tb_fornecedor(nm_fornecedor, ds_telefone ,ds_endereco , id_servico , hr_reposicao , ds_contrato , tp_produto , ds_nota_do_produto , ds_cep , nr_estabelecimento , ds_complemento,id_produto)
VALUES ("Gucci Deploytment","+32 (32)3370-2143" , "Houston US / Abroi City" , 4 , '14:00' , "Griffing Gucci" , "Blusas Gucci" , "GUCCIGANG" , "234434-344" , 2 , "First Avenue",3);


INSERT INTO tb_fornecedor(nm_fornecedor, ds_telefone ,ds_endereco , id_servico , hr_reposicao , ds_contrato , tp_produto , ds_nota_do_produto , ds_cep , nr_estabelecimento , ds_complemento,id_produto)
VALUES ("Capides Brasil","(21)2970-2143" , "Avenida Brasil/ Rio De Janeiro" , 5 , '9:00' , "ART.12" , "Capides e prateleiras" , "2N220" , "94411-521" , 902 , "Ao Lado da Confot Colchoes",4);


 
 
 
 INSERT INTO tb_compra_servico (ds_servico , vl_preco_servico , tp_pagamento , vl_fim_garantia)
 VALUES ("Segurança" , 300.00 , "BANCARIA" , '2023-1-03');
 
 
 INSERT INTO tb_compra_servico (ds_servico , vl_preco_servico , tp_pagamento , vl_fim_garantia)
 VALUES ("Limpeza" , 200.00 , "BANCARIA" , '2025-5-05');
 
 
 INSERT INTO tb_compra_servico (ds_servico , vl_preco_servico , tp_pagamento , vl_fim_garantia)
 VALUES ("Reciclagem" , 120.00 , "Boleto" , '2021-2-13');
 
 
 INSERT INTO tb_compra_servico (ds_servico , vl_preco_servico , tp_pagamento , vl_fim_garantia)
 VALUES ("Praça de Alimentação" , 500.00 , "BANCARIA" , '2025-4-3');
 
 
 
 
 INSERT INTO tb_controle_compra_produto (ds_nota_fiscal , dt_compra , bt_aprovado , vl_preco , tp_pagamento , nr_quantidade ,nr_compra,vl_total_da_compra,id_compra_servico , id_fornecedor , id_produto , id_item_produto)
 VALUES ("21G3H3" , '2019-1-21' , true, 20000.00 , "Check de Contrato" , "23000" , "233321" , "129.300 Mil Reais" , 1 , 1 , 1,1);
 
 
 INSERT INTO tb_controle_compra_produto (ds_nota_fiscal , dt_compra , bt_aprovado , vl_preco , tp_pagamento , nr_quantidade ,nr_compra,vl_total_da_compra,id_compra_servico , id_fornecedor , id_produto , id_item_produto)
 VALUES ("99G3H3" , '2018-1-21' , true, 34000.00 , "Check de Contrato" , "231000" , "136521" , "29.300 Mil Reais" , 2,2,2,2);
 
 
 INSERT INTO tb_controle_compra_produto (ds_nota_fiscal , dt_compra , bt_aprovado , vl_preco , tp_pagamento , nr_quantidade ,nr_compra,vl_total_da_compra,id_compra_servico , id_fornecedor , id_produto , id_item_produto)
 VALUES ("56L65L" , '2015-1-21' , true, 78900.00 , "Check de Contrato" , "897000" , "788321" , "567.600 Mil Reais" ,3,3,3,3);
 
 
 INSERT INTO tb_controle_compra_produto (ds_nota_fiscal , dt_compra , bt_aprovado , vl_preco , tp_pagamento , nr_quantidade ,nr_compra,vl_total_da_compra,id_compra_servico , id_fornecedor , id_produto , id_item_produto)
 VALUES ("8788LP" , '2015-2-9' , true, 2500.00 , "Check de Contrato" , "59000" , "43-4335" , "54.090 Mil dOLLAR" ,4,4,4,4);
 
 
 select *
       from tb_fornecedor
      inner 
       join tb_produto
		 on tb_fornecedor.id_produto= tb_produto.id_produto;
         
         
        
        
        
        select *
       from tb_item_produto
      inner 
       join tb_produto
		 on tb_item_produto.id_produto= tb_produto.id_produto;
         
        
        
        
        
        select *
       from tb_controle_compra_produto
      inner 
       join tb_compra_servico
		 on tb_controle_compra_produto.id_compra_servico= tb_compra_servico.id_compra_servico
         inner
         join tb_fornecedor
         on tb_controle_compra_produto.id_fornecedor= tb_fornecedor.id_fornecedor
         inner
         join tb_produto
         on tb_controle_compra_produto.id_produto= tb_produto.id_produto
         inner
         join tb_item_produto
         on tb_controle_compra_produto.id_item_produto= tb_item_produto.id_item_produto;
