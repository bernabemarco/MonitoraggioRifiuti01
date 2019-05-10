

CREATE VIEW CommCli_Consunt_LAVINTDOC_Strutturato as
SELECT 
        VB.RIFCOMMCLI,
        VB.TIPOASSEGNAZIONE,
        IsNull(VB.CODNODO_DEST,   'TT') CODNODO_DEST,         
        IsNull(VB.CODLIVELLO_DEST,'TT') CODLIVELLO_DEST,
        IsNull(VB.TIPONODO,1) as TIPONODO_DEST,
        VB.LIVPADRE_DEST,
        IsNull(VB.PERCRIPARTIZIONE,100) AS PRC_DEST,
        IsNull(VB.nrrigastrutt_dest,1) AS nrrigastrutt_dest,
        IsNull(VB.nrrigastruttpadre_dest,1) AS nrrigastruttpadre_dest,
        VB.DESCRIZIONE as DESCRIZIONE_DEST,
        (VR.COSTOTOTLAV*IsNull(VB.PERCRIPARTIZIONE,100)/100) COSTOTOTRIP,
        (VR.COSTOTOTLAVeuro*IsNull(VB.PERCRIPARTIZIONE,100)/100) COSTOTOTRIPeuro,
        VR.*
FROM 
        CCBilancioConsLavINTDOC VR  
        LEFT OUTER JOIN VistaAssegnazioniConsComm VB ON (VR.IDTESTADOC = VB.IDTESTA) AND 
                                                        (VR.IDRIGADOC = VB.IDRIGA) AND 
                                                        (VR.ORIGINEEVENTO = VB.ORIGINEEVENTO) AND 
                                                        (VR.idcommcli = VB.idcommcli)
        
WHERE
        VR.TIPOREC IN ('X1','X2','PM') 

GO
GRANT SELECT
    ON OBJECT::[dbo].[CommCli_Consunt_LAVINTDOC_Strutturato] TO [Metodo98]
    AS [dbo];

