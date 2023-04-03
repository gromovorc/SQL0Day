CREATE FUNCTION dbo.udf_GetSKUPrice(@ID_SKU AS INT) 
	RETURNS decimal(18, 2) 
AS
BEGIN
	DECLARE @SKUPrice decimal(18, 2);
	SELECT @SKUPrice = isnull(SUM(Basket.Value) / SUM (Basket.Quantity), 0) 
	FROM Basket 
	WHERE Basket.ID = @ID_SKU;
	RETURN(@SKUPrice);
END;

