

CREATE FUNCTION [dbo].[DividiScontiEstesi] ()
    RETURNS @TableOfValues table 
                (IDTESTA DECIMAL(10,0),
                 IDRIGA  INT,
                 SCONTO varchar(50)
                ) 
AS 
BEGIN

DECLARE @IDTESTA        DECIMAL(10,0)
DECLARE @IDRIGA         int     
DECLARE @LenString      int 
DECLARE @StringData         Varchar(8000)
DECLARE @SCONTO             Varchar(8000)

    DECLARE Documenti_Cursor CURSOR FOR
        SELECT IDTESTA,IDRIGA,ISNULL(NULLIF(SCONTIESTESI,''),0) AS SCONTIESTESI FROM RigheDocumenti 
        where idtesta in (SELECT
                            PROGRESSIVO
                        FROM
                            TESTEDOCUMENTI TD,
                            TabEserciziEuritmo TEE,
                            TabCliforEuritmo TCE,
                            TabDocumentiEuritmo TDE
                        WHERE
                            TD.ESERCIZIO    = TEE.CODICE and
                            TD.CODCLIFOR    = TCE.CODICE and 
                            TD.TIPODOC      = TDE.CODICE  ) 
                --and   tiporiga <> 'R' and tiporiga <> 'D' and tiporiga <> 'V' 
    OPEN Documenti_Cursor

    FETCH NEXT FROM Documenti_Cursor
        INTO @IDTESTA,@IDRIGA,@StringData

    WHILE @@FETCH_STATUS = 0
        BEGIN
            SET @StringData = REPLACE(@StringData,'+(','-')
            SET @StringData = REPLACE(@StringData,')','')

            WHILE len( @StringData ) > 0 
                BEGIN
                    IF (charindex( '+', @StringData ) < charindex( '-', @StringData )) OR
                        (charindex( '+', @StringData ) > 0 AND charindex( '-', @StringData ) = 0)
                        BEGIN
                            IF charindex( '+', @StringData ) > 0
                                BEGIN
                                    SELECT @LenString = (CASE charindex( '+', @StringData ) 
                                                         WHEN 0 
                                                         THEN len( @StringData ) 

                                                         ELSE ( charindex( '+', @StringData ) -1 )
                                                         END
                                                        ) 
                                END
                            ELSE
                                BEGIN
                                    SELECT @LenString = (CASE charindex( '-', @StringData ) 
                                                         WHEN 0 THEN len( @StringData ) 
                                                         ELSE ( charindex( '-', @StringData )-1 )
                                                         END
                                    ) 
                                END
                        END
                    ELSE
                        BEGIN
                            SELECT @LenString = (CASE charindex( '-', @StringData ) 
                                                 WHEN 0 THEN len( @StringData ) 
                                                 ELSE ( charindex( '-', @StringData )  -1 )
                                                 END
                                                ) 
                        END

                    IF LTRIM(substring( @StringData, 1, @LenString )) <> '' AND
                        RTRIM(substring( @StringData, 1, @LenString )) <> ''

                        BEGIN
                            SET @SCONTO = substring( @StringData, 1, @LenString)

                            INSERT INTO @TableOfValues 
                            SELECT @IDTESTA,@IDRIGA,@SCONTO
                        END                     

                        SELECT @StringData = (CASE ( len( @StringData ) - @LenString ) 
                                              WHEN 0 
                                              THEN '' 
                                              ELSE right( @StringData, len( @StringData ) - @LenString -1) 
                                              END
                                             ) 
                END

            FETCH NEXT FROM Documenti_Cursor
                INTO @IDTESTA,@IDRIGA,@StringData
        END

    CLOSE Documenti_Cursor
    DEALLOCATE Documenti_Cursor

RETURN 

END 


GO
GRANT SELECT
    ON OBJECT::[dbo].[DividiScontiEstesi] TO [Metodo98]
    AS [dbo];

