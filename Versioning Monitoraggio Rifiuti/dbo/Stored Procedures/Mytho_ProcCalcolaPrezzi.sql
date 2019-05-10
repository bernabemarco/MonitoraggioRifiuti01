

CREATE PROCEDURE [dbo].[Mytho_ProcCalcolaPrezzi]

AS

BEGIN


     ----forzo rebuild-------------------------------------

    DELETE  MYTHO_PRODUCTS_PRICE_DISCOUNT
   
    DELETE TMP_GESTIONEPREZZI_RIGHE_Classificate

    DELETE  PREZZIPARTICOLARI_XML_COMPLETO
    DELETE  dbo.TMP_GESTIONEPREZZI_RIGHE
    DELETE  TMP_GESTIONEPREZZI_RIGHE_Classificate

    ----Rigenero Dati AnagraficaClientiTablet--------------
    DELETE FROM  [AnagraficaClientiTablet]
    /* Inserimento Dati Cliente*/
        ;
        WITH Clienti (CODAGENTE, IDGRUPPO,CODCONTO,  LISTINO, USAPRZCOMMERCIALI, UsaPrzPrvPart ,
                CodGruppoPrezziPart,
                CodSettore ,
                CodZona,
                CodCategoria ,
                Sconto1 ,
                ApplScontoRiga ,
                ApplScontoFinale)
        AS 
        ( SELECT  CF.CODAGENTE1,
                --BINARY_CHECKSUM(Cf.UsaPrzPrvPart,Cf.CodGruppoPrezziPart, cf.CodSettore ,Cf.CodZona ,cf.CodCategoria, replace(CF.Sconto1,' ',''),CF.ApplScontoRiga,CF.ApplScontoFinale,CF.Listino) AS IDGRUPPO,
                0,
                CF.CODCONTO, 
                Cf.LISTINO, 
                cf.USAPRZCOMMERCIALI, 
                cf.UsaPrzPrvPart ,
                cf.CodGruppoPrezziPart,
                cf.CodSettore ,
                cf.CodZona,
                cf.CodCategoria ,
                cf.Sconto1 ,
                cf.ApplScontoRiga ,
                cf.ApplScontoFinale
                FROM ANAGRAFICARISERVATICF CF 
                    INNER join ANAGRAFICACF C ON CF.CODCONTO = C.CODCONTO 
                WHERE 
                 CF.ESERCIZIO = year(getdate())
          
                AND C.TIPOCONTO ='C'
                AND cf.USAPRZPRVPART <>0
                AND CF.EXPORTECOMMERCE = 1
                
        UNION
        SELECT   DISTINCT
                TRSFAG.CODAGENTE
               -- ,BINARY_CHECKSUM(CFESERCIZIO.UsaPrzPrvPart,CFESERCIZIO.CodGruppoPrezziPart, CFESERCIZIO.CodSettore ,CFESERCIZIO.CodZona ,CFESERCIZIO.CodCategoria, replace(CFESERCIZIO.Sconto1,' ',''),CFESERCIZIO.ApplScontoRiga,CFESERCIZIO.ApplScontoFinale,CFESERCIZIO.Listino) AS IDGRUPPO
                ,0 
                ,CFESERCIZIO.CODCONTO
                ,CFESERCIZIO.LISTINO
                ,CFESERCIZIO.USAPRZCOMMERCIALI
                ,UsaPrzPrvPart 
                ,CodGruppoPrezziPart
                ,CodSettore
                ,CodZona
                ,CodCategoria
                ,Sconto1
                ,ApplScontoRiga 
                ,ApplScontoFinale
                FROM TP_TRASFAGENTI TRSFAG 
                inner join ANAGRAFICARISERVATICF CFESERCIZIO
                ON TRSFAG.CODAGENTE = CFESERCIZIO.CODAGENTE1 
                OR  TRSFAG.CODAGENTE = CFESERCIZIO.CODAGENTE2
                OR  TRSFAG.CODAGENTE = CFESERCIZIO.CODAGENTE3
                INNER join ANAGRAFICACF C ON CFESERCIZIO.CODCONTO = C.CODCONTO 
                Where CFESERCIZIO.STATOORDINI<2 AND TRSFAG.ATTIVO=1 
                AND CFESERCIZIO.ESERCIZIO = year(getdate())  AND
                TRSFAG.CODAGENTE NOT IN (SELECT CODICE FROM TP_CONFIGESPORTAZ WHERE TABELLEINESPORTAZIONE='7')
                AND C.TIPOCONTO ='C'
                AND CFESERCIZIO.EXPORTECOMMERCE = 1
                AND CFESERCIZIO.USAPRZPRVPART  <>0
                )
        
        INSERT INTO [dbo].[AnagraficaClientiTablet] (CodConto
                                                        ,Codclifor
                                                        ,LISTINO
                                                        ,USAPRZCOMMERCIALI
                                                        ,UsaPrzPrvPart 
                                                        ,CodGruppoPrezziPart
                                                        ,CodSettore
                                                        ,CodZona
                                                        ,CodCategoria
                                                        ,Sconto1
                                                        ,ApplScontoRiga 
                                                        ,ApplScontoFinale
                                                        ,UTENTEMODIFICA
                                                        ,DATAMODIFICA)

        SELECT DISTINCT CODCONTO,
             CODCONTO AS CODCLIFOR
    
            ,LISTINO
            ,USAPRZCOMMERCIALI
            ,UsaPrzPrvPart 
            ,CodGruppoPrezziPart
            ,CodSettore
            ,CodZona
            ,CodCategoria
            ,Sconto1
            ,ApplScontoRiga 
            ,ApplScontoFinale
            , USER_NAME(), GETDATE() FROM Clienti

    ------------------------------------------------------
    ------------------------------------------------------
    SET NOCOUNT ON;

    DECLARE @Progressivi_GestionePrezzi AS Progressivi_GestionePrezzi
    DECLARE @Progressivi_GestionePrezzi_classificati AS Progressivi_GestionePrezzi

    MERGE TMP_GESTIONEPREZZI_RIGHE AS TARGET
    USING
    ( SELECT     
            Gp.PROGRESSIVO, 
            Gp.CODGRUPPOPREZZICF, 
            Gp.CODCLIFOR, 
            Gp.CODART, 
            Gp.CODGRUPPOPREZZIMAG, 
            Gp.INIZIOVALIDITA, 
            Gp.FINEVALIDITA, 
            Gp.USANRLISTINO, 
            Gp.TIPOARROT, 
            Gp.ARROTALIRE, 
            Gp.ARROTAEURO, 
            Gp.CODARTRIC, 
            Gp.PROGRESSIVOCTR, 
            ISNULL(Gpr.IDRIGA,0) IDRIGA, 
            ISNULL(Gpr.RIFPROGRESSIVO,0) RIFPROGRESSIVO, 
            ISNULL(Gpr.NRLISTINO,0) NRLISTINO, 
            ISNULL(Gpr.UM,'') UM, 
            ISNULL(Gpr.QTAMINIMA,0) QTAMINIMA, 
            ISNULL(Gpr.PREZZO_MAGG,0) PREZZO_MAGG, 
            ISNULL(Gpr.PREZZO_MAGGEURO,0) PREZZO_MAGGEURO,
            ISNULL(Gpr.SCONTO_UNICO,'') SCONTO_UNICO, 
            ISNULL(Gpr.SCONTO_AGGIUNTIVO,'') SCONTO_AGGIUNTIVO, 
            ISNULL(Gpr.TIPO,0) TIPO
        FROM         
            GESTIONEPREZZI AS Gp 
        LEFT OUTER JOIN
            GESTIONEPREZZIRIGHE AS Gpr 
        ON Gp.PROGRESSIVO = Gpr.RIFPROGRESSIVO
    ) AS SOURCE
    (
        PROGRESSIVO, 
        CODGRUPPOPREZZICF, 
        CODCLIFOR, 
        CODART, 
        CODGRUPPOPREZZIMAG, 
        INIZIOVALIDITA, 
        FINEVALIDITA, 
        USANRLISTINO, 
        TIPOARROT, 
        ARROTALIRE, 
        ARROTAEURO, 
        CODARTRIC, 
        PROGRESSIVOCTR, 
        IDRIGA, 
        RIFPROGRESSIVO, 
        NRLISTINO, 
        UM, 
        QTAMINIMA, 
        PREZZO_MAGG, 
        PREZZO_MAGGEURO,
        SCONTO_UNICO, 
        SCONTO_AGGIUNTIVO, 
        TIPO
    )
    ON (TARGET.PROGRESSIVO = SOURCE.PROGRESSIVO)
    WHEN NOT MATCHED BY SOURCE THEN   
        DELETE
    WHEN NOT MATCHED BY TARGET THEN  
        INSERT
            (
                PROGRESSIVO, 
                CODGRUPPOPREZZICF, 
                CODCLIFOR, 
                CODART, 
                CODGRUPPOPREZZIMAG, 
                INIZIOVALIDITA, 
                FINEVALIDITA, 
                USANRLISTINO, 
                TIPOARROT, 
                ARROTALIRE, 
                ARROTAEURO, 
                CODARTRIC, 
                PROGRESSIVOCTR, 
                IDRIGA, 
                RIFPROGRESSIVO, 
                NRLISTINO, 
                UM, 
                QTAMINIMA, 
                PREZZO_MAGG, 
                PREZZO_MAGGEURO,
                SCONTO_UNICO, 
                SCONTO_AGGIUNTIVO, 
                TIPO,
                UTENTEMODIFICA,
                DATAMODIFICA
            )
        VALUES
            (
                PROGRESSIVO, 
                CODGRUPPOPREZZICF, 
                CODCLIFOR, 
                CODART, 
                CODGRUPPOPREZZIMAG, 
                INIZIOVALIDITA, 
                FINEVALIDITA, 
                USANRLISTINO, 
                TIPOARROT, 
                ARROTALIRE, 
                ARROTAEURO, 
                CODARTRIC, 
                PROGRESSIVOCTR, 
                IDRIGA, 
                RIFPROGRESSIVO, 
                NRLISTINO, 
                UM, 
                QTAMINIMA, 
                PREZZO_MAGG, 
                PREZZO_MAGGEURO,
                SCONTO_UNICO, 
                SCONTO_AGGIUNTIVO, 
                TIPO,
                USER_NAME(),
                GETDATE()
            )
    OUTPUT 
    ISNULL(Inserted.Progressivo,0) , ISNULL(Deleted.Progressivo,0)  INTO @Progressivi_GestionePrezzi;
    
    ---Delete ----------------------------------------------
    
    Delete from MYTHO_PRODUCTS_PRICE_DISCOUNT
    FROM MYTHO_PRODUCTS_PRICE_DISCOUNT PR
    INNER JOIN @Progressivi_GestionePrezzi DEL
    ON DEL.progressivoDel = PR.PROGRESSIVOREGOLA
    WHERE PR.TIPOPREZZO =0

    

    --Insert -----------------------------------
    
    INSERT INTO [MYTHO_PRODUCTS_PRICE_DISCOUNT]
           ([PROGRESSIVOREGOLA]
           ,[TIPOREGOLA]
           ,[CODCLIFOR]
           ,[CODART]
           ,[UM]
           ,[QTA]
           ,[PREZZO]
           ,[SCONTO]
           ,[TIPO]
           ,[TIPOPREZZO]
           ,[INIZIOVALIDITA]
           ,[FINEVALIDITA]
           ,[UTENTEMODIFICA]
           ,[DATAMODIFICA]
           ,SCONTIESTESIXML)
    
    SELECT     Progressivo, Tiporegola, CODCLIFOR, CODART, UM, QTAMINIMA, Prezzo, ISNULL(Sconto,''), TIPO,  USAPRZCOMMERCIALI,INIZIOVALIDITA, FINEVALIDITA, utenteModifica, 
                      datamodifica, CONVERT(varchar(1000), DiscountXML)
    FROM         Mytho_GetRowsTablet(@Progressivi_GestionePrezzi,0)
    
    
    --Classificati -----------------------------
    MERGE TMP_GESTIONEPREZZI_RIGHE_CLASSIFICATE AS TARGET
    USING
        ( SELECT     
        
                GP.[PROGRESSIVO] ,
                GP.[CODGRUPPOPREZZICF] ,
                GP.[CODCLIFOR] ,
                GP.[CODDESTINAZIONE] ,
                GP.[CODART],
                GP.[CODGRUPPOPREZZIMAG] ,
                GP.[INIZIOVALIDITA],
                GP.[FINEVALIDITA] ,
                GP.[FAMIGLIA] ,
                GP.[REPARTO] ,
                GP.[TIPOARROT] ,
                GP.[ARROTAVALUTA] ,
                GP.[ARROTONDA] ,
                GP.[CODARTTIPOLOGIA] ,
                GP.[VARIANTI] ,
                GP.[UM] ,
                GP.[TIPORIGA] ,
                GP.[QTAMINIMA] ,
                GP.[IMPORTOVALUTA] ,
                GP.[IMPORTO] ,
                GP.[TIPOSCONTO] ,
                GP.[PROGRESSIVOCTR] ,
                GP.[CODSETTORE],
                GP.[CODZONA] ,
                GP.[CODCATEGORIA] ,
                GP.[CLIFOR] ,
                GP.[TipoEspositore] ,
                GPR.[PROGRESSIVOREGOLETESTE] ,
                GPR.[IDRIGA] ,
                GPR.[CODSCONTO] ,
                GPR.[SCONTO] ,
                GPR.[POSIZIONE] ,
                GPR.INIZIOVALIDITA [INIZIOVALIDITASC] ,
                GPR.FINEVALIDITA [FINEVALIDITASC]           
            FROM         
                dbo.REGOLEPREZZIESTESI AS Gp 
            LEFT OUTER JOIN
                dbo.REGOLESCONTIESTESI AS Gpr 
            ON Gp.PROGRESSIVO = Gpr.[PROGRESSIVOREGOLETESTE]
        ) AS SOURCE
        (
                [PROGRESSIVO] ,
                [CODGRUPPOPREZZICF] ,
                [CODCLIFOR] ,
                [CODDESTINAZIONE] ,
                [CODART],
                [CODGRUPPOPREZZIMAG] ,
                [INIZIOVALIDITA],
                [FINEVALIDITA] ,
                [FAMIGLIA] ,
                [REPARTO] ,
                [TIPOARROT] ,
                [ARROTAVALUTA] ,
                [ARROTONDA] ,
                [CODARTTIPOLOGIA] ,
                [VARIANTI] ,
                [UM] ,
                [TIPORIGA] ,
                [QTAMINIMA] ,
                [IMPORTOVALUTA] ,
                [IMPORTO] ,
                [TIPOSCONTO] ,
                [PROGRESSIVOCTR] ,
                [CODSETTORE],
                [CODZONA] ,
                [CODCATEGORIA] ,
                [CLIFOR] ,
                [TipoEspositore] ,
                [PROGRESSIVOREGOLETESTE] ,
                [IDRIGA] ,
                [CODSCONTO] ,
                [SCONTO] ,
                [POSIZIONE] ,
                [INIZIOVALIDITASC] ,
                [FINEVALIDITASC]        
        )
        ON (TARGET.PROGRESSIVO = SOURCE.PROGRESSIVO)
        WHEN NOT MATCHED BY SOURCE THEN   
            DELETE
        WHEN NOT MATCHED BY TARGET THEN  
            INSERT
                (
                [PROGRESSIVO] ,
                [CODGRUPPOPREZZICF] ,
                [CODCLIFOR] ,
                [CODDESTINAZIONE] ,
                [CODART],
                [CODGRUPPOPREZZIMAG] ,
                [INIZIOVALIDITA],
                [FINEVALIDITA] ,
                [FAMIGLIA] ,
                [REPARTO] ,
                [TIPOARROT] ,
                [ARROTAVALUTA] ,
                [ARROTONDA] ,
                [CODARTTIPOLOGIA] ,
                [VARIANTI] ,
                [UM] ,
                [TIPORIGA] ,
                [QTAMINIMA] ,
                [IMPORTOVALUTA] ,
                [IMPORTO] ,
                [TIPOSCONTO] ,
                [PROGRESSIVOCTR] ,
                [CODSETTORE],
                [CODZONA] ,
                [CODCATEGORIA] ,
                [CLIFOR] ,
                [TipoEspositore] ,
                [PROGRESSIVOREGOLETESTE] ,
                [IDRIGA] ,
                [CODSCONTO] ,
                [SCONTO] ,
                [POSIZIONE] ,
                [INIZIOVALIDITASC] ,
                [FINEVALIDITASC]        
                )
            VALUES
                (
                    [PROGRESSIVO] ,
                    [CODGRUPPOPREZZICF] ,
                    [CODCLIFOR] ,
                    [CODDESTINAZIONE] ,
                    [CODART],
                    [CODGRUPPOPREZZIMAG] ,
                    [INIZIOVALIDITA],
                    [FINEVALIDITA] ,
                    [FAMIGLIA] ,
                    [REPARTO] ,
                    [TIPOARROT] ,
                    [ARROTAVALUTA] ,
                    [ARROTONDA] ,
                    [CODARTTIPOLOGIA] ,
                    [VARIANTI] ,
                    [UM] ,
                    [TIPORIGA] ,
                    [QTAMINIMA] ,
                    [IMPORTOVALUTA] ,
                    [IMPORTO] ,
                    [TIPOSCONTO] ,
                    [PROGRESSIVOCTR] ,
                    [CODSETTORE],
                    [CODZONA] ,
                    [CODCATEGORIA] ,
                    [CLIFOR] ,
                    [TipoEspositore] ,
                    [PROGRESSIVOREGOLETESTE] ,
                    [IDRIGA] ,
                    [CODSCONTO] ,
                    [SCONTO] ,
                    [POSIZIONE] ,
                    [INIZIOVALIDITASC] ,
                    [FINEVALIDITASC]        
                )
        OUTPUT 
        ISNULL(Inserted.Progressivo,0) , ISNULL(Deleted.Progressivo,0)  INTO @Progressivi_GestionePrezzi_classificati;
    
    ---Delete ----------------------------------------------
    
    Delete from MYTHO_PRODUCTS_PRICE_DISCOUNT
    FROM MYTHO_PRODUCTS_PRICE_DISCOUNT PR
    INNER JOIN @Progressivi_GestionePrezzi_classificati DEL
    ON DEL.progressivoDel = PR.PROGRESSIVOREGOLA
    WHERE PR.Tipoprezzo =1
    
    
    ---Insert ----------------------------------------------    
    INSERT INTO [MYTHO_PRODUCTS_PRICE_DISCOUNT]
           ([PROGRESSIVOREGOLA]
           ,[TIPOREGOLA]
           ,[CODCLIFOR]
           ,[DESTINAZIONE]
           ,[CODART]
           ,[UM]
           ,[QTA]
           ,[PREZZO]
           ,[SCONTO]
           ,[TIPO]
           ,[TIPOPREZZO]
           ,[INIZIOVALIDITA]
           ,[FINEVALIDITA]
           ,[UTENTEMODIFICA]
           ,[DATAMODIFICA]
           ,SCONTIESTESIXML)
    
    SELECT     Progressivo, Tiporegola, CODCLIFOR, DESTINAZIONE, CODART, UM, QTAMINIMA, ISNULL(Prezzo,0), ISNULL(Sconto,''), TIPO,  USAPRZCOMMERCIALI,INIZIOVALIDITA, FINEVALIDITA, utenteModifica, 
                      datamodifica, CONVERT(varchar(1000), DiscountXML)
    FROM         Mytho_GetRowsTablet(@Progressivi_GestionePrezzi_classificati,1)
    
    --Delete Record ---------------------------------------------------------------------------------------------

    DELETE [MYTHO_PRODUCTS_PRICE_DISCOUNT] FROM  [MYTHO_PRODUCTS_PRICE_DISCOUNT] MPR Inner JOIN ANAGRAFICAARTICOLICOMM ART ON ART.CODICEART  = MPR.CODART WHERE ART.EXPORTECOMMERCE = 1 AND ART.ESERCIZIO = YEAR(GETDATE())





RETURN
END




GO
GRANT EXECUTE
    ON OBJECT::[dbo].[Mytho_ProcCalcolaPrezzi] TO [Metodo98]
    AS [dbo];

