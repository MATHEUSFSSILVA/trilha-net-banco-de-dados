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


--Criar uma tabela
CREATE TABLE [dbo].[Produtos](
	Id int IDENTITY(1,1) PRIMARY KEY NOT NULL, --NOT NULL PARA TER OBRIGATORIEDADE DE CADASTRO, PRIMARY KEY GARANTE QUE O ID SERÁ ÚNICO.
	Nome varchar(255) NOT NULL, --Aceita até 8mil caracteres, travamos em 255 dígitos porém pode ser até 8mil.
	Cor varchar(255) NULL,
	Preco decimal(13, 2) NOT NULL, --Decimal, 13 caracteres e 2 casas decimais.
	DataCadastro datetime2(7) NULL,
	Tamanho varchar(5) NULL,
	Genero char(1) NULL
)