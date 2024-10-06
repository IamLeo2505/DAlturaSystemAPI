CREATE PROCEDURE pA_lista_detallecredito
AS
BEGIN
    SELECT 
        IdDetalleCrédito,
        FechaPago,
        MontoAbono,
    FROM DetalleCrédito
END

USE SystemAlturaCoffee
GO

CREATE PROCEDURE pA_guardar_detallecredito(
    @IdDetalleCrédito INT,
    @FechaPago Date,
    @MontoAbono DECIMAL(10,0),
) AS 
BEGIN
    INSERT INTO DetalleCrédito(IdDetalleCrédito, FechaPago, MontoAbono)
    VALUES (@IdDetalleCrédito, @FechaPago, @MontoAbono)
END

CREATE PROCEDURE pA_editar_detallecredito(
  @IdDetalleCrédito INT not null,
  @FechaPago Date not null,
  @MontoAbono DECIMAL(10,0) not null
) AS 
BEGIN
  UPDATE DetalleCrédito SET
    FechaPago = @FechaPago,
	MontoAbono = @MontoAbono,
  WHERE IdDetalleCrédito = @IdDetalleCrédito
END

CREATE PROCEDURE pA_eliminar_detallecredito(
  @IdDetalleCrédito INT
)
AS 
BEGIN
  DELETE FROM DetalleCrédito WHERE IdDetalleCrédito = @IdDetalleCrédito
END
