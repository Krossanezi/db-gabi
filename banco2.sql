drop database biblioteca;

create database Biblioteca;

use Biblioteca;

create table Usuario(
  idUsuario int primary key not null auto_increment,
  nome varchar(45) not null,
  RG varchar(12),
  CPF varchar(14) not null,
  idProfessor int,
  matriculaAluno int,
  logradouro varchar(45),
  Cidade varchar(45),
  numero varchar(45),                        
  complemento varchar(45),
  bairro varchar(45),
  Estado char(2),
  CEP int
  );


create table Emprestimo(
  idEmprestimo int primary key not null auto_increment,
  idUsuario int not null,
  dataEmprestimo datetime not null,
  dataDevolucao datetime not null,
  situacao varchar(45) not null,
  foreign key (idUsuario) references Usuario(idUsuario)
);

create table Livro(
  idLivro int primary key not null auto_increment,
  titulo varchar(45) not null,
  anoPublicacao int not null,
  editora varchar(45) not null,
  numeroEdicao int not null,
  autor varchar(45) not null,
  volume int not null,
  numeroExemplares int not null
);

create table Exemplar(
  idExemplar int primary key not null auto_increment,
  idLivro int not null,
  foreign key (idLivro) references Livro (idLivro)
);

create table ItemEmprestimo(
  idItem int primary key not null auto_increment,
  idEmprestimo int not null,
  idExemplar int not null,
  foreign key (idEmprestimo) references Emprestimo (idEmprestimo),
  foreign key (idExemplar) references Exemplar (idExemplar)
);


create table estados(
sigla char(2) primary key,
estado varchar(45) not null,
capital varchar(50) not null
);

SELECT* FROM livro
ORDER BY titulo;

SELECT* from Usuario
ORDER BY nome DESC;

SELECT *FROM  Emprestimo
INNER JOIN livro;

SELECT
  COUNT(idEmprestimo) AS numero_emprestimos
FROM emprestimo;


SELECT AVG(anoPublicacao) as autor
FROM livro;

SELECT MIN(anoPublicacao) as titulo
FROM livro;

SELECT MAX(anoPublicacao) as editora
FROM livro;

SELECT
  SUM(idExemplar) AS total_exemplares
FROM itememprestimo;

SELECT COUNT(*) as  numeroExemplares
FROM livro;

