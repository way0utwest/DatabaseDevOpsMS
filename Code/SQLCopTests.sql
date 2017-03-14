-- <Migration ID="b8cfe6ee-9d5a-4946-bbaa-7eba51724511" />
GO
EXEC tsqlt.NewTestClass @ClassName = N'SQLCop'

GO
CREATE PROCEDURE [SQLCop].[test Procedures Named SP_]
AS
BEGIN
    -- Written by George Mastros
    -- February 25, 2012
    -- http://sqlcop.lessthandot.com
    -- http://blogs.lessthandot.com/index.php/DataMgmt/DBProgramming/MSSQLServer/don-t-start-your-procedures-with-sp_
    
    SET NOCOUNT ON
    
    Declare @Output VarChar(max)
    Set @Output = ''
  
    SELECT	@Output = @Output + SPECIFIC_SCHEMA + '.' + SPECIFIC_NAME + Char(13) + Char(10)
    From	INFORMATION_SCHEMA.ROUTINES
    Where	SPECIFIC_NAME COLLATE SQL_LATIN1_GENERAL_CP1_CI_AI LIKE 'sp[_]%'
            And SPECIFIC_NAME COLLATE SQL_LATIN1_GENERAL_CP1_CI_AI NOT LIKE '%diagram%'
            AND ROUTINE_SCHEMA <> 'tSQLt'
    Order By SPECIFIC_SCHEMA,SPECIFIC_NAME

    If @Output > '' 
        Begin
            Set @Output = Char(13) + Char(10) 
                          + 'For more information:  '
                          + 'http://blogs.lessthandot.com/index.php/DataMgmt/DBProgramming/MSSQLServer/don-t-start-your-procedures-with-sp_'
                          + Char(13) + Char(10) 
                          + Char(13) + Char(10) 
                          + @Output
            EXEC tSQLt.Fail @Output
        End 
END;
GO
CREATE PROCEDURE [SQLCop].[test Procedures with Identity]
AS
BEGIN
	-- Written by George Mastros
	-- February 25, 2012
	-- http://sqlcop.lessthandot.com
	-- http://wiki.lessthandot.com/index.php/6_Different_Ways_To_Get_The_Current_Identity_Value
	
	SET NOCOUNT ON

	Declare @Output VarChar(max)
	Set @Output = ''

	Select	@Output = @Output + Schema_Name(schema_id) + '.' + name + Char(13) + Char(10)
	From	sys.all_objects
	Where	type = 'P'
			AND name Not In('sp_helpdiagrams','sp_upgraddiagrams','sp_creatediagram','testProcedures with @@Identity')
			And Object_Definition(object_id) COLLATE SQL_LATIN1_GENERAL_CP1_CI_AI Like '%@@identity%'
			And is_ms_shipped = 0
			and schema_id <> Schema_id('tSQLt')
			and schema_id <> Schema_id('SQLCop')
	ORDER BY Schema_Name(schema_id), name 

	If @Output > '' 
		Begin
			Set @Output = Char(13) + Char(10) 
						  + 'For more information:  '
						  + 'http://wiki.lessthandot.com/index.php/6_Different_Ways_To_Get_The_Current_Identity_Value'
						  + Char(13) + Char(10) 
						  + Char(13) + Char(10) 
						  + @Output
			EXEC tSQLt.Fail @Output
		End
	
END;
GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [SQLCop].[test Procedures With SET ROWCOUNT]
AS
BEGIN
    -- Written by George Mastros
    -- February 25, 2012
    -- http://sqlcop.lessthandot.com
    -- http://sqltips.wordpress.com/2007/08/19/set-rowcount-will-not-be-supported-in-future-version-of-sql-server/

    SET NOCOUNT ON

    DECLARE @Output VARCHAR(MAX)
    SET @Output = ''

    SELECT	@Output = @Output + SCHEMA_NAME(schema_id) + '.' + name + CHAR(13) + CHAR(10)
    FROM	sys.all_objects
    WHERE	type = 'P'
            AND name NOT IN('sp_helpdiagrams','sp_upgraddiagrams','sp_creatediagram','testProcedures With SET ROWCOUNT')
            AND REPLACE(OBJECT_DEFINITION(Object_id), ' ', '') COLLATE SQL_LATIN1_GENERAL_CP1_CI_AI LIKE '%SET ROWCOUNT%'
            AND is_ms_shipped = 0
            AND schema_id <> SCHEMA_ID('tSQLt')
            AND schema_id <> SCHEMA_ID('SQLCop')			
    ORDER BY SCHEMA_NAME(schema_id) + '.' + name

    IF @Output > '' 
        BEGIN
            SET @Output = CHAR(13) + CHAR(10) 
                          + 'For more information:  '
                          + 'http://sqltips.wordpress.com/2007/08/19/set-rowcount-will-not-be-supported-in-future-version-of-sql-server/'
                          + CHAR(13) + CHAR(10) 
                          + CHAR(13) + CHAR(10) 
                          + @Output
            EXEC tSQLt.Fail @Output
        END
END;



GO





