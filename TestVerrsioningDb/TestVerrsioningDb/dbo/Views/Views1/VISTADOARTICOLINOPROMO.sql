
CREATE VIEW [dbo].[VISTADOARTICOLINOPROMO]
AS

    select distinct 
        CODICEART AS CODICE
    from 
        ANAGRAFICAARTICOLICOMM 
    where 
        (FlagCauzioni = 1 or ESAURITO = 1) and 
        ESERCIZIO in (Select ESERCIZIOATTIVO From TABUTENTI Where USERID=user_name())
union
    select 
        codart as CODICE 
    FRom 
        TP_ExtraMag 
    where TP_Espositore = 'x'

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTADOARTICOLINOPROMO] TO [Metodo98]
    AS [dbo];

