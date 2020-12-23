drop database concessionariadecarro;

create database concessionariadecarro;

use concessionariadecarro;
 
create table tb_carro(
    id_carro int primary key  auto_increment,

	ds_marca varchar(70),
    ds_modelo varchar(70),
	dt_ano datetime,
    nr_km int,
    ds_cambio varchar(15),
    ds_combustivel varchar(15),
	vl_preco decimal(20,2),
    ds_endereco_imagem varchar(250)
);
	
create table tb_reserva(
    id_reserva int primary key  auto_increment,
    id_carro int,
	id_vendedor int,
	ds_codigo_vendedor varchar(45),
    id_cliente int,
	foreign key (id_cliente) references tb_cliente (id_cliente)
);


create table tb_vendedor(
    id_vendedor int primary key auto_increment,
    nm_vendedor varchar(150),  
    dt_nascimento datetime,
    dt_rg varchar(20),
    ds_endereco_imagem varchar(255),
    ds_codigo_vendedor varchar (45)
);

create table tb_login(
    id_login int primary key  auto_increment,
    nm_usuario varchar(150),
    ds_cpf varchar(20),
	ds_telefone varchar(45),
    ds_email varchar(150),
    ds_senha varchar(45),
    bt_gerente boolean
);

create table tb_login_vendedor(
    id_login_vendedor int primary key  auto_increment,
    id_login int,
	id_vendedor int,
    foreign key (id_login) references tb_login (id_login),
	foreign key(id_vendedor) references tb_vendedor (id_vendedor)
);

create table tb_cliente(
    id_cliente int primary key auto_increment,
    nm_cliente varchar (150),
    ds_email varchar(150),
    ds_telefone varchar(20),
    ds_cpf varchar(20),
    ds_rg varchar(20)
);

create table tb_login_cliente(
    id_login_cliente int primary key  auto_increment,
    id_login int,
    id_cliente int,
	foreign key  (id_login) references tb_login (id_login),
	foreign key(id_cliente) references tb_cliente (id_cliente)
);

create table tb_servico(
    id_servico int primary key  auto_increment,
    nm_servico varchar(200),
	vl_servico decimal(10,2)
    
);

create table tb_carro_servico(
   id_carro_servico int primary key auto_increment,
   id_carro int,
   id_servico int,
   foreign key  (id_carro) references tb_carro (id_carro),
   foreign key (id_servico) references tb_servico (id_servico)
);


create table tb_agendamento(
   id_agendamento int primary key auto_increment,
   dt_hora_dia datetime,
   bt_pago boolean,
   nm_servico varchar(200),
   ds_marca_carro varchar (45),
   ds_modelo_carro varchar (45),
   ds_placa_carro varchar(45),
   dt_ano_modelo date,
   id_cliente int,
   foreign key(id_cliente) references tb_cliente (id_cliente)

);
create table tb_agendamento_servico(
   id_agendamento_servico int primary key auto_increment,
   id_agendamento int,
   id_servico int,
   foreign key (id_servico) references tb_servico (id_servico),
   foreign key (id_agendamento) references tb_cliente (id_agendamento)
);


insert into tb_carro(ds_marca, ds_modelo, dt_ano, nr_km, ds_cambio, ds_combustivel, vl_preco, ds_endereco_imagem)
values("Ford","1.6 FREESTYLE 16V FLEX 4P",'2013-01-01', 90.00,"Manual","Gasolina",41.890,null);

insert into tb_carro(ds_marca, ds_modelo, dt_ano, nr_km, ds_cambio, ds_combustivel, vl_preco, ds_endereco_imagem)
values("Toyota Corolla","2.0 XEI 16V FLEX 4P",'2018-01-01', 28.162,"Automatica","Gasolina",88.490,null);


insert into tb_login(nm_usuario, ds_cpf, ds_email, ds_senha, bt_gerente)
values("Joao","646.107.649-20","Joaodasilva@.com","joaosilva",true);

insert into tb_login(nm_usuario, ds_cpf, ds_email, ds_senha, bt_gerente)
values("Paulo","163.946.072-15","paulodacosta@.com","wifi",true);


insert into tb_reserva(id_carro, id_vendedor,ds_codigo_vendedor, id_cliente ) values (1, 2,"542910",1); 
insert into tb_reserva(id_carro, id_vendedor,ds_codigo_vendedor, id_cliente ) values (1, 1,"122110",2); 

 
insert into tb_vendedor(nm_vendedor, dt_nascimento, dt_rg, ds_endereco_imagem, ds_codigo_vendedor)
values("Pedro", '2001-03-1',"11 345 678-9",null,"521110");

insert into tb_vendedor( nm_vendedor , dt_nascimento ,dt_rg, ds_endereco_imagem, ds_codigo_vendedor)
values( "Pedro", '1997-06-05',"11 217 198-6",null,"187260");


insert into tb_login_vendedor(id_login_vendedor, id_login , id_vendedor ) values (1, 2, 3);

insert into tb_login_vendedor(id_login_vendedor, id_login , id_vendedor ) values (5, 6, 2);


insert into tb_cliente(nm_cliente , ds_email , ds_telefone , ds_cpf , ds_rg )
values("Cassiano", "Cassianocostacp@gmail,com","5989-7612","683.240.302-04","82.965.531-1");

insert into tb_cliente(nm_cliente , ds_email , ds_telefone , ds_cpf , ds_rg )
values("Marcelo", "marceloanocostacp@gmail,com","5169-3622","173.845.402-14","32.666.237-9");



insert into tb_login_cliente (id_login, id_cliente) values (2, 1);
insert into tb_login_cliente(id_login, id_cliente) values ( 2, 1);



insert into tb_servico( nm_servico ,vl_servico)
values("troca de oleo", 20.5 );

insert into tb_servico( nm_servico ,vl_servico)
values("troca de escapamento", 12.5);




insert into tb_carro_servico(id_carro_servico ,id_carro	, id_servico) values(1,4,2);

insert into tb_carro_servico(id_carro_servico ,id_carro	, id_servico) values(3,5,6);


insert into tb_agendamento( dt_hora_dia ,bt_pago, nm_servico, ds_marca_carro, ds_modelo_carro,ds_placa_carro,dt_ano_modelo,id_cliente)
values( '2020-12-02 12:00', true, "troca de pneu", "Chevrolet", "6.2 2SS CONVERSÍVEL V", "RI02A18", '2014-01-01',1);

insert into tb_agendamento( dt_hora_dia ,bt_pago, nm_servico, ds_marca_carro, ds_modelo_carro,ds_placa_carro,dt_ano_modelo,id_cliente)
values( '2020-01-01 16:00', true, "troca de oleo", "Ford", "2.0 TITANIUM PLUS 16V FLEX 4P POWERSHIFT", "FJ01B98", '2013-01-01',9);



insert into tb_agendamento_servico(id_agendamento_servico ,id_agendamento, id_servico) values(1,3,7);

insert into tb_agendamento_servico(id_agendamento_servico ,id_agendamento, id_servico) values(8,2,5);




    
select *
	from tb_reseva
   inner 
	join tb_cliente
      on tb_reserva.id_cliente = tb_reserva.id_cliente;
    
    
select *
  from tb_login_vendedor
 inner 
  join tb_login
    on tb_login_vendedor.id_login = tb_login_vendedor.id_login
 inner
  join tb_cliente
  on tb_login_vendedor.id_cliente=tb_login_vendedor.id_cliente;


select *
  from tb_carro_servico
 inner 
  join tb_carro
    on tb_carro_servico.id_carro = tb_carro_servico.id_carro
inner
  join tb_servico
    on tb_carro_servico.id_sevico=tb_carro_servico.id_servico;



select *
  from tb_login_cliente
 inner 
  join tb_login
    on tb_login_cliente.id_login = tb_login.id_login
 inner 
  join tb_cliente 
    on tb_login_cliente.id_cliente = tb_login_cliente.id_cliente;
    
    
select *
  from tb_agendamento
 inner 
  join tb_cliente 
    on agendamento.id_cliente = agendamento.id_cliente;
    

select *
  from tb_agendamento_servico
 inner 
  join tb_servico
    on tb_agendamento_servico.id_servico = tb_agendamento_servico.id_servico
 inner
   join tb_servico
     on tb_agendamento_servico.id_agendamento = tb_agendamento_servico.id_agendamento;
     

    
    
