CREATE TABLE [dbo].[MYTHO_Codici_Articoli] (
    [CODICEMETODO]    VARCHAR (50) NOT NULL,
    [SKU]             VARCHAR (20) NULL,
    [ProductEntityId] BIGINT       IDENTITY (1, 1) NOT NULL,
    [UTENTEMODIFICA]  VARCHAR (25) DEFAULT (user_name()) NOT NULL,
    [DATAMODIFICA]    DATETIME     DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_MYTHO_Codici_Articoli] PRIMARY KEY CLUSTERED ([CODICEMETODO] ASC)
);


GO
 
        CREATE TRIGGER [dbo].[TI_MYTHO_InsertProduct] ON [dbo].[MYTHO_Codici_Articoli] FOR INSERT AS
        
            BEGIN       
                SET NOCOUNT ON 
                DECLARE @CODICEMETODO VARCHAR(50), @CODSKU VARCHAR(20)

                DECLARE @RESULT bit
                ---------------------------------------------------------
                DECLARE View4Inserted_InsertItems  cursor FAST_FORWARD for 
                        SELECT CODICEMETODO FROM Inserted 
            
                    OPEN View4Inserted_InsertItems
                    --- 
                    FETCH NEXT FROM View4Inserted_InsertItems
                    INTO @CODICEMETODO 

                    -- Check @@FETCH_STATUS to see if there are any more rows to fetch.
                    WHILE @@FETCH_STATUS = 0
                        BEGIN 
                                        
                            
                            EXECUTE MYTHO_GETSKU @CODSKU = @CODSKU OUTPUT


                            UPDATE [MYTHO_Codici_Articoli] set SKU = @CODSKU WHERE CODICEMETODO = @CODICEMETODO 
                        

                            

                            FETCH NEXT FROM View4Inserted_InsertItems
                            INTO @CODICEMETODO  
                        END
                    
                    CLOSE View4Inserted_InsertItems
                    DEALLOCATE View4Inserted_InsertItems
                    ---------------------------------------------------------
                    
            END
    
GO
GRANT DELETE
    ON OBJECT::[dbo].[MYTHO_Codici_Articoli] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[MYTHO_Codici_Articoli] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[MYTHO_Codici_Articoli] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[MYTHO_Codici_Articoli] TO [Metodo98]
    AS [dbo];

