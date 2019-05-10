
CREATE FUNCTION [dbo].[MAPS_DataUltimoElementoModificato](
    @NOMEPIANIF     varchar(30)
) RETURNS DATETIME
BEGIN

    DECLARE @RESULT DATETIME
    SELECT @RESULT = MAX(DATAMODIFICA)
    FROM
    (
        select          
            MAX(dbo.MAPS_MaxDate(TD.DATAMODIFICA, RD.DATAMODIFICA)) as DATAMODIFICA
        from PROGPRODUZIONE PP
            inner join TESTEDOCUMENTI TD on TD.PROGRESSIVO = PP.IDTESTADOC
            inner join RIGHEDOCUMENTI RD on RD.IDTESTA = PP.IDTESTADOC and RD.IDRIGA = PP.IDRIGADOC
        where PP.NOMEPIANIF = @NOMEPIANIF
            and PP.TIPO in (3,4,5,9)

        union 

        select 
            MAX(dbo.MAPS_MaxDate(TP.DATAMODIFICA,RP.DATAMODIFICA)) as DATAMODIFICA
        from PROGPRODUZIONE PP
            inner join TESTEORDINIPROD TP on TP.PROGRESSIVO = PP.IDTESTADOC
            inner join RIGHEORDPROD RP on RP.IDTESTA = PP.IDTESTADOC and RP.IDRIGA = PP.IDRIGADOC
        where PP.NOMEPIANIF = @NOMEPIANIF
            and PP.TIPO in (6)

        union

        select
            MAX(dbo.MAPS_MaxDate(TP.DATAMODIFICA, IP.DATAMODIFICA)) as DATAMODIFICA         
        from PROGPRODUZIONE PP
            inner join TESTEORDINIPROD TP on TP.PROGRESSIVO = PP.IDTESTADOC
            inner join IMPEGNIORDPROD IP on IP.IDTESTA = PP.IDTESTADOC and IP.IDRIGA = PP.IDRIGADOC and IP.IDIMPEGNO = PP.IDIMPEGNO
        where PP.NOMEPIANIF = @NOMEPIANIF
            and PP.TIPO in (7)
    ) DATA
    IF (@RESULT IS NULL)
        SET @RESULT = GETDATE()
        
    RETURN @RESULT
    
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[MAPS_DataUltimoElementoModificato] TO [Metodo98]
    AS [dbo];

