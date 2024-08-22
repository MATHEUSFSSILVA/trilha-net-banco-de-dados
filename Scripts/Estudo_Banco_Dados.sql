select * from Clientes
where Nome Like 'G%'
order by Nome


--Inserir dados em uma tabela setando colunas - Necessário passar na ordem da tabela.
insert into Clientes (Nome, Sobrenome, Email, AceitaComunicados, DataCadastro)
values ('Matheus', 'Silva', 'email@email.com', 1, GETDATE())


--Inserir dados em uma tabela omitindo colunas - Necessário passar na ordem da tabela.
insert into Clientes Values ('Hannandah', 'Laura', 'email@email.com', 1, GETDATE())


--Atualizar um dado
update Clientes
set Email = 'emailatualizado@email.com',
	AceitaComunicados = 1
where Id = 244


--Método de backup
begin tran
rollback


--Deletar um registro de uma tabela
delete Clientes
where Id = 1001


--Soma
select SUM(Preco) as PrecoTotalProdutos from Produtos

--Contagem
select COUNT(*) as QuantidadeProdutos from Produtos

--Mínimo
select MIN(Preco) as PrecoMinimo from Produtos

--Máximo
select MAX(Preco) as PrecoMinimo from Produtos

--Média
select AVG(Preco) as PrecoMinimo from Produtos

--Concat de colunas
select
UPPER(Nome + ' - ' + Cor) as NomeCorMaiusculo,
LOWER(Nome + ' - ' + Cor) as NomeCorMinusculo
from Produtos

--Para Adicionar ou remover uma coluna, clicar com o botão esquerdo em Produtos e design ou abaixo.
--Adicionar
alter table Produtos
add DataCadastro datetime2 NULL

--Remover
alter table Produtos
drop column DataCadastro 

update Produtos set DataCadastro = getdate()

--Formatando uma data
select
FORMAT(DataCadastro, 'dd-MM-yyyy') as Data
from Produtos

--Entendendo o group by
select
Tamanho,
COUNT(*) as Quantidade
from Produtos
group by Tamanho
having Tamanho <> ''
order by Quantidade


--Apagar tabelas.
DROP TABLE IF EXISTS dbo.Enderecos


--Criar tabela endereços com as colunas Id idCliente rua bairro cidade estado
create table Enderecos (
	Id int primary key identity(1, 1) NOT NULL,
	IdCliente int NULL,
	Rua varchar(255) NULL,
	Bairro varchar(255) NULL,
	Cidade varchar(255) NULL,
	Estado char(2) NULL

	constraint FK_Enderecos_Clientes foreign key (IdCliente)
	references Clientes(Id)
)

insert into Enderecos values (4, 'Do Café', 'Higienópolis', 'Marília', 'SP')

select * from Clientes where Id = 4
select * from Enderecos where IdCliente = 4


--JOINS - Além de realizar o Join é possível selecionar colunas de ambas as tabelas.
select 
	C.AceitaComunicados,
	E.Rua
from Clientes as C
inner join Enderecos as E on C.Id = E.IdCliente

