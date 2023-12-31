USE [PartsUnlimitedDB]
GO
/****** Object:  StoredProcedure [tOrderTests].[test orders updated correctly.]    Script Date: 3/13/2017 8:31:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
ALTER PROCEDURE [tOrderTests].[test orders updated correctly.]
AS
BEGIN
    EXEC tsqlt.FakeTable @TableName = N'Order', @SchemaName = N'dbo'
	INSERT dbo.[Order]
	        ( OrderID
	        , Total
	        )
	    VALUES
	        ( 1, 0),
	        ( 2, 0),
	        ( 3, 0)

    EXEC tsqlt.FakeTable @TableName = N'OrderDetail', @SchemaName = N'dbo'
	INSERT dbo.OrderDetail
	        ( OrderId
	        , Quantity
	        , UnitPrice
	        )
	    VALUES
	        ( 1, 10, 10),
	        ( 1, 20, 10),
	        ( 2, 10, 5),
	        ( 3, 1, 4),
	        ( 3, 1, 10),
	        ( 3, 1, 6)
 
	CREATE TABLE tOrderTests.Expected (orderid INT, total DECIMAL(18,2))
	INSERT tOrderTests.Expected
	 VALUES (1, 300),
	        (2, 50),
			(3, 20)

	EXEC dbo.UpdateOrderTotals

	-- assert
	EXEC tsqlt.AssertEqualsTable @Expected = N'tOrderTests.Expected', @Actual = N'[dbo].[Order]', @FailMsg = N'The totals are incorrect.'
	

END;
