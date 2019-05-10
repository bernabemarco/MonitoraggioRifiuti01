
CREATE PROCEDURE PR_TEMPFATTURESOSP(@strW NVARCHAR(1000), @IDSESSIONE SMALLINT) AS
BEGIN
    DECLARE @SQL NVARCHAR(2000) 
    DECLARE @TIPOSI SMALLINT
    DECLARE @STRWHERE NVARCHAR(1000)

    SET @SQL = 'DELETE FROM TEMPFATTURESOSP WHERE IDSESSIONE = ' + CAST(@IDSESSIONE AS NVARCHAR(5))
    PRINT(@SQL)
    EXEC(@SQL)

    --Nel caso di campi data rimetto un apice singolo, altrimenti v- in errore la query
    SET @STRWHERE = Replace(@strW, '{d '+char(39)+char(39), '{d '+char(39))
    SET @STRWHERE = Replace(@STRWHERE, char(39)+char(39)+'}', char(39)+'}')
    
    
    -- creo una tabella temporanea di SQL
    CREATE TABLE #TEMPDATIFATTURESOSP
    (
        NRREG               DECIMAL(10,0) NOT NULL,
        NRRIGA              DECIMAL(10,0) NOT NULL,
        IDTESTADOC          DECIMAL(10,0),
        NUMPROT             VARCHAR(12),
        DATAFATTURA         DATETIME,
        CODCLIFOR           VARCHAR(7),
        DSCCLIFOR           VARCHAR(80),
        IMPONIBILE          DECIMAL(19, 4),
        IMPOSTA             DECIMAL(19, 4),
        TOTFATTURA          DECIMAL(19, 4),
        FLGNOTAACCR         SMALLINT,
        MESELIQUIDAZ        SMALLINT,
        ANNOLIQUIDAZ        SMALLINT,
        CONSTRAINT PK_TEMPDATIFATTURESOSP PRIMARY KEY (NRREG,NRRIGA)
    )

    SET @SQL='INSERT INTO #TEMPDATIFATTURESOSP (NRREG,NRRIGA,IDTESTADOC,NUMPROT,DATAFATTURA,CODCLIFOR,DSCCLIFOR,IMPONIBILE,IMPOSTA,TOTFATTURA,FLGNOTAACCR,MESELIQUIDAZ,ANNOLIQUIDAZ) '
    SET @SQL = @SQL + 'SELECT PROGRESSIVO,NRRIGA,IDTESTADOC,NUMDOC,DATADOC,CONTO,(SELECT DSCCONTO1 FROM ANAGRAFICACF WHERE CODCONTO=CONTO),IMPONIBILEEURO,IMPOSTAEURO,TOTDOCEURO,(SELECT NOTAACCRADD FROM CAUSALICONTABILI WHERE CODICECAUSALE=CAUSALE),MESELIQUIDAZ,YEAR(DATADOC)+1 '
    SET @SQL = @SQL + 'FROM TESTECONTABILITA INNER JOIN RIGHEIVA ON PROGRESSIVO = NRREG '
    SET @SQL = @SQL + 'WHERE ' + @STRWHERE + ' ORDER BY PROGRESSIVO,NRRIGA'
    
    PRINT(@SQL)
    EXEC(@SQL)
    
    DECLARE @PROG DECIMAL(10, 0)
    DECLARE @PROGPREC DECIMAL(10, 0)
    DECLARE @IDTESTADOC DECIMAL(10, 0)
    DECLARE @IDTESTADOCPREC DECIMAL(10, 0)
    DECLARE @NUMPROT NVARCHAR(12)
    DECLARE @DATADOC DATETIME
    DECLARE @CONTO NVARCHAR(7)
    DECLARE @DSCCONTO NVARCHAR(80)
    DECLARE @DSCCONTOPREC NVARCHAR(80)
    DECLARE @NUMPROTPREC NVARCHAR(12)
    DECLARE @DATADOCPREC DATETIME
    DECLARE @CONTOPREC NVARCHAR(7)  
    DECLARE @IMPONIB DECIMAL(19, 4)
    DECLARE @IMPOSTA DECIMAL(19, 4)
    DECLARE @TOTFATTURA DECIMAL(19, 4)
    DECLARE @TOTFATTURAPREC DECIMAL(19, 4)
    DECLARE @MESELIQ SMALLINT
    DECLARE @ANNOLIQ SMALLINT
    DECLARE @MESELIQPREC SMALLINT
    DECLARE @ANNOLIQPREC SMALLINT
    DECLARE @NOTAACCR SMALLINT
    DECLARE @NOTAACCRPREC SMALLINT
    
    DECLARE @TOTIMPONIB DECIMAL(19, 4)
    DECLARE @TOTIMPOSTA DECIMAL(19, 4)
    DECLARE @TOTPAGATO DECIMAL(19, 4)
    DECLARE @TOTINSCAD DECIMAL(19, 4)
    DECLARE @TOTIMPONIBINC DECIMAL(19, 4)
    DECLARE @TOTIMPOSTAINC DECIMAL(19, 4)
    
    DECLARE @IMPONIBINC DECIMAL(19, 4)
    DECLARE @IMPOSTAINC DECIMAL(19, 4)
    DECLARE @DIFFIVA DECIMAL(19, 4)
    DECLARE @DATAFATTURA VARCHAR(10)

    DECLARE @TIPOD NVARCHAR(3)
    DECLARE @NUMD DECIMAL(10, 0)
    DECLARE @ANNOD SMALLINT
    DECLARE @BISD NVARCHAR(1)
    DECLARE @NRREGESITO DECIMAL(10, 0)
    
    DECLARE CURCONT CURSOR FOR
    SELECT NRREG,IDTESTADOC,NUMPROT,DATAFATTURA,CODCLIFOR,DSCCLIFOR,IMPONIBILE,IMPOSTA,TOTFATTURA,FLGNOTAACCR,MESELIQUIDAZ,ANNOLIQUIDAZ FROM #TEMPDATIFATTURESOSP ORDER BY NRREG,NRRIGA
    OPEN CURCONT

    FETCH NEXT FROM CURCONT INTO @PROG,@IDTESTADOC,@NUMPROT,@DATADOC,@CONTO,@DSCCONTO,@IMPONIB,@IMPOSTA,@TOTFATTURA,@NOTAACCR,@MESELIQ,@ANNOLIQ
    SET @PROGPREC = 0
    WHILE @@FETCH_STATUS = 0
        BEGIN
            IF @PROG<>@PROGPREC 
                IF @PROGPREC <> 0
                    BEGIN
                        --LETTURA TOT. PAGATO/INCASSATO
                        IF @IDTESTADOCPREC = 0 
                            BEGIN
                                DECLARE CURSCAD CURSOR FOR
                                SELECT SUM(IMPORTOSCADEURO) FROM VISTASCADENZE WHERE TIPODOC='___' AND NUMDOC=@PROGPREC AND ESITO IN (2,4)
                                OPEN CURSCAD
                                
                                FETCH NEXT FROM CURSCAD INTO @TOTPAGATO
                                IF @@FETCH_STATUS <> 0 
                                    SET @TOTPAGATO = 0
                                ELSE
                                    IF @TOTPAGATO IS NULL 
                                        SET @TOTPAGATO = 0
                                        
                                CLOSE CURSCAD
                                DEALLOCATE CURSCAD
                            END
                        ELSE
                            BEGIN
                                
                                DECLARE CURDOC CURSOR FOR
                                SELECT TIPODOC,NUMERODOC,ESERCIZIO,BIS FROM TESTEDOCUMENTI WHERE PROGRESSIVO = @IDTESTADOCPREC
                                OPEN CURDOC
                            
                                FETCH NEXT FROM CURDOC INTO @TIPOD,@NUMD,@ANNOD,@BISD
                                IF @@FETCH_STATUS = 0 
                                    BEGIN
                                        DECLARE CURSCAD CURSOR FOR
                                        SELECT SUM(IMPORTOSCADEURO) FROM VISTASCADENZE WHERE TIPODOC=@TIPOD AND NUMDOC=@NUMD AND ANNODOC=@ANNOD AND BIS=@BISD AND ESITO IN (2,4)
                                        OPEN CURSCAD
                                        
                                        FETCH NEXT FROM CURSCAD INTO @TOTPAGATO
                                        IF @@FETCH_STATUS <> 0 
                                            SET @TOTPAGATO = 0
                                        ELSE
                                            IF @TOTPAGATO IS NULL 
                                                SET @TOTPAGATO = 0
                                        
                                        CLOSE CURSCAD
                                        DEALLOCATE CURSCAD
                                    END                                 
                                ELSE
                                    SET @TOTPAGATO = 0
                                
                                CLOSE CURDOC
                                DEALLOCATE CURDOC
                            END
                            
                        --LETTURA TOT. IN SCADENZA (SCADENZE DA PAGARE)
                        IF @IDTESTADOCPREC=0 
                            BEGIN
                                DECLARE CURSCAD CURSOR FOR
                                SELECT SUM(IMPORTOSCADEURO) FROM VISTASCADENZE WHERE TIPODOC='___' AND NUMDOC=@PROGPREC AND ESITO NOT IN (2,4,5)
                                OPEN CURSCAD
                                
                                FETCH NEXT FROM CURSCAD INTO @TOTINSCAD
                                IF @@FETCH_STATUS <> 0 
                                    SET @TOTINSCAD = 0
                                ELSE
                                    IF @TOTINSCAD IS NULL 
                                        SET @TOTINSCAD = 0

                                CLOSE CURSCAD
                                DEALLOCATE CURSCAD
                            END
                        ELSE
                            BEGIN
                                DECLARE CURDOC CURSOR FOR
                                SELECT TIPODOC,NUMERODOC,ESERCIZIO,BIS FROM TESTEDOCUMENTI WHERE PROGRESSIVO = @IDTESTADOCPREC
                                OPEN CURDOC
                            
                                FETCH NEXT FROM CURDOC INTO @TIPOD,@NUMD,@ANNOD,@BISD
                                IF @@FETCH_STATUS = 0 
                                    BEGIN
                                        DECLARE CURSCAD CURSOR FOR
                                        SELECT SUM(IMPORTOSCADEURO) FROM VISTASCADENZE WHERE TIPODOC=@TIPOD AND NUMDOC=@NUMD AND ANNODOC=@ANNOD AND BIS=@BISD AND ESITO NOT IN (2,4,5)
                                        OPEN CURSCAD
                                        
                                        FETCH NEXT FROM CURSCAD INTO @TOTINSCAD
                                        IF @@FETCH_STATUS <> 0 
                                            SET @TOTINSCAD = 0
                                        ELSE
                                            IF @TOTINSCAD IS NULL 
                                                SET @TOTINSCAD = 0
                                        
                                        CLOSE CURSCAD
                                        DEALLOCATE CURSCAD
                                    END                                 
                                ELSE
                                    SET @TOTINSCAD = 0
                                
                                CLOSE CURDOC
                                DEALLOCATE CURDOC
                            END
                                            
                        --LETTURA TOT. IMPONIB/IVA DEI MOV DI INCASSO
                        SET @TOTIMPONIBINC = 0
                        SET @TOTIMPOSTAINC = 0
                        IF @IDTESTADOCPREC = 0
                            BEGIN
                                --------------------------------------------------------
                                -- MODIFICATA QUERY DI LETTURA INCASSI PER SVILUPPO 3523
                                --------------------------------------------------------
                                DECLARE CURSCAD CURSOR FOR
                                SELECT RI.IMPONIBILEEURO,RI.IMPOSTAEURO FROM RIGHEIVA RI INNER JOIN TABSCADENZE TS ON RI.RIFSCADRIGSOSP=TS.PROGRESSIVO WHERE TS.TIPODOC='___' AND TS.NUMDOC=@PROGPREC AND ((TS.ESITO IN (2,4)) OR (TS.FLGLIQSOSP<>0)) --ORDER BY PROGRESSIVO
                                OPEN CURSCAD

                                --FETCH NEXT FROM CURSCAD INTO @NRREGESITO
                                FETCH NEXT FROM CURSCAD INTO @IMPONIBINC,@IMPOSTAINC
                                WHILE @@FETCH_STATUS = 0
                                    BEGIN
                                        IF @IMPONIBINC IS NOT NULL
                                            SET @TOTIMPONIBINC = @TOTIMPONIBINC + @IMPONIBINC
                                        IF @IMPOSTAINC IS NOT NULL
                                            SET @TOTIMPOSTAINC = @TOTIMPOSTAINC + @IMPOSTAINC
                                        
                                        FETCH NEXT FROM CURSCAD INTO @IMPONIBINC,@IMPOSTAINC
                                    END
                                CLOSE CURSCAD
                                DEALLOCATE CURSCAD
                            END
                        ELSE
                            BEGIN
                                DECLARE CURDOC CURSOR FOR
                                SELECT TIPODOC,NUMERODOC,ESERCIZIO,BIS FROM TESTEDOCUMENTI WHERE PROGRESSIVO = @IDTESTADOCPREC
                                OPEN CURDOC
                            
                                FETCH NEXT FROM CURDOC INTO @TIPOD,@NUMD,@ANNOD,@BISD
                                IF @@FETCH_STATUS = 0 
                                    BEGIN
                                        --------------------------------------------------------
                                        -- MODIFICATA QUERY DI LETTURA INCASSI PER SVILUPPO 3523
                                        --------------------------------------------------------
                                        DECLARE CURSCAD CURSOR FOR
                                        SELECT RI.IMPONIBILEEURO,RI.IMPOSTAEURO FROM RIGHEIVA RI INNER JOIN TABSCADENZE TS ON RI.RIFSCADRIGSOSP=TS.PROGRESSIVO WHERE TS.TIPODOC=@TIPOD AND TS.NUMDOC=@NUMD AND TS.ANNODOC=@ANNOD AND TS.BIS=@BISD AND ((TS.ESITO IN (2,4)) OR (TS.FLGLIQSOSP<>0)) --ORDER BY PROGRESSIVO
                                        OPEN CURSCAD                            
                                        
                                        FETCH NEXT FROM CURSCAD INTO @IMPONIBINC,@IMPOSTAINC
                                        WHILE @@FETCH_STATUS = 0
                                            BEGIN
                                                IF @IMPONIBINC IS NOT NULL
                                                    SET @TOTIMPONIBINC = @TOTIMPONIBINC + @IMPONIBINC
                                                IF @IMPOSTAINC IS NOT NULL
                                                    SET @TOTIMPOSTAINC = @TOTIMPOSTAINC + @IMPOSTAINC
                                                
                                                FETCH NEXT FROM CURSCAD INTO @IMPONIBINC,@IMPOSTAINC
                                            END
                                        CLOSE CURSCAD
                                        DEALLOCATE CURSCAD
                                    END
                                CLOSE CURDOC
                                DEALLOCATE CURDOC
                            END
                        
                        SET @DIFFIVA = @TOTIMPOSTA-@TOTIMPOSTAINC
                        IF @DIFFIVA <> 0
                            BEGIN
                                --SCRITTURA RECORD FINALE SU TEMPORANEO
                                SET @DATAFATTURA=RIGHT('00' + CAST(DAY(@DATADOCPREC) AS VARCHAR(2)),2) + '/' + RIGHT('00' + CAST(MONTH(@DATADOCPREC) AS VARCHAR(2)),2) + '/' + CAST(YEAR(@DATADOCPREC) AS VARCHAR(4))
                                IF @NOTAACCRPREC<>0
                                    SET @TOTFATTURAPREC = @TOTFATTURAPREC *(-1)
                                    
                                SET @SQL = 'INSERT INTO TEMPFATTURESOSP (IDSESSIONE,NRREG,NUMPROT,ANNOPROT,DATAFATTURA,CODCLIFOR,DSCCLIFOR,TOTFATTURA,TOTIMPSOSP,TOTIVASOSP,TOTPAG,TOTINSCAD,TOTIMPONIB,TOTIMPOSTA,DIFFIVA,MESELIQUIDAZ,ANNOLIQUIDAZ)'
                                SET @SQL = @SQL + 'VALUES (' + CAST(@IDSESSIONE AS NVARCHAR(5)) + ',' + CAST(@PROGPREC AS NVARCHAR(10)) + ',''' + @NUMPROTPREC + ''',' + CAST(YEAR(@DATADOCPREC) AS NVARCHAR(4)) + ',' + '{D ''' + RIGHT(@DATAFATTURA,4) + '-' + SUBSTRING(@DATAFATTURA,4,2) + '-' + LEFT(@DATAFATTURA,2) + '''},' 
                                SET @SQL = @SQL + '''' + CAST(@CONTOPREC AS NVARCHAR(7)) + ''',''' +  REPLACE(@DSCCONTOPREC,char(39),char(39)+char(39)) + ''',' 
                                SET @SQL = @SQL + CAST(@TOTFATTURAPREC AS NVARCHAR(23)) + ',' +  CAST(@TOTIMPONIB AS NVARCHAR(23)) + ',' + CAST(@TOTIMPOSTA AS NVARCHAR(23)) + ',' + CAST(@TOTPAGATO AS NVARCHAR(23)) + ',' + CAST(@TOTINSCAD AS NVARCHAR(23)) + ',' + CAST(@TOTIMPONIBINC AS NVARCHAR(23)) + ',' + CAST(@TOTIMPOSTAINC AS NVARCHAR(23)) + ',' + CAST(@DIFFIVA AS NVARCHAR(23)) + ',' + CAST(@MESELIQPREC AS NVARCHAR(23)) + ',' + CAST(@ANNOLIQPREC AS NVARCHAR(23)) 
                                SET @SQL = @SQL + ')'
                            
                                PRINT(@SQL)
                                EXEC(@SQL)
                            END
                        SET @TOTPAGATO = 0
                        SET @TOTINSCAD = 0
                        SET @IMPONIBINC = 0
                        SET @IMPOSTAINC = 0
                        SET @TOTIMPONIB = @IMPONIB
                        SET @TOTIMPOSTA = @IMPOSTA
                        SET @NUMPROTPREC = @NUMPROT
                        SET @DATADOCPREC = @DATADOC
                        SET @CONTOPREC = @CONTO 
                        SET @DSCCONTOPREC = @DSCCONTO
                        SET @TOTFATTURAPREC = @TOTFATTURA
                        SET @MESELIQPREC = @MESELIQ
                        SET @ANNOLIQPREC = @ANNOLIQ
                        SET @NOTAACCRPREC = @NOTAACCR
                        SET @PROGPREC = @PROG
                        SET @IDTESTADOCPREC = @IDTESTADOC                       
                    END
                ELSE   --PRIMO RECORD LETTO
                    BEGIN
                        SET @TOTIMPONIB = @IMPONIB
                        SET @TOTIMPOSTA = @IMPOSTA
                        SET @NUMPROTPREC = @NUMPROT
                        SET @DATADOCPREC = @DATADOC
                        SET @CONTOPREC = @CONTO 
                        SET @DSCCONTOPREC = @DSCCONTO
                        SET @TOTFATTURAPREC = @TOTFATTURA
                        SET @MESELIQPREC = @MESELIQ
                        SET @ANNOLIQPREC = @ANNOLIQ
                        SET @NOTAACCRPREC = @NOTAACCR
                        SET @PROGPREC = @PROG
                        SET @IDTESTADOCPREC = @IDTESTADOC
                    END
            ELSE
                BEGIN
                    SET @TOTIMPONIB = @TOTIMPONIB + @IMPONIB
                    SET @TOTIMPOSTA = @TOTIMPOSTA + @IMPOSTA
                    SET @NUMPROTPREC = @NUMPROT
                    SET @DATADOCPREC = @DATADOC
                    SET @CONTOPREC = @CONTO 
                    SET @DSCCONTOPREC = @DSCCONTO
                    SET @TOTFATTURAPREC = @TOTFATTURA
                    SET @MESELIQPREC = @MESELIQ
                    SET @ANNOLIQPREC = @ANNOLIQ
                    SET @NOTAACCRPREC = @NOTAACCR
                    SET @PROGPREC = @PROG
                    SET @IDTESTADOCPREC = @IDTESTADOC
                END
            FETCH NEXT FROM CURCONT INTO @PROG,@IDTESTADOC,@NUMPROT,@DATADOC,@CONTO,@DSCCONTO,@IMPONIB,@IMPOSTA,@TOTFATTURA,@NOTAACCR,@MESELIQ,@ANNOLIQ
        END
    --INSERISCO L'ULTIMO RECORD ELABORATO DENTRO AL CICLO
    IF @PROGPREC <> 0
        BEGIN
            --LETTURA TOT. PAGATO/INCASSATO
            IF @IDTESTADOCPREC = 0 
                BEGIN
                    DECLARE CURSCAD CURSOR FOR
                    SELECT SUM(IMPORTOSCADEURO) FROM VISTASCADENZE WHERE TIPODOC='___' AND NUMDOC=@PROGPREC AND ESITO IN (2,4)
                    OPEN CURSCAD
                    
                    FETCH NEXT FROM CURSCAD INTO @TOTPAGATO
                    IF @@FETCH_STATUS <> 0 
                        SET @TOTPAGATO = 0
                    ELSE
                        IF @TOTPAGATO IS NULL 
                            SET @TOTPAGATO = 0

                    CLOSE CURSCAD
                    DEALLOCATE CURSCAD
                END
            ELSE
                BEGIN
                    
                    DECLARE CURDOC CURSOR FOR
                    SELECT TIPODOC,NUMERODOC,ESERCIZIO,BIS FROM TESTEDOCUMENTI WHERE PROGRESSIVO = @IDTESTADOCPREC
                    OPEN CURDOC
                
                    FETCH NEXT FROM CURDOC INTO @TIPOD,@NUMD,@ANNOD,@BISD
                    IF @@FETCH_STATUS = 0 
                        BEGIN
                            DECLARE CURSCAD CURSOR FOR
                            SELECT SUM(IMPORTOSCADEURO) FROM VISTASCADENZE WHERE TIPODOC=@TIPOD AND NUMDOC=@NUMD AND ANNODOC=@ANNOD AND BIS=@BISD AND ESITO IN (2,4)
                            OPEN CURSCAD
                            
                            FETCH NEXT FROM CURSCAD INTO @TOTPAGATO
                            IF @@FETCH_STATUS <> 0 
                                SET @TOTPAGATO = 0
                            ELSE
                                IF @TOTPAGATO IS NULL 
                                    SET @TOTPAGATO = 0
                            
                            CLOSE CURSCAD
                            DEALLOCATE CURSCAD
                        END                                 
                    ELSE
                        SET @TOTPAGATO = 0
                    
                    CLOSE CURDOC
                    DEALLOCATE CURDOC
                END
                
            --LETTURA TOT. IN SCADENZA (SCADENZE DA PAGARE)
            IF @IDTESTADOCPREC = 0 
                BEGIN
                    DECLARE CURSCAD CURSOR FOR
                    SELECT SUM(IMPORTOSCADEURO) FROM VISTASCADENZE WHERE TIPODOC='___' AND NUMDOC=@PROGPREC AND ESITO NOT IN (2,4,5)
                    OPEN CURSCAD
                    
                    FETCH NEXT FROM CURSCAD INTO @TOTINSCAD
                    IF @@FETCH_STATUS <> 0 
                        SET @TOTINSCAD = 0
                    ELSE
                        IF @TOTINSCAD IS NULL 
                            SET @TOTINSCAD = 0

                    CLOSE CURSCAD
                    DEALLOCATE CURSCAD
                END
            ELSE
                BEGIN
                    DECLARE CURDOC CURSOR FOR
                    SELECT TIPODOC,NUMERODOC,ESERCIZIO,BIS FROM TESTEDOCUMENTI WHERE PROGRESSIVO = @IDTESTADOCPREC
                    OPEN CURDOC
                
                    FETCH NEXT FROM CURDOC INTO @TIPOD,@NUMD,@ANNOD,@BISD
                    IF @@FETCH_STATUS = 0 
                        BEGIN
                            DECLARE CURSCAD CURSOR FOR
                            SELECT SUM(IMPORTOSCADEURO) FROM VISTASCADENZE WHERE TIPODOC=@TIPOD AND NUMDOC=@NUMD AND ANNODOC=@ANNOD AND BIS=@BISD AND ESITO NOT IN (2,4,5)
                            OPEN CURSCAD
                            
                            FETCH NEXT FROM CURSCAD INTO @TOTINSCAD
                            IF @@FETCH_STATUS <> 0 
                                SET @TOTINSCAD = 0
                            ELSE
                                IF @TOTINSCAD IS NULL 
                                    SET @TOTINSCAD = 0
                            
                            CLOSE CURSCAD
                            DEALLOCATE CURSCAD
                        END                                 
                    ELSE
                        SET @TOTINSCAD = 0
                    
                    CLOSE CURDOC
                    DEALLOCATE CURDOC
                END
                                
            --LETTURA TOT. IMPONIB/IVA DEI MOV DI INCASSO
            SET @TOTIMPONIBINC = 0
            SET @TOTIMPOSTAINC = 0
            IF @IDTESTADOCPREC = 0
                BEGIN
                    --------------------------------------------------------
                    -- MODIFICATA QUERY DI LETTURA INCASSI PER SVILUPPO 3523
                    --------------------------------------------------------
                    DECLARE CURSCAD CURSOR FOR
                    SELECT RI.IMPONIBILEEURO,RI.IMPOSTAEURO FROM RIGHEIVA RI INNER JOIN TABSCADENZE TS ON RI.RIFSCADRIGSOSP=TS.PROGRESSIVO WHERE TS.TIPODOC='___' AND TS.NUMDOC=@PROGPREC AND ((TS.ESITO IN (2,4)) OR (TS.FLGLIQSOSP<>0)) --ORDER BY PROGRESSIVO
                    OPEN CURSCAD
                    
                    FETCH NEXT FROM CURSCAD INTO @IMPONIBINC,@IMPOSTAINC
                    WHILE @@FETCH_STATUS = 0
                        BEGIN
                            IF @IMPONIBINC IS NOT NULL
                                SET @TOTIMPONIBINC = @TOTIMPONIBINC + @IMPONIBINC
                            IF @IMPOSTAINC IS NOT NULL
                                SET @TOTIMPOSTAINC = @TOTIMPOSTAINC + @IMPOSTAINC
                            
                            FETCH NEXT FROM CURSCAD INTO @IMPONIBINC,@IMPOSTAINC
                        END
                    CLOSE CURSCAD
                    DEALLOCATE CURSCAD
                END
            ELSE
                BEGIN
                    DECLARE CURDOC CURSOR FOR
                    SELECT TIPODOC,NUMERODOC,ESERCIZIO,BIS FROM TESTEDOCUMENTI WHERE PROGRESSIVO = @IDTESTADOCPREC
                    OPEN CURDOC
                
                    FETCH NEXT FROM CURDOC INTO @TIPOD,@NUMD,@ANNOD,@BISD
                    IF @@FETCH_STATUS = 0 
                        BEGIN
                            --------------------------------------------------------
                            -- MODIFICATA QUERY DI LETTURA INCASSI PER SVILUPPO 3523
                            --------------------------------------------------------
                            DECLARE CURSCAD CURSOR FOR
                            SELECT RI.IMPONIBILEEURO,RI.IMPOSTAEURO FROM RIGHEIVA RI INNER JOIN TABSCADENZE TS ON RI.RIFSCADRIGSOSP=TS.PROGRESSIVO WHERE TS.TIPODOC=@TIPOD AND TS.NUMDOC=@NUMD AND TS.ANNODOC=@ANNOD AND TS.BIS=@BISD AND ((TS.ESITO IN (2,4)) OR (TS.FLGLIQSOSP<>0)) --ORDER BY PROGRESSIVO
                            OPEN CURSCAD
                            
                            FETCH NEXT FROM CURSCAD INTO @IMPONIBINC,@IMPOSTAINC
                            WHILE @@FETCH_STATUS = 0
                                BEGIN
                                    IF @IMPONIBINC IS NOT NULL
                                        SET @TOTIMPONIBINC = @TOTIMPONIBINC + @IMPONIBINC
                                    IF @IMPOSTAINC IS NOT NULL
                                        SET @TOTIMPOSTAINC = @TOTIMPOSTAINC + @IMPOSTAINC

                                    FETCH NEXT FROM CURSCAD INTO @IMPONIBINC,@IMPOSTAINC
                                END
                            CLOSE CURSCAD
                            DEALLOCATE CURSCAD
                        END
                    CLOSE CURDOC
                    DEALLOCATE CURDOC
                END
            
            SET @DIFFIVA = @TOTIMPOSTA-@TOTIMPOSTAINC
            IF @DIFFIVA <> 0
                BEGIN
                    --SCRITTURA RECORD FINALE SU TEMPORANEO
                    SET @DATAFATTURA=RIGHT('00' + CAST(DAY(@DATADOCPREC) AS VARCHAR(2)),2) + '/' + RIGHT('00' + CAST(MONTH(@DATADOCPREC) AS VARCHAR(2)),2) + '/' + CAST(YEAR(@DATADOCPREC) AS VARCHAR(4))
                    IF @NOTAACCRPREC <> 0 
                        SET @TOTFATTURAPREC = @TOTFATTURAPREC * (-1)
                        
                    SET @SQL = 'INSERT INTO TEMPFATTURESOSP (IDSESSIONE,NRREG,NUMPROT,ANNOPROT,DATAFATTURA,CODCLIFOR,DSCCLIFOR,TOTFATTURA,TOTIMPSOSP,TOTIVASOSP,TOTPAG,TOTINSCAD,TOTIMPONIB,TOTIMPOSTA,DIFFIVA,MESELIQUIDAZ,ANNOLIQUIDAZ)'
                    SET @SQL = @SQL + 'VALUES (' + CAST(@IDSESSIONE AS NVARCHAR(5)) + ',' + CAST(@PROGPREC AS NVARCHAR(10)) + ',''' + @NUMPROTPREC + ''',' + CAST(YEAR(@DATADOCPREC) AS NVARCHAR(4)) + ',' + '{D ''' + RIGHT(@DATAFATTURA,4) + '-' + SUBSTRING(@DATAFATTURA,4,2) + '-' + LEFT(@DATAFATTURA,2) + '''},' 
                    SET @SQL = @SQL + '''' + CAST(@CONTOPREC AS NVARCHAR(7)) + ''',''' + REPLACE(@DSCCONTOPREC,char(39),char(39)+char(39)) + ''',' 
                    SET @SQL = @SQL + CAST(@TOTFATTURAPREC AS NVARCHAR(23)) + ',' +  CAST(@TOTIMPONIB AS NVARCHAR(23)) + ',' + CAST(@TOTIMPOSTA AS NVARCHAR(23)) + ',' + CAST(@TOTPAGATO AS NVARCHAR(23)) + ',' + CAST(@TOTINSCAD AS NVARCHAR(23)) + ',' + CAST(@TOTIMPONIBINC AS NVARCHAR(23)) + ',' + CAST(@TOTIMPOSTAINC AS NVARCHAR(23)) + ',' + CAST(@DIFFIVA AS NVARCHAR(23)) + ',' + CAST(@MESELIQPREC AS NVARCHAR(23)) + ',' + CAST(@ANNOLIQPREC AS NVARCHAR(23)) 
                    SET @SQL = @SQL + ')'
                
                    PRINT(@SQL)
                    EXEC(@SQL)
                END
        END
    CLOSE CURCONT
    DEALLOCATE CURCONT  
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[PR_TEMPFATTURESOSP] TO [Metodo98]
    AS [dbo];

