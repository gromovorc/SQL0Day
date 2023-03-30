CREATE FUNCTION dbo.udf_GetSKUPrice(@ID_SKU AS INT) 
	RETURNS decimal(18, 2) 
AS
BEGIN
	DECLARE @SKUPrice decimal(18, 2);
	SELECT @SKUPrice = SUM(Basket.Value) / SUM (Basket.Quantity) 
	FROM Basket 
	WHERE Basket.ID = @ID_SKU;
	IF (@SKUPrice IS NULL)
		SET @SKUPrice = 0;
	RETURN(@SKUPrice);
END;

