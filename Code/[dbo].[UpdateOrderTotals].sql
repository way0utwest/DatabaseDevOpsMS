USE [PartsUnlimitedDB]
GO
/****** Object:  StoredProcedure [dbo].[UpdateOrderTotals]    Script Date: 3/13/2017 8:30:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[UpdateOrderTotals]

/*
Description:

Changes:
Date       Who         Notes
---------- ---         ---------------------------------------------------
3/13/2017  PLATO\Steve    
*/
AS
BEGIN
WITH OrderCTE (OrderID, total)
AS
( SELECT od.OrderId
 , SUM( od.Quantity * od.UnitPrice)
 FROM dbo.OrderDetail od
 GROUP BY OrderId
)
UPDATE dbo.[Order]
 SET Total = oc.total
  FROM OrderCTE oc
  WHERE oc.OrderId = [ORDER].orderid

END
