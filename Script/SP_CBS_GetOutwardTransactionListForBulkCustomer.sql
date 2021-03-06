USE [ACH]
GO
/****** Object:  StoredProcedure [dbo].[CBS_GetOutwardTransactionListForBulkCustomer]    Script Date: 7/19/2022 3:37:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec [CBS_GetOutwardTransactionListForBulkCustomer] 'HV'
ALTER PROCEDURE [dbo].[CBS_GetOutwardTransactionListForBulkCustomer](@HV varchar(5))
AS
BEGIN
	DECLARE @CurDate varchar(8), @CBSOCEHV varchar(8),  @CBSOCERV varchar(8), @CBSIREHV varchar(8), @CBSIRERV varchar(8)
	--SELECT  @CurDate = CONVERT(varchar(8),GETDATE(),112)
	--select @CBSOCEHV =  @CurDate -- comment/remove in production 
	--select @CBSOCERV =  @CurDate -- comment/remove in production
	/*SELECT  @CurDate = CONVERT(varchar(8),GETDATE(),112), @CBSOCEHV =  CBSOCEHV, @CBSOCERV =  CBSOCERV, @CBSIREHV = CBSIREHV,  @CBSIRERV = CBSIRERV -- uncomment in UAT
	FROM ACH_BankSetting*/
	SELECT  @CurDate = CONVERT(varchar(8),GETDATE(),112), @CBSOCEHV =  CBSOCEHV, @CBSOCERV =  CBSOCERV, @CBSIREHV = CBSIREHV,  @CBSIRERV = CBSIRERV
	FROM ACH_BankSetting

	print '@CBSOCERV :'+@CBSOCERV

	IF (ISNULL(@CBSOCEHV,'') = @CurDate AND @HV='HV')
	BEGIN
		PRINT 'OCE HV ON'
		SELECT TOP 1 'OutwardHV' TableName, O.*
		FROM CBS_OCETransaction O, CBS_BulkCustomer B
		WHERE CBSResponse IS NULL
		AND MsgId IS NULL
		AND FCCRef IS NULL
		AND HV='OCHV'
		AND Envelop='OCE'
		AND O.BenefAccount = B.AccountNo -- rename to BenefAccount

		ORDER BY SLNO
	END

	ELSE IF (ISNULL(@CBSOCERV,'') = @CurDate  AND @HV='RV')
	BEGIN
		PRINT 'OCE RV ON'
		SELECT TOP 1 'OutwardRV' TableName, *
		FROM CBS_OCETransaction O, CBS_BulkCustomer B
		WHERE CBSResponse IS NULL
		AND MsgId IS NULL
		AND FCCRef IS NULL
		AND Envelop ='OCE'
		AND HV='OCRV'
		AND O.BenefAccount = B.AccountNo -- rename to BenefAccount

		ORDER BY SLNO
	END

	ELSE IF (ISNULL(@CBSIREHV,'') = @CurDate  AND @HV='IREHV')
	BEGIN
		PRINT 'IRE HV ON'
		SELECT TOP 1 'IREHV' TableName,  *
		FROM CBS_OCETransaction O, CBS_BulkCustomer B
		WHERE CBSResponse IS NULL
		AND MsgId IS NULL
		AND FCCRef IS NULL
		AND Envelop IN ('IRE')
		AND HV = 'OCHV'
		AND O.BenefAccount = B.AccountNo -- rename to BenefAccount

		ORDER BY SLNO


	END
	ELSE IF (ISNULL(@CBSIRERV,'') = @CurDate AND @HV='IRERV')
	BEGIN
		PRINT 'IRE RV ON'
		SELECT TOP 1 'IRERV' TableName,  *
		FROM CBS_OCETransaction O, CBS_BulkCustomer B
		WHERE CBSResponse IS NULL
		AND MsgId IS NULL
		AND FCCRef IS NULL
		AND Envelop IN ('IRE')
		AND HV = 'OCRV'
		AND O.BenefAccount = B.AccountNo -- rename to BenefAccount

		ORDER BY SLNO

	END

END