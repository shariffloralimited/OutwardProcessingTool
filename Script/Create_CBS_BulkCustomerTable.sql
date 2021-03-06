USE [ACH]
GO

/****** Object:  Table [dbo].[CBS_BulkCustomer]    Script Date: 7/19/2022 3:35:05 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CBS_BulkCustomer](
	[AccountNo] [varchar](18) NOT NULL,
 CONSTRAINT [PK_CBS_BulkCustomer] PRIMARY KEY CLUSTERED 
(
	[AccountNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


