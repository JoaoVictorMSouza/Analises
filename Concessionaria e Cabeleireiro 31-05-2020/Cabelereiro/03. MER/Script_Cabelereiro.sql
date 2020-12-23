create database cabelereiro;

use cabelereiro;

create table tb_login (
    id_login int primary key auto_increment,
    nm_usuario varchar(150),
    ds_senha varchar(45),
    ds_email varchar(150),
    ds_numero varchar(20)
);

create table tb_produto (
    id_produto int primary key auto_increment,
    nm_produto varchar(150),
    vl_preco decimal(10,2),
    id_login int,
    foreign key (id_login) references tb_login (id_login)
);

create table tb_servico (
    id_servico int primary key auto_increment,
    nm_servico varchar(150),
    vl_servico decimal(10,2),
    id_login int,
    foreign key (id_login) references tb_login (id_login)
);

create table tb_cabelereiro (
    id_cabelereiro int primary key auto_increment,
    nm_nome varchar(150),
    dt_nascimento date,
    ds_rg varchar(20),
    id_login int,
    foreign key (id_login) references tb_login (id_login)
);

create table tb_agendamento (
    id_agendamento int primary key auto_increment,
    dt_horarioedia datetime,
    ds_numerodocliente varchar(20),
    nm_nomecliente varchar(150),
    id_cabelereiro int,
    foreign key (id_cabelereiro) references tb_cabelereiro (id_cabelereiro)
);

create table tb_agendamento_servico (
    id_agendamento_servico int primary key auto_increment,
    id_agendamento int,
    id_servico int,
    foreign key (id_agendamento) references tb_agendamento (id_agendamento),
    foreign key (id_servico) references tb_servico (id_servico)
);

insert into tb_login(nm_usuario, ds_senha, ds_email, ds_numero)
	 values ('Kaua', 'KYHd@#!23', 'kauausuario@gmail.com', '11 94168-4168');
     
insert into tb_login(nm_usuario, ds_senha, ds_email, ds_numero)
	 values ('Matheus', 'HREF&$#*(:¨&', 'matheususuario@gamil.com', '21 92541-1569');

     
insert into tb_produto(nm_produto, vl_preco, id_login)
	 values ('Gel Capilar', 19.99, 2);
    
insert into tb_produto(nm_produto, vl_preco, id_login)
	 values ('navelhete', 25.00, 1);

	
insert into tb_cabelereiro(nm_nome, dt_nascimento, ds_rg, id_login)
	 values ('Samuel', '2004-02-21', '24.687.786-0', 1);
     
insert into tb_cabelereiro(nm_nome, dt_nascimento, ds_rg, id_login)
	 values ('Joao', '2002-08-30', '87.235.345-8', 2);
     
     
insert into tb_agendamento(dt_horarioedia, ds_numerodocliente, nm_nomecliente, id_cabelereiro)
	 values ('2020-03-01 10:30:09', '11 94253-6783', 'Pedro', 1);
     
insert into tb_agendamento(dt_horarioedia, ds_numerodocliente, nm_nomecliente, id_cabelereiro)
	 values ('2020-03-01 15:45:00', '11 92744-5687', 'Jonatas', 2);
     
     
insert into tb_servico (nm_servico, vl_servico, id_login)
     values ('Corte Masculino', 30.00, 1);
     
insert into tb_servico (nm_servico, vl_servico, id_login)
     values('Corte Feminino', 70.00, 2);
     

insert into tb_agendamento_servico (id_servico, id_agendamento)
	 values(2,1);
     
insert into tb_agendamento_servico (id_servico, id_agendamento)
	 values(1,2);
	

	select *
	  from tb_produto
inner join tb_login
		on tb_produto.id_login = tb_login.id_login;

	select *
      from tb_servico
inner join tb_login
		on tb_servico.id_login = tb_login.id_login;
        
	select *
      from tb_cabelereiro
inner join tb_login
		on tb_cabelereiro.id_login = tb_login.id_login;
        
	select * 
      from tb_agendamento
inner join tb_cabelereiro
		on tb_agendamento.id_cabelereiro = tb_cabelereiro.id_cabelereiro;
        
	select * 
      from tb_agendamento_servico
inner join tb_agendamento
		on tb_agendamento_servico.id_agendamento = tb_agendamento.id_agendamento
inner join tb_servico
		on tb_agendamento_servico.id_servico = tb_servico.id_servico;