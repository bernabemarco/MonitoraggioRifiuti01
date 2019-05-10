
CREATE PROCEDURE [dbo].[ProcEx_PreparaElencoArticoliOF](@IdSessione Decimal(5,0),
                                                         @CodBuyer   Varchar(7),
                                                          @Where      Varchar(MAX),
                                                           @Articolo   Varchar(MAX),
                                                            @IsTuttiFornitori    smallint)

AS

BEGIN

DECLARE @nSQL       Varchar(MAX)
DECLARE @Esercizio  Decimal(5,0)

    SET NOCOUNT ON 

    SELECT @Esercizio = ESERCIZIOATTIVO FROM TABUTENTI WHERE USERDB = USER_NAME();
    
    SET @nSQL = ''

    IF @Articolo <> ''
        BEGIN
            SET @nSQL = CAST('DELETE FROM #TP_ELENCOARTICOLIOF_TEMP WHERE (CodArt = ''' + @Articolo + ''');' AS Varchar(MAX))
            EXEC(@nSQL)
        END
    ELSE
        BEGIN
            SET @nSQL = CAST('TRUNCATE TABLE #TP_ELENCOARTICOLIOF_TEMP;' AS Varchar(MAX))
            EXEC(@nSQL)
        END

    SET @nSQL = CAST('insert into #TP_ELENCOARTICOLIOF_TEMP(IDSESSIONE,Prog_ID,CodArt,DescrizioneArt,CodFor,TP_CodDep,ModalitaCalcolo,Gruppo,Categoria,CodCategoriaStat,GruppoPrzPart,CodFamigliaPos,CodRepartoPos,CodLivello,CodMarchio,VarEsplicite,NettificaDisponibilita,Proposta,DataCons,NomePianif,RifCommCli,UtenteModifica,DataModifica)
                      Select distinct
                         ' + CAST(@IdSessione AS Varchar(MAX)) + ' as IdSessione
                        ,0 As Prog_Id
                        ,Codice
                        ,Descrizione
                        ,CodFor
                        ,tp_CodDep
                        ,ModalitaCalcolo
                        ,Gruppo
                        ,Categoria
                        ,CodCategoriaStat
                        ,GruppoPrzPart
                        ,CodFamigliaPOS
                        ,CodRepartoPOS
                        ,CodLivelloInterno
                        ,CodMarchio
                        ,VarEsplicite
                        ,0 as NettificaDisponibilita
                        ,0 as Proposta
                        ,getdate() as DataCons
                        ,'''' as NomePianif
                        ,'''' as RifCommCli
                        ,User_Name() As UtenteModifica
                        ,getdate() As DataModifica
                     from
                        [dbo].[View_Of_ElencoArticoli]
                     Where 
                            Esercizio = ' + CAST(@Esercizio As Varchar(MAX)) + '
                        ' + CAST((CASE WHEN @Where <> '' THEN ' AND ' + @Where ELSE '' END) As Varchar(MAX)) AS Varchar(MAX))
        
    EXEC(@nSQL)
    
    --TRUNCATE TABLE [dbo].[#TP_ELENCOARTICOLIOF_TEMP];
    
    /*Equivale al print*/
    select @nSQL as [processing-instruction(x)] FOR XML PATH 
    
    /*18.04.2016 Giacenza*/
    EXEC [PROC_CREA_GIACENZE_RUNTIME] @IdSessione, @Esercizio, @Articolo;
END


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[ProcEx_PreparaElencoArticoliOF] TO [Metodo98]
    AS [dbo];

