USE [ACH]
GO
/****** Object:  StoredProcedure [dbo].[CBS_TrancateBulkCustomer]    Script Date: 7/19/2022 3:36:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[CBS_TrancateBulkCustomer]
AS
BEGIN
	TRUNCATE TABLE [dbo].[CBS_BulkCustomer]
END