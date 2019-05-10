
Create View [dbo].[EC_ViewMovimentiEC]
AS
    /*Non Riconciliati*/
    SELECT
         (M_EC.Progressivo + ROW_NUMBER() OVER (Partition By M_EC.Progressivo Order By ECF.[CodBanca],ECF.[CodFlusso])) As Progressivo
        ,0 AS RifMovimento
        ,ECF.[CodBanca]
        ,ECF.[CodFlusso]
        ,ECF.[ABIBanca]
        ,ECF.[ContoCorrente]
        ,ISNULL(NULLIF(ECF.[CliForGen],''),P_EC.[CodContoDef]) AS CliForGen
        ,ECF.[DataOpBanca]
        ,ECF.[DataValuta]
        ,ECF.[Importo]
        ,ECF.[Segno]
        ,ECF.[CausaleABI]
        ,ECF.[NrAssegno]
        ,ECF.[RowKey]
        ,0 As Stato
        ,0 As [Riconciliato]
        ,1 As [Type]
    FROM
    (
        SELECT
             ECF.Progressivo
            ,ROW_NUMBER() OVER (Partition By BINARY_CHECKSUM(ECF.[CodBanca],ECF.[CodFlusso],ECF.[ABIBanca],ECF.[ContoCorrente],ECF.[DataOpBanca],ECF.[DataValuta],ECF.[Importo],ECF.[Segno],ECF.[CausaleABI],ECF.[NrAssegno]) Order By ECF.[CodBanca],ECF.[CodFlusso]) As JoinKey
            ,ECF.[CodBanca]
            ,ECF.[CodFlusso]
            ,ECF.[ABIBanca]
            ,ECF.[ContoCorrente]
            ,ECF.[CliForGen]
            ,ECF.[DataOpBanca]
            ,ECF.[DataValuta]
            ,ECF.[Importo]
            ,ECF.[Segno]
            ,ECF.[CausaleABI]
            ,ECF.[NrAssegno]
            ,BINARY_CHECKSUM(ECF.[CodBanca],ECF.[CodFlusso],ECF.[ABIBanca],ECF.[ContoCorrente],ECF.[DataOpBanca],ECF.[DataValuta],ECF.[Importo],ECF.[Segno],ECF.[CausaleABI],ECF.[NrAssegno]) As RowKey
        FROM
            [dbo].[EC_EstrattoContoFile] ECF
    ) ECF
    Left Join
    (
        SELECT
             EC.Progressivo
            ,ROW_NUMBER() OVER (Partition By EC.[RowKey] Order By EC.[CodBanca],EC.[CodFlusso]) As JoinKey
            ,EC.[CodBanca]
            ,EC.[CodFlusso]
            ,EC.[ABIBanca]
            ,EC.[ContoCorrente]
            ,EC.[CliForGen]
            ,EC.[DataOpBanca]
            ,EC.[DataValuta]
            ,EC.[Importo]
            ,EC.[Segno]
            ,EC.[CausaleABI]
            ,EC.[NrAssegno]
            ,EC.[RowKey]
        FROM
            [dbo].[EC_EstrattoConto] EC
    ) EC
    ON
            EC.JoinKey = ECF.JoinKey
        And EC.RowKey = ECF.RowKey
    CROSS JOIN
        (SELECT ISNUll(MAX(Progressivo),0) As Progressivo FROM [dbo].[EC_EstrattoConto]) M_EC
    CROSS JOIN
        (SELECT CodContoDef FROM EC_Parametri WHERE Progressivo = 1) P_EC
    WHERE
        EC.Progressivo IS NULL
    UNION /*Riconciliati*/
    SELECT DISTINCT
         EC.Progressivo
        ,MV.Progressivo
        ,EC.[CodBanca]
        ,EC.[CodFlusso]
        ,EC.[ABIBanca]
        ,EC.[ContoCorrente]
        ,ISNULL(NULLIF(EC.[CliForGen],''),P_EC.[CodContoDef]) AS CliForGen
        ,EC.[DataOpBanca]
        ,EC.[DataValuta]
        ,EC.[Importo]
        ,EC.[Segno]
        ,EC.[CausaleABI]
        ,EC.[NrAssegno]
        ,EC.[RowKey]
        ,EC.[Stato]
        ,(CASE WHEN EC.[Stato] = 1 OR EC.[Stato] = 2 THEN 1 ELSE 0 END) AS Riconciliato
        ,0 As [Type]
    FROM
        [dbo].[EC_EstrattoConto] EC
    INNER JOIN
        [dbo].[EC_MovimentiEcPn] MV
    ON
        MV.RifProgressivoEC = EC.Progressivo
    CROSS JOIN
        (SELECT CodContoDef FROM EC_Parametri WHERE Progressivo = 1) P_EC

GO
GRANT SELECT
    ON OBJECT::[dbo].[EC_ViewMovimentiEC] TO [Metodo98]
    AS [dbo];

