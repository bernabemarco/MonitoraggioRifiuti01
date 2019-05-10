

CREATE PROCEDURE [dbo].[Proc_PreparaGraficoOF](@CodArticolo as Varchar(50),
                                                @CodDeposito as Varchar(10),
                                                 @Previsione as Varchar(2))

AS

BEGIN

    IF (@Previsione = 'MQ' OR @Previsione = 'WT')
    BEGIN
        SELECT PM.[CodArticolo],PM.[CodDeposito],'PREVISIONE' AS TIPO
            ,SPS.[35] AS [-35],SPS.[34] AS [-34],SPS.[33] AS [-33],SPS.[32] AS [-32],SPS.[31] AS [-31],SPS.[30] AS [-30]
            ,SPS.[29] AS [-29],SPS.[28] AS [-28],SPS.[27] AS [-27],SPS.[26] AS [-26],SPS.[25] AS [-25],SPS.[24] AS [-24],SPS.[23] AS [-23],SPS.[22] AS [-22],SPS.[21] AS [-21],SPS.[20] AS [-20]
            ,SPS.[19] AS [-19],SPS.[18] AS [-18],SPS.[17] AS [-17],SPS.[16] AS [-16],SPS.[15] AS [-15],SPS.[14] AS [-14],SPS.[13] AS [-13],SPS.[12] AS [-12],SPS.[11] AS [-11],SPS.[10] AS [-10]
            ,SPS.[9] AS [-9],SPS.[8] AS [-8],SPS.[7] AS [-7],SPS.[6] AS [-6],SPS.[5] AS [-5],SPS.[4] AS [-4],SPS.[3] AS [-3],SPS.[2] AS [-2],SPS.[1] AS [-1],PM.[1] AS [0]
            ,PM.[2] AS [1],PM.[3] AS [2],PM.[4] AS [3],PM.[5] AS [4],PM.[6] AS [5],PM.[7] AS [6],PM.[8] AS [7],PM.[9] AS [8],PM.[10] AS [9],PM.[11] AS [10],PM.[12] AS [11],0 AS [12]
        FROM TP_STAGIONALE_PREVISIONI PM
        INNER JOIN TP_STAGIONALE_PREVISIONI_STORICO SPS ON SPS.CodArticolo = PM.CodArticolo AND SPS.CodDeposito = PM.CodDeposito AND SPS.Tipo = PM.Tipo
        INNER JOIN TP_ExtraMag X ON X.CodArt = SPS.CodArticolo
        WHERE PM.Tipo = @Previsione AND PM.[CodArticolo] = @CodArticolo AND PM.[CodDeposito] = @CodDeposito
        UNION
        SELECT SV.CodArticolo,SV.CodDeposito,'VENDUTO' AS TIPO
            ,SV.[36] AS [-35],SV.[35] AS [-34],SV.[34] AS [-33],SV.[33] AS [-32],SV.[32] AS [-31],SV.[31] AS [-30]
            ,SV.[30] AS [-29],SV.[29] AS [-28],SV.[28] AS [-27],SV.[27] AS [-26],SV.[26] AS [-25],SV.[25] AS [-24],SV.[24] AS [-23],SV.[23] AS [-22],SV.[22] AS [-21],SV.[21] AS [-20]
            ,SV.[20] AS [-19],SV.[19] AS [-18],SV.[18] AS [-17],SV.[17] AS [-16],SV.[16] AS [-15],SV.[15] AS [-14],SV.[14] AS [-13],SV.[13] AS [-12],SV.[12] AS [-11],SV.[11] AS [-10]
            ,SV.[10] AS [-9],SV.[9] AS [-8],SV.[8] AS [-7],SV.[7] AS [-6],SV.[6] AS [-5],SV.[5] AS [-4],SV.[4] AS [-3],SV.[3] AS [-2],SV.[2] AS [-1],SV.[1] AS [0]
            ,0 AS [1],0 AS [2],0 AS [3],0 AS [4],0 AS [5],0 AS [6],0 AS [7],0 AS [8],0 AS [9],0 AS [10],0 AS [11],0 AS [12]
        FROM TP_STAGIONALE_VENDUTO SV
        WHERE SV.[CodArticolo] = @CodArticolo AND SV.[CodDeposito] = @CodDeposito
        UNION
        SELECT SA.CodArticolo,SA.CodDeposito,'ACQUISTATO' AS TIPO
            ,SA.[36] AS [-35],SA.[35] AS [-34],SA.[34] AS [-33],SA.[33] AS [-32],SA.[32] AS [-31],SA.[31] AS [-30]
            ,SA.[30] AS [-29],SA.[29] AS [-28],SA.[28] AS [-27],SA.[27] AS [-26],SA.[26] AS [-25],SA.[25] AS [-24],SA.[24] AS [-23],SA.[23] AS [-22],SA.[22] AS [-21],SA.[21] AS [-20]
            ,SA.[20] AS [-19],SA.[19] AS [-18],SA.[18] AS [-17],SA.[17] AS [-16],SA.[16] AS [-15],SA.[15] AS [-14],SA.[14] AS [-13],SA.[13] AS [-12],SA.[12] AS [-11],SA.[11] AS [-10]
            ,SA.[10] AS [-9],SA.[9] AS [-8],SA.[8] AS [-7],SA.[7] AS [-6],SA.[6] AS [-5],SA.[5] AS [-4],SA.[4] AS [-3],SA.[3] AS [-2],SA.[2] AS [-1],SA.[1] AS [0]
            ,0 AS [1],0 AS [2],0 AS [3],0 AS [4],0 AS [5],0 AS [6],0 AS [7],0 AS [8],0 AS [9],0 AS [10],0 AS [11],0 AS [12] 
        FROM TP_STAGIONALE_ACQUISTATO SA
        WHERE SA.[CodArticolo] = @CodArticolo AND SA.[CodDeposito] = @CodDeposito
        UNION
        SELECT SVM.CodArticolo,SVM.CodDeposito,'MEDIA' AS TIPO
            ,SVM.[36] AS [-35],SVM.[35] AS [-34],SVM.[34] AS [-33],SVM.[33] AS [-32],SVM.[32] AS [-31],SVM.[31] AS [-30]
            ,SVM.[30] AS [-29],SVM.[29] AS [-28],SVM.[28] AS [-27],SVM.[27] AS [-26],SVM.[26] AS [-25],SVM.[25] AS [-24],SVM.[24] AS [-23],SVM.[23] AS [-22],SVM.[22] AS [-21],SVM.[21] AS [-20]
            ,SVM.[20] AS [-19],SVM.[19] AS [-18],SVM.[18] AS [-17],SVM.[17] AS [-16],SVM.[16] AS [-15],SVM.[15] AS [-14],SVM.[14] AS [-13],SVM.[13] AS [-12],SVM.[12] AS [-11],SVM.[11] AS [-10]
            ,SVM.[10] AS [-9],SVM.[9] AS [-8],SVM.[8] AS [-7],SVM.[7] AS [-6],SVM.[6] AS [-5],SVM.[5] AS [-4],SVM.[4] AS [-3],SVM.[3] AS [-2],SVM.[2] AS [-1],SVM.[1] AS [0]
            ,0 AS [1],0 AS [2],0 AS [3],0 AS [4],0 AS [5],0 AS [6],0 AS [7],0 AS [8],0 AS [9],0 AS [10],0 AS [11],0 AS [12]
        FROM TP_STAGIONALE_VENDUTO_MEDIA SVM
        WHERE SVM.[CodArticolo] = @CodArticolo AND SVM.[CodDeposito] = @CodDeposito
        UNION
        SELECT TS.CodArticolo,TS.CodDeposito,'TRACKINGSIGNAL' AS TIPO
            ,TS.[-35],TS.[-34],TS.[-33],TS.[-32],TS.[-31],TS.[-30]
            ,TS.[-29],TS.[-28],TS.[-27],TS.[-26],TS.[-25],TS.[-24],TS.[-23],TS.[-22],TS.[-21],TS.[-20]
            ,TS.[-19],TS.[-18],TS.[-17],TS.[-16],TS.[-15],TS.[-14],TS.[-13],TS.[-12],TS.[-11],TS.[-10]
            ,TS.[-9],TS.[-8],TS.[-7],TS.[-6],TS.[-5],TS.[-4],TS.[-3],TS.[-2],TS.[-1],0 AS [0]
            ,0 AS [1],0 AS [2],0 AS [3],0 AS [4],0 AS [5],0 AS [6],0 AS [7],0 AS [8],0 AS [9],0 AS [10],0 AS [11],0 AS [12]
        FROM TP_VISTA_PERIODI_TRACKINGSIGNAL TS
        WHERE TS.Tipo = @Previsione AND TS.[CodArticolo] = @CodArticolo AND TS.[CodDeposito] = @CodDeposito
    END
    ELSE
    BEGIN
        SELECT PM.[CodArticolo],PM.[CodDeposito],'PREVISIONE' AS TIPO
            ,SPS.[35] AS [-35],SPS.[34] AS [-34],SPS.[33] AS [-33],SPS.[32] AS [-32],SPS.[31] AS [-31],SPS.[30] AS [-30]
            ,SPS.[29] AS [-29],SPS.[28] AS [-28],SPS.[27] AS [-27],SPS.[26] AS [-26],SPS.[25] AS [-25],SPS.[24] AS [-24],SPS.[23] AS [-23],SPS.[22] AS [-22],SPS.[21] AS [-21],SPS.[20] AS [-20]
            ,SPS.[19] AS [-19],SPS.[18] AS [-18],SPS.[17] AS [-17],SPS.[16] AS [-16],SPS.[15] AS [-15],SPS.[14] AS [-14],SPS.[13] AS [-13],SPS.[12] AS [-12],SPS.[11] AS [-11],SPS.[10] AS [-10]
            ,SPS.[9] AS [-9],SPS.[8] AS [-8],SPS.[7] AS [-7],SPS.[6] AS [-6],SPS.[5] AS [-5],SPS.[4] AS [-4],SPS.[3] AS [-3],SPS.[2] AS [-2],SPS.[1] AS [-1],PM.[1] AS [0]
            ,PM.[2] AS [1],PM.[3] AS [2],PM.[4] AS [3],PM.[5] AS [4],PM.[6] AS [5],PM.[7] AS [6],PM.[8] AS [7],PM.[9] AS [8],PM.[10] AS [9],PM.[11] AS [10],PM.[12] AS [11],0 AS [12]
        FROM TP_STAGIONALE_PREVISIONI PM
        INNER JOIN TP_STAGIONALE_PREVISIONI_STORICO SPS ON SPS.CodArticolo = PM.CodArticolo AND SPS.CodDeposito = PM.CodDeposito AND SPS.Tipo = PM.Tipo
        INNER JOIN TP_ExtraMag X ON X.CodArt = SPS.CodArticolo
        WHERE PM.Tipo = @Previsione AND PM.[CodArticolo] = @CodArticolo AND PM.[CodDeposito] = @CodDeposito
        UNION
        SELECT PV.CodArticolo,PV.CodDeposito,'VENDUTO' AS TIPO
            ,PV.[36] AS [-35],PV.[35] AS [-34],PV.[34] AS [-33],PV.[33] AS [-32],PV.[32] AS [-31],PV.[31] AS [-30]
            ,PV.[30] AS [-29],PV.[29] AS [-28],PV.[28] AS [-27],PV.[27] AS [-26],PV.[26] AS [-25],PV.[25] AS [-24],PV.[24] AS [-23],PV.[23] AS [-22],PV.[22] AS [-21],PV.[21] AS [-20]
            ,PV.[20] AS [-19],PV.[19] AS [-18],PV.[18] AS [-17],PV.[17] AS [-16],PV.[16] AS [-15],PV.[15] AS [-14],PV.[14] AS [-13],PV.[13] AS [-12],PV.[12] AS [-11],PV.[11] AS [-10]
            ,PV.[10] AS [-9],PV.[9] AS [-8],PV.[8] AS [-7],PV.[7] AS [-6],PV.[6] AS [-5],PV.[5] AS [-4],PV.[4] AS [-3],PV.[3] AS [-2],PV.[2] AS [-1],PV.[1] AS [0]
            ,0 AS [1],0 AS [2],0 AS [3],0 AS [4],0 AS [5],0 AS [6],0 AS [7],0 AS [8],0 AS [9],0 AS [10],0 AS [11],0 AS [12]
        FROM TP_PERIODI_VENDUTO PV
        WHERE PV.[CodArticolo] = @CodArticolo AND PV.[CodDeposito] = @CodDeposito
        UNION
        SELECT PA.CodArticolo,PA.CodDeposito,'ACQUISTATO' AS TIPO
            ,PA.[36] AS [-35],PA.[35] AS [-34],PA.[34] AS [-33],PA.[33] AS [-32],PA.[32] AS [-31],PA.[31] AS [-30]
            ,PA.[30] AS [-29],PA.[29] AS [-28],PA.[28] AS [-27],PA.[27] AS [-26],PA.[26] AS [-25],PA.[25] AS [-24],PA.[24] AS [-23],PA.[23] AS [-22],PA.[22] AS [-21],PA.[21] AS [-20]
            ,PA.[20] AS [-19],PA.[19] AS [-18],PA.[18] AS [-17],PA.[17] AS [-16],PA.[16] AS [-15],PA.[15] AS [-14],PA.[14] AS [-13],PA.[13] AS [-12],PA.[12] AS [-11],PA.[11] AS [-10]
            ,PA.[10] AS [-9],PA.[9] AS [-8],PA.[8] AS [-7],PA.[7] AS [-6],PA.[6] AS [-5],PA.[5] AS [-4],PA.[4] AS [-3],PA.[3] AS [-2],PA.[2] AS [-1],PA.[1] AS [0]
            ,0 AS [1],0 AS [2],0 AS [3],0 AS [4],0 AS [5],0 AS [6],0 AS [7],0 AS [8],0 AS [9],0 AS [10],0 AS [11],0 AS [12] 
        FROM TP_PERIODI_ACQUISTATO PA
        WHERE PA.[CodArticolo] = @CodArticolo AND PA.[CodDeposito] = @CodDeposito
        UNION
        SELECT PVM.CodArticolo,PVM.CodDeposito,'MEDIA' AS TIPO
            ,[M_36] AS [-35],[M_35] AS [-34],[M_34] AS [-33],[M_33] AS [-32],[M_32] AS [-31],[M_31] AS [-30]
            ,[M_30] AS [-29],[M_29] AS [-28],[M_28] AS [-27],[M_27] AS [-26],[M_26] AS [-25],[M_25] AS [-24],[M_24] AS [-23],[M_23] AS [-22],[M_22] AS [-21],[M_21] AS [-20]
            ,[M_20] AS [-19],[M_19] AS [-18],[M_18] AS [-17],[M_17] AS [-16],[M_16] AS [-15],[M_15] AS [-14],[M_14] AS [-13],[M_13] AS [-12],[M_12] AS [-11],[M_11] AS [-10]
            ,[M_10] AS [-9],[M_9] AS [-8],[M_8] AS [-7],[M_7] AS [-6],[M_6] AS [-5],[M_5] AS [-4],[M_4] AS [-3],[M_3] AS [-2],[M_2] AS [-1],[M_1] AS [0]
            ,0 AS [1],0 AS [2],0 AS [3],0 AS [4],0 AS [5],0 AS [6],0 AS [7],0 AS [8],0 AS [9],0 AS [10],0 AS [11],0 AS [12] 
        FROM TP_PERIODI_VENDUTO PVM
        WHERE PVM.[CodArticolo] = @CodArticolo AND PVM.[CodDeposito] = @CodDeposito
        UNION
        SELECT TS.CodArticolo,TS.CodDeposito,'TRACKINGSIGNAL' AS TIPO
            ,TS.[-35],TS.[-34],TS.[-33],TS.[-32],TS.[-31],TS.[-30]
            ,TS.[-29],TS.[-28],TS.[-27],TS.[-26],TS.[-25],TS.[-24],TS.[-23],TS.[-22],TS.[-21],TS.[-20]
            ,TS.[-19],TS.[-18],TS.[-17],TS.[-16],TS.[-15],TS.[-14],TS.[-13],TS.[-12],TS.[-11],TS.[-10]
            ,TS.[-9],TS.[-8],TS.[-7],TS.[-6],TS.[-5],TS.[-4],TS.[-3],TS.[-2],TS.[-1],0 AS [0]
            ,0 AS [1],0 AS [2],0 AS [3],0 AS [4],0 AS [5],0 AS [6],0 AS [7],0 AS [8],0 AS [9],0 AS [10],0 AS [11],0 AS [12]
        FROM TP_VISTA_PERIODI_TRACKINGSIGNAL TS
        WHERE TS.Tipo = @Previsione AND TS.[CodArticolo] = @CodArticolo AND TS.[CodDeposito] = @CodDeposito
    END

    

END
    


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[Proc_PreparaGraficoOF] TO [Metodo98]
    AS [dbo];

