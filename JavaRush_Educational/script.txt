use test;
drop table if exists hibernate_sequence;
drop table if exists part;
create table hibernate_sequence (next_val bigint) engine=MyISAM;
insert into hibernate_sequence values ( 1 );
create table part (id bigint not null auto_increment, amount integer not null, name varchar(255), requirement bit not null, primary key (id)) engine=MyISAM
default character set = utf8;
insert into part (amount, name, requirement) values (10,'Процессор' ,true);
insert into part (amount, name, requirement) values (3,'Материнская плата' ,true);
insert into part (amount, name, requirement) values (8,'Звуковая карта' ,false);
insert into part (amount, name, requirement) values (2,'Подсветка корпуса' ,false);
insert into part (amount, name, requirement) values (3,'HDD диск' ,true);
insert into part (amount, name, requirement) values (8,'Корпус' ,true);
insert into part (amount, name, requirement) values (15,'Оперативная память' ,true);
insert into part (amount, name, requirement) values (5,'SSD диск' ,false);
insert into part (amount, name, requirement) values (12,'Видеокарта' ,true);
insert into part (amount, name, requirement) values (10,'Процессор' ,true);


insert into part (amount, name, requirement) values (2,'Блок питания' ,true);
insert into part (amount, name, requirement) values (1,'Система охлаждения компьютера' ,false);
insert into part (amount, name, requirement) values (15,'Система охлаждения процессора' ,false);
insert into part (amount, name, requirement) values (3,'Система охлаждения корпуса' ,false);
insert into part (amount, name, requirement) values (0,'Оптический привод' ,false);
insert into part (amount, name, requirement) values (40,'Клавиатура' ,false);
insert into part (amount, name, requirement) values (30,'Мышь' ,false);
insert into part (amount, name, requirement) values (50,'HDMI провод' ,false);
insert into part (amount, name, requirement) values (15,'Монитор' ,false);
insert into part (amount, name, requirement) values (12,'Колонки' ,false);
insert into part (amount, name, requirement) values (10,'Микрофон' ,false);
insert into part (amount, name, requirement) values (14,'Игровая гарнитура' ,false);
insert into part (amount, name, requirement) values (99,'Гарантия на комлектующие' ,true);


