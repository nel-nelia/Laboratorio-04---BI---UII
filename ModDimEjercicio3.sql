--use master;
create database DimEjercicio3;
go
use DimEjercicio3;
create table FactPaqueteTrabajo(
	IdFactPaqueteTrabajo int primary key identity,
	Costos decimal(10,2) not null,
	Colaborador varchar(250) not null,
	IdDimProyecto int not null,
	IdDimResponsable int not null,
	IdDimLocalidad int not null,
	IdDimTiempo int not null
);
create table DimProyecto(
	IdDimProyecto int primary key identity,
	Proyecto varchar(250) unique not null,
	Cliente varchar(250) unique not null,
	Telefono varchar(12) unique not null
);
create table DimResponsable(
	IdDimResponsable int primary key identity,
	Responsable varchar(250) not null,
	Empresa varchar(250) not null,
);
create table DimTiempo(
	IdDimTiempo int primary key identity,
	Ano int not null,
	Mes int not null,
	Dia int not null
);
create table DimLocalidad(
	IdDimLocalidad int primary key identity,
	Localidad varchar(250) unique  not null,
	Pais varchar(250) unique  not null
);

alter table FactPaqueteTrabajo add constraint FK_DimLocalidad_FactPaqueteTrabajo foreign key (DimLocalidadSkey) 
references IdDimLocalidad;
alter table FactPaqueteTrabajo add constraint FK_DimProyecto_FactPaqueteTrabajo foreign key (DimProyectoSkey)
 references IdDimProyecto;
alter table FactPaqueteTrabajo add constraint FK_DimResponsable_FactPaqueteTrabajo foreign key (DimResponsableSkey) 
references IdDimResponsable;
alter table FactPaqueteTrabajo add constraint FK_DimTiempo_FactPaqueteTrabajo foreign key (DimTiempoSkey) 
references IdDimTiempo;
