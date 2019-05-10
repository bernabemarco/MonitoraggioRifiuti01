
CREATE PROCEDURE [dbo].[CPPX_ProcCalcolaPrezziAgenti]
--ENCRY--
AS

BEGIN


    ----forzo rebuild-------------------------------------

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
        ( SELECT  GI.CODAGENTE,
                BINARY_CHECKSUM(Cf.UsaPrzPrvPart,Cf.CodGruppoPrezziPart, cf.CodSettore ,Cf.CodZona ,cf.CodCategoria, replace(CF.Sconto1,' ',''),CF.ApplScontoRiga,CF.ApplScontoFinale,CF.Listino) AS IDGRUPPO,
                R.CODCONTO, 
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
                FROM dbo.TP_GIROVISITE_TESTA GI 
                    
                    INNER JOIN 
                        TP_GIROVISITE_RIGHE R ON GI.Progressivo = r.RIFProgressivo
                    INNER JOIN 
                        TP_TRASFAGENTI TRASF ON TRASF.CODAGENTE=GI.CODAGENTE
                    INNER JOIN
                    
                        TP_CONFIGESPORTAZ CONF  ON  Conf.Codice = GI.Codagente 
                    INNER join ANAGRAFICARISERVATICF CF ON R.CODCONTO = CF.CODCONTO 
            
                WHERE 
                CONF.TABELLEINESPORTAZIONE=7 AND TRASF.ATTIVO=1
                AND CF.ESERCIZIO = year(getdate())
                AND CF.STATOORDINI<2
        UNION
        SELECT   DISTINCT
                TRSFAG.CODAGENTE
                ,BINARY_CHECKSUM(CFESERCIZIO.UsaPrzPrvPart,CFESERCIZIO.CodGruppoPrezziPart, CFESERCIZIO.CodSettore ,CFESERCIZIO.CodZona ,CFESERCIZIO.CodCategoria, replace(CFESERCIZIO.Sconto1,' ',''),CFESERCIZIO.ApplScontoRiga,CFESERCIZIO.ApplScontoFinale,CFESERCIZIO.Listino) AS IDGRUPPO
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
        
                Where CFESERCIZIO.STATOORDINI<2 AND TRSFAG.ATTIVO=1 
                AND CFESERCIZIO.ESERCIZIO = year(getdate())  AND
                TRSFAG.CODAGENTE NOT IN (SELECT CODICE FROM TP_CONFIGESPORTAZ WHERE TABELLEINESPORTAZIONE='7')
        
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
             (CASE WHEN (IDGRUPPO < 0)
                           THEN REPLACE(CAST(dbo.F_NUMERIC_TO_BASE_N(IDGRUPPO,36) AS VARCHAR(15)),'-','�') 
                           ELSE '@' + CAST(dbo.F_NUMERIC_TO_BASE_N(IDGRUPPO,36) AS VARCHAR(15))
                           END) AS CODCLIFOR
    
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
    
    Delete from PREZZIPARTICOLARI_XML_COMPLETO
    FROM PREZZIPARTICOLARI_XML_COMPLETO PR
    INNER JOIN @Progressivi_GestionePrezzi DEL
    ON DEL.progressivoDel = PR.PROGRESSIVOREGOLA
    WHERE PR.TIPOPREZZO =0

    

    --Insert -----------------------------------
    
    INSERT INTO [PREZZIPARTICOLARI_XML_COMPLETO]
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
    FROM         Price.GetRowsTablet(@Progressivi_GestionePrezzi,0)
    
    
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
    
    Delete from PREZZIPARTICOLARI_XML_COMPLETO
    FROM PREZZIPARTICOLARI_XML_COMPLETO PR
    INNER JOIN @Progressivi_GestionePrezzi_classificati DEL
    ON DEL.progressivoDel = PR.PROGRESSIVOREGOLA
    WHERE PR.Tipoprezzo =1
    
    
    ---Insert ----------------------------------------------    
    INSERT INTO [PREZZIPARTICOLARI_XML_COMPLETO]
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
    FROM         Price.GetRowsTablet(@Progressivi_GestionePrezzi_classificati,1)
    

RETURN
END



GO
GRANT EXECUTE
    ON OBJECT::[dbo].[CPPX_ProcCalcolaPrezziAgenti] TO [Metodo98]
    AS [dbo];

