

/*CREATE PROCEDURE [dbo].[Mytho_SetAnagraficaClienti](
    @TipoConto char(1)  = 'C',
    @Intestazione varchar(80),
    @Indirizzo varchar(80),
    @Localita varchar(80), 
    @Provincia varchar(4), 
    @CAP varchar(8), 
    @Telefono varchar(25) ='', 
    @Fax varchar(25) ='',
    @CF varchar(16) = '',
    @PI varchar(11) = '',
    @RetVal bit  = 0 OUTPUT,
    @CodClifor  Varchar(7) ='' OUTPUT) 
AS
    
    DECLARE @TranCounter INT;
    DECLARE @Result varchar(7);
    SET @TranCounter = @@TRANCOUNT;
    IF @TranCounter > 0
        -- Procedure called when there is
        -- an active transaction.
        -- Create a savepoint to be able
        -- to roll back only the work done
        -- in the procedure if there is an
        -- error.
        SAVE TRANSACTION ProcedureSave;
    ELSE
        -- Procedure must start its own
        -- transaction.
    BEGIN TRANSACTION ;
    -- Modify database.
    
    
    IF LTRIM(ISNULL(@CF,'')) = ''
        BEGIN
            SET @CF = @PI
        END
    
        BEGIN TRY
            SELECT @RESULT = [dbo].[Mytho_FunCheckClifor] (@PI, @CF, @TipoConto)
            
            IF @RESULT = ''
                BEGIN
                    DECLARE @CodConto VARCHAR(7)
                    SELECT @CodConto = [dbo].[FunGetNewCodAnagraficaCF] (@TipoConto)
                    --Print ''cucu''
                    INSERT INTO ANAGRAFICACF 
                            ( CodConto, CodMastro, DscConto1, Indirizzo, Localita, Provincia, CAP, Telefono, Fax, Telex, CodNazione, CodiceISO, PartitaIVA, CodFiscale, DscConto2, CodLingua, Note, TipoProfessionista, LuogoNascita, VersPresso, IndirizzoInternet, CodFiscaleRitAcc, PartitaIvaRitAcc, CAPRitAcc, ProvinciaRitAcc, LocalitaRitAcc, IndirizzoRitAcc, ZonaSped, DataNascita, TipoDocRTAcc, TipoClienteBudget, ConsideraBudget, CodRegione, PercorsoDocumenti, TipoConto,  UtenteModifica, DataModifica ) 
                            VALUES 
                            ( @CodConto,  41, @Intestazione, @Indirizzo, @Localita, @Provincia, @CAP, @Telefono, @Fax, '',  0, 'IT', @PI, @CF, '',  0, '',  0, '', '', '', '', '000000000000', '', '', '', '', '', NULL,  0, '''',  0, 'VT06', '', @TipoConto, 'POS', getdate() )

                    INSERT INTO ANAGRAFICACFGESTCONT 
                            ( CODCONTO, DOCUMENTO, ATTIVITA, NOTE,  UtenteModifica, DataModifica ) 
                            VALUES 
                            ( @CodConto, '', '', '', 'POS', getdate() )

                    INSERT INTO ANAGRAFICARISERVATICF ( CodPag, MeseEscl1, DestDivMerci, Sconto1, CodContoFatt, Fido, CodCambio, CodBanca, FidoEuro, CodDeposito, CodIVA, Provv1, CodSped, BancaAnagr, CodAgente1, CodAgente2, CodSettore, CodZona, DichEsIVA, DestDivDocumenti, Provv2, Provv3, CodAgente3, PrcTrasporto, Porto, CodDebitore, ccDebitore, CodCategoria, ApplScontoRiga, ApplScontoFinale, TraspACura, NrControPCont, CodDepositoColl, CodDepComp, CodDepCompColl, Esercizio, CodConto, MeseEscl2, GGEscl1, GGEscl2, CodGruppoPrezziPart, CodGruppoProvPart, Listino, Note1, NonRaggruppDoc, StatoContabilita, StatoMagazzino, StatoOrdini, StatoBolle, StatoFatture, StatoNoteAccredito, StatoAltro, InoltroTrasp, RaggScadenze, SpeseDocum, SpeseEffetto, SpeseTrasporto, SpeseImballo, RivIvaOmaggi, UsaPrzPrvPart, FattFineMese, DATAINIZIOCALCOLOFIDO, NUMEROCONTRATTO,  UtenteModifica, DataModifica ) 
                            VALUES 
                            ( 'DPAG',  0,  0, '0', @CodConto,  0,  1, '',  0, '',  100, '',  0,  0, '', '',  0,  0, '',  0, '', '', '', '',  0, '', '',  0, '', '',  0,  0,'', '', '',  YEAR(getdate()), @CodConto,  0,  0,  0,  0,  0,  0, '', 0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, NULL,  0, 'POS', getdate() )

                    SET @RetVal = 1
                    SET @CodClifor = @CodConto
                END
            ELSE
                BEGIN
                    SET @RetVal = 1
                    SET @CodClifor = @RESULT
                END

            IF @TranCounter = 0
                    -- @TranCounter = 0 means no transaction was
                    -- started before the procedure was called.
                    -- The procedure must commit the transaction
                    -- it started.
                COMMIT TRANSACTION ;
        END TRY

        BEGIN CATCH
            -- An error occurred; must determine
            -- which type of rollback will roll
            -- back only the work done in the
            -- procedure.
            IF @TranCounter = 0
                -- Transaction started in procedure.
                -- Roll back complete transaction.
                ROLLBACK TRANSACTION ProcedureSave;
            ELSE
                -- Transaction started before procedure
                -- called, do not roll back modifications
                -- made before the procedure was called.
                IF XACT_STATE() <> -1
                    -- If the transaction is still valid, just
                    -- roll back to the savepoint set at the
                    -- start of the stored procedure.
                    ROLLBACK TRANSACTION ProcedureSave;
                    SET @RetVal = 0
                    SET @CodClifor = ''
                    -- If the transaction is uncommitable, a
                    -- rollback to the savepoint is not allowed
                    -- because the savepoint rollback writes to
                    -- the log. Just return to the caller, which
                    -- should roll back the outer transaction.

            -- After the appropriate rollback, echo error
            -- information to the caller.
            DECLARE @ErrorMessage NVARCHAR(4000);
            DECLARE @ErrorSeverity INT;
            DECLARE @ErrorState INT;

            SELECT @ErrorMessage = ERROR_MESSAGE();
            SELECT @ErrorSeverity = ERROR_SEVERITY();
            SELECT @ErrorState = ERROR_STATE();

            RAISERROR (@ErrorMessage, -- Message text.
                       @ErrorSeverity, -- Severity.
                       @ErrorState -- State.
                       );
        END CATCH*/

CREATE PROCEDURE [dbo].[Mytho_SetAnagraficaClienti](
    @TipoConto varchar(1) = 'C',
    @CF varchar(16) = '',
    @PI varchar(11) = '',
    @Esercizio decimal(5,0),
    @UtenteModifica varchar(25),
    @Intestazione varchar(80),
    @Indirizzo varchar(80),
    @Telefono varchar(25),
    @Fax varchar(25),
    @Citta varchar(80),
    @CodiceISO varchar(3),
    @Cap varchar(8),
    @RetVal bit  = 0 OUTPUT,
    @CodClifor  Varchar(7) ='' OUTPUT) 
AS
    
    DECLARE @TranCounter INT;
    DECLARE @Result varchar(7);
    SET @TranCounter = @@TRANCOUNT;
    IF @TranCounter > 0
        -- Procedure called when there is
        -- an active transaction.
        -- Create a savepoint to be able
        -- to roll back only the work done
        -- in the procedure if there is an
        -- error.
        SAVE TRANSACTION ProcedureSave;
    ELSE
        -- Procedure must start its own
        -- transaction.
    BEGIN TRANSACTION ;
    -- Modify database.
    
    
    IF LTRIM(ISNULL(@CF,'')) = ''
        BEGIN
            SET @CF = @PI
        END
    
        BEGIN TRY
            SELECT @RESULT = [dbo].[Mytho_FunCheckClifor] (@PI, @CF, @TipoConto)
            
            IF @RESULT = ''
                BEGIN

                    DECLARE @CodConto VARCHAR(7)
                    SELECT @CodConto = [dbo].[FunGetNewCodAnagraficaCF] (@TipoConto)

                    declare @CodContoMytho varchar(7)
                    select @CodContoMytho = CODCONTO_IMP From MYTHO_Parametri
                    
                    -- x provare --
                    -- set @CodContoMytho = 'C     1'

                    if(@@ROWCOUNT > 0)

                    begin

                        if( LEN( LTRIM( RTRIM(@CodContoMytho) ) ) > 0  )
                            
                        begin

                            -- Inserimento in ANAGRAFICACF --
                            INSERT INTO ANAGRAFICACF (CodConto, CodMastro, DscConto1,     Indirizzo,  Localita, Provincia, CAP,  Telefono,  Fax,  Telex, CodNazione,   CodiceISO,   PartitaIVA, CodFiscale, DscConto2, CodLingua, Note, TipoProfessionista, LuogoNascita, VersPresso, IndirizzoInternet, CodFiscaleRitAcc, PartitaIvaRitAcc, CAPRitAcc, ProvinciaRitAcc, LocalitaRitAcc, IndirizzoRitAcc, ZonaSped, DataNascita, TipoConto,  UtenteModifica, DataModifica) 
                            Select  Top 1             @CodConto,CODMASTRO, @Intestazione, @Indirizzo, @Citta,   '',        @Cap, @Telefono, @Fax, '',    null,         @CodiceISO , @PI,        @CF,        @CodConto, CodLingua, '',   0,                  '',           '',         '',                @CF,              @PI,              @Cap,      '',              @Citta,         @Indirizzo,      '',       null,        TipoConto,  @UtenteModifica, getdate() 
                            From    ANAGRAFICACF 
                            Where   CODCONTO = @CodContoMytho

                            -- Inserimento in ANAGRAFICARISERVATICF --
                            INSERT INTO ANAGRAFICARISERVATICF (CodPag, MeseEscl1, DestDivMerci, Sconto1, CodContoFatt, Fido, CodCambio, CodBanca, FidoEuro, CodDeposito, CodIVA, Provv1, CodSped, BancaAnagr, CodAgente1, CodAgente2, CodSettore, CodZona, DichEsIVA, DestDivDocumenti, Provv2, Provv3, CodAgente3, PrcTrasporto, Porto, CodDebitore, ccDebitore, CodCategoria, ApplScontoRiga, ApplScontoFinale, TraspACura, NrControPCont, CodDepositoColl, CodDepComp, CodDepCompColl, Esercizio, CodConto,  MeseEscl2, GGEscl1, GGEscl2, CodGruppoPrezziPart, CodGruppoProvPart, Listino, Note1, NonRaggruppDoc, StatoContabilita, StatoMagazzino, StatoOrdini, StatoBolle, StatoFatture, StatoNoteAccredito, StatoAltro, InoltroTrasp, RaggScadenze, SpeseDocum, SpeseEffetto, SpeseTrasporto, SpeseImballo, RivIvaOmaggi, UsaPrzPrvPart, FattFineMese, DATAINIZIOCALCOLOFIDO, NUMEROCONTRATTO,  UtenteModifica, DataModifica ) 
                            Select                             CodPag, MeseEscl1, DestDivMerci, Sconto1, CodContoFatt, Fido, CodCambio, CodBanca, FidoEuro, CodDeposito, CodIVA, Provv1, CodSped, BancaAnagr, CodAgente1, CodAgente2, CodSettore, CodZona, DichEsIVA, DestDivDocumenti, Provv2, Provv3, CodAgente3, PrcTrasporto, Porto, CodDebitore, ccDebitore, CodCategoria, ApplScontoRiga, ApplScontoFinale, TraspACura, NrControPCont, CodDepositoColl, CodDepComp, CodDepCompColl, @Esercizio,@CodConto, MeseEscl2, GGEscl1, GGEscl2, CodGruppoPrezziPart, CodGruppoProvPart, Listino, Note1, NonRaggruppDoc, StatoContabilita, StatoMagazzino, StatoOrdini, StatoBolle, StatoFatture, StatoNoteAccredito, StatoAltro, InoltroTrasp, RaggScadenze, SpeseDocum, SpeseEffetto, SpeseTrasporto, SpeseImballo, RivIvaOmaggi, UsaPrzPrvPart, FattFineMese, DATAINIZIOCALCOLOFIDO, NUMEROCONTRATTO,  @UtenteModifica,getdate()
                            From   ANAGRAFICARISERVATICF
                            Where  CODCONTO  = @CodContoMytho
                            And    ESERCIZIO = @Esercizio

                            -- Inserimento in ANAGRAFICACFGESTCONT --
                            INSERT INTO ANAGRAFICACFGESTCONT (CODCONTO, DOCUMENTO, ATTIVITA, NOTE,  UtenteModifica, DataModifica) 
                            Select                            @CodConto,DOCUMENTO, ATTIVITA, NOTE,  @UtenteModifica,getdate()
                            From   ANAGRAFICACFGESTCONT
                            Where  CODCONTO = @CodContoMytho

                            SET @RetVal = 1
                            SET @CodClifor = @CodConto

                        end

                    end

                END

            ELSE

                BEGIN
                    SET @RetVal = 1
                    SET @CodClifor = @RESULT
                END

            IF @TranCounter = 0
                    -- @TranCounter = 0 means no transaction was
                    -- started before the procedure was called.
                    -- The procedure must commit the transaction
                    -- it started.
                COMMIT TRANSACTION ;

        END TRY

        BEGIN CATCH
            -- An error occurred; must determine
            -- which type of rollback will roll
            -- back only the work done in the
            -- procedure.
            IF @TranCounter = 0
                -- Transaction started in procedure.
                -- Roll back complete transaction.
                ROLLBACK TRANSACTION ProcedureSave;
            ELSE
                -- Transaction started before procedure
                -- called, do not roll back modifications
                -- made before the procedure was called.
                IF XACT_STATE() <> -1
                    -- If the transaction is still valid, just
                    -- roll back to the savepoint set at the
                    -- start of the stored procedure.
                    ROLLBACK TRANSACTION ProcedureSave;
                    SET @RetVal = 0
                    SET @CodClifor = ''
                    -- If the transaction is uncommitable, a
                    -- rollback to the savepoint is not allowed
                    -- because the savepoint rollback writes to
                    -- the log. Just return to the caller, which
                    -- should roll back the outer transaction.

            -- After the appropriate rollback, echo error
            -- information to the caller.
            DECLARE @ErrorMessage NVARCHAR(4000);
            DECLARE @ErrorSeverity INT;
            DECLARE @ErrorState INT;

            SELECT @ErrorMessage = ERROR_MESSAGE();
            SELECT @ErrorSeverity = ERROR_SEVERITY();
            SELECT @ErrorState = ERROR_STATE();

            RAISERROR (@ErrorMessage, -- Message text.
                       @ErrorSeverity, -- Severity.
                       @ErrorState -- State.
                       );
        END CATCH


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[Mytho_SetAnagraficaClienti] TO [Metodo98]
    AS [dbo];

