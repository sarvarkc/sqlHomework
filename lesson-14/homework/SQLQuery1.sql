DECLARE @tableHTML NVARCHAR(MAX);

SET @tableHTML =
N'<style>
    table { border-collapse: collapse; width: 100%; }
    th, td { border: 1px solid #dddddd; padding: 8px; text-align: left; }
    th { background-color: #f2f2f2; }
</style>
<h2>SQL Server Index Metadata Report</h2>
<table>
<tr>
    <th>Table Name</th>
    <th>Index Name</th>
    <th>Index Type</th>
    <th>Column Name</th>
    <th>Column Type</th>
</tr>' +
(
    SELECT
        td.name AS [Table Name],
        i.name AS [Index Name],
        i.type_desc AS [Index Type],
        c.name AS [Column Name],
        typ.name AS [Column Type]
    FROM 
        sys.indexes i
    INNER JOIN 
        sys.index_columns ic ON i.object_id = ic.object_id AND i.index_id = ic.index_id
    INNER JOIN 
        sys.columns c ON ic.object_id = c.object_id AND ic.column_id = c.column_id
    INNER JOIN 
        sys.tables td ON td.object_id = i.object_id
    INNER JOIN 
        sys.types typ ON c.user_type_id = typ.user_type_id
    WHERE 
        i.is_primary_key = 0 AND i.is_unique_constraint = 0
    FOR XML PATH('tr'), TYPE
).value('.', 'NVARCHAR(MAX)') +
N'</table>';

EXEC msdb.dbo.sp_send_dbmail
    @profile_name = 'YourDatabaseMailProfileName',
    @recipients = 'recipient@example.com',
    @subject = 'SQL Server Index Metadata Report',
    @body = @tableHTML,
    @body_format = 'HTML';
