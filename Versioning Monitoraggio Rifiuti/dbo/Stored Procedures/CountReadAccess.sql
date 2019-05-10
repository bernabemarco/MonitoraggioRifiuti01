


CREATE PROCEDURE [dbo].[CountReadAccess]
(@helpid int, @utente varchar(50),@countaccess int output)
as
begin


set @countaccess =(select count(*) from TABACCESSIUTENTE where helpid = @helpid and CODUTENTE = @utente and INDICESCHEDA > -2 and TIPOACCESSO < 2)
--print 'utente: ' + cast(@countaccess as varchar(2))
if @countaccess = 0 
begin
 
 set @countaccess = (select COUNT(*) from TABMEMBRIGRUPPO TM inner join TABACCESSIGRUPPO TG on TM.CODGRUPPO = TG.CODGRUPPO   where CODUTENTE  = @utente  and helpid = @helpid
                    AND tm.CODUTENTE  not in (select CODUTENTE from TABACCESSIUTENTE where helpid = tg.HELPID and CODUTENTE = @utente))
 --print 'gruppo: '  + cast(@countaccess as varchar(2))
 if @countaccess = 0 
 begin
        if exists(SELECT CodGruppo FROM TabMembriGruppo  WHERE CodUtente=@utente)
        begin
            set @countaccess = (SELECT count(*) FROM TabProfili P INNER JOIN TabAccessiRuolo AR ON P.CodRuolo = AR.CodRuolo INNER JOIN TabMembriGruppo MG ON P.CodGruppo=MG.CodGruppo WHERE MG.CodUtente=@utente and helpid = @helpid  and ar.INDICESCHEDA > -2 and ar.TIPOACCESSO < 2
                                AND MG.CodUtente  NOT IN (select CODUTENTE from TABACCESSIUTENTE where helpid = @HELPID and CODUTENTE = @utente AND INDICESCHEDA = AR.INDICESCHEDA AND  HELPID =AR.HELPID )
                                AND MG.CODUTENTE  not in (select CODUTENTE from TABMEMBRIGRUPPO TM inner join TABACCESSIGRUPPO TG on TM.CODGRUPPO = TG.CODGRUPPO   where CODUTENTE  = 'trm5'  and helpid = AR.HELPID))
    --      print 'ruolo1: ' + cast(@countaccess as varchar(2))
        end 
        else
        begin
           set @countaccess = (SELECT count(*) FROM TabProfili P INNER JOIN TabAccessiRuolo AR ON P.CodRuolo = AR.CodRuolo WHERE P.CodUtente=@utente and helpid = @helpid  and ar.INDICESCHEDA > -2 and ar.TIPOACCESSO < 2
                               AND P.CodUtente  NOT IN (select CODUTENTE from TABACCESSIUTENTE where helpid = @HELPID and CODUTENTE = @utente AND INDICESCHEDA = AR.INDICESCHEDA AND  HELPID =AR.HELPID ))  
        --   print 'ruolo2: ' + cast(@countaccess as varchar(2))
        end 
 end
end
end


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[CountReadAccess] TO [Metodo98]
    AS [dbo];

