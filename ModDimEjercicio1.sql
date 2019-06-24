--use master;
create database DimEjercicio1;
go
use DimEjercicio1;
create table FactEnvio(
	IdFactEnvio int not null,
	--Fecha datetime not null,
	Costos decimal(10,2) not null,
	IdDimDestino int not null,
	IdDimCentroCosto int not null,
	IdDimLote int not null,
	IdDimModoTransporte int not null,
	IdDimTiempo int not null,
);
create table DimDestino(
	IdDimDestino int primary key identity,
	Destino varchar(255) not null,
	Pais varchar(150) not null,
	TarifaImportacion decimal(10,2) not null
);
create table DimCentroCosto(
	IdDimCentroCosto int primary key identity,
	CentroCosto varchar(255) not null,
	Responsable varchar(255) not null,
	GrupoCentroCosto varchar(255) not null
);
create table DimLote(
	IdDimLote int primary key identity,
	Lote varchar(255) unique not null,
	Peso decimal(10,2) not null,
	TarifaExportacion decimal(10,2) not null,
	Grupo varchar(255) unique not null
);
create table DimModoTransporte(
	IdDimModoTransporte int primary key identity,
	ModoTransporte varchar(255) not null
);
create table DimTiempo(
	IdDimTiempo int primary key identity,
	Ano int not null,
	Mes int not null
);
alter table  FactEnvio add constraint FK_DimDestino_FactEnvio foreign key (DimDestinoSkey)
 references IdDimDestino;
alter table  FactEnvio add constraint FK_DimCentroCosto_FactEnvio foreign key (DimCentroCostoSkey)
 references IdDimCentroCosto;
alter table  FactEnvio add constraint FK_DimLote_FactEnvio  foreign key (DimLoteSkey) references IdDimLote;
alter table  FactEnvio add constraint FK_DimModoTransporte_FactEnvio foreign key (DimModoTransporteSkey) 
references IdDimModoTransporte;
alter table  FactEnvio add constraint FK_DimTiempo_FactEnvio foreign key (DimTiempoSkey) references IdDimTiempo;