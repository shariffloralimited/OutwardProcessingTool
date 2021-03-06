USE [ACH]
GO
/****** Object:  StoredProcedure [dbo].[CBS_GetOutwardTransactionList]    Script Date: 7/19/2022 3:37:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[CBS_GetOutwardTransactionList](@HV varchar(5))
AS
BEGIN
	DECLARE @CurDate varchar(8), @CBSOCEHV varchar(8),  @CBSOCERV varchar(8), @CBSICERV varchar(8),@CBSICEHV varchar(8), @CBSOREHV varchar(8),  @CBSORERV varchar(8),@CBSIREHV varchar(8),  @CBSIRERV varchar(8), @CBSRetry varchar(8), @CheckID uniqueidentifier
	SELECT  @CurDate = CONVERT(varchar(8),GETDATE(),112), @CBSOCEHV =  CBSOCEHV, @CBSOCERV =  CBSOCERV, @CBSICERV = CBSICERV,@CBSICEHV = CBSICEHV, @CBSOREHV = CBSOREHV,  @CBSORERV = CBSORERV,@CBSIREHV = CBSIREHV,  @CBSIRERV = CBSIRERV
	FROM ACH_BankSetting

	print '@CBSOCERV :'+@CBSOCERV

		CREATE TABLE #CBSTemp
		(
			[TableName] [varchar](10) NULL,
			[SLNo] [int] NOT NULL,
			[Envelop] [varchar](3) NULL,
			[Branch] [varchar](10) NULL,
			[XREF] [varchar](16) NULL,
			[CheckID] [uniqueidentifier] NOT NULL,
			[HV] [varchar](4) NULL,
			[CCY] [varchar](3) NULL,
			[InstType] [char](3) NULL,
			[TxnBrn] [varchar](10) NULL,
			[InstDate] [varchar](20) NULL,
			[TxnDate] [varchar](20) NULL,
			[ValDate] [varchar](20) NULL,
			[RoutingNo] [varchar](9) NULL,
			[SerialNo] [varchar](10) NULL,
			[RemAccount] [varchar](20) NULL,
			[BenefAccount] [varchar](20) NULL,
			[Amount] [decimal](18, 2) NULL,
			[RemBranch] [varchar](10) NULL,
			[ReasonCode] [varchar](3) NULL,
			[RejectReason] [varchar](100) NULL,
			[MsgID] [varchar](50) NULL,
			[Status] [char](1) NULL,
			[FCCRef] [varchar](50) NULL,
			[CBSResponse] [varchar](50) NULL,
			[OrderSeq] [varchar](2),
			[TrCd] [varchar](3),
		)


	IF (ISNULL(@CBSOCEHV,'') = @CurDate AND @HV='HV')
	BEGIN
		PRINT 'OCE HV ON'
		INSERT INTO #CBSTemp	
		SELECT 'OutwardHV' TableName, *
		FROM CBS_OCETransaction
		WHERE CBSResponse IS NULL
		AND MsgId IS NULL
		AND FCCRef IS NULL
		AND HV='OCHV'
		AND Envelop='OCE'
		AND BenefAccount NOT IN (SELECT AccountNo from CBS_BulkCustomer)

		ORDER BY SLNO
	END

	ELSE IF (ISNULL(@CBSOCERV,'') = @CurDate  AND @HV='RV')
	BEGIN
		PRINT 'OCE RV ON'
		INSERT INTO #CBSTemp
		SELECT 'OutwardRV' TableName, *
		FROM CBS_OCETransaction
		WHERE CBSResponse IS NULL
		AND MsgId IS NULL
		AND FCCRef IS NULL
		AND Envelop ='OCE'
		AND HV='OCRV'
		AND BenefAccount NOT IN (SELECT AccountNo from CBS_BulkCustomer) -- rename to BenefAccount

		ORDER BY SLNO
	END
	
	ELSE IF (ISNULL(@CBSIREHV,'') = @CurDate  AND @HV='IREHV')
	BEGIN
		PRINT 'IRE HV ON'
		INSERT INTO #CBSTemp
		SELECT 'IREHV' TableName,  *
		FROM CBS_OCETransaction
		WHERE CBSResponse IS NULL
		AND MsgId IS NULL
		AND FCCRef IS NULL
		AND Envelop IN ('IRE')
		AND HV = 'OCHV'
		AND BenefAccount NOT IN (SELECT AccountNo from CBS_BulkCustomer) -- rename to BenefAccount
		ORDER BY SLNO


	END
	ELSE IF (ISNULL(@CBSIRERV,'') = @CurDate AND @HV='IRERV')
	BEGIN
		PRINT 'IRE RV ON'
		INSERT INTO #CBSTemp
		SELECT 'IRERV' TableName,  *
		FROM CBS_OCETransaction
		WHERE CBSResponse IS NULL
		AND MsgId IS NULL
		AND FCCRef IS NULL
		AND Envelop IN ('IRE')
		AND HV = 'OCRV'
		AND BenefAccount NOT IN (SELECT AccountNo from CBS_BulkCustomer) -- rename to BenefAccount
		ORDER BY SLNO

	END

	SELECT  TOP 50 * FROM #CBSTemp ORDER BY [OrderSeq] 

	drop table #CBSTemp

END