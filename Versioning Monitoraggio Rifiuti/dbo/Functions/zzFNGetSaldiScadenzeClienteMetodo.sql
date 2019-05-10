
CREATE FUNCTION [dbo].[zzFNGetSaldiScadenzeClienteMetodo] ( @Cliente VARCHAR(7) )
RETURNS @Scadenze TABLE
    (
      Anno INT NOT NULL
               DEFAULT 0 ,
      Mese INT NOT NULL
               DEFAULT 0 ,
      TotaleScadenze DECIMAL(19, 4) NOT NULL
                                    DEFAULT 0 ,
      TotaleInsoluti DECIMAL(19, 4) NOT NULL
                                    DEFAULT 0 ,
      PrcSolvibilita DECIMAL(16, 6) NOT NULL
                                    DEFAULT 1 ,
      NumeroInsoluti INT NOT NULL
                         DEFAULT 0 ,
      ColoreSfondo INT NOT NULL
                       DEFAULT 0 ,
      ColoreCarattere INT NOT NULL
                          DEFAULT 0
    )
AS 
    BEGIN

	  -- Estraggo le statistiche sulle scadenze
        INSERT  INTO @Scadenze
                ( Anno ,
                  Mese ,
                  TotaleScadenze ,
                  TotaleInsoluti ,
                  NumeroInsoluti
				)
                SELECT  YEAR(DATASCADENZA) AS Anno ,
                        MONTH(DATASCADENZA) AS Mese ,
                        SUM(IMPORTOSCEURO) AS TotaleScadenze ,
                        SUM(CASE ESITO
                              WHEN 3 THEN IMPORTOSCEURO
                              WHEN 4 THEN IMPORTOSCEURO
                              ELSE 0
                            END) AS TotaleInsoluti ,
                        SUM(CASE ESITO
                              WHEN 3 THEN 1
                              WHEN 4 THEN 1
                              ELSE 0
                            END) AS NumeroInsoluti
                FROM    dbo.TABSCADENZE
                WHERE   CODCLIFOR = @Cliente
                GROUP BY YEAR(DATASCADENZA) ,
                        MONTH(DATASCADENZA)

	  -- Aggiorno la percentuale di solvibilit�
        UPDATE  @Scadenze
        SET     PrcSolvibilita = 1 - ( TotaleInsoluti / TotaleScadenze )
        WHERE   TotaleScadenze <> 0

	  -- Aggiorno le soglie di colore
	  -- In rosso scuro e testo bianco le righe con percentuale di solvibilit� sotto soglia
        UPDATE  @Scadenze
        SET     ColoreSfondo = -4194304 ,
                ColoreCarattere = -1
        WHERE   PrcSolvibilita < 0.95
      
        RETURN                
    END

GO
GRANT SELECT
    ON OBJECT::[dbo].[zzFNGetSaldiScadenzeClienteMetodo] TO [Metodo98]
    AS [dbo];

