

CREATE PROCEDURE [dbo].[RIPORTAINRIGHEDOCUMENTI_BUDGET] 
    @WHERECOND          as VARCHAR(8000),
    @RES                int out,
    @ERRORNR            int out,
    @ERRORMS            Varchar(2048) out,
    @ERRORLINE          int out
--ENCRY--
AS
BEGIN

    Declare @COMANDO            Varchar(8000)
    Declare @CODICISCONTOHeader Varchar(8000)
    Declare @CODICISCONTO       Varchar(8000)

    set @RES = 1;

    begin try

        -- Pulizia delle righe gi� depositate su righedocumenti budget
        Set @COMANDO = '    update  righedocumenti_budget                                               ' + char(13) +
                       '    set     contratti = null,                                                   ' + char(13) +  
                       '            totprovvageuro1 = 0,                                                ' + char(13) +  
                       '            totprovvageuro2 = 0,                                                ' + char(13) +  
                       '            totprovvageuro3 = 0                                                 ' + char(13) +  
                       '    where   contratti.value(''(/contratti/rc/@progressivo)[1]'', ''decimal'')   ' + char(13) +    
                       '    in  (                                                                       ' + char(13) +                                                                  
                       '            Select      PROGRESSIVO                                             ' + char(13) +      
                       '            From        VISTA_TESTE_CONTRATTI TC                                ' + char(13) +  
                       '            Where       ( ' + @WHERECOND + ' )                                  ' + char(13) +                                      
                       '        )                                                                       ' + char(13)                                            
        EXECUTE (@COMANDO)

        declare @CODICESCONTO varchar(5)
        declare cur cursor forward_only read_only for 
        Select Distinct CODICE from contratti_configsconti

        open cur
    
        fetch next from cur into @CODICESCONTO

        Set @CODICISCONTOHeader = ''
        Set @CODICISCONTO = ''

        while @@FETCH_STATUS = 0

            begin

                -- Testata --
                if ( len( @CODICISCONTOHeader ) > 0 )           
                begin
            
                    Set @CODICISCONTOHeader = @CODICISCONTOHeader + ','
            
                end

                Set @CODICISCONTOHeader = @CODICISCONTOHeader + 'IsNull([' + @CODICESCONTO + '],0) As ' + @CODICESCONTO


                -- Valori --
                if ( len( @CODICISCONTO ) > 0 )             
                begin
            
                    Set @CODICISCONTO = @CODICISCONTO + ','
            
                end

                Set @CODICISCONTO = @CODICISCONTO + '[' + @CODICESCONTO + ']'

                fetch next from cur into @CODICESCONTO

            end

        close cur

        deallocate cur


        if ( len( @CODICISCONTO ) > 0 )
    
        begin
        
            IF OBJECT_ID('tempdb..Bdgt') IS NOT NULL DROP TABLE #Bdgt

            Create Table #Bdgt(
                    idtestadoc          decimal(10,0)   not null,
                    idrigadoc           int             not null,
                    contratto           decimal(10,0)   not null,
                    codicecosto         varchar(7)      null,
                    valorerigapremio    decimal(19,6)   not null
                )

            Set @COMANDO =  '   Insert Into #Bdgt(idtestadoc,idrigadoc,contratto,codicecosto,valorerigapremio)          ' + char(13) +      
                            '   Select s.idtestadoc,s.idrigadoc,s.contratto,s.codicecosto,s.valorerigapremio            ' + char(13) +   
                            '   FROM(                                                                                   ' + char(13) +  
                            '   Select      cs.idtestadoc,                                                              ' + char(13) +
                            '               cs.idrigadoc,                                                               ' + char(13) +
                            '               cs.contratto,                                                               ' + char(13) +
                            '               cs.codicecosto,                                                             ' + char(13) +
                            '               sum(cs.valorerigapremio) As valorerigapremio                                ' + char(13) +
                            '   From        contratti_costificazionerighe cs                                            ' + char(13) +
                            '   Group By    cs.contratto,cs.idtestadoc,cs.idrigadoc,cs.codicecosto                      ' + char(13) +
                            '   Having      cs.contratto in (                                                           ' + char(13) +
                            '                    Select      TC.PROGRESSIVO                                             ' + char(13) +
                            '                    From        VISTA_TESTE_CONTRATTI TC                                   ' + char(13) +
                            '                    Where       (' + @WHERECOND + ')                                       ' + char(13) +
                            '                    Group By    TC.PROGRESSIVO                                             ' + char(13) +
                            '               )                                                                           ' + char(13) +
                            '   )s                                                                                      ' + char(13)

            EXECUTE (@COMANDO)      

            if (@@ROWCOUNT > 0)

            begin

            
                IF OBJECT_ID('tempdb..#xmlctr') IS NOT NULL DROP TABLE #xmlctr

                Create Table #xmlctr(
                    idtesta decimal(10,0)   not null,
                    idriga  int             not null,
                    struXml varchar(MAX)    not null
                    primary key(idtesta,idriga)
                )


                declare @IDTESTAROTT        decimal(10,0)
                declare @IDRIGAROTT         int

                declare @IDTESTA            decimal(10,0)
                declare @IDRIGA             int
                declare @CONTRATTO          decimal(10,0)
                declare @COSTO              varchar(7)
                declare @VALORERIGAPREMIO   decimal(19,6)
                declare @nodoXml            varchar(8000) = '<contratti>'

                declare cur cursor forward_only read_only for 

                Select      idtestadoc,idrigadoc,contratto,codicecosto,valorerigapremio 
                From        #Bdgt
                Order By    idtestadoc,idrigadoc,contratto 

                open cur

                fetch next from cur into @IDTESTAROTT,@IDRIGAROTT,@CONTRATTO,@COSTO,@VALORERIGAPREMIO

                set @IDTESTA = @IDTESTAROTT
                set @IDRIGA = @IDRIGAROTT

                while @@FETCH_STATUS = 0

                    begin
                    
                        Set @nodoXml = @nodoXml + '<rc progressivo=''' + Cast(@CONTRATTO as varchar) 
                                                + ''' codice=''' + @COSTO 
                                                + ''' valore=''' + Cast(@VALORERIGAPREMIO as varchar) 
                                                + '''/>'

                        fetch next from cur into @IDTESTA,@IDRIGA,@CONTRATTO,@COSTO,@VALORERIGAPREMIO

                        -- controllo la rottura --
                        if (   (@IDTESTAROTT <> @IDTESTA) or (@IDRIGAROTT <> @IDRIGA)   )
                        begin       
                            
                            Set @nodoXml = @nodoXml + '</contratti>'                
                        
                            --
                            insert into #xmlctr(idtesta,idriga,struXml) values(@IDTESTAROTT,@IDRIGAROTT,@nodoXml)

                            Set @nodoXml = '<contratti>'
                            Set @IDTESTAROTT = @IDTESTA
                            set @IDRIGAROTT = @IDRIGA

                        end

                    end

                close cur

                deallocate cur

                -- select * from #xmlctr

                -- Inserimento in RigheDocumentiBudget --
                Insert Into RIGHEDOCUMENTI_BUDGET(IDTESTA,IDRIGA,Contratti)

                Select      O.IDTESTA,O.IDRIGA,O.struXml
                From        #xmlctr O
                Left join   (
                                select  B.IDTESTA,B.IDRIGA  
                                from    RIGHEDOCUMENTI_BUDGET   B
                            )D
                On          D.IDTESTA   =   O.idtesta
                And         D.IDRIGA    =   O.idriga
                Where       D.IDTESTA Is Null

                -- Update in RigheDocumentiBudget --
                Update      RIGHEDOCUMENTI_BUDGET
                Set         RIGHEDOCUMENTI_BUDGET.Contratti = #xmlctr.struXml
                From        RIGHEDOCUMENTI_BUDGET
                Inner Join  #xmlctr 
                On          #xmlctr.idtesta = RIGHEDOCUMENTI_BUDGET.IDTESTA
                And         #xmlctr.idriga  = RIGHEDOCUMENTI_BUDGET.IDRIGA


            end

        end
    
        Update      RIGHEDOCUMENTI_BUDGET
        Set         RIGHEDOCUMENTI_BUDGET.TOTPROVVAGEURO1 = D.provvag1,
                    RIGHEDOCUMENTI_BUDGET.TOTPROVVAGEURO2 = D.provvag2,
                    RIGHEDOCUMENTI_BUDGET.TOTPROVVAGEURO3 = D.provvag3
        From        RIGHEDOCUMENTI_BUDGET
        Inner Join  (
                        Select  C.IdTestaDoc,C.IdRigaDoc,
                                sum(C.valrigaprovv1) as provvag1,
                                sum(C.valrigaprovv2) as provvag2,
                                sum(C.valrigaprovv3) as provvag3
                        From CONTRATTI_COSTIFICAZIONERIGHE C
                        inner join #Bdgt B
                        On B.contratto = C.contratto
                        And B.idtestadoc = C.Idtestadoc
                        And B.idrigadoc = C.idrigadoc
                        Group By C.IdTestaDoc,C.IdRigaDoc
                ) D
        On  RIGHEDOCUMENTI_BUDGET.idtesta   = D.IdtestaDoc
        And RIGHEDOCUMENTI_BUDGET.idriga    = D.Idrigadoc

    
    end try

    begin catch
        set @RES        = 0
        set @ERRORNR    = ERROR_NUMBER()
        set @ERRORMS    = ERROR_MESSAGE()
        set @ERRORLINE  = ERROR_LINE()
    end catch

END


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[RIPORTAINRIGHEDOCUMENTI_BUDGET] TO [Metodo98]
    AS [dbo];

