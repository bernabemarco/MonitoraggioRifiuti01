

CREATE VIEW CommCli_Consunt_COSTIDIRDOC_Strutturato AS
SELECT 
        VB.rifcommcli,
        VB.tipoassegnazione,
        IsNull(VB.CODNODO_DEST,   'TT') CODNODO_DEST,         
        IsNull(VB.CODLIVELLO_DEST,'TT') CODLIVELLO_DEST,
        IsNull(VB.tiponodo,1) AS tiponodo_dest,
        VB.LIVPADRE_DEST,
        IsNull(VB.percripartizione,100) AS prc_dest,
        IsNull(VB.nrrigastrutt_dest,1) AS nrrigastrutt_dest,
        IsNull(VB.nrrigastruttpadre_dest,1) AS nrrigastruttpadre_dest,
        VB.descrizione AS descrizione_dest,
        (VR.importo*IsNull(VB.percripartizione,100)/100) costototrip,
        (VR.importoeuro*IsNull(VB.percripartizione,100)/100) costototripeuro,
        VR.*
FROM 
        CCBilancioConsCostiDirDOC VR  
        LEFT OUTER JOIN VistaAssegnazioniConsComm VB ON VR.idtestadoc = VB.idtesta 
                                                    AND VR.idrigadoc = VB.idriga 
                                                    AND VR.origineevento = VB.origineevento 
                                                    AND VR.idcommcli = VB.idcommcli
WHERE
        VR.tiporec IN ('S2','S3','SM') 

GO
GRANT SELECT
    ON OBJECT::[dbo].[CommCli_Consunt_COSTIDIRDOC_Strutturato] TO [Metodo98]
    AS [dbo];

