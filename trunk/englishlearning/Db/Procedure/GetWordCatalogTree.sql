CREATE PROCEDURE GetCatalogRelationTree
AS
	/*DECLARE CatalogRleation_Cur CURSOR FOR
	SELECT
		CatalogID
	FROM
		WordCatalog
	WHERE
		NOT EXISTS (SELECT CatalogID FROM CatalogRelation WHERE ChildCatalogID = WordCatalog.CatalogID)*/

	--OPEN table_cur
	--FETCH NEXT FROM table_cur INTO @TableName
	
	SELECT
		ROW_NUMBER() OVER(ORDER BY WordCatalog.CatalogID ASC) AS ROWID,
		--CASE WHEN CatalogRelation.ChildCatalogID IS NULL THEN -1 ELSE ROW_NUMBER() OVER(ORDER BY WordCatalog.CatalogID ASC) END AS ParentRowID,
		WordCatalog.CatalogID,
		--CASE WHEN CatalogRelation.ChildCatalogID IS NULL THEN '-1' ELSE CatalogRelation.CatalogID END AS ParentCatalogID,
		CatalogRelation.CatalogID  AS ParentCatalogID,
		WordCatalog.CatalogName,
		WordCatalog.CatalogDisp,
		WordCatalog.CreateTime,
		WordCatalog.UpdateTime
	FROM
		WordCatalog
	LEFT JOIN CatalogRelation ON
		CatalogRelation.ChildCatalogID = WordCatalog.CatalogID
	ORDER BY
	  WordCatalog.CatalogID ASC

	--SELECT @Ret = 1;
GO