CREATE VIEW SKUPrice AS
SELECT 
	SKU.ID, 
	SKU.Code, 
	SKU.Name, 
	dbo.udf_GetSKUPrice(ID_SKU) AS ����������������
FROM SKU
	INNER JOIN Basket ON SKU.ID = Basket.ID_SKU;