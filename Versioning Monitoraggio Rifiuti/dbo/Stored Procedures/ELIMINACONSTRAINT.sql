

CREATE PROCEDURE ELIMINACONSTRAINT (@NomeTabella VarChar(100), @Contraint VarChar(100), @TYPE VARCHAR(2)) AS
BEGIN
DECLARE @dftDaCancellare  VARCHAR(100)
DECLARE @stringa varchar(200)

SET @dftDaCancellare=(SELECT top 1 NAME FROM sysobjects WHERE parent_obj = OBJECT_ID (@NomeTabella) AND XTYPE=@TYPE and sysobjects.name like @Contraint + '%' ORDER BY  sysobjects.crdate DESC)
SET @stringa = 'ALTER TABLE ' + @NomeTabella + ' DROP CONSTRAINT '  + @dftDaCancellare
IF EXISTS(SELECT top 1 NAME FROM sysobjects WHERE parent_obj = OBJECT_ID (@NomeTabella) AND XTYPE=@TYPE and sysobjects.name like @Contraint + '%')
    EXEC (@stringa)
END

