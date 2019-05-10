create view ADIUTO_VistaDocumentale_FeB2BAttive
as
SELECT     Adiuto_FeAttive.F1001, Adiuto_FeAttive.F1076 AS Azienda, Adiuto_FeAttive.F1060 AS PIvaAzienda, Adiuto_FeAttive.F1058, Adiuto_FeAttive.F1059 AS ProgressivoInvio, 
                      Adiuto_FeAttive.F1004 AS esercizio, Adiuto_FeAttive.F1005 AS NaturaDoc, Adiuto_FeAttive.F1084 AS TipologiaFattura, Adiuto_FeAttive.F1083 AS nrDoc, 
                      Adiuto_FeAttive.F1007 AS DtDoc, Adiuto_FeAttive.F1011 AS Destinatario, 
					  Adiuto_FeAttive.F1063 as StatoB2B,
					  Adiuto_FeAttive.F1012, Adiuto_FeAttive.F1013, Adiuto_FeAttive.F1014, Adiuto_FeAttive.F1015, 
                      Adiuto_FeAttive.F1016, Adiuto_FeAttive.F1017, Adiuto_FeAttive.F1018, Adiuto_FeAttive.F1019, Adiuto_FeAttive.F1020, Adiuto_FeAttive.F1021, Adiuto_FeAttive.F1022, 
                      Adiuto_FeAttive.F1023, Adiuto_FeAttive.F1024, Adiuto_FeAttive.F1025, Adiuto_FeAttive.F1033, Adiuto_FeAttive.F1034, Adiuto_FeAttive.F1035, Adiuto_FeAttive.F1036, 
                      Adiuto_FeAttive.F1037, Adiuto_FeAttive.F1061 AS DtInoltroSDI, Adiuto_FeAttive.F1062,  Adiuto_FeAttive.F1064, Adiuto_FeAttive.F1065, 
                      Adiuto_FeAttive.F1066, Adiuto_FeAttive.F1067, Adiuto_FeAttive.F1068, Adiuto_FeAttive.F1081, Adiuto_FeAttive.F1082
FROM         SICURA_DataDB..A1063 AS Adiuto_FeAttive INNER JOIN
                      SICURA_DataDB..TDOC ON Adiuto_FeAttive.FIDD = TDOC.FIDD
WHERE     (TDOC.FENA = - 1)

GO
GRANT SELECT
    ON OBJECT::[dbo].[ADIUTO_VistaDocumentale_FeB2BAttive] TO [Metodo98]
    AS [dbo];

