create proc pA_lista_productos
as
begin
     select 
	 idproducto, codigo, nombre, descripcion, f_ingreso,
	 f_vencimiento, precio_compra, precio_venta, stock,
	 estado
	 from producto
end


create proc pA_guardar_productos(
@codigo varchar(30),
@nombre varchar(50),
@descripcion varchar(150),
@f_ingreso date,
@f_vencimiento date,
@precio_compra decimal(8, 2),
@precio_venta decimal (8, 2),
@stock int,
@estado varchar(10)
) as 
begin
     insert into producto(codigo, nombre, descripcion, f_ingreso, f_vencimiento,
	                      precio_compra, precio_venta, stock, estado)
	 values (@codigo, @nombre, @descripcion, @f_ingreso, @f_vencimiento, @precio_compra, 
	         @precio_venta, @stock, @estado)
end



create proc pA_editar_producto(
@idproducto int, 
@codigo varchar(30) null,
@nombre varchar(50) null,
@descripcion varchar(150) null,
@f_ingreso date null,
@f_vencimiento date null,
@precio_compra decimal(8, 2) null,
@precio_venta decimal (8, 2) null,
@stock int null,
@estado varchar(10) null
) as 
begin

update producto set

codigo = isnull(@codigo, codigo),
nombre = isnull(@nombre, nombre),
descripcion = isnull(@descripcion, descripcion),
f_ingreso = isnull(@f_ingreso, f_ingreso),
f_vencimiento = isnull(@f_vencimiento, f_vencimiento),
precio_compra = isnull(@precio_compra, precio_compra),
precio_venta = isnull(@precio_venta, precio_venta),
stock = isnull(@stock, stock),
estado = isnull(@estado, estado)
where idproducto = @idproducto

end


create proc pA_eliminar_productos(
@idproducto int
)
as 
begin
delete from producto where idproducto = @idproducto
end