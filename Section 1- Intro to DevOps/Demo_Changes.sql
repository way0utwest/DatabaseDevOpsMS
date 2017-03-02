-- Change the Order table
ALTER TABLE [Order] ADD OrderStatus TINYINT NULL DEFAULT 0
GO
-- Update all orders to Open status
UPDATE dbo.[Order]
 SET OrderStatus = 1
GO
ALTER TABLE [Order] ALTER COLUMN OrderStatus TINYINT NOT NULL
GO
-- Create the new status table
CREATE TABLE Status
( StatusID INT
, StatusDisplay VARCHAR(50)
)
GO
-- Add data
INSERT Status (StatusID, StatusDisplay)
 VALUES (0, 'Unknown'), (1, 'Open'), (2, 'Shipped'), (3, 'Backlogged')
 GO
CREATE PROCEDURE ShipOrder
 @orderid INT
AS
BEGIN
BEGIN TRY
        UPDATE dbo.[Order]
    	 SET OrderStatus = 2
    	 WHERE OrderId = @orderid
    
END TRY
BEGIN CATCH
    THROW;
END CATCH
END
GO
EXEC tsqlt.NewTestClass @ClassName = N'tOrderTests'
 ;
GO
CREATE PROCEDURE [tOrderTests].[test Check ShipOrder sets proper status]
AS
BEGIN
	-- Assemble
    EXEC tsqlt.FakeTable @TableName = N'Order', @SchemaName = N'dbo';
	
	INSERT dbo.[Order]
	        ( OrderID)
	    VALUES
	        ( 1 )

	DECLARE @actual TINYINT, @expected tinyint;
	SELECT @expected = StatusID
	FROM dbo.Status
	WHERE StatusDisplay = 'Shipped';

	-- Act
	EXEC ShipOrder @orderid = 1;
	SELECT @actual = OrderStatus
	 FROM dbo.[Order]
	 WHERE OrderId = 1

	-- Assert
	EXEC tsqlt.AssertEquals @Expected = @expected, @Actual = @actual, @Message = N'Incorrect status set.'
	
END
