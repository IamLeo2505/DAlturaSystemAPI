create proc pA_lista_devolucion
as
begin
     select 
	 IdDevolucion, FechaDevolucion, Motivo
	 from Devolución
end



create proc pA_guardar_devolucion(
@FechaDevolución date,
@Motivo varchar(20)
) as 
begin
     insert into Devolución(FechaDevolucion, Motivo)
	 values (@IdDevolucion, @FechaDevolucion, @Motivoo)
end



create proc pA_editar_devolucion(
@IdDevolución int not null,
@FechaDevolución date not null,
@Motivo varchar(20) not null
) as 
begin

update Devolución set
FechaDevolucion = isnull(@FechaDevolucion, FechaDevolucion),
Motivo = isnull(@Motivo, Motivo)
where IdDevolucion = @IdDevolucion

end


create proc pA_eliminar_empleado(
@idempleado int
)
as 
begin
delete from empleado where idempleado = @idempleado
end

select * from empleado
