
/*
    RIF.29/12/2015 - creata
*/
CREATE FUNCTION [dbo].[MAPS_FornitoreFaseEsterna](
    @NOMEPIANIF     varchar(30)
    ,@PROG_ID       decimal(20,0)
) RETURNS VARCHAR(7)
BEGIN
    DECLARE @RESULT VARCHAR(7)

    select @RESULT=TERZISTA
    from
    (
        select
            FASI.NOMEPIANIF
            ,FASI.PROG_ID
            ,CDL.TERZISTA
        from PROGPRODUZIONEFASI FASI
            inner join RIGHECICLOORDINE RCO on RCO.PROGRESSIVO=FASI.RIFPROGRESSIVO and RCO.NUMEROFASE=FASI.RIFNUMEROFASE
            inner join TABELLACDLAVORO CDL on CDL.CODICE=FASI.CDLAVORO
        where
            FASI.TIPO = 0
            and FASI.TIPOFASE = 1
            and RCO.FLGTEMPIFICACTRASF<>0

        union

        select
            FASI.NOMEPIANIF
            ,FASI.PROG_ID
            ,CDL.TERZISTA
        from PROGPRODUZIONEFASI FASI
            inner join RIGHECICLOPROD RCO on RCO.PROGRESSIVO=FASI.RIFPROGRESSIVO and RCO.NUMEROFASE=FASI.RIFNUMEROFASE
            inner join TABELLACDLAVORO CDL on CDL.CODICE=FASI.CDLAVORO
        where 
            FASI.TIPO = 1
            and FASI.TIPOFASE = 1
            and RCO.FLGTEMPIFICACTRASF<>0
    ) FASI
    where
        FASI.NOMEPIANIF=@NOMEPIANIF
        and FASI.PROG_ID=@PROG_ID
    
    RETURN @RESULT
    
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[MAPS_FornitoreFaseEsterna] TO [Metodo98]
    AS [dbo];

