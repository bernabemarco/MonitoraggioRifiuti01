

create function dbo.F_NUMERIC_TO_BASE_N
    (
    @Number     numeric(32,0),
    @Base       int
    )
returns varchar(110)
as

begin
declare @Work_Number    numeric(38,0)
declare @Modulus    int
declare @Digits     varchar(36)
declare @Output_String  varchar(110)
if @Number is null or @Base is null or @Base < 2 or @Base > 36 
    begin
    return null
    end
set @Digits = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ'
set @Output_String = ''
set @Work_Number = @Number
while 1=1  
    begin
    Set @Modulus = convert(int,abs(@Work_Number-(round(@Work_Number/@Base,0,1)*@Base)))
    set @Output_String = substring(@Digits,@Modulus+1,1) + @Output_String
    set @Work_Number = round(@Work_Number/@Base,0,1)
    if @Work_Number = 0 break
    end -- end while
if @Number < 0 set @Output_String = '-'+@Output_String
return @Output_String
end

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[F_NUMERIC_TO_BASE_N] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[F_NUMERIC_TO_BASE_N] TO [Metodo98]
    AS [dbo];

