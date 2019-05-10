

CREATE PROCEDURE [dbo].[PROC_CREA_PREVISIONI_FUTURE_MEDIAMOBILE]
--ENCRY--
AS

BEGIN

SET NOCOUNT ON

    /*MEDIA MOBILE PONDERATA A 3 PERIODI*/
    /*3.1*/
    DELETE FROM TP_MEDIAMOBILE_TMP WHERE PERIODI = 3

    INSERT INTO [TP_MEDIAMOBILE_TMP]([CodArticolo],[CodDeposito],[Periodi],[1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],[UtenteModifica],[DataModifica])
    Select
        codart,
        coddeposito,
        3 as Periodi,
        "1",
        "2",
        "3",
        "4",
        "5",
        "6",
        "7",
        "8",
        "9",
        "10",
        "11",
        (("t1" + "t2" + "t3") / tot_per) As "12",
        User_Name(),
        GetDate()
    From
    (
        Select
            codart,
            coddeposito,
            "1",
            "2",
            "3",
            "4",
            "5",
            "6",
            "7",
            "8",
            "9",
            "10",
            (("t1" + "t2" + "t3") / tot_per) As "11",
            ((("t1" + "t2" + "t3") / tot_per) * 3) As "t3",
            ("10" * 2) as t2,
            ("9" * 1) as t1,
            tot_per,
            num_per
        From
        (
            Select
                codart,
                coddeposito,
                "1",
                "2",
                "3",
                "4",
                "5",
                "6",
                "7",
                "8",
                "9",
                (("t1" + "t2" + "t3") / tot_per) As "10",
                ((("t1" + "t2" + "t3") / tot_per) * 3) As "t3",
                ("9" * 2) as t2,
                ("8" * 1) as t1,
                tot_per,
                num_per
            From
            (
                Select
                    codart,
                    coddeposito,
                    "1",
                    "2",
                    "3",
                    "4",
                    "5",
                    "6",
                    "7",
                    "8",
                    (("t1" + "t2" + "t3") / tot_per) As "9",
                    ((("t1" + "t2" + "t3") / tot_per) * 3) As "t3",
                    ("8" * 2) as t2,
                    ("7" * 1) as t1,
                    tot_per,
                    num_per
                From
                (
                    Select
                        codart,
                        coddeposito,
                        "1",
                        "2",
                        "3",
                        "4",
                        "5",
                        "6",
                        "7",
                        (("t1" + "t2" + "t3") / tot_per) As "8",
                        ((("t1" + "t2" + "t3") / tot_per) * 3) As "t3",
                        ("7" * 2) as t2,
                        ("6" * 1) as t1,
                        tot_per,
                        num_per
                    From
                    (
                        Select
                            codart,
                            coddeposito,
                            "1",
                            "2",
                            "3",
                            "4",
                            "5",
                            "6",
                            (("t1" + "t2" + "t3") / tot_per) As "7",
                            ((("t1" + "t2" + "t3") / tot_per) * 3) As "t3",
                            ("6" * 2) as t2,
                            ("5" * 1) as t1,
                            tot_per,
                            num_per
                        From
                        (
                            Select
                                codart,
                                coddeposito,
                                "1",
                                "2",
                                "3",
                                "4",
                                "5",
                                (("t1" + "t2" + "t3") / tot_per) As "6",
                                ((("t1" + "t2" + "t3") / tot_per) * 3) As "t3",
                                ("5" * 2) as t2,
                                ("4" * 1) as t1,
                                tot_per,
                                num_per
                            From
                            (
                                Select
                                    codart,
                                    coddeposito,
                                    "1",
                                    "2",
                                    "3",
                                    "4",
                                    (("t1" + "t2" + "t3") / tot_per) As "5",
                                    ((("t1" + "t2" + "t3") / tot_per) * 3) As "t3",
                                    ("4" * 2) as t2,
                                    ("3" * 1) as t1,
                                    tot_per,
                                    num_per
                                From
                                (
                                    Select
                                        codart,
                                        coddeposito,
                                        "1",
                                        "2",
                                        "3",
                                        (("t1" + "t2" + "t3") / tot_per) As "4",
                                        ((("t1" + "t2" + "t3") / tot_per) * 3) As "t3",
                                        ("3" * 2) as t2,
                                        ("2" * 1) as t1,
                                        tot_per,
                                        num_per
                                    From
                                    (
                                        Select
                                            codart,
                                            coddeposito,
                                            "1",
                                            "2",
                                            (("t_1" + "t1" + "t2") / tot_per) As "3",
                                            ((("t_1" + "t1" + "t2") / tot_per) * 3) As "t3",
                                            ("2" * 2) as t2,
                                            ("1" * 1) as t1,
                                            tot_per,
                                            num_per
                                        From
                                        (
                                            Select
                                                codart,
                                                coddeposito,
                                                "1",
                                                (("t_1" + "t_2" + "t1") / tot_per) As "2",
                                                ((("t_1" + "t_2" + "t1") / tot_per) * 3) As "t2",
                                                ("1" * 2)t1,
                                                ("-1" * 1)t_1,
                                                tot_per,
                                                num_per
                                            From
                                            (
                                                Select
                                                    codart,
                                                    coddeposito,
                                                    "-1",
                                                    "-2",
                                                    (("t_1" + "t_2" + "t_3") / tot_per) As "1",
                                                    ((("t_1" + "t_2" + "t_3") / tot_per) * 3) As "t1",
                                                    ("-1" * 2) AS t_1,
                                                    ("-2" * 1) as t_2,
                                                    tot_per,
                                                    num_per
                                                From
                                                (
                                                    select
                                                        strm.codart,
                                                        strm.coddeposito,
                                                        sum(case when month(strm.datamov)= MONTH(dateadd(m, -1, getdate())) and year(strm.datamov)= year(dateadd(m, -1, getdate())) then strm.qta1um else 0 end) as "-1",
                                                        sum(case when month(strm.datamov)= MONTH(dateadd(m, -2, getdate())) and year(strm.datamov)= year(dateadd(m, -2, getdate())) then strm.qta1um else 0 end) as "-2",
                                                        sum(case when month(strm.datamov)= MONTH(dateadd(m, -1, getdate())) and year(strm.datamov)= year(dateadd(m, -1, getdate())) then strm.qta1um else 0 end) * 3 as "t_1",
                                                        sum(case when month(strm.datamov)= MONTH(dateadd(m, -2, getdate())) and year(strm.datamov)= year(dateadd(m, -2, getdate())) then strm.qta1um else 0 end) * 2 as "t_2",
                                                        sum(case when month(strm.datamov)= MONTH(dateadd(m, -3, getdate())) and year(strm.datamov)= year(dateadd(m, -3, getdate())) then strm.qta1um else 0 end) * 1 as "t_3",
                                                        (1 + 2 + 3) as tot_per,
                                                        3 as num_per
                                                    from 
                                                        storicomag strm
                                                    inner join
                                                        TP_ExtraMag x
                                                    on
                                                        x.CodArt = strm.CODART
                                                    where
                                                        x.ConsidAcq = 1 and 
                                                        strm.CodCausale In(Select Items from SplitCCVMCAU('VEN')) And
                                                        strm.TipoDoc In(Select Items from SplitCCVMDOC('VEN'))
                                                    group by 
                                                        strm.codart,
                                                        strm.coddeposito
                                                ) P1
                                            ) P2
                                        ) P3
                                    ) P4
                                ) P5
                            ) P6
                        ) P7
                    ) P8
                ) P9
            ) P10
        ) P11
    ) P12

    /*MEDIA MOBILE PONDERATA A 6 PERIODI*/
    /*6.1*/
    DELETE FROM TP_MEDIAMOBILE_TMP WHERE PERIODI = 6
    

    INSERT INTO [TP_MEDIAMOBILE_TMP]([CodArticolo],[CodDeposito],[Periodi],[1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],[UtenteModifica],[DataModifica])
    Select
        codart,
        coddeposito,
        6 as Periodi,
        "1",
        "2",
        "3",
        "4",
        "5",
        "6",
        "7",
        "8",
        "9",
        "10",
        "11",
        (("t1" + "t2" + "t3" + "t4" + "t5" + "t6") / tot_per) As "12",
        User_name(),
        GetDate()
    From
    (
        Select
            codart,
            coddeposito,
            "1",
            "2",
            "3",
            "4",
            "5",
            "6",
            "7",
            "8",
            "9",
            "10",
            (("t1" + "t2" + "t3" + "t4" + "t5" + "t6") / tot_per) As "11",
            ((("t1" + "t2" + "t3" + "t4" + "t5" + "t6") / tot_per) * 6) As "t6",
            ("10" * 5) AS t5,
            ("9" * 4) AS t4,
            ("8" * 3) AS t3,
            ("7" * 2) AS t2,
            ("6" * 1) AS t1,
            tot_per,
            num_per
        From
        (
            Select
                codart,
                coddeposito,
                "1",
                "2",
                "3",
                "4",
                "5",
                "6",
                "7",
                "8",
                "9",
                (("t1" + "t2" + "t3" + "t4" + "t5" + "t6") / tot_per) As "10",
                ((("t1" + "t2" + "t3" + "t4" + "t5" + "t6") / tot_per) * 6) As "t6",
                ("9" * 5) AS t5,
                ("8" * 4) AS t4,
                ("7" * 3) AS t3,
                ("6" * 2) AS t2,
                ("5" * 1) AS t1,
                tot_per,
                num_per
            From
            (
                Select
                    codart,
                    coddeposito,
                    "1",
                    "2",
                    "3",
                    "4",
                    "5",
                    "6",
                    "7",
                    "8",
                    (("t1" + "t2" + "t3" + "t4" + "t5" + "t6") / tot_per) As "9",
                    ((("t1" + "t2" + "t3" + "t4" + "t5" + "t6") / tot_per) * 6) As "t6",
                    ("8" * 5) AS t5,
                    ("7" * 4) AS t4,
                    ("6" * 3) AS t3,
                    ("5" * 2) AS t2,
                    ("4" * 1) AS t1,
                    tot_per,
                    num_per
                From
                (
                    Select
                        codart,
                        coddeposito,
                        "1",
                        "2",
                        "3",
                        "4",
                        "5",
                        "6",
                        "7",
                        (("t1" + "t2" + "t3" + "t4" + "t5" + "t6") / tot_per) As "8",
                        ((("t1" + "t2" + "t3" + "t4" + "t5" + "t6") / tot_per) * 6) As "t6",
                        ("7" * 5) AS t5,
                        ("6" * 4) AS t4,
                        ("5" * 3) AS t3,
                        ("4" * 2) AS t2,
                        ("3" * 1) AS t1,
                        tot_per,
                        num_per
                    From
                    (
                        Select
                            codart,
                            coddeposito,
                            "1",
                            "2",
                            "3",
                            "4",
                            "5",
                            "6",
                            (("t1" + "t2" + "t3" + "t4" + "t5" + "t6") / tot_per) As "7",
                            ((("t1" + "t2" + "t3" + "t4" + "t5" + "t6") / tot_per) * 6) As "t6",
                            ("6" * 5) AS t5,
                            ("5" * 4) AS t4,
                            ("4" * 3) AS t3,
                            ("3" * 2) AS t2,
                            ("2" * 1) AS t1,
                            tot_per,
                            num_per
                        From
                        (
                            Select
                                codart,
                                coddeposito,
                                "1",
                                "2",
                                "3",
                                "4",
                                "5",
                                (("t_1" + "t1" + "t2" + "t3" + "t4" + "t5") / tot_per) As "6",
                                ((("t_1" + "t1" + "t2" + "t3" + "t4" + "t5") / tot_per) * 6) As "t6",
                                ("5" * 5) AS t5,
                                ("4" * 4) AS t4,
                                ("3" * 3) AS t3,
                                ("2" * 2) AS t2,
                                ("1" * 1) AS t1,
                                tot_per,
                                num_per
                            From
                            (
                                Select                          
                                    codart,
                                    coddeposito,
                                    "-1",
                                    "1",
                                    "2",
                                    "3",
                                    "4",
                                    (("t_1" + "t_2" + "t1" + "t2" + "t3" + "t4") / tot_per) As "5",
                                    ((("t_1" + "t_2" + "t1" + "t2" + "t3" + "t4") / tot_per) * 6) As "t5",
                                    ("4" * 5) AS t4,
                                    ("3" * 4) AS t3,
                                    ("2" * 3) AS t2,
                                    ("1" * 2) AS t1,
                                    ("-1" * 1) AS t_1,
                                    tot_per,
                                    num_per
                                From
                                (
                                    Select
                                        codart,
                                        coddeposito,
                                        "-1",
                                        "-2",
                                        "1",
                                        "2",
                                        "3",
                                        (("t_1" + "t_2" + "t_3" + "t1" + "t2" + "t3") / tot_per) As "4",
                                        ((("t_1" + "t_2" + "t_3" + "t1" + "t2" + "t3") / tot_per) * 6) As "t4",
                                        ("3" * 5) AS t3,
                                        ("2" * 4) AS t2,
                                        ("1" * 3) AS t1,
                                        ("-1" * 2) AS t_1,
                                        ("-2" * 1) as t_2,
                                        tot_per,
                                        num_per
                                    From
                                    (
                                        Select
                                            codart,
                                            coddeposito,
                                            "-1",
                                            "-2",
                                            "-3",
                                            "1",
                                            "2",
                                            (("t_1" + "t_2" + "t_3" + "t_4" + "t1" + "t2") / tot_per) As "3",
                                            ((("t_1" + "t_2" + "t_3" + "t_4" + "t1" + "t2") / tot_per) * 6) As "t3",
                                            ("2" * 5) AS t2,
                                            ("1" * 4) AS t1,
                                            ("-1" * 3) AS t_1,
                                            ("-2" * 2) as t_2,
                                            ("-3" * 1) as t_3,
                                            tot_per,
                                            num_per
                                        From
                                        (
                                            Select
                                                codart,
                                                coddeposito,
                                                "-1",
                                                "-2",
                                                "-3",
                                                "-4",
                                                "1",
                                                (("t_1" + "t_2" + "t_3" + "t_4" + "t_5" + "t1") / tot_per) As "2",
                                                ((("t_1" + "t_2" + "t_3" + "t_4" + "t_5" + "t1") / tot_per) * 6) As "t2",
                                                ("1" * 5) AS t1,
                                                ("-1" * 4) AS t_1,
                                                ("-2" * 3) as t_2,
                                                ("-3" * 2) as t_3,
                                                ("-4" * 1) as t_4,
                                                tot_per,
                                                num_per
                                            From
                                            (
                                                Select
                                                    codart,
                                                    coddeposito,
                                                    "-1",
                                                    "-2",
                                                    "-3",
                                                    "-4",
                                                    "-5",
                                                    (("t_1" + "t_2" + "t_3" + "t_4" + "t_5" + "t_6") / tot_per) As "1",
                                                    ((("t_1" + "t_2" + "t_3" + "t_4" + "t_5" + "t_6") / tot_per) * 6) As "t1",
                                                    ("-1" * 5) AS t_1,
                                                    ("-2" * 4) as t_2,
                                                    ("-3" * 3) as t_3,
                                                    ("-4" * 2) as t_4,
                                                    ("-5" * 1) as t_5,
                                                    tot_per,
                                                    num_per
                                                From
                                                (
                                                    select
                                                        strm.codart,
                                                        strm.coddeposito,
                                                        sum(case when month(strm.datamov)= MONTH(dateadd(m, -1, getdate())) and year(strm.datamov)= year(dateadd(m, -1, getdate())) then strm.qta1um else 0 end) as "-1",
                                                        sum(case when month(strm.datamov)= MONTH(dateadd(m, -2, getdate())) and year(strm.datamov)= year(dateadd(m, -2, getdate())) then strm.qta1um else 0 end) as "-2",
                                                        sum(case when month(strm.datamov)= MONTH(dateadd(m, -3, getdate())) and year(strm.datamov)= year(dateadd(m, -3, getdate())) then strm.qta1um else 0 end) as "-3",
                                                        sum(case when month(strm.datamov)= MONTH(dateadd(m, -4, getdate())) and year(strm.datamov)= year(dateadd(m, -4, getdate())) then strm.qta1um else 0 end) as "-4",
                                                        sum(case when month(strm.datamov)= MONTH(dateadd(m, -5, getdate())) and year(strm.datamov)= year(dateadd(m, -5, getdate())) then strm.qta1um else 0 end) as "-5",
                                                        sum(case when month(strm.datamov)= MONTH(dateadd(m, -6, getdate())) and year(strm.datamov)= year(dateadd(m, -6, getdate())) then strm.qta1um else 0 end) as "-6",
                                                        sum(case when month(strm.datamov)= MONTH(dateadd(m, -1, getdate())) and year(strm.datamov)= year(dateadd(m, -1, getdate())) then strm.qta1um else 0 end) * 5 as "t_1",
                                                        sum(case when month(strm.datamov)= MONTH(dateadd(m, -2, getdate())) and year(strm.datamov)= year(dateadd(m, -2, getdate())) then strm.qta1um else 0 end) * 4 as "t_2",
                                                        sum(case when month(strm.datamov)= MONTH(dateadd(m, -3, getdate())) and year(strm.datamov)= year(dateadd(m, -3, getdate())) then strm.qta1um else 0 end) * 3 as "t_3",
                                                        sum(case when month(strm.datamov)= MONTH(dateadd(m, -4, getdate())) and year(strm.datamov)= year(dateadd(m, -4, getdate())) then strm.qta1um else 0 end) * 2 as "t_4",
                                                        sum(case when month(strm.datamov)= MONTH(dateadd(m, -5, getdate())) and year(strm.datamov)= year(dateadd(m, -5, getdate())) then strm.qta1um else 0 end) * 1 as "t_5",
                                                        sum(case when month(strm.datamov)= MONTH(dateadd(m, -6, getdate())) and year(strm.datamov)= year(dateadd(m, -6, getdate())) then strm.qta1um else 0 end) * 1 as "t_6",
                                                        (1 + 2 + 3 + 4 + 5 + 6) as tot_per,
                                                        6 as num_per
                                                    from 
                                                        storicomag strm
                                                    inner join
                                                        TP_ExtraMag x
                                                    on
                                                        x.CodArt = strm.CODART
                                                    where
                                                        x.ConsidAcq = 1 and 
                                                        strm.CodCausale In(Select Items from SplitCCVMCAU('VEN')) And
                                                        strm.TipoDoc In(Select Items from SplitCCVMDOC('VEN'))
                                                    group by 
                                                        strm.codart,
                                                        strm.coddeposito
                                                ) P1
                                            ) P2
                                        ) P3
                                    ) P4
                                ) P5
                            ) P6
                        ) P7
                    ) P8
                ) P9
            ) P10
        ) P11
    ) P12
    

    /*9.1*/
    DELETE FROM TP_MEDIAMOBILE_TMP WHERE PERIODI = 9
    

    INSERT INTO [TP_MEDIAMOBILE_TMP]([CodArticolo],[CodDeposito],[Periodi],[1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],[UtenteModifica],[DataModifica])
    Select
        codart,
        coddeposito,
        9 AS Periodi,
        "1",
        "2",
        "3",
        "4",
        "5",
        "6",
        "7",
        "8",
        (((("-1" * 1) + ("1" * 2) + ("2" * 3) + ("3" * 4) + ("4" * 5) + ("5" * 6) + ("6" * 7) + ("7" * 8) + ("8" * 9))) / 45) As "9",
        0,0,0,
        User_Name(),
        GetDate()
    From
    (
        Select
            codart,
            coddeposito,
            "-1",
            "1",
            "2",
            "3",
            "4",
            "5",
            "6",
            "7",
            (((("-2" * 1) + ("-1" * 2) + ("1" * 3) + ("2" * 4) + ("3" * 5) + ("4" * 6) + ("5" * 7) + ("6" * 8) + ("7" * 9))) / 45) As "8"
        From
        (
            Select
                codart,
                coddeposito,
                "-1",
                "-2",
                "1",
                "2",
                "3",
                "4",
                "5",
                "6",
                (((("-3" * 1) + ("-2" * 2) + ("-1" * 3) + ("1" * 4) + ("2" * 5) + ("3" * 6) + ("4" * 7) + ("5" * 8) + ("6" * 9))) / 45) As "7"
            From
            (
                Select                          
                    codart,
                    coddeposito,
                    "-1",
                    "-2",
                    "-3",
                    "1",
                    "2",
                    "3",
                    "4",
                    "5",
                    (((("-4" * 1) + ("-3" * 2) + ("-2" * 3) + ("-1" * 4) + ("1" * 5) + ("2" * 6) + ("3" * 7) + ("4" * 8) + ("5" * 9))) / 45) As "6"
                From
                (
                    Select
                        codart,
                        coddeposito,
                        "-1",
                        "-2",
                        "-3",
                        "-4",
                        "1",
                        "2",
                        "3",
                        "4",
                        (((("-5" * 1) + ("-4" * 2) + ("-3" * 3) + ("-2" * 4) + ("-1" * 5) + ("1" * 6) + ("2" * 7) + ("3" * 8)+ ("4" * 9))) / 45) As "5"
                    From
                    (
                        Select
                            codart,
                            coddeposito,
                            "-1",
                            "-2",
                            "-3",
                            "-4",
                            "-5",
                            "1",
                            "2",
                            "3",
                            (((("-6" * 1) + ("-5" * 2) + ("-4" * 3) + ("-3" * 4) + ("-2" * 5) + ("-1" * 6) + ("1" * 7) + ("2" * 8) + ("3" * 9))) / 45) As "4"
                        From
                        (
                            Select
                                codart,
                                coddeposito,
                                "-1",
                                "-2",
                                "-3",
                                "-4",
                                "-5",
                                "-6",
                                "1",
                                "2",
                                (((("-7" * 1) + ("-6" * 2) + ("-5" * 3) + ("-4" * 4) + ("-3" * 5) + ("-2" * 6) + ("-1" * 7) + ("1" * 8) + ("2" * 9))) / 45) As "3"
                            From
                            (
                                Select
                                    codart,
                                    coddeposito,
                                    "1",
                                    "-1",
                                    "-2",
                                    "-3",
                                    "-4",
                                    "-5",
                                    "-6",
                                    "-7",
                                    (((("-8" * 1) + ("-7" * 2) + ("-6" * 3) + ("-5" * 4) + ("-4" * 5) + ("-3" * 6) + ("-2" * 7) + ("-1" * 8) + ("1" * 9))) / 45) As "2"
                                From
                                (
                                    select
                                        codart,
                                        coddeposito,
                                        "-1",
                                        "-2",
                                        "-3",
                                        "-4",
                                        "-5",
                                        "-6",
                                        "-7",
                                        "-8",
                                        (((("-9" * 1) + ("-8" * 2) + ("-7" * 3) + ("-6" * 4) + ("-5" * 5) + ("-4" * 6) + ("-3" * 7) + ("-2" * 8) + ("-1" * 9))) / 45) As "1"
                                    from 
                                    (
                                        select
                                            strm.codart,
                                            strm.coddeposito,
                                            sum(case when month(strm.datamov)= MONTH(dateadd(m, -1, getdate())) and year(strm.datamov)= year(dateadd(m, -1, getdate())) then strm.qta1um else 0 end) as "-1",
                                            sum(case when month(strm.datamov)= MONTH(dateadd(m, -2, getdate())) and year(strm.datamov)= year(dateadd(m, -2, getdate())) then strm.qta1um else 0 end) as "-2",
                                            sum(case when month(strm.datamov)= MONTH(dateadd(m, -3, getdate())) and year(strm.datamov)= year(dateadd(m, -3, getdate())) then strm.qta1um else 0 end) as "-3",
                                            sum(case when month(strm.datamov)= MONTH(dateadd(m, -4, getdate())) and year(strm.datamov)= year(dateadd(m, -4, getdate())) then strm.qta1um else 0 end) as "-4",
                                            sum(case when month(strm.datamov)= MONTH(dateadd(m, -5, getdate())) and year(strm.datamov)= year(dateadd(m, -5, getdate())) then strm.qta1um else 0 end) as "-5",
                                            sum(case when month(strm.datamov)= MONTH(dateadd(m, -6, getdate())) and year(strm.datamov)= year(dateadd(m, -6, getdate())) then strm.qta1um else 0 end) as "-6",
                                            sum(case when month(strm.datamov)= MONTH(dateadd(m, -7, getdate())) and year(strm.datamov)= year(dateadd(m, -7, getdate())) then strm.qta1um else 0 end) as "-7",
                                            sum(case when month(strm.datamov)= MONTH(dateadd(m, -8, getdate())) and year(strm.datamov)= year(dateadd(m, -8, getdate())) then strm.qta1um else 0 end) as "-8",
                                            sum(case when month(strm.datamov)= MONTH(dateadd(m, -9, getdate())) and year(strm.datamov)= year(dateadd(m, -9, getdate())) then strm.qta1um else 0 end) as "-9"
                                        from 
                                            storicomag strm
                                        inner join
                                            TP_ExtraMag x
                                        on
                                            x.CodArt = strm.CODART
                                        where
                                            x.ConsidAcq = 1 and 
                                            strm.CodCausale In(Select Items from SplitCCVMCAU('VEN')) And
                                            strm.TipoDoc In(Select Items from SplitCCVMDOC('VEN')) 
                                        group by 
                                            strm.codart,
                                            strm.coddeposito
                                    ) P0
                                ) P1
                            ) P2
                        ) P3
                    ) P4
                ) P5
            ) P6
        ) P7
    ) P8

    /*9.2*/
    Update TP_MEDIAMOBILE_TMP
        Set 
            TP_MEDIAMOBILE_TMP.[1] = PREVISIONE.[1],
            TP_MEDIAMOBILE_TMP.[2] = PREVISIONE.[2],
            TP_MEDIAMOBILE_TMP.[3] = PREVISIONE.[3],
            TP_MEDIAMOBILE_TMP.[4] = PREVISIONE.[4],
            TP_MEDIAMOBILE_TMP.[5] = PREVISIONE.[5],
            TP_MEDIAMOBILE_TMP.[6] = PREVISIONE.[6],
            TP_MEDIAMOBILE_TMP.[7] = PREVISIONE.[7],
            TP_MEDIAMOBILE_TMP.[8] = PREVISIONE.[8],
            TP_MEDIAMOBILE_TMP.[9] = PREVISIONE.[9],
            TP_MEDIAMOBILE_TMP.[10] = PREVISIONE.[10],
            TP_MEDIAMOBILE_TMP.[11] = PREVISIONE.[11],
            TP_MEDIAMOBILE_TMP.[12] = PREVISIONE.[12]
    From
        TP_MEDIAMOBILE_TMP
    INNER JOIN
        (
            Select
                codart,
                coddeposito,
                periodi,
                "1",
                "2",
                "3",
                "4",
                "5",
                "6",
                "7",
                "8",
                "9",
                "10",
                "11",
                ((("3" * 9) + ("4" * 8) + ("5" * 7) + ("6" * 6) + ("7" * 5) + ("8" * 4) + ("9" * 3) + ("10" * 2) + ("11" * 1)) / 45) As "12"
            From
            (
                
                Select
                    codart,
                    coddeposito,
                    periodi,
                    "1",
                    "2",
                    "3",
                    "4",
                    "5",
                    "6",
                    "7",
                    "8",
                    "9",
                    "10",
                    ((("2" * 1) + ("3" * 2) + ("4" * 3) + ("5" * 4) + ("6" * 5) + ("7" * 6) + ("8" * 7) + ("9" * 8) + ("10" * 9)) / 45) As "11"
                From
                (
                    Select
                        codarticolo as codart,
                        coddeposito,
                        periodi,
                        "1",
                        "2",
                        "3",
                        "4",
                        "5",
                        "6",
                        "7",
                        "8",
                        "9",
                        (((("1" * 1) + ("2" * 2) + ("3" * 3) + ("4" * 4) + ("5" * 5) + ("6" * 6) + ("7" * 7) + ("8" * 8) + ("9" * 9))) / 45) As "10"
                    From
                        TP_MEDIAMOBILE_TMP WHERE Periodi = 9
                ) P10
            ) P11
        ) PREVISIONE
    ON
        PREVISIONE.CodArt = TP_MEDIAMOBILE_TMP.CodArticolo And
        PREVISIONE.CodDeposito = TP_MEDIAMOBILE_TMP.CodDeposito And
        PREVISIONE.Periodi = TP_MEDIAMOBILE_TMP.Periodi

    /*12.1*/
    DELETE FROM TP_MEDIAMOBILE_TMP WHERE PERIODI = 12
    

    INSERT INTO [TP_MEDIAMOBILE_TMP]([CodArticolo],[CodDeposito],[Periodi],[1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12],[UtenteModifica],[DataModifica])
    Select                          
        codart,
        coddeposito,
        12 as Periodi,
        "-1",
        "-2",
        "-3",
        "-4",
        "-5",
        "-6",
        "1",
        "2",
        "3",
        "4",
        "5",
        (((("-7" * 1) + ("-6" * 2) + ("-5" * 3) + ("-4" * 4) + ("-3" * 5) + ("-2" * 6) + ("-1" * 7) + ("1" * 8) + ("2" * 9) + ("3" * 10) + ("4" * 11) + ("5" * 12))) / 78) As "6",
        User_Name(),
        GetDate()
    From
    (
        Select
            codart,
            coddeposito,
            "-1",
            "-2",
            "-3",
            "-4",
            "-5",
            "-6",
            "-7",
            "1",
            "2",
            "3",
            "4",
            (((("-8" * 1) + ("-7" * 2) + ("-6" * 3) + ("-5" * 4) + ("-4" * 5) + ("-3" * 6) + ("-2" * 7) + ("-1" * 8) + ("1" * 9) + ("2" * 10) + ("3" * 11) + ("4" * 12))) / 78) As "5"
        From
        (
            Select
                codart,
                coddeposito,
                "-1",
                "-2",
                "-3",
                "-4",
                "-5",
                "-6",
                "-7",
                "-8",
                "1",
                "2",
                "3",
                (((("-9" * 1) + ("-8" * 2) + ("-7" * 3) + ("-6" * 4) + ("-5" * 5) + ("-4" * 6) + ("-3" * 7) + ("-2" * 8) + ("-1" * 9) + ("1" * 10) + ("2" * 11) + ("3" * 12))) / 78) As "4"
            From
            (
                Select
                    codart,
                    coddeposito,
                    "-1",
                    "-2",
                    "-3",
                    "-4",
                    "-5",
                    "-6",
                    "-7",
                    "-8",
                    "-9",
                    "1",
                    "2",
                    (((("-10" * 1) + ("-9" * 2) + ("-8" * 3) + ("-7" * 4) + ("-6" * 5) + ("-5" * 6) + ("-4" * 7) + ("-3" * 8) + ("-2" * 9) + ("-1" * 10) + ("1" * 11) + ("2" * 12))) / 78) As "3"
                From
                (
                    Select
                        codart,
                        coddeposito,
                        "-1",
                        "-2",
                        "-3",
                        "-4",
                        "-5",
                        "-6",
                        "-7",
                        "-8",
                        "-9",
                        "-10",
                        "1",
                        (((("-11" * 1) + ("-10" * 2) + ("-9" * 3) + ("-8" * 4) + ("-7" * 5) + ("-6" * 6) + ("-5" * 7) + ("-4" * 8) + ("-3" * 9) + ("-2" * 10) + ("-1" * 11) + ("1" * 12))) / 78) As "2"
                    From
                    (
                        select
                            codart,
                            coddeposito,
                            "-1",
                            "-2",
                            "-3",
                            "-4",
                            "-5",
                            "-6",
                            "-7",
                            "-8",
                            "-9",
                            "-10",
                            "-11",
                            (((("-12" * 1) + ("-11" * 2) + ("-10" * 3) + ("-9" * 4) + ("-8" * 5) + ("-7" * 6) + ("-6" * 7) + ("-5" * 8) + ("-4" * 9) + ("-3" * 10) + ("-2" * 11) + ("-1" * 12))) / 78) As "1"
                        from 
                        (
                            select
                                strm.codart,
                                strm.coddeposito,
                                sum(case when month(strm.datamov)= MONTH(dateadd(m, -1, getdate())) and year(strm.datamov)= year(dateadd(m, -1, getdate())) then strm.qta1um else 0 end) as "-1",
                                sum(case when month(strm.datamov)= MONTH(dateadd(m, -2, getdate())) and year(strm.datamov)= year(dateadd(m, -2, getdate())) then strm.qta1um else 0 end) as "-2",
                                sum(case when month(strm.datamov)= MONTH(dateadd(m, -3, getdate())) and year(strm.datamov)= year(dateadd(m, -3, getdate())) then strm.qta1um else 0 end) as "-3",
                                sum(case when month(strm.datamov)= MONTH(dateadd(m, -4, getdate())) and year(strm.datamov)= year(dateadd(m, -4, getdate())) then strm.qta1um else 0 end) as "-4",
                                sum(case when month(strm.datamov)= MONTH(dateadd(m, -5, getdate())) and year(strm.datamov)= year(dateadd(m, -5, getdate())) then strm.qta1um else 0 end) as "-5",
                                sum(case when month(strm.datamov)= MONTH(dateadd(m, -6, getdate())) and year(strm.datamov)= year(dateadd(m, -6, getdate())) then strm.qta1um else 0 end) as "-6",
                                sum(case when month(strm.datamov)= MONTH(dateadd(m, -7, getdate())) and year(strm.datamov)= year(dateadd(m, -7, getdate())) then strm.qta1um else 0 end) as "-7",
                                sum(case when month(strm.datamov)= MONTH(dateadd(m, -8, getdate())) and year(strm.datamov)= year(dateadd(m, -8, getdate())) then strm.qta1um else 0 end) as "-8",
                                sum(case when month(strm.datamov)= MONTH(dateadd(m, -9, getdate())) and year(strm.datamov)= year(dateadd(m, -9, getdate())) then strm.qta1um else 0 end) as "-9",
                                sum(case when month(strm.datamov)= MONTH(dateadd(m, -10, getdate())) and year(strm.datamov)= year(dateadd(m, -10, getdate())) then strm.qta1um else 0 end) as "-10",
                                sum(case when month(strm.datamov)= MONTH(dateadd(m, -11, getdate())) and year(strm.datamov)= year(dateadd(m, -11, getdate())) then strm.qta1um else 0 end) as "-11",
                                sum(case when month(strm.datamov)= MONTH(dateadd(m, -12, getdate())) and year(strm.datamov)= year(dateadd(m, -12, getdate())) then strm.qta1um else 0 end) as "-12"
                            from 
                                storicomag strm
                            inner join
                                TP_ExtraMag x
                            on
                                x.CodArt = strm.CODART
                            where
                                x.ConsidAcq = 1 and   
                                strm.CodCausale In(Select Items from SplitCCVMCAU('VEN')) And
                                strm.TipoDoc In(Select Items from SplitCCVMDOC('VEN'))
                            group by 
                                strm.codart,
                                strm.coddeposito
                        ) P0
                    ) P1
                ) P2
            ) P3
        ) P4
    ) P5

    /*12.2*/
    Update TP_MEDIAMOBILE_TMP
        Set 
            TP_MEDIAMOBILE_TMP.[1] = PREVISIONE.[1],
            TP_MEDIAMOBILE_TMP.[2] = PREVISIONE.[2],
            TP_MEDIAMOBILE_TMP.[3] = PREVISIONE.[3],
            TP_MEDIAMOBILE_TMP.[4] = PREVISIONE.[4],
            TP_MEDIAMOBILE_TMP.[5] = PREVISIONE.[5],
            TP_MEDIAMOBILE_TMP.[6] = PREVISIONE.[6],
            TP_MEDIAMOBILE_TMP.[7] = PREVISIONE.[7],
            TP_MEDIAMOBILE_TMP.[8] = PREVISIONE.[8],
            TP_MEDIAMOBILE_TMP.[9] = PREVISIONE.[9],
            TP_MEDIAMOBILE_TMP.[10] = PREVISIONE.[10],
            TP_MEDIAMOBILE_TMP.[11] = PREVISIONE.[11],
            TP_MEDIAMOBILE_TMP.[12] = PREVISIONE.[12]
    From
        TP_MEDIAMOBILE_TMP
    INNER JOIN
        (
            Select
                codart,
                coddeposito,
                periodi,
                "1",
                "2",
                "3",
                "4",
                "5",
                "6",
                "7",
                "8",
                "9",
                "10",
                "11",
                (((("-1" * 1) + ("1" * 2) + ("2" * 3) + ("3" * 4) + ("4" * 5) + ("5" * 6) + ("6" * 7) + ("7" * 8) + ("8" * 9) + ("9" * 10) + ("10" * 11) + ("11" * 12))) / 78) As "12"
            From
            (
                Select
                    codart,
                    coddeposito,
                    periodi,
                    "-1",       
                    "1",
                    "2",
                    "3",
                    "4",
                    "5",
                    "6",
                    "7",
                    "8",
                    "9",
                    "10",
                    (((("-2" * 1) + ("-1" * 2) + ("1" * 3) + ("2" * 4) + ("3" * 5) + ("4" * 6) + ("5" * 7) + ("6" * 8) + ("7" * 9) + ("8" * 10) + ("9" * 11) + ("10" * 12))) / 78) As "11"
                From
                (
                    Select
                        codart,
                        coddeposito,
                        periodi,
                        "-1",
                        "-2",       
                        "1",
                        "2",
                        "3",
                        "4",
                        "5",
                        "6",
                        "7",
                        "8",
                        "9",
                        (((("-3" * 1) + ("-2" * 2) + ("-1" * 3) + ("1" * 4) + ("2" * 5) + ("3" * 6) + ("4" * 7) + ("5" * 8) + ("6" * 9) + ("7" * 10) + ("8" * 11) + ("9" * 12))) / 78) As "10"
                    From
                    (
                        Select
                            codart,
                            coddeposito,
                            periodi,
                            "-1",
                            "-2",
                            "-3",
                            "1",
                            "2",
                            "3",
                            "4",
                            "5",
                            "6",
                            "7",
                            "8",
                            (((("-4" * 1) + ("-3" * 2) + ("-2" * 3) + ("-1" * 4) + ("1" * 5) + ("2" * 6) + ("3" * 7) + ("4" * 8) + ("5" * 9) + ("6" * 10) + ("7" * 11) + ("8" * 12))) / 78) As "9"
                        From
                        (
                            Select
                                codart,
                                coddeposito,
                                periodi,
                                "-1",
                                "-2",
                                "-3",
                                "-4",
                                "1",
                                "2",
                                "3",
                                "4",
                                "5",
                                "6",
                                "7",
                                (((("-5" * 1) + ("-4" * 2) + ("-3" * 3) + ("-2" * 4) + ("-1" * 5) + ("1" * 6) + ("2" * 7) + ("3" * 8) + ("4" * 9) + ("5" * 10) + ("6" * 11) + ("7" * 12))) / 78) As "8"
                            From
                            (
                                Select
                                    codart,
                                    coddeposito,
                                    periodi,
                                    "-1",
                                    "-2",
                                    "-3",
                                    "-4",
                                    "-5",
                                    "1",
                                    "2",
                                    "3",
                                    "4",
                                    "5",
                                    "6",
                                    (((("-6" * 1) + ("-5" * 2) + ("-4" * 3) + ("-3" * 4) + ("-2" * 5) + ("-1" * 6) + ("1" * 7) + ("2" * 8) + ("3" * 9) + ("4" * 10) + ("5" * 11) + ("6" * 12))) / 78) As "7"
                                From
                                (
                                    Select
                                        codarticolo as codart,
                                        coddeposito,
                                        periodi,
                                        "1" AS "-1",
                                        "2" AS "-2",
                                        "3" AS "-3",
                                        "4" AS "-4",
                                        "5" AS "-5",
                                        "6" AS "-6",
                                        "7" AS "1",
                                        "8" AS "2",
                                        "9" AS "3",
                                        "10" AS "4",
                                        "11" AS "5",
                                        "12" AS "6"
                                    From
                                        TP_MEDIAMOBILE_TMP
                                    Where
                                        Periodi = 12
                                ) P6
                            ) P7
                        ) P8
                    ) P9
                ) P10
            ) P11
        ) PREVISIONE
    ON
        PREVISIONE.CodArt = TP_MEDIAMOBILE_TMP.CodArticolo And
        PREVISIONE.CodDeposito = TP_MEDIAMOBILE_TMP.CodDeposito And
        PREVISIONE.Periodi = TP_MEDIAMOBILE_TMP.Periodi

    If @@ERROR <> 0 GoTo ErrorHandler
    Set NoCount OFF
    Return(0)
  
ErrorHandler:
    Return(@@ERROR)

END


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[PROC_CREA_PREVISIONI_FUTURE_MEDIAMOBILE] TO [Metodo98]
    AS [dbo];

