CREATE TABLE [dbo].[PL_PackingRaggAllestimenti] (
    [PROGRESSIVO]          DECIMAL (18)     IDENTITY (1, 1) NOT NULL,
    [RIFPROGRESSIVO]       DECIMAL (18)     NOT NULL,
    [IDRAGGR]              UNIQUEIDENTIFIER NOT NULL,
    [IDRAGGRPADRE]         UNIQUEIDENTIFIER NULL,
    [NRPACKAGEREL]         VARCHAR (100)    DEFAULT ('') NULL,
    [IMBALLOQTA]           DECIMAL (16, 6)  DEFAULT ((1)) NULL,
    [PROGRPL]              DECIMAL (18)     DEFAULT ((0)) NULL,
    [UDS]                  VARCHAR (25)     DEFAULT ('') NULL,
    [TIPOCONTENITORE]      SMALLINT         DEFAULT ((0)) NULL,
    [CODCONTENITORE]       VARCHAR (25)     DEFAULT ('') NULL,
    [PESOCONTENITORE]      DECIMAL (16, 6)  DEFAULT ((0)) NULL,
    [PESOLORDOCONTENITORE] DECIMAL (16, 6)  DEFAULT ((0)) NULL,
    [STATO]                SMALLINT         DEFAULT ((0)) NULL,
    [UTENTEMODIFICA]       VARCHAR (25)     NOT NULL,
    [DATAMODIFICA]         DATETIME         NOT NULL,
    CONSTRAINT [PK_PL_PackingRaggAllestimenti] PRIMARY KEY CLUSTERED ([PROGRESSIVO] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UNQ_IDX_PL_PackingRaggAllestimenti]
    ON [dbo].[PL_PackingRaggAllestimenti]([IDRAGGR] ASC);


GO


CREATE TRIGGER TD_PL_PackingRaggAllestimenti ON PL_PackingRaggAllestimenti
FOR DELETE 
AS
    
    DELETE PL_PackingRigheAllestimenti
    FROM   PL_PackingRigheAllestimenti T2, DELETED T1
    WHERE  T2.RIFPROGRESSIVO  = T1.RIFPROGRESSIVO AND
           T2.RIFRAGGR = T1.IDRAGGR



GO


CREATE TRIGGER TI_PL_PackingRaggAllestimenti ON PL_PackingRaggAllestimenti AFTER INSERT
AS

BEGIN   

    DECLARE @RIFPROGRESSIVO  DECIMAL(18,0)
    DECLARE @IDRAGGR         UNIQUEIDENTIFIER
    DECLARE @IDRAGGRPADRE    UNIQUEIDENTIFIER
    DECLARE @NRPACKAGERELTMP VARCHAR(100)

    DECLARE CUR_INS CURSOR FOR SELECT I.RIFPROGRESSIVO,I.IDRAGGR,I.IDRAGGRPADRE FROM INSERTED I ORDER BY I.RIFPROGRESSIVO,I.PROGRESSIVO 
    OPEN  CUR_INS

    FETCH NEXT FROM CUR_INS INTO  @RIFPROGRESSIVO,@IDRAGGR,@IDRAGGRPADRE
 
    WHILE @@FETCH_STATUS = 0    
       BEGIN
           IF @IDRAGGRPADRE IS NULL     
           
              BEGIN
                   UPDATE PL_PackingRaggAllestimenti 
                   SET NRPACKAGEREL = CAST((SELECT (COUNT(*) + 1) 
                                            FROM PL_PackingRaggAllestimenti WHERE 
                                            RIFPROGRESSIVO = @RIFPROGRESSIVO AND IDRAGGRPADRE IS NULL AND LEN(NRPACKAGEREL) > 0) AS VARCHAR(100))
                   
                   WHERE IDRAGGR = @IDRAGGR 
              END       
           
           ELSE

              BEGIN  
                  SELECT @NRPACKAGERELTMP = (SELECT TOP 1 ISNULL(NRPACKAGEREL,'') 
                                             FROM PL_PackingRaggAllestimenti WHERE 
                                             RIFPROGRESSIVO = @RIFPROGRESSIVO AND IDRAGGR=@IDRAGGRPADRE AND LEN(NRPACKAGEREL) > 0 
                                              ORDER BY PROGRESSIVO) + '.' +
                                              CAST((SELECT (COUNT(*) + 1) FROM PL_PackingRaggAllestimenti WHERE 
                                                    RIFPROGRESSIVO = @RIFPROGRESSIVO AND IDRAGGRPADRE = @IDRAGGRPADRE AND LEN(NRPACKAGEREL) > 0) AS VARCHAR(100)) 

              
                  IF LEN(@NRPACKAGERELTMP) > 0 
                     BEGIN 
                       UPDATE PL_PackingRaggAllestimenti 
                       SET NRPACKAGEREL = @NRPACKAGERELTMP
                       WHERE IDRAGGR = @IDRAGGR
                     END
              END       
           
          FETCH NEXT FROM CUR_INS INTO  @RIFPROGRESSIVO,@IDRAGGR,@IDRAGGRPADRE
       END

       CLOSE CUR_INS
       DEALLOCATE CUR_INS

END



GO
GRANT DELETE
    ON OBJECT::[dbo].[PL_PackingRaggAllestimenti] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[PL_PackingRaggAllestimenti] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[PL_PackingRaggAllestimenti] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[PL_PackingRaggAllestimenti] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[PL_PackingRaggAllestimenti] TO [Metodo98]
    AS [dbo];

