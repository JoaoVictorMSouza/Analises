create database controledevendas;

use controledevendas;

create table tb_cliente(
    id_cliente int primary key auto_increment,
    nm_cliente varchar(150),
    ds_email varchar(150),
    ds_cpf varchar(150),
	ds_cep varchar(15),
    nr_casa varchar(45),
    ds_complemento varchar(45),
    ds_nascimento datetime
);

create table tb_cupom(
    id_cupom int primary key auto_increment,
    ds_codigo_cupom varchar(45),
    ds_criacao   datetime,
    ds_duracao datetime,
    vl_cupom varchar(45),
    ds_cupom varchar(200)
    
);

create table tb_produto(
    id_produto int primary key auto_increment,
    nm_produto varchar(200),
    vl_produto decimal(20.5),	
    ds_produto varchar(150),
    ds_codigo_barra varchar (150)
);


create table tb_estoque(
    id_estoque int primary key auto_increment,
    nr_quantidade int,
    id_produto int,
    foreign key (id_produto) references tb_produto (id_produto),
    bt_disponivel bool
);

create table tb_venda(
    id_venda int primary key auto_increment,
    vl_total decimal (20,2),
    ds_pagamento decimal(20,2),
    ds_nota_fiscal varchar(150),
    id_cliente int,
    id_cupom int,
    id_vendedor int,
    foreign key (id_cliente) references tb_cliente (id_cliente),
    foreign key (id_cupom) references tb_cupom (id_cupom),
    foreign key (id_vendedor) references tb_vendedor (id_vendedor)
);
create table tb_extrato(
	id_extrato int primary key auto_increment
    );

create table tb_venda_item(
    id_venda_item int primary key auto_increment,
    id_extrato int,
    id_servico int,
    id_produto int,
    foreign key (id_extrato) references tb_extrato (id_extrato),
    foreign key (id_servico) references tb_servico (id_servico),
    foreign key (id_produto) references tb_produto (id_produto),
	nr_quantidade int
);

create table tb_vendedor(
	id_vendedor int primary key auto_increment,
	nm_vendedor varchar(45),
	ds_cpf varchar (20),
	ds_usuario varchar(45),
	bt_gerente varchar(45),
	ds_senha varchar(45)

);

create table tb_servico(
    id_servico int primary key auto_increment,
    nm_servico varchar (50),
    ds_servico varchar(150),
    vl_servico varchar(45),
    bt_disponivel bool,
    ds_codigo_barra varchar (150)
);

insert into tb_cliente( nm_cliente, ds_email, ds_cpf, ds_cep, nr_casa, ds_complemento, ds_nascimento)
values("Pedro", "PedroCostad@gmail.com", "745.723.293-45", "2101-445", "123","casa", '2004-12-01');

insert into tb_cliente( nm_cliente, ds_email, ds_cpf, ds_cep, nr_casa, ds_complemento, ds_nascimento)
values("Joao", "jkCostadsl@gmail.com", "948.643.143-43", "6121-433", "33","casa", '2003-11-02');

insert into tb_cliente( nm_cliente, ds_email, ds_cpf, ds_cep, nr_casa, ds_complemento, ds_nascimento)
values("Marcelo", "Marklostad@gmail.com", "765.123.193-15", "8108-989", "213","casa", '2001-12-01');



insert into tb_cupom( ds_codigo_cupom , ds_criacao, ds_duracao,vl_cupom, ds_cupom )
values("AKWJ", '2020-2-13','2001-11-2 13:00', "20.00", "desconto");

insert into tb_cupom( ds_codigo_cupom , ds_criacao, ds_duracao,vl_cupom, ds_cupom )
values("FAMJ", '2020-1-18','2001-12-3 15:00', "35.00", "desconto");

insert into tb_cupom( ds_codigo_cupom , ds_criacao, ds_duracao,vl_cupom, ds_cupom )
values("AKWJ", '2020-03-12','2001-9-3 17:00', "40.00", "desconto");



insert into tb_produto( nm_produto, vl_produto, ds_produto, ds_codigo_barra) 
values("Óleos", 20.00, "necessidades vitais", "205678" );

insert into tb_produto( nm_produto, vl_produto, ds_produto, ds_codigo_barra) 
values("Natural Health", 129.00, "Vitamina E, Novatol", "206678" );

insert into tb_produto( nm_produto, vl_produto, ds_produto, ds_codigo_barra) 
values("TVP", 150.00, "proteína de soja texturizada", "205K12" );



insert into tb_estoque( nr_quantidade,id_produto, bt_disponivel)
values(2000, 3, true);

insert into tb_estoque( nr_quantidade,id_produto, bt_disponivel)
values(1000, 8, true);

insert into tb_estoque( nr_quantidade,id_produto, bt_disponivel)
values(7000, 1, true);


insert into tb_venda( vl_total, ds_pagamento, ds_nota_fiscal)
values(1500.00, 1300.00, "CPF");

insert into tb_venda( vl_total, ds_pagamento, ds_nota_fiscal)
values(1500.00, 1300.00, "CPF");

insert into tb_venda( vl_total, ds_pagamento, ds_nota_fiscal)
values(1500.00, 1300.00, "CPF");



insert into tb_venda_item(nr_quantidade)
values(2000);

insert into tb_venda_item(nr_quantidade)
values(4000);

insert into tb_venda_item(nr_quantidade)
values(22000);


insert into tb_vendedor( nm_vendedor, ds_cpf, ds_usuario, bt_gerente, ds_senha)
values("Cassiano", "456-212-123-12", "digital", true, "Fuipraescola");


insert into tb_vendedor( nm_vendedor, ds_cpf, ds_usuario, bt_gerente, ds_senha)
values("Fernando", "156-312-123-32", "digital", true, "Fuipraescoka");


insert into tb_vendedor( nm_vendedor, ds_cpf, ds_usuario, bt_gerente, ds_senha)
values("Lara", "356-132-423-02", "digital", true, "ganharpresente");



insert into tb_servico( nm_servico, ds_servico , vl_servico , bt_disponivel , ds_codigo_barra)
values("conserto de imoveis", "qualquer imovel", "150,0", true, "1AKS234");

insert into tb_servico( nm_servico, ds_servico , vl_servico , bt_disponivel , ds_codigo_barra)
values("consertos de  computadores", "hardawere", "250,0", true, "1AKS254");

insert into tb_servico( nm_servico, ds_servico , vl_servico , bt_disponivel , ds_codigo_barra)
values("Solucionar problemas no sistema", "softawere", "350,0", true, "2AKSJ34");




     select *
       from tb_estoque
      inner 
       join tb_produto
		 on tb_estoque.id_produto= tb_produto.id_produto;
         

     select *
	   from tb_venda
	  inner 
       join tb_cliente
		 on tb_venda.id_cliente= tb_cliente.id_cliente
	  inner 
        join tb_cupom
		  on tb_venda.id_cupom= tb_cupom.id_cupom
        inner 
         join tb_vendedor
		   on tb_venda.id_vendedor= tb_vendedor.id_vendedor;
           
			
            
            
            select *
			   from tb_venda_item
			  inner 
			   join tb_servico
				 on tb_venda_item.id_servico= tb_servico.id_servico
			   inner 
				join tb_produto
				  on tb_venda_item.id_produto= tb_produto.id_produto
				inner 
			join tb_extrato
			 on tb_venda_item.id_extrato= tb_extrato.id_extrato;
          
           


    select *
      from tb_produto
inner join tb_cliente
        on tb_produto.id_produto= tb_produto.id_produto;




    
        
        
drop table tb_venda_item;

