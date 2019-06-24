create database DimEjercicio2;
go
use DimEjercicio2;
create table DimCliente(
	IdDimCliente int primary key identity,
	Cliente varchar(255) unique not null,
	Direccion varchar(255) not null,
	TipoSkey int not null
);
go
create table FactReserva(
	IdFactReserva int primary key identity,
	IdDimCliente int not null,
	IdDimAgenciaViaje int not null,
	IdDimViaje int not null,
	IdDimTiempo int not null
);
go
create table DimAgenciaViaje(
	IdDimAgenciaViaje int primary key identity,
	AgenciaViaje varchar(255) unique not null,
	Operador varchar(255) unique not null,
);
go
create table DimViaje(
	IdDimViaje int primary key identity,
	Viaje varchar(255) unique not null,
	Descripcion varchar(255) unique not null,
	Destino varchar(255) unique not null,
	Pais varchar(255) unique not null
);
go
create table DimTiempo(
	IdDimTiempo int primary key identity,
	Anio int not null,
	Mes int not null
);
ALTER TABLE FactReserva ADD CONSTRAINT FK_DimCliente_FactReserva FOREIGN KEY (DimClienteSkey) 
REFERENCES IdDimCliente;
ALTER TABLE FactReserva ADD CONSTRAINT FK_DimAgenciaViaje_FactReserva FOREIGN KEY (DimAgenciaViajeSkey) 
REFERENCES IdDimAgenciaViaje;
ALTER TABLE FactReserva ADD CONSTRAINT FK_DimViaje_FactReserva FOREIGN KEY (DimViajeSkey) 
REFERENCES IdDimViaje;
ALTER TABLE  FactReserva ADD CONSTRAINT FK_DimTiempo_FactReserva FOREIGN KEY (DimTiempoSkey) 
REFERENCES IdDimTiempo;
