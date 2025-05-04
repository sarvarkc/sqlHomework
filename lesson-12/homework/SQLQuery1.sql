CREATE PROCEDURE dbo.GetProceduresAndFunctionsInfo
    @DatabaseName NVARCHAR(128) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @SQL NVARCHAR(MAX);

    IF @DatabaseName IS NULL
        SET @DatabaseName = DB_NAME(); -- Use current database if none given

    SET @SQL = '
    SELECT
        SCHEMA_NAME(o.schema_id) AS SchemaName,
        o.name AS ObjectName,
        CASE o.type
            WHEN ''P'' THEN ''Stored Procedure''
            WHEN ''FN'' THEN ''Scalar Function''
            WHEN ''TF'' THEN ''Table-Valued Function''
            WHEN ''IF'' THEN ''Inline Table-Valued Function''
            ELSE o.type_desc
        END AS ObjectType,
        p.name AS ParameterName,
        TYPE_NAME(p.user_type_id) AS DataType,
        p.max_length AS MaxLength
    FROM [' + QUOTENAME(@DatabaseName) + '].sys.objects o
    LEFT JOIN [' + QUOTENAME(@DatabaseName) + '].sys.parameters p ON o.object_id = p.object_id
    WHERE o.type IN (''P'', ''FN'', ''TF'', ''IF'')
    ORDER BY SchemaName, ObjectName, ParameterName;
    ';

    EXEC sp_executesql @SQL;
END
GO