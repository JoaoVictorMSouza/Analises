drop database controle_funcionario;

create database controle_funcionario;

use controle_funcionario;

create table tb_funcionario (
	id_funcionario int primary key auto_increment,
    nm_funcionario varchar(100),
    ds_genero varchar(20),
    dt_nascimento date,
    ds_email varchar(150),
    ds_telefone varchar(25),
    ds_rg varchar(20),
    ds_cpf varchar(20),
    ds_endereco varchar(150),
    ds_cep varchar(20),
    ds_numero_casa varchar(10),
    ds_complemento varchar(150),
    ds_departamento varchar(45),
    ds_cargo varchar(200),
    ds_usuario varchar(45),
    ds_senha varchar(45)
);

create table tb_dia_semana (
	id_semana int primary key auto_increment,
    bt_segunda boolean,
    bt_terca boolean,
    bt_quarta boolean,
    bt_quinta boolean,
    bt_sexta boolean,
    bt_sabado boolean,
    bt_domingo boolean,
    hr_entrada time,
    hr_saida time,
    id_funcionario int,
    foreign key (id_funcionario) references tb_funcionario (id_funcionario)
);

create table tb_controle_acesso (
	id_controle_acesso int primary key auto_increment,
    bt_departamento_venda boolean,
	bt_departamento_compra boolean,
    bt_rh boolean,
    bt_financeiro boolean,
    bt_adm boolean,
    bt_ti boolean,
    bt_juridico boolean,
    id_funcionario int,
    foreign key (id_funcionario) references tb_funcionario (id_funcionario)
);

create table tb_controle_ponto (
	id_controle_ponto int primary key auto_increment,
    dt_dia date,
    dt_entrada datetime,
    dt_entrada_intervalo datetime,
    dt_saida_intervalo datetime,
    dt_saida datetime,
    dt_entrada_hora_extra datetime,
    dt_saida_hora_extra datetime,
    id_funcionario int,
    foreign key (id_funcionario) references tb_funcionario (id_funcionario)
);

create table tb_provento (
	id_provento int primary key auto_increment,
    nr_horas_extras int,
    vl_hora_extra decimal(20,2),
    vl_bonus decimal(20,2),
    vl_decimo_terceiro decimal(20,2),
    vl_comissao decimal(20,2),
    vl_total_provento decimal(20,2),
    id_funcionario int,
    id_controle_ponto int,
    id_semana int,
    foreign key (id_funcionario) references tb_funcionario (id_funcionario),
    foreign key (id_controle_ponto) references tb_controle_ponto (id_controle_ponto),
    foreign key (id_semana) references tb_dia_semana (id_semana)
);	

create table tb_desconto (
	id_desconto int primary key auto_increment,
    vl_fgts decimal(20,2),
    vl_inss decimal(20,2),
    bt_vr boolean,
    bt_vt boolean,
    bt_plano_saude boolean,
    bt_plano_odontologico boolean,
    vl_adiantamento decimal(20,2),
    vl_contribuicao_sindical decimal(20,2),
    nr_faltas int,
    nr_atrasos int,
    vl_total_desconto decimal(20,2),
    id_funcionario int,
    id_controle_ponto int,
    id_semana int,
    foreign key (id_funcionario) references tb_funcionario (id_funcionario),
    foreign key (id_controle_ponto) references tb_controle_ponto (id_controle_ponto),
    foreign key (id_semana) references tb_dia_semana (id_semana)
);

create table tb_pagamento (
	id_pagamento int primary key auto_increment,
    vl_salario_base decimal(20,2),
    vl_hora decimal(20,2),
    ds_conta_bancaria varchar(45),
    ds_agencia_bancaria varchar(45),
    ds_banco varchar(45),
    vl_total_pagamento decimal(20,2),
    dt_pagamento datetime,
    id_funcionario int,
    id_controle_ponto int,
    id_provento int,
    id_desconto int,
    foreign key (id_funcionario) references tb_funcionario (id_funcionario),
    foreign key (id_controle_ponto) references tb_controle_ponto (id_controle_ponto),
    foreign key (id_provento) references tb_provento (id_provento),
    foreign key (id_desconto) references tb_desconto (id_desconto)
);

insert into tb_funcionario(nm_funcionario, ds_genero, dt_nascimento, ds_email, ds_telefone, ds_rg, ds_cpf, ds_endereco, ds_cep, ds_numero_casa, ds_complemento, ds_departamento, ds_cargo, ds_usuario, ds_senha)
	 values ('Carolina Priscila Luana da Rocha','Feminino','1999-06-16','carolinapriscilaluanadarocha_@accor.com.br','(69) 98666-6480','42.339.840-4','468.697.865-34','Estrada Areia Branca','76808-725','427','Casa',
     'Administrativo','Analista Administrativo','cprilu','01kasf');
     
insert into tb_funcionario(nm_funcionario, ds_genero, dt_nascimento, ds_email, ds_telefone, ds_rg, ds_cpf, ds_endereco, ds_cep, ds_numero_casa, ds_complemento, ds_departamento, ds_cargo, ds_usuario, ds_senha)
	 values ('Pietro Kauê Pedro Henrique Campos','Masculino','1945-03-27','pietrokauepedrohenriquecampos-80@jotace.eti.br','(95) 98180-0497','10.193.465-8','952.974.097-21','Rua Armando Nogueira','69312-311','674','Apartamento',
     'Financeiro','Diretor Financeiro','pkpha','asf1198');
     
insert into tb_funcionario(nm_funcionario, ds_genero, dt_nascimento, ds_email, ds_telefone, ds_rg, ds_cpf, ds_endereco, ds_cep, ds_numero_casa, ds_complemento, ds_departamento, ds_cargo, ds_usuario, ds_senha)
	 values ('Helena Marcela Pereira','Feminino','1983-06-24','helenamarcelapereira__helenamarcelapereira@devuono.com.br','(46) 98449-7567','33.124.834-7','559.090.004-20','Rua Antonio Garces Novaes Filho','85504-308','655','Casa',
     'Vendas','Gerente de vendas','hmpqt','agfd594');
     
select * from tb_funcionario;



insert into tb_dia_semana(bt_segunda, bt_terca, bt_quarta, bt_quinta, bt_sexta, bt_sabado, bt_domingo, hr_entrada, hr_saida, id_funcionario)
	 values (true,true,true,true,true,false,false,'8:00:00','16:00:00',1);
insert into tb_dia_semana(bt_segunda, bt_terca, bt_quarta, bt_quinta, bt_sexta, bt_sabado, bt_domingo, hr_entrada, hr_saida, id_funcionario)
	 values (true,true,true,true,true,true,false,'8:00:00','17:00:00',2);
insert into tb_dia_semana(bt_segunda, bt_terca, bt_quarta, bt_quinta, bt_sexta, bt_sabado, bt_domingo, hr_entrada, hr_saida, id_funcionario)
	 values (true,true,true,true,true,false,false,'8:00:00','16:00:00',3);
     
select * from tb_dia_semana;




insert into tb_controle_acesso (bt_departamento_venda, bt_departamento_compra, bt_rh, bt_financeiro, bt_adm, bt_ti, bt_juridico, id_funcionario)
	 values (false,false,false,false,true,false,false,1);
insert into tb_controle_acesso (bt_departamento_venda, bt_departamento_compra, bt_rh, bt_financeiro, bt_adm, bt_ti, bt_juridico, id_funcionario)
	 values (false,false,false,true,false,false,false,2);
insert into tb_controle_acesso (bt_departamento_venda, bt_departamento_compra, bt_rh, bt_financeiro, bt_adm, bt_ti, bt_juridico, id_funcionario)
	 values (true,false,false,false,false,false,false,3);

select * from tb_controle_acesso;

insert into tb_controle_ponto (dt_dia, dt_entrada, dt_entrada_intervalo, dt_saida_intervalo, dt_saida, dt_entrada_hora_extra, dt_saida_hora_extra, id_funcionario)
	 values ('2020-06-25','2020-06-25 9:00:00','2020-06-25 13:00:00','2020-06-25 13:47:29','2020-06-25 16:05:29',null,null,1);
insert into tb_controle_ponto (dt_dia, dt_entrada, dt_entrada_intervalo, dt_saida_intervalo, dt_saida, dt_entrada_hora_extra, dt_saida_hora_extra, id_funcionario)
	 values ('2020-06-25','2020-06-25 7:53:57','2020-06-25 12:01:34','2020-06-25 12:57:29','2020-06-25 18:05:29','2020-06-25 16:10:00','2020-06-25 12:57:29',2);
insert into tb_controle_ponto (dt_dia, dt_entrada, dt_entrada_intervalo, dt_saida_intervalo, dt_saida, dt_entrada_hora_extra, dt_saida_hora_extra, id_funcionario)
	 values (null,null,null,null,null,null,null,3);
     
select * from tb_controle_ponto;



insert into tb_provento (nr_horas_extras, vl_hora_extra, vl_bonus, vl_decimo_terceiro, vl_comissao, vl_total_provento, id_funcionario, id_controle_ponto,id_semana)
     values (null,89.00,400.53,null,null,400.53,1, (select id_controle_ponto from tb_controle_ponto where id_funcionario = 1),(select id_semana from tb_dia_semana where id_funcionario = 1));
insert into tb_provento (nr_horas_extras, vl_hora_extra, vl_bonus, vl_decimo_terceiro, vl_comissao, vl_total_provento, id_funcionario, id_controle_ponto, id_semana)
     values (2,120.00,1000.53,null,null,1240.53,2,(select id_controle_ponto from tb_controle_ponto where id_funcionario = 2),(select id_semana from tb_dia_semana where id_funcionario = 2));
insert into tb_provento (nr_horas_extras, vl_hora_extra, vl_bonus, vl_decimo_terceiro, vl_comissao, vl_total_provento, id_funcionario, id_controle_ponto, id_semana)
     values (2,120.00,1000.53,null,null,1240.53,3,(select id_controle_ponto from tb_controle_ponto where id_funcionario = 3),(select id_semana from tb_dia_semana where id_funcionario = 3));
     
select * from tb_provento;



insert into tb_desconto (vl_fgts, vl_inss, bt_vr, bt_vt, bt_plano_saude, bt_plano_odontologico, vl_adiantamento, vl_contribuicao_sindical, nr_faltas, nr_atrasos, vl_total_desconto, id_funcionario, id_controle_ponto,id_semana)
	 values (200.00,150.00,true,true,true,true,null,null,null,1,550.53,1,(select id_controle_ponto from tb_controle_ponto where id_funcionario = 1),(select id_semana from tb_dia_semana where id_funcionario = 1));
insert into tb_desconto (vl_fgts, vl_inss, bt_vr, bt_vt, bt_plano_saude, bt_plano_odontologico, vl_adiantamento, vl_contribuicao_sindical, nr_faltas, nr_atrasos, vl_total_desconto, id_funcionario, id_controle_ponto,id_semana)
	 values (500.00,450.00,true,true,true,true,1200.00,50.00,null,null,1450.53,2,(select id_controle_ponto from tb_controle_ponto where id_funcionario = 2),(select id_semana from tb_dia_semana where id_funcionario = 2));
insert into tb_desconto (vl_fgts, vl_inss, bt_vr, bt_vt, bt_plano_saude, bt_plano_odontologico, vl_adiantamento, vl_contribuicao_sindical, nr_faltas, nr_atrasos, vl_total_desconto, id_funcionario, id_controle_ponto,id_semana)
	 values (200.00,150.00,true,true,true,false,null,null,1,null,850.53,3,(select id_controle_ponto from tb_controle_ponto where id_funcionario = 3),(select id_semana from tb_dia_semana where id_funcionario = 3));
     
select * from tb_desconto;



insert into tb_pagamento (vl_salario_base, vl_hora, ds_conta_bancaria, ds_agencia_bancaria, ds_banco, vl_total_pagamento, dt_pagamento, id_funcionario, id_controle_ponto, id_provento, id_desconto)
	 values (2506.00,60.00,'0175172-7','1008','Bradesco',2100.00,'2020-07-05 12:15:48',1,(select id_controle_ponto from tb_controle_ponto where id_funcionario = 1),
     (select id_provento from tb_provento where id_funcionario = 1),(select id_desconto from tb_desconto where id_funcionario = 1));
insert into tb_pagamento (vl_salario_base, vl_hora, ds_conta_bancaria, ds_agencia_bancaria, ds_banco, vl_total_pagamento, dt_pagamento, id_funcionario, id_controle_ponto, id_provento, id_desconto)
	 values (5506.00,60.00,'0175172-7','1008','Bradesco',4350.00,'2020-07-05 12:17:48',2,(select id_controle_ponto from tb_controle_ponto where id_funcionario = 1),
     (select id_provento from tb_provento where id_funcionario = 2),(select id_desconto from tb_desconto where id_funcionario = 2));
insert into tb_pagamento (vl_salario_base, vl_hora, ds_conta_bancaria, ds_agencia_bancaria, ds_banco, vl_total_pagamento, dt_pagamento, id_funcionario, id_controle_ponto, id_provento, id_desconto)
	 values (3506.00,60.00,'0175172-7','1008','Bradesco',3230.00,'2020-07-05 12:16:48',3,(select id_controle_ponto from tb_controle_ponto where id_funcionario = 1),
     (select id_provento from tb_provento where id_funcionario = 3),(select id_desconto from tb_desconto where id_funcionario = 3));
     
select * from tb_pagamento;




select * from tb_funcionario where ds_departamento like '%Financeiro%';

select * from tb_controle_acesso ca join tb_funcionario f on ca.id_funcionario = f.id_funcionario where ds_departamento like '%Vendas%';

select bt_departamento_venda, bt_departamento_compra, bt_rh, bt_financeiro, bt_adm, bt_ti, bt_juridico, ds_departamento 
from tb_controle_acesso ca 
join tb_funcionario f on ca.id_funcionario = f.id_funcionario 
where ds_departamento like '%Vendas%';

select * from tb_controle_ponto cp join tb_funcionario f on cp.id_funcionario = f.id_funcionario where nm_funcionario like '%Carolina%';

select  id_pagamento, vl_salario_base, vl_hora, ds_conta_bancaria, ds_agencia_bancaria, ds_banco, vl_total_pagamento, dt_pagamento, f.id_funcionario, nm_funcionario, ds_email, ds_telefone, ds_departamento, d.id_desconto, 
vl_fgts, vl_inss, bt_vr, bt_vt, bt_plano_saude, bt_plano_odontologico, vl_adiantamento, vl_contribuicao_sindical, nr_faltas, nr_atrasos, vl_total_desconto,pr.id_provento, nr_horas_extras, vl_hora_extra, vl_bonus, 
vl_decimo_terceiro, vl_comissao, vl_total_provento
from tb_pagamento p 
join tb_funcionario f on p.id_funcionario = f.id_funcionario
join tb_desconto d on p.id_funcionario = d.id_funcionario
join tb_provento pr on p.id_funcionario = pr.id_funcionario
where nm_funcionario like '%Carolina%';

select truncate(avg(vl_total_pagamento),2),ds_departamento from tb_pagamento p join tb_funcionario f on p.id_funcionario = f.id_funcionario where ds_departamento like '%Vendas%';