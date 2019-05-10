CREATE TABLE [dbo].[FEATUREARTICOLO] (
    [CodArticolo]    VARCHAR (50) NOT NULL,
    [CodTipologia]   VARCHAR (3)  NOT NULL,
    [CodVariante]    VARCHAR (8)  NOT NULL,
    [CodFeature]     INT          DEFAULT ((0)) NOT NULL,
    [LungVariante]   AS           ([dbo].[funlunghezzavariante]([codtipologia])),
    [UtenteModifica] VARCHAR (25) NOT NULL,
    [DataModifica]   DATETIME     NOT NULL,
    [NRRIGA]         INT          DEFAULT ((0)) NULL,
    PRIMARY KEY CLUSTERED ([CodArticolo] ASC, [CodTipologia] ASC),
    FOREIGN KEY ([CodTipologia], [CodVariante]) REFERENCES [dbo].[TABVARIANTI] ([TIPOLOGIA], [VARIANTE])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_FEATUREARTICOLO]
    ON [dbo].[FEATUREARTICOLO]([CodArticolo] ASC, [CodFeature] ASC, [CodTipologia] ASC);


GO


CREATE TRIGGER TU_FEAUTUREVALUE
   ON  FEATUREARTICOLO
    AFTER UPDATE
AS 
BEGIN

       BEGIN TRY
                    SET NOCOUNT ON 
                    DECLARE @CodArticolo VARCHAR(50)
                    DECLARE @CodFeature INT
                    DECLARE @RESULT bit
                    DECLARE @VarEsplicite VARCHAR(max)
                    ---------------------------------------------------------
                    DECLARE View4Inserted  cursor FAST_FORWARD for 
                                  SELECT CodArticolo, CodFeature  FROM Inserted 
                    
                           OPEN View4Inserted
                           ---    
                           FETCH NEXT FROM View4Inserted
                           INTO @CodArticolo, @CodFeature

                           -- Check @@FETCH_STATUS to see if there are any more rows to fetch.
                           WHILE @@FETCH_STATUS = 0
                                  BEGIN

                                        SET @VarEsplicite = (SELECT [Dbo].[FunStringVarEsplicite4Feature] (@CodArticolo))                                
                                        UPDATE ANAGRAFICAARTICOLI SET VARESPLICITE = @VarEsplicite, CodFeature=@CodFeature Where CODICE = @CodArticolo
                                        UPDATE GESTIONEPREZZI SET VARESPLICITE = @VarEsplicite Where CODART  = @CodArticolo
                                        UPDATE REGOLEPREZZIESTESI  SET VARESPLICITE = @VarEsplicite Where CODART  = @CodArticolo
                                        UPDATE TABPROVVIGIONI  SET VARESPLICITE = @VarEsplicite Where CODARTICOLO   = @CodArticolo 
                                        
                                  FETCH NEXT FROM View4Inserted
                                  INTO @CodArticolo, @CodFeature  
                                        
                                  END
                           CLOSE View4Inserted
                           DEALLOCATE View4Inserted
                           ---------------------------------------------------------
             END TRY
             BEGIN CATCH
                    RAISERROR ('Errore inserimento [dbo].[FEATUREARTICOLO].', 16, 1);
                    ROLLBACK TRANSACTION;
                    RETURN 
             END CATCH;   

END



GO


CREATE TRIGGER TD_FEAUTUREVALUE ON FEATUREARTICOLO AFTER DELETE AS 

BEGIN

       BEGIN TRY
                    SET NOCOUNT ON 
                    DECLARE @CodArticolo VARCHAR(50)
                    
                    DECLARE View4Deleted  cursor FAST_FORWARD for                                   
                        SELECT Distinct CodArticolo FROM Deleted 
                    
                           OPEN View4Deleted
                           
                           FETCH NEXT FROM View4Deleted INTO @CodArticolo

                           WHILE @@FETCH_STATUS = 0
                                  BEGIN

                                        UPDATE ANAGRAFICAARTICOLI SET VARESPLICITE = '', CodFeature = 0 Where CODICE = @CodArticolo
                                        UPDATE GESTIONEPREZZI SET VARESPLICITE = '' Where CODART  = @CodArticolo
                                        UPDATE REGOLEPREZZIESTESI  SET VARESPLICITE = '' Where CODART  = @CodArticolo
                                        UPDATE TABPROVVIGIONI  SET VARESPLICITE = '' Where CODARTICOLO   = @CodArticolo 

                                  FETCH NEXT FROM View4Deleted INTO @CodArticolo
                                        
                                  END
                           CLOSE View4Deleted
                           DEALLOCATE View4Deleted
                           
             END TRY
             BEGIN CATCH
                    RAISERROR ('Errore on Delete FEATUREARTICOLO.', 16, 1);
                    ROLLBACK TRANSACTION;
                    RETURN 
             END CATCH;

END


GO



CREATE TRIGGER TI_FEAUTUREVALUE
   ON  FEATUREARTICOLO
    AFTER INSERT
AS 
BEGIN

       BEGIN TRY
                    SET NOCOUNT ON 
                    DECLARE @CodArticolo VARCHAR(50)
                    DECLARE @CodFeature INT
                    DECLARE @RESULT bit
                    DECLARE @VarEsplicite VARCHAR(max)
                    ---------------------------------------------------------
                    DECLARE View4Inserted  cursor FAST_FORWARD for 
                                  SELECT CodArticolo, CodFeature  FROM Inserted 
                    
                           OPEN View4Inserted
                           ---    
                           FETCH NEXT FROM View4Inserted
                           INTO @CodArticolo, @CodFeature

                           WHILE @@FETCH_STATUS = 0
                                  BEGIN

                                        SET @VarEsplicite = (SELECT [Dbo].[FunStringVarEsplicite4Feature] (@CodArticolo)) 
                                                                      
                                        UPDATE ANAGRAFICAARTICOLI SET VARESPLICITE = @VarEsplicite,  CodFeature = @CodFeature Where CODICE = @CodArticolo
                                        UPDATE GESTIONEPREZZI SET VARESPLICITE = @VarEsplicite Where CODART  = @CodArticolo
                                        UPDATE REGOLEPREZZIESTESI  SET VARESPLICITE = @VarEsplicite Where CODART  = @CodArticolo
                                        UPDATE TABPROVVIGIONI  SET VARESPLICITE = @VarEsplicite Where CODARTICOLO   = @CodArticolo 

                                  FETCH NEXT FROM View4Inserted
                                  INTO @CodArticolo, @CodFeature
                                        
                                  END
                           CLOSE View4Inserted
                           DEALLOCATE View4Inserted
                           ---------------------------------------------------------
             END TRY
             BEGIN CATCH
                    RAISERROR ('Errore inserimento [dbo].[FEATUREARTICOLO].', 16, 1);
                    ROLLBACK TRANSACTION;
                    RETURN 
             END CATCH;

END



GO
GRANT DELETE
    ON OBJECT::[dbo].[FEATUREARTICOLO] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FEATUREARTICOLO] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FEATUREARTICOLO] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FEATUREARTICOLO] TO [Metodo98]
    AS [dbo];

