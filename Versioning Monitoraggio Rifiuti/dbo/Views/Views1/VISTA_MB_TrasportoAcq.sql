

CREATE VIEW [dbo].[VISTA_MB_TrasportoAcq]
AS

Select
    TraspAcq.CODART,
    TraspAcq.NRRIFPARTITA,
    TraspAcq.CODDEPOSITO,
    TraspAcq.ValoreQta,
    TraspAcq.UmQta,
    AUmP.UM As UmQtaConv1,
    (TraspAcq.ValoreQta / AFC.FATTORE) As ValoreQtaConv1
From
(
    Select
        C.CODART,
        C.NRRIFPARTITA,
        C.CODDEPOSITO,
        C.COSTOMEDIOPEZZOXKG AS ValoreQta,
        P.UMTOTALEQTA As UmQta
    from
        TP_TRASPORTOCOSTOACQARTICOLI C,
        TP_TRASPORTOPARAMETRIACQ P
) TraspAcq
Cross Join
    MB_PARAMETRI M
Inner Join
    ARTICOLIUMPREFERITE AUmP
On
    AUmP.CODART = TraspAcq.CODART And
    AUmP.TIPOUM = M.TIPOUM1
left Join
    ARTICOLIFATTORICONVERSIONE AFC
On
    AFC.CODART = TraspAcq.CODART And
    AFC.UM1 = TraspAcq.UmQta And
    AFC.UM2 = AUmP.UM
Where
    AFC.FATTORE > 0



GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTA_MB_TrasportoAcq] TO [Metodo98]
    AS [dbo];

