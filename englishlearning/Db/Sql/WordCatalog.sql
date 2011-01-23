UPDATE
	WordCatalog
SET
	CatalogName = :CatalogName,
	CatalogDisp = :CatalogDisp,
	UpdateTime = GetDate()
WHERE
	CatalogID = :CatalogID
	
INSERT INTO 
	WordCatalog(CatalogID, CatalogName, CatalogDisp, CreateTime, UpdateTime)
VALUES
	(:CatalogID, :CatalogName, :CatalogDisp, GetDate(), NULL)
	
DELETE FROM WordCatalog WHERE CatalogID = :CatalogID