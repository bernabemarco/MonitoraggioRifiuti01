

Create View [dbo].[EC_ViewMovimentiPN]
AS

select 
    M.PROGRESSIVO,
    M.RifRiga,
    M.RifScad,
    M.DESCRIZIONE,
    M.CODBANCA,
    M.ContoCorrente,
    M.CliForGen,
    M.ABI,
    M.CAB,
    M.DATAREG,
    M.CodCausale,
    M.CODCAUSABIEC,
    M.SEGNO,
    M.IMPORTO,
    M.Stato,
    M.ExistsScad,
    M.Riconciliato,
    M.IsNew,
    M.RifMovimento
from
(
    /*
        Creo una riga di intestazione con Progressivo del movimento e numero riga = 0.
        Ne creo una per ogni banca all'interno delle righe\scadenze per far funzionare il
        raggruppamento nelle scadenze.
    */
    select Distinct
        TC.PROGRESSIVO,
        0 AS RifRiga,
        0 AS RifScad,
        TC.DESCRIZIONE,
        ISNULL(ISNULL(AB_M.CODBANCA,AB_S.CODBANCA),'') As CODBANCA,
        '' AS ContoCorrente,
        '' As CliForGen,
        '00000' AS ABI,
        '00000' AS CAB,
        TC.DATAREG,
        TC.CAUSALE As CodCausale,
        '' As CODCAUSABIEC,
        '' As SEGNO,
        SUM(RC.IMPORTOEURO) OVER(PARTITION BY TC.PROGRESSIVO,RC.SEGNO) AS IMPORTO,
        ISNULL(TC.FLGMOVRICONCILIATOEC,0) AS Stato,
        0 AS ExistsScad,
        (CASE WHEN TC.FLGMOVRICONCILIATOEC = 1 OR TC.FLGMOVRICONCILIATOEC = 2 THEN 1 ELSE 0 END) AS Riconciliato,
        (CASE WHEN TC.FLGMOVRICONCILIATOEC = 1 OR TC.FLGMOVRICONCILIATOEC = 2 THEN 0 ELSE 1 END) AS IsNew,
        0 As RifMovimento
    from 
        TESTECONTABILITA TC
    inner join
        RIGHECONTABILITA RC
    on
        RC.NRREG = TC.PROGRESSIVO
    left join
        TABSCADENZE TS
    on
        TS.NRREGESITO = RC.NRREG
        and ts.RIFRIGACONT = rc.NRRIGA
    left join
        ANAGRAFICABANCHE AB_M
    on
        AB_M.CODCONTORIF = RC.CONTO
    left join
        ANAGRAFICABANCHE AB_S
    on
        AB_S.CODBANCA = TS.BANCAINC
    UNION
    select 
        TC.PROGRESSIVO,
        RC.NRRIGA AS RifRiga,
        ISNULL(TS.PROGRESSIVO,0) AS RifScad,
        RC.DESCRIZIONE AS Descrizione,
        ISNULL(AB_M.CODBANCA,AB_S.CODBANCA) As CODBANCA,
        ISNULL(AB_M.ContoCorrente,AB_S.ContoCorrente) As ContoCorrente,
        RC.CONTO As CliForGen,
        ISNULL((CASE WHEN LEN(AB_M.ABI) = 6 THEN RIGHT(AB_M.ABI,LEN(AB_M.ABI) -1) ELSE AB_M.ABI END),(CASE WHEN LEN(AB_S.ABI) = 6 THEN RIGHT(AB_S.ABI,LEN(AB_S.ABI) -1) ELSE AB_S.ABI END)) As ABI,
        ISNULL(AB_M.CAB,AB_S.CAB) AS CAB,
        TC.DATAREG,
        TC.CAUSALE As CodCausale,
        ISNULL(CC.CODCAUSABIEC,'') As CODCAUSABIEC,
        RC.SEGNO,
        RC.IMPORTOEURO AS IMPORTO,
        ISNULL(TC.FLGMOVRICONCILIATOEC,0) AS Stato,
        (CASE WHEN TS.PROGRESSIVO IS NULL THEN 0 ELSE 1 END) AS ExistsScad,
        (CASE WHEN TC.FLGMOVRICONCILIATOEC = 1 OR TC.FLGMOVRICONCILIATOEC = 2 THEN 1 ELSE 0 END) AS Riconciliato,
        (CASE WHEN TC.FLGMOVRICONCILIATOEC = 1 OR TC.FLGMOVRICONCILIATOEC = 2 THEN 0 ELSE 1 END) AS IsNew,
        ISNULL(ECMEP.Progressivo,0) As RifMovimento
    from 
        TESTECONTABILITA TC
    inner join
        RIGHECONTABILITA RC
    on
        RC.NRREG = TC.PROGRESSIVO
    left join
        TABSCADENZE TS
    on
        TS.NRREGESITO = RC.NRREG
        and ts.RIFRIGACONT = rc.NRRIGA
    inner join
        CAUSALICONTABILI CC
    on
        CC.CODICECAUSALE = TC.CAUSALE
    left join
        ANAGRAFICABANCHE AB_M
    on
        AB_M.CODCONTORIF = RC.CONTO
    left join
        ANAGRAFICABANCHE AB_S
    on
        AB_S.CODBANCA = TS.BANCAINC
    left join
        EC_MovimentiEcPn ECMEP
    on
        ECMEP.RifProgressivoPN = TC.PROGRESSIVO
    /*
    where 
            (AB_M.CODBANCA IS NOT NULL or AB_S.CODBANCA IS NOT NULL)
        --AND CC.GESTRICONEC = 1 /*Vedi NOTA di BIRTI*/
    */
) As M
INNER JOIN /*Un movimento per poter essere preso in considerazione deve avere almeno una riga con una banca, anche se � la banca di incasso della scadenza.*/
    (
        Select Distinct
            TC.Progressivo
        from 
            TESTECONTABILITA TC
        inner join
            RIGHECONTABILITA RC
        on
            RC.NRREG = TC.PROGRESSIVO
        left join
            TABSCADENZE TS
        on
            TS.NRREGESITO = RC.NRREG
            and ts.RIFRIGACONT = rc.NRRIGA
        left join
            ANAGRAFICABANCHE AB_M
        on
            AB_M.CODCONTORIF = RC.CONTO
        left join
            ANAGRAFICABANCHE AB_S
        on
            AB_S.CODBANCA = TS.BANCAINC
        Where
                (AB_M.CODBANCA IS NOT NULL or AB_S.CODBANCA IS NOT NULL)
    ) F
ON
    F.PROGRESSIVO = M.PROGRESSIVO


GO
GRANT SELECT
    ON OBJECT::[dbo].[EC_ViewMovimentiPN] TO [Metodo98]
    AS [dbo];

