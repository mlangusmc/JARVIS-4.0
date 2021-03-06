/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2014 (12.0.5590)
    Source Database Engine Edition : Microsoft SQL Server Enterprise Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/

USE [QEDRT]
GO
/****** Object:  StoredProcedure [RAP].[sp_LOGIC_JARVIS]    Script Date: 9/26/2018 1:11:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [RAP].[sp_LOGIC_JARVIS]
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
/*//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	SETUP SECTION
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

Project Schema:	[RAP]
Project Name:	Reports Automation Project - JARVIS_Illogical_Conditions
Descriptor:		LOGIC - Illogicals
Name:			

Author: 		[Lang, Holiday]
Date:			[2018-07-10]

Used By:		Stored Procedure - Logic_Assembly_FINAL

Description:	Put your code into relative BLOCKs of CODE and provide an OVERVIEW here:

Notes:  - Illogical Coverage Amount Tajia TEMP-Logic Removed 8/9/18

				AA.0	MAIN
				
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	MAIN BODY
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\*/

--            	AA.0			--

	--TRUNCATE TABLE	[RAP].[LOGIC_JARVIS]

   INSERT INTO		[RAP].[LOGIC_JARVIS]
   Select Jarvis_System_Complete_ID.*,

'System Complete Flag' =
		(case
		when	SUBSTRING(Jarvis_System_Complete_ID.[Overall Results], 0, 10) = 'No Action'
				and ([IllogicalCondition] = 'Dates Rolled But No Payment Made'
				or [IllogicalCondition] = 'Illogical Premium Amount' 
				or [IllogicalCondition] = 'Illogical Coverage Amount'
				or [IllogicalCondition] = 'Illogical Escrow Status Change'
				or [IllogicalCondition] = 'Invalid Coverage Codes'
				or [IllogicalCondition] = 'Rejected Payments'
				or [IllogicalCondition] = 'Illogical Expiration Date'
				or [IllogicalCondition] = 'Illogical Agency Billed Setup'
				or [IllogicalCondition] = 'Payee Changed But Policy Number The Same'
				or [IllogicalCondition] = 'No Track Pay Code'
				or [IllogicalCondition] = 'Date Mismatch'
				or [IllogicalCondition] = 'Escrowed Line Prem of 1'
				or [IllogicalCondition] = 'Payment Issued Past or Future Exp Date'
				or [IllogicalCondition] = 'High Premium Amount'
				or [IllogicalCondition] = 'Coverage Compared to UPB'
				or [IllogicalCondition] = 'Future Dated Cancels'
				or [IllogicalCondition] = 'Unknown Payee'
				or [IllogicalCondition] = 'LPI Pay Code But No LPI Payee'
				or [IllogicalCondition] = 'Illogical Coverage Code Changes'
				or [IllogicalCondition] = 'Illogical Term'
				or [IllogicalCondition] = 'Dates Advanced - Potential Fraud'
				or [IllogicalCondition] = 'Pending Payments with Rolled Dates'
				or [IllogicalCondition] = 'Premium Greater Than Coverage'
				or [IllogicalCondition] = 'High Coverage Amount'
				or [IllogicalCondition] = 'Payee Mismatch'
				or [IllogicalCondition] = 'Invalid Payment Code'
				or [IllogicalCondition] = 'Payments Made Dates Not Rolled'
				or [IllogicalCondition] = 'Coverage Amount of 0'
				or [IllogicalCondition] = 'Payments on New Loans'
				or [IllogicalCondition] = 'Unapplied Payments')
		then	'1'
		else	'0'
		end)

--	INTO			[RAP].[LOGIC_JARVIS]


from
(Select Jarvis_Overall_Results.*,

--///////////////  Overall Results & Master Governing Logic Section  (Combines "Report No Action" & "Overall Results" from Jarvis 3.0)  ///////////////

'Overall Results' = 
		(case	
		when	[ServiceBureauID]='300'
				and ([LoanDate] is NULL
				or	[LoanDate] >= DATEADD(day,-120,[ReportDate])
				or	[LoanDate] = '1/1/1900'
				or	[AcquisitionDate] >= DATEADD(day,-120,[ReportDate]))
				and	([CLINT_CPI_NUMBER] is NULL
				or	[InsCoCodePrevious] = 'FLOW'
				or	[InsCoCodePrevious] = '2MTGE'
				or	[InsCoCodePrevious] = 'UNKNOWN'
				or	[InsCoCodePrevious] = 'NEWLN'
				or	[InsCoCodePrevious] = 'BOARD'
				or	[InsCoCodePrevious] = 'PRIOR'
				or	[InsCoCodePrevious] = 'NULL'
				or	[InsCoCodePrevious] is NULL
				or	[AgentCodePrevious] = 'FLOW'
				or	[AgentCodePrevious] = '2MTGE'
				or	[AgentCodePrevious] = 'UNKNOWN'
				or	[AgentCodePrevious] = 'NEWLN'
				or	[AgentCodePrevious] = 'BOARD'
				or	[AgentCodePrevious] = 'PRIOR'
				or	[AgentCodePrevious] = 'NULL'
				or	[AgentCodePrevious] is NULL
				or	[InsCoCode] = 'FLOW'
				or	[InsCoCode] = '2MTGE'
				or	[InsCoCode] = 'UNKNOWN'
				or	[InsCoCode] = 'NEWLN'
				or	[InsCoCode] = 'BOARD'
				or	[InsCoCode] = 'PRIOR'
				or	[InsCoCode] = 'NULL'
				or	[InsCoCode] is NULL
				or	[AgentCode] = 'FLOW'
				or	[AgentCode] = '2MTGE'
				or	[AgentCode] = 'UNKNOWN'
				or	[AgentCode] = 'NEWLN'
				or	[AgentCode] = 'BOARD'
				or	[AgentCode] = 'PRIOR'
				or	[AgentCode] = 'NULL'
				or	[AgentCode] is NULL
				or	[PolicyNumberPrevious] = 'CLIENT CONTACTED'
				or	[PolicyNumberPrevious] = 'TBD'
				or	[PolicyNumberPrevious] = '0'
				or	[PolicyNumberPrevious] = 'NULL'
				or	([AgentCode] = 'CONDO'
				and	[PaymentType] = '7'))
		then	'No Action - Cenlar NLB Opportunities Process'
		when	([ServiceBureauID] = '515'
				or	[ServiceBureauID] = '760'
				or	[ServiceBureauID] = '176')
				and	([ReportType] = 'FloodIllogicalConditionPolicy22iMaint'
				or	[ReportType] = 'FloodIllogicalConditionRolledDates'
				or	[ReportType] = 'FloodIllogicalConditionDisbursements')
		then	'Exceptions - US Bank Flood'
		when	[LoanBalanceAmount] = '0'
				or	[LoanBalanceAmount] is NULL
				or	([ForeclosureStop] >= '8'
				and	[ServiceBureauID] <> '867')
				or	([ForeclosureStop] = '9'
				and	[ServiceBureauID] = '867')
		then	'No Action - Loan PIF/REO'
		when	[AcquisitionDate] is NULL
				and [CustomLineType] = '352'
				and [CoverageGroup] = 'Hazard'
		then	'Exceptions - Hazard On 352 Line'
		when	([ServiceBureauID] <> '942'
				or	[ServiceBureauID] <> '106'
				or	[ServiceBureauID] <> '472'
				or	[ServiceBureauID] <> '591'
				or	[ServiceBureauID] <> '685'
				or	[ServiceBureauID] <> '708'
				or	[ServiceBureauID] <> '747'
				or	[ServiceBureauID] <> '936')
				and	[CLINT_CPI_NUMBER] is NULL
				and	([LoanDate] >= DATEADD(day,-120,[ReportDate])
				or	[AcquisitionDate] >= DATEADD(day,-120,[ReportDate]))
				and	([InsCoCodePrevious] = 'UNKNOWN'
				or	[AgentCodePrevious] = 'COMCN'
				or	[AgentCodePrevious] = '7NWLN'
				or	[AgentCodePrevious] = '7NONO'
				or	[AgentCodePrevious] = '7NOFD'
				or	[AgentCodePrevious] = '7E088'
				or	[AgentCodePrevious] = 'NEWLN'
				or	[AgentCodePrevious] = 'BOARD'
				or	[AgentCodePrevious] = 'PRIOR'
				or	[AgentCodePrevious] is NULL
				or	[InsCoCodePrevious] = 'UNKNOWN'
				or	[InsCoCodePrevious] = 'COMCN'
				or	[InsCoCodePrevious] = '7NWLN'
				or	[InsCoCodePrevious] = '7NONO'
				or	[InsCoCodePrevious] = '7NOFD'
				or	[InsCoCodePrevious] = '7E088'
				or	[InsCoCodePrevious] = 'NEWLN'
				or	[InsCoCodePrevious] = 'BOARD'
				or	[InsCoCodePrevious] = 'PRIOR'
				or	[InsCoCodePrevious] is NULL)
				and	SUBSTRING(Jarvis_Overall_Results.[Report No Action Detail], 0, 10) <> 'No Action'
		then	'No Action - Client NLB Process & No Doc Received'	
		when	([IllogicalCondition] = 'Illogical Agency Billed Setup'
				or	[IllogicalCondition] = 'Unapplied Payments'
				or	[IllogicalCondition] = 'Rejected Payments')
				and	SUBSTRING(Jarvis_Overall_Results.[Report No Action Detail], 0, 10) <> 'No Action'
		then	'Exceptions - Unapplied/Rejected/Agency Billed'
		when	[IllogicalCondition] = 'Dates Rolled But No Payment Made'
				and (ABS(DATEDIFF(day,[ProcessEligibleDate],[ExpirationDate])) >= 730)
				and	[PolicyTerm] <> '36'
		then	'Exceptions - Exp > 730'
		when	SUBSTRING(Jarvis_Overall_Results.[Report No Action Detail], 0, 10) = 'No Action'
		then	'No Action'
		when	SUBSTRING(Jarvis_Overall_Results.[SFL AutoProcess], 0, 10) = 'No Action'
		then	'No Action - SFL AutoProcess'
		when	SUBSTRING(Jarvis_Overall_Results.[Specialty Payee No Action], 0, 10) = 'No Action'
		then	'No Action - Specialty Payee'
		else	'Exceptions'
		end)


from
(Select Jarvis_NA_Detail.*,

--///////////////  Report No Action Summary Section  ///////////////

'Report No Action Detail' = 
		(case
		when	[IllogicalCondition] = 'Dates Rolled But No Payment Made'
		then	Jarvis_NA_Detail.[Dates Rolled But No Payment Made]
		when	[IllogicalCondition] = 'Illogical Premium Amount'
		then	Jarvis_NA_Detail.[Illogical Premium Amount]
		when	[IllogicalCondition] = 'Illogical Coverage Amount'
		then	Jarvis_NA_Detail.[Illogical Coverage Amount]
		when	[IllogicalCondition] = 'Illogical Escrow Status Change'
		then	Jarvis_NA_Detail.[Illogical Escrow Status Change]
		when	[IllogicalCondition] = 'Invalid Coverage Codes'
		then	Jarvis_NA_Detail.[Invalid Coverage Codes]
		when	[IllogicalCondition] = 'Rejected Payments'
		then	Jarvis_NA_Detail.[Rejected Payments]
		when	[IllogicalCondition] = 'Illogical Expiration Date'
		then	Jarvis_NA_Detail.[Illogical Expiration Date]
		when	[IllogicalCondition] = 'Illogical Agency Billed Setup'
		then	Jarvis_NA_Detail.[Illogical Agency Billed Setup]
		when	[IllogicalCondition] = 'Payee Changed But Policy Number The Same'
		then	Jarvis_NA_Detail.[Payee Changed But Policy Number The Same]
		when	[IllogicalCondition] = 'No Track Pay Code'
		then	Jarvis_NA_Detail.[No Track Pay Code]
		when	[IllogicalCondition] = 'Date Mismatch'
		then	Jarvis_NA_Detail.[Date Mismatch]
		when	[IllogicalCondition] = 'Escrowed Line Prem of 1'
		then	Jarvis_NA_Detail.[Escrowed Line Prem of 1]
		when	[IllogicalCondition] = 'Payment Issued Past or Future Exp Date'
		then	Jarvis_NA_Detail.[Payment Issued Past or Future Exp Date]
		when	[IllogicalCondition] = 'High Premium Amount'
		then	Jarvis_NA_Detail.[High Premium Amount]
		when	[IllogicalCondition] = 'Coverage Compared to UPB'
		then	Jarvis_NA_Detail.[Coverage Compared to UPB]
		when	[IllogicalCondition] = 'Future Dated Cancels'
		then	Jarvis_NA_Detail.[Future Dated Cancels]
		when	[IllogicalCondition] = 'Unknown Payee'
		then	Jarvis_NA_Detail.[Unknown Payee]
		when	[IllogicalCondition] = 'LPI Pay Code But No LPI Payee'
		then	Jarvis_NA_Detail.[LPI Pay Code But No LPI Payee]
		when	[IllogicalCondition] = 'Illogical Coverage Code Changes'
		then	Jarvis_NA_Detail.[Illogical Coverage Code Changes]
		when	[IllogicalCondition] = 'Illogical Term'
		then	Jarvis_NA_Detail.[Illogical Term]
		when	[IllogicalCondition] = 'Dates Advanced - Potential Fraud'
		then	Jarvis_NA_Detail.[Dates Advanced - Potential Fraud]
		when	[IllogicalCondition] = 'Pending Payments with Rolled Dates'
		then	Jarvis_NA_Detail.[Pending Payments with Rolled Dates]
		when	[IllogicalCondition] = 'Premium Greater Than Coverage'
		then	Jarvis_NA_Detail.[Premium Greater Than Coverage]
		when	[IllogicalCondition] = 'High Coverage Amount'
		then	Jarvis_NA_Detail.[High Coverage Amount]
		when	[IllogicalCondition] = 'Payee Mismatch'
		then	Jarvis_NA_Detail.[Payee Mismatch]
		when	[IllogicalCondition] = 'Invalid Payment Code'
		then	Jarvis_NA_Detail.[Invalid Payment Code]
		when	[IllogicalCondition] = 'Payments Made Dates Not Rolled'
		then	Jarvis_NA_Detail.[Payments Made Dates Not Rolled]
		when	[IllogicalCondition] = 'Coverage Amount of 0'
		then	Jarvis_NA_Detail.[Coverage Amount of 0]
		when	[IllogicalCondition] = 'Payments on New Loans'
		then	Jarvis_NA_Detail.[Payments on New Loans]
		when	[IllogicalCondition] = 'Unapplied Payments'
		then	Jarvis_NA_Detail.[Unapplied Payments]
		else	NULL
		end)


from
(Select *,

--///////////////  Report Details Section  ///////////////

'SFL AutoProcess' = 
		(case
		when	(([IllogicalCondition] = 'Illogical Premium Amount'
				or	[IllogicalCondition] = 'High Premium Amount')
--				and	[PremiumAmountPrevious] >= '2'
				and	[PremiumAmountPrevious] >= '100'
				and	[PremiumAmount] >= [PremiumAmountPrevious]*9.5)
				or	(([IllogicalCondition] = 'Illogical Coverage Amount'
				or	[IllogicalCondition] = 'High Coverage Amount')
				and	[CoverageAmountPrevious] >= '1'
				and	([CoverageAmount] >= [CoverageAmountPrevious]*9.5
				or	[CoverageAmount] <= [CoverageAmountPrevious]*.1))
		then	'Exceptions - Factor of 9.5'
		when	[IllogicalCondition] = 'Future Dated Cancels'
				or [IllogicalCondition] = 'Unapplied Payments'
				or [IllogicalCondition] = 'Illogical Agency Billed Setup'
				or [IllogicalCondition] = 'Rejected Payments'
				or [IllogicalCondition] = 'Illogical Expiration Date'
		then	'Exceptions - Future Dated/Unapplied/Rejected/Agency Billed Setup'
		when	(((DATEPART(weekday,[ProcessEligibleDate]) >= '3')
				and	(ABS(DATEDIFF(weekday,[ITEM_COMPLETED],[ProcessEligibleDate])) <= 1))
				or	((DATEPART(weekday,[ProcessEligibleDate]) <= '2')
				and	(ABS(DATEDIFF(weekday,[ITEM_COMPLETED],[ProcessEligibleDate])) <= 3)))
				and (([ITEM_POL_AG_PAYEE] = [AgentCode]
				or	[ITEM_POL_AG_PAYEE] is NULL)
				or	([ITEM_POL_INS_PAYEE] = [InsCoCode]
				or	[ITEM_POL_INS_PAYEE] is NULL))
				and	([IllogicalCondition] = 'Illogical Term'
				or	[IllogicalCondition] =	'Payments on New Loans'
				or	[IllogicalCondition] =	'Escrowed Line Prem of 1'
				or	[IllogicalCondition] =	'Payments Made Dates Not Rolled'
				or	[IllogicalCondition] =	'Pending Payments with Rolled Dates'
				or	[IllogicalCondition] =	'Dates Rolled But No Payment Made'
				or	[IllogicalCondition] =	'Illogical Escrow Status Change'
				or	[IllogicalCondition] =	'Date Mismatch')
				and	([ITEM_ACTION_STATUS] = '8' 
				or	[ITEM_ACTION_STATUS] =	'12'
				or	[ITEM_ACTION_STATUS] =	'25'
				or	[ITEM_ACTION_STATUS] =	'31'
				or	[ITEM_ACTION_STATUS] =	'91')
		then	'No Action'
		when	(((DATEPART(weekday,[ProcessEligibleDate]) >= '5')
				and	(ABS(DATEDIFF(weekday,[ITEM_COMPLETED],[ProcessEligibleDate])) <= 3))
				or	((DATEPART(weekday,[ProcessEligibleDate]) <= '4')
				and	(ABS(DATEDIFF(weekday,[ITEM_COMPLETED],[ProcessEligibleDate])) <= 5)))
				and ([ITEM_POL_AG_PAYEE] = [AgentCode]
				or	[ITEM_POL_AG_PAYEE] is NULL)
				and	([ITEM_POL_INS_PAYEE] = [InsCoCode]
				or	[ITEM_POL_INS_PAYEE] is NULL)
				and	([ITEM_POL_NUMBER] = [PolicyNumber]
				or	[ITEM_POL_NUMBER] = [PolicyNumberPrevious]
				or	[ITEM_POL_NUMBER] is NULL)
				and	[IllogicalCondition] = 'Illogical Premium Amount'
				and	([ITEM_ACTION_STATUS] = '8' 
				or	[ITEM_ACTION_STATUS] = '12'
				or	[ITEM_ACTION_STATUS] = '25'
				or	[ITEM_ACTION_STATUS] = '31'
				or	[ITEM_ACTION_STATUS] = '91')
		then	'No Action - Ill. PremAmt'
		when	(((DATEPART(weekday,[ProcessEligibleDate]) >= '5')
				and	(ABS(DATEDIFF(weekday,[ITEM_COMPLETED],[ProcessEligibleDate])) <= 15))
				or	((DATEPART(weekday,[ProcessEligibleDate]) <= '4')
				and	(ABS(DATEDIFF(weekday,[ITEM_COMPLETED],[ProcessEligibleDate])) <= 17)))
				and ([ITEM_POL_AG_PAYEE] = [AgentCode]
				or	[ITEM_POL_AG_PAYEE] is NULL)
				and	([ITEM_POL_INS_PAYEE] = [InsCoCode]
				or	[ITEM_POL_INS_PAYEE] is NULL)
				and	([IllogicalCondition] <> 'Illogical Term'
				or	[IllogicalCondition] <> 'Payments on New Loans'
				or	[IllogicalCondition] <> 'Escrowed Line Prem of 1'
				or	[IllogicalCondition] <> 'Payments Made Dates Not Rolled'
				or	[IllogicalCondition] <> 'Pending Payments with Rolled Dates'
				or	[IllogicalCondition] <> 'Dates Rolled But No Payment Made'
				or	[IllogicalCondition] <> 'Illogical Agency Billed Setup'
				or	[IllogicalCondition] <> 'Illogical Premium Amount'
				or	[IllogicalCondition] <>	'Date Mismatch')
				and	([ITEM_ACTION_STATUS] = '8' 
				or	[ITEM_ACTION_STATUS] = '12'
				or	[ITEM_ACTION_STATUS] = '25'
				or	[ITEM_ACTION_STATUS] = '31'
				or	[ITEM_ACTION_STATUS] = '91')
		then	'No Action'
		else	'Exceptions'
		end),
		
'Specialty Payee No Action' = 
		(case	
		when	[IllogicalCondition] = 'Future Dated Cancels'
				or [IllogicalCondition] = 'Unapplied Payments'
				or [IllogicalCondition] = 'Illogical Agency Billed Setup'
				or [IllogicalCondition] = 'Rejected Payments'
		then	'Exceptions - Future Dated/Unapplied/Rejected/Agency Billed/Exp'
		when	([ReportType] = 'IllogicalConditionPolicy22iMaint' 
				or	[ReportType] = 'IllogicalConditionRolledDates'
				or	[ReportType] = 'IllogicalConditionDisbursements'
				or	[ReportType] = 'FloodIllogicalConditionPolicy22iMaint'
				or	[ReportType] = 'FloodIllogicalConditionRolledDates'
				or	[ReportType] = 'FloodIllogicalConditionDisbursements')
				and	([AgentCode] = 'XXXXX'
				or	[InsCoCode]	 = 'ASBIN' 
				or	[InsCoCode]  = 'ASPOL' 
				or  [InsCoCode]  = 'ASWND' 
				or  [InsCoCode]  = 'ASFLD' 
				or  [InsCoCode]  = 'ASPWF' 
				or  [InsCoCode]  = 'ASREO' 
				or  [InsCoCode]  = 'NOTRK' 
				or  [InsCoCode]  = 'PAYEE' 
				or  [InsCoCode]  = 'LPCAN' 
				or  [InsCoCode]  = 'WIN33' 
				or  [InsCoCode]  = '*ASG*'
				or  [InsCoCode]  = 'EDIUS'				
				or  [InsCoCode]  = 'EDIAL'
				or  [InsCoCode]  = 'EDIFA'
				or  [InsCoCode]  = 'EDIAF'
				or  [InsCoCode]  = 'EDIKE'
				or  [InsCoCode]  = 'EDISA'
				or  [InsCoCode]  = 'EDITR'
				or  [InsCoCode]  = 'EDIER'
				or  [InsCoCode]  = 'EDINA'
				or  [InsCoCode]  = 'EDIST'
				or  [InsCoCode]  = 'EDILM')
		then	'No Action'
		else	'Exceptions'
		end),
		
'Dates Rolled But No Payment Made' =  
		(case
		when	[IllogicalCondition] = 'Dates Rolled But No Payment Made'
				and [ServiceBureauID] = '194'
				and ABS([PremiumAmountPrevious] - [PremiumAmount]) > '500'
		then	'Exceptions - Client 194 $500 Logic'
		when	[IllogicalCondition] = 'Dates Rolled But No Payment Made'
				and [ExpirationDate] > DATEADD(DAY,+730,[ReportDate])
				and	[PolicyTerm] <> '36'
		then	'Exceptions - ExpDate > 730'
		when	[IllogicalCondition] = 'Dates Rolled But No Payment Made'
				and [ExpirationDate] > DATEADD(DAY,+120,[ReportDate])
				and ([AgentCode] = 'XXXXX'
				or	[AgentCode] = '7CNCL')
		then	'Exceptions - CNCL Pol & ExpDate > 120'
		when	[IllogicalCondition] = 'Dates Rolled But No Payment Made'
				and [PremiumAmount] < '100'
		then	'No Action - PremAmt < $100'
		when	[IllogicalCondition] = 'Dates Rolled But No Payment Made'
				and ([PaymentType] = '7'
				or	[PaymentType] = '8')
		then	'No Action - PaymentType = 7 or 8'
		when	[IllogicalCondition] = 'Dates Rolled But No Payment Made'
				and [EffectiveDate] >= DATEADD(DAY,+21,[ReportDate])
				and [EffectiveDate] <= DATEADD(DAY,+1095,[ReportDate])
				and [ServiceBureauID] <> '933'
		then	'No Action - Future Dated Policies'
		when	[IllogicalCondition] = 'Dates Rolled But No Payment Made'
				and	(([AcquisitionDate] >= DATEADD(DAY,-120,[ReportDate]))
				or ([LoanDate] >= DATEADD(DAY,-120,[ReportDate])))
				and [ServiceBureauID] <> '277'
				and [ServiceBureauID] <> '708'
				and [ServiceBureauID] <> '936'
				and ([InsCoCode] = [InsCoCodePrevious]
				or	[InsCoCodePrevious] = 'NEWLN'
				or	[CLINT_CPI_NUMBER] is NULL)
				and ([ITEM_POL_INS_PAYEE] = [InsCoCode]
				or	[InsCoCodePrevious] = 'NEWLN'
				or	[ITEM_POL_INS_PAYEE] is NULL
				or	[CLINT_CPI_NUMBER] is NULL)
		then	'No Action - Acq/Loan Date within 120 days & no Payee Change'
		when	[IllogicalCondition] = 'Dates Rolled But No Payment Made'
				and	(([AcquisitionDate] >= DATEADD(DAY,-55,[ReportDate]))
					or ([LoanDate] >=DATEADD (DAY,-55,[ReportDate])))
				and [InsCoCode] = [InsCoCodePrevious]
				and ([ServiceBureauID] = '708'
				or	[ServiceBureauID] = '936')
				and ([ITEM_POL_INS_PAYEE] is NULL
				or	[ITEM_POL_INS_PAYEE] = [InsCoCode])
		then	'No Action - Acq/Loan Date within 55 days & no Payee Change'
		when	[IllogicalCondition] = 'Dates Rolled But No Payment Made'
				and ([AgentCode] = 'LPCAN'
				or	[AgentCode] = 'EDIAL'
				or	[AgentCode] = 'PAYEE'
				or	[AgentCode] = 'XXXXX'
				or	[AgentCode] = 'EDIAF'
				or	[AgentCode] = 'EDIKE'
				or	[AgentCode] = 'EDISA'
				or	[AgentCode] = 'EDITR'
				or	[AgentCode] = 'EDIER'
				or	[AgentCode] = 'EDINA'
				or	[AgentCode] = 'EDIST'
				or	[AgentCode] = 'EDIUS'
				or	[AgentCode] = 'EDIFA'
				or	[AgentCode] = 'EDILM')
		then	'No Action - Agent Specialty Payee'
		when	[IllogicalCondition] = 'Dates Rolled But No Payment Made'
				and ([AgentCodePrevious] = '7CNCL'
				or	[AgentCodePrevious]  = 'ASBIN'
				or	[AgentCodePrevious]  = 'CONDO'
				or	[AgentCodePrevious]  = 'LPMOD'
				or	[AgentCodePrevious]  = 'LPRST'
				or	[AgentCodePrevious]  = 'NOINF'
				or	[AgentCodePrevious]  = 'REMAP'
				or	[AgentCodePrevious]  = 'VACNT'
				or	[AgentCodePrevious]  = 'WDRQD'
				or	[AgentCodePrevious]  = 'XXXXX'
				or	[AgentCodePrevious]  = 'ZONEI'
				or	[AgentCodePrevious]  = 'ASPOL'
				or	[AgentCodePrevious]  = 'ASWND'
				or	[AgentCodePrevious]  = 'ASFLD'
				or	[AgentCodePrevious]  = 'ASPWF'
				or	[AgentCodePrevious]  = 'ASREO'
				or	[AgentCodePrevious]  = 'NOTRK'
				or	[AgentCodePrevious]  = 'PAYEE'
				or	[AgentCodePrevious]  = 'LPCAN'
				or	[AgentCodePrevious]  = 'WIN33'
				or	[AgentCodePrevious]  = 'WWIO8'
				or	[AgentCodePrevious]  = 'SCO00'
				or	[AgentCodePrevious]  = 'SAF98'
				or	[AgentCodePrevious]  = 'FLGAP'
				or	[AgentCodePrevious]  = '*ASG*'
				or	[AgentCodePrevious]  = 'EDIUS'				
				or	[AgentCodePrevious]  = 'EDIAL'
				or	[AgentCodePrevious]  = 'EDIFA'
				or	[AgentCodePrevious]  = 'EDIAF'
				or	[AgentCodePrevious]  = 'EDIKE'
				or	[AgentCodePrevious]  = 'EDISA'
				or	[AgentCodePrevious]  = 'EDITR'
				or	[AgentCodePrevious]  = 'EDIER'
				or	[AgentCodePrevious]  = 'EDINA'
				or	[AgentCodePrevious]  = 'EDIST'
				or	[AgentCodePrevious]  = 'EDILM')
		then	'No Action - Agent Previous Specialty Payee'
		when	[IllogicalCondition] = 'Dates Rolled But No Payment Made'
				and [ITEM_POL_PREMIUM] = '0'
				and [CLINT_CPI_NUMBER] is not NULL
				and ((DATEPART(weekday,[ProcessEligibleDate]) >= '5')
				and	(ABS(DATEDIFF(day,[ITEM_COMPLETED],[ProcessEligibleDate])) <= 3))
		then	'No Action - PolPrem = 0 (Thu-Fri)'
		when	[IllogicalCondition] = 'Dates Rolled But No Payment Made'
				and [ITEM_POL_PREMIUM] = '0'
				and [CLINT_CPI_NUMBER] is not NULL
				and ((DATEPART(weekday,[ProcessEligibleDate]) <= '4')
				and	(ABS(DATEDIFF(day,[ITEM_COMPLETED],[ProcessEligibleDate])) <= 5))
		then	'No Action - PolPrem = 0 (Mon-Wed)'
		when	[IllogicalCondition] = 'Dates Rolled By No Payment Made'
				and	[PolicyTerm] = '36'
				and	[ExpirationDate] = [ExpirationDatePrevious]
				and	SUBSTRING([PolicyNumber],1,3) = 'BAN'
		then	'No Action - Multi-Year Policy'
		when	[IllogicalCondition] = 'Dates Rolled But No Payment Made'
		then	'Exceptions'
		else	NULL
		end),

'Illogical Premium Amount' = 
		(case	
		when	[IllogicalCondition] = 'Illogical Premium Amount'
				and	(([InsCoCode] = [ITEM_POL_INS_PAYEE])
				or	([AgentCode] = [ITEM_POL_AG_PAYEE])
				or	([ITEM_POL_INS_PAYEE] is NULL)
				or	([ITEM_POL_AG_PAYEE] is NULL))
				and	((FLOOR([PremiumAmount]) = FLOOR([ITEM_ANNUAL_PREM]))
				or	(FLOOR([PremiumAmount]) = FLOOR([ITEM_POL_PREMIUM])))
				and	[PremiumAmount] <= [PremiumAmountPrevious]*9.5
		then	'No Action - Matching Premium Amounts'
		when	[IllogicalCondition] = 'Illogical Premium Amount'
				and [ITEM_ACTION_STATUS] <> '3' 
				and [ITEM_ACTION_STATUS] <> '5' 
				and [ITEM_ACTION_STATUS] <> '93' 
				and [ITEM_SOURCE] = '8' 
				and [ITEM_COMPLETED] >= DATEADD(DAY,-5,[ReportDate])
				and [PremiumAmount] <= [PremiumAmountPrevious]*9.5
		then	'No Action - EDI Business Rull Process (Pre)'
		when	[IllogicalCondition] = 'Illogical Premium Amount'
				and	[PremiumAmount] >= [PremiumAmountPrevious]*9.5
				and (FLOOR([PremiumAmount]) = FLOOR([ITEM_ANNUAL_PREM])
				or	FLOOR([PremiumAmount]) = FLOOR([ITEM_POL_PREMIUM]))
				and	[PremiumAmountPrevious] < '100'
				and	[PremiumAmount] < '10000'
		then	'No Action - Premium Already Corrected'
		when	[IllogicalCondition] = 'Illogical Premium Amount'
				and	[PremiumAmountPrevious] >= '2'
				and	[PremiumAmount] >= [PremiumAmountPrevious]*9.5
				and [ITEM_SOURCE] <> '8'
		then	'Exceptions - Factor of 9.5'
		when	[IllogicalCondition] = 'Illogical Premium Amount'
				and	[PremiumAmountPrevious] >= '2'
				and	[PremiumAmount] >= [PremiumAmountPrevious]*2
				and	[PremiumAmount] >= '20000'
				and [ITEM_SOURCE] <> '8'
		then	'Exceptions - High Prem Factor of 2'
		when	[IllogicalCondition] = 'Illogical Premium Amount'
				and [ITEM_ACTION_STATUS] <> '3' 
				and [ITEM_ACTION_STATUS] <> '5' 
				and [ITEM_ACTION_STATUS] <> '93' 
				and [ITEM_SOURCE] = '8' 
				and [ITEM_COMPLETED] >= DATEADD(DAY,-5,[ReportDate])
		then	'No Action - EDI Business Rule Process (Post)'
		when	[IllogicalCondition] = 'Illogical Premium Amount'
				and	([AgentCodePrevious] = 'XXXXX'
				or	[AgentCodePrevious] = '7CNCL')
				and	([AgentCodePrevious] = [ITEM_POL_AG_PAYEE]
				or	[InsCoCodePrevious] = [ITEM_POL_INS_PAYEE])
				and	[ITEM_POL_NUMBER] = [PolicyNumberPrevious]
				and	(FLOOR([ITEM_POL_PREMIUM]) = FLOOR([PremiumAmountPrevious])
				or	[ITEM_POL_PREMIUM] = '0'
				or	FLOOR([ITEM_ANNUAL_PREM]) = FLOOR([PremiumAmountPrevious]))
		then	'No Action - Doc is Prior Cancelled Coverage'
		when	[IllogicalCondition] = 'Illogical Premium Amount'
				and	[DisbursementCodeDate] >= DATEADD(day,-5,[ReportDate])
				and	FLOOR([LastDisbursementAmount]) = FLOOR([PremiumAmountPrevious])
				and	[CLINT_CPI_NUMBER] is NULL
		then	'No Action - Prem Corrected / Prior Prem Was Payment'
		when	[IllogicalCondition] = 'Illogical Premium Amount'
		then	'Exceptions'
		else	NULL 
		end),
		
'Illogical Coverage Amount' = 
		(case 	
		when	[IllogicalCondition] = 'Illogical Coverage Amount'
				and [GroupName] is NULL
				or
				[IllogicalCondition] = 'Illogical Coverage Amount'
				and [ServiceBureauID] = '618'
		then	'Exceptions - PennyMac'
		when	[IllogicalCondition] = 'Illogical Coverage Amount'
				and [CustomLineType] = '352'
				and [ExpirationDate] < DATEADD(DAY,0,[ReportDate])
				and FLOOR([LoanBalanceAmount]) = FLOOR([CoverageAmount])
		then	'No Action - 352 Line w/old ExpDate and LoanBal = CovAmt'
		when	[IllogicalCondition] = 'Illogical Coverage Amount'
				and [CoverageAmount] <= [CoverageAmountPrevious]*9.5
				and	[CoverageAmount] >= [CoverageAmountPrevious]*.1
				and FLOOR([ITEM_POL_COV_AMNT]) = FLOOR([CoverageAmount])
				and	[ITEM_POL_COV_AMNT] is not NULL
		then	'No Action - Matching CovAmts'
		when	[IllogicalCondition] = 'Illogical Coverage Amount'
				and [CustomLineType] = '352'
				and [CoverageAmount] <= [CoverageAmountPrevious]*9.5
				and	[CoverageAmount] >= [CoverageAmountPrevious]*.1
				and [ServiceBureauID] <> '277'
				and ([AgentCode] = 'CONDO'
				or	[AgentCode] = 'MMMMM')
		then	'No Action - Flood Agent Code = CONDO or MMMMM'
		when	[IllogicalCondition] = 'Illogical Coverage Amount'
				and [CustomLineType] <> '352'
				and [CoverageAmount] <= [CoverageAmountPrevious]*9.5
				and	[CoverageAmount] >= [CoverageAmountPrevious]*.1
				and [ServiceBureauID] <> '277'
				and ([AgentCode] = 'CONDO'
				or	[AgentCode] = 'MMMMM')
		then	'No Action - Agent Code = CONDO or MMMMM'
		when	[IllogicalCondition] = 'Illogical Coverage Amount'
				and ([CoverageGroup] = 'FLOOD'
				or	[CustomLineType] = '352')
				and [CoverageAmount] = '250000'
		then	'No Action - Flood line with $250k Coverage'
		when	[IllogicalCondition] = 'Illogical Coverage Amount'
				and (([ForcedCoverageIndicator] = 'S')
				or	([ForcedCoverageIndicator] = 'R'))
		then	'No Action - Forced Coverage Indicator S or R'
		when	[IllogicalCondition] = 'Illogical Coverage Amount'
		then	'Exceptions'
		else	NULL 
		end),
		
'Illogical Escrow Status Change' = 
		(case	
		when	[IllogicalCondition] = 'Illogical Escrow Status Change' 
				and ([InsCoCode] = 'ASPOL' 
				or	[InsCoCode] = 'ASBIN')
				and [EscrowStatus] = 'Escrow' 
				and [PaymentType] = '2'
		then	'No Action - ASPOL/ASBIN Escrowed Loan that is PayType = 2'
		when	[IllogicalCondition] = 'Illogical Escrow Status Change'
				and (([LoanDate] >= DATEADD(day,-120,[ReportDate]))
				or	([AcquisitionDate] >= DATEADD(day,-120,[ReportDate])))
				and	([InsCoCode] = 'CONDO'
				or	[AgentCode] = 'CONDO'
				or	[PolicyNumberPrevious] = 'NEW LOAN'
				or	[PolicyNumberPrevious] = 'NEED WIND'
				or	[PolicyNumberPrevious] = 'NO POLICY NUMBER'
				or	[PolicyNumberPrevious] = 'NO POLICY RECEIVED'
				or	[PolicyNumberPrevious] = 'MISSING'
				or	[PolicyNumberPrevious] = 'NEED CONDO POLICY'
				or	[PolicyNumberPrevious] = 'OH BLANKET COVERAGE'
				or	[PolicyNumberPrevious] = 'REQ POL'
				or	[PolicyNumberPrevious] = 'MP NEEDED'
				or	[PolicyNumberPrevious] = 'MASTERPOLICY'
				or	[PolicyNumberPrevious] = 'MASTER POLICY'
				or	[PolicyNumberPrevious] = 'MASTER POLICY REQ'
				or	[PolicyNumberPrevious] = 'REQ POLICY'
				or	[PolicyNumberPrevious] = 'NOT AVAILABLE'
				or	[PolicyNumberPrevious] = 'NEED FLOOD'
				or	[PolicyNumberPrevious] = 'POLICY REQUESTED'
				or	[PolicyNumberPrevious] = 'REQ POLICY'
				or	[PolicyNumberPrevious] = 'MISSING'
				or	[PolicyNumberPrevious] = 'NEW GCX LOAN'
				or	[PolicyNumberPrevious] = 'NEW LOAN FLOOD REQ'
				or	[PremiumAmountPrevious] = '0'
				or	[PolicyNumber] = 'REO BANK OWNED')
		then	'No Action - Recent Loan Closing & New Policy Added'
		when	[IllogicalCondition] = 'Illogical Escrow Status Change'
				and ([ForeclosureStop] >= '8'
				or	[AgentCode] = 'CONDO'
				or	[AgentCode] = 'FNMAE'
				or	([AgentCode] = 'NOINF'
				and	[AgentCodePrevious] = 'NOINF')
				or	[InsCoCodePrevious] = 'CONDO'
				or	[InsCoCodePrevious] = 'ASPOL'
				or	[InsCoCodePrevious] = 'OHWOR'
				or	[InsCoCodePrevious] = 'ASFLD'
				or	[InsCoCodePrevious] = 'ZONEI'
				or	[InsCoCodePrevious] = 'ASWND')
		then	'No Action - Foreclosure or Specialty Payee'
		when	[IllogicalCondition] = 'Illogical Escrow Status Change'
		then	'Exceptions'
		else	NULL 
		end),

'Invalid Coverage Codes' = 
		(case
		when	[IllogicalCondition] = 'Invalid Coverage Codes'
				and ([AgentCode] = '11111'
				or	[AgentCode] = 'CHGOF'
				or	[AgentCode] = '7NOFD'
				or	[AgentCode] = 'FDGAP'
				or	[AgentCode] = 'LPRST')
		then	'No Action - AgentCode - 11111, CHGOF, 7NOFD, FDGAP or LPRST'
		when	[IllogicalCondition] = 'Invalid Coverage Codes'
		then	'Exceptions'
		else	NULL
		end),

'Illogical Expiration Date' = 
		(case
		when	[IllogicalCondition] = 'Illogical Expiration Date'
				and ([AgentCode] = 'CONDO'
				or	[AgentCode] = 'FNMAE')
		then	'No Action - Condo or FNMAE'
		when	[IllogicalCondition] = 'Illogical Expiration Date'
				and [ExpirationDate] > DATEADD(DAY,+1150,[ReportDate])
				and [ExpirationDate] < DATEADD(DAY,+3650,[ReportDate])
				and [CoverageAmount] < '500000'
		then	'Exceptions - Greater than 3 years'
		when	[IllogicalCondition] = 'Illogical Expiration Date'
				and [ITEM_POLCY_EXPDATE] = [ExpirationDate]
		then	'No Action - Matching ExpDates'
		when	[IllogicalCondition] = 'Illogical Expiration Date'
				and	[PolicyTerm] = '36'
				and	[ExpirationDate] = [ExpirationDatePrevious]
				and	SUBSTRING([PolicyNumber],1,3) = 'BAN'
		then	'No Action - Multi-Year Policy'
		when	[IllogicalCondition] = 'Illogical Expiration Date'
		then	'Exceptions'
		else	NULL
		end),

'Illogical Agency Billed Setup' = 
		(case
		when	[IllogicalCondition] = 'Illogical Agency Billed Setup'
				and	[PaymentType] = [PaymentTypePrevious]
				and	[PaymentType] = [ITEM_POL_PAY_TYPE]
				and	[AgentCode] = [AgentCodePrevious]
				and	[AgentCode] = [ITEM_POL_AG_PAYEE]
				and	[InsCoCode] = [InsCoCodePrevious]
				and	[InsCoCode] = [ITEM_POL_INS_PAYEE]
				and	[AgentCode] = [AgentCodePrevious]
				and	[AgentCode] = [ITEM_POL_AG_PAYEE]
		then	'No Action - Matching Payee/Pay Code & No Changes'
		when	[IllogicalCondition] = 'Illogical Agency Billed Setup'
		then	'Exceptions'
		else	NULL
		end),

'Payee Changed But Policy Number The Same' = 
		(case
		when	[IllogicalCondition] = 'Payee Changed But Policy Number The Same'
				and [ITEM_POL_INS_PAYEE] = [InsCoCode]
				and [ITEM_POL_NUMBER] = [PolicyNumber]
				and [PaymentType] <> '3'
		then	'No Action - Matching Payees & PolicyNumbs & PayType <> 3'
		when	[IllogicalCondition] = 'Payee Changed But Policy Number The Same'
				and [ITEM_POL_AG_PAYEE] = [AgentCode]
				and [ITEM_POL_NUMBER] = [PolicyNumber]
				and [PaymentType] = '3'
		then	'No Action - Matching Payees & PolicyNumbs & PayType = 3'
		when	[IllogicalCondition] = 'Payee Changed But Policy Number The Same'
				and	([InsCoCodePrevious] = 'EDIUS'				
				or	[InsCoCodePrevious] = 'EDIAL'
				or	[InsCoCodePrevious] = 'EDIFA'
				or	[InsCoCodePrevious] = 'EDIAF'
				or	[InsCoCodePrevious] = 'EDIKE'
				or	[InsCoCodePrevious] = 'EDISA'
				or	[InsCoCodePrevious] = 'EDITR'
				or	[InsCoCodePrevious] = 'EDIER'
				or	[InsCoCodePrevious] = 'EDINA'
				or	[InsCoCodePrevious] = 'EDIST'
				or	[InsCoCodePrevious] = 'EDILM'
				or	[InsCoCodePrevious] = 'ASREO'
				or	[InsCoCodePrevious] = 'NOTRK'
				or	[InsCoCodePrevious] = 'NOPAY'
				or	[AgentCodePrevious] = 'EDIUS'				
				or	[AgentCodePrevious] = 'EDIAL'
				or	[AgentCodePrevious] = 'EDIFA'
				or	[AgentCodePrevious] = 'EDIAF'
				or	[AgentCodePrevious] = 'EDIKE'
				or	[AgentCodePrevious] = 'EDISA'
				or	[AgentCodePrevious] = 'EDITR'
				or	[AgentCodePrevious] = 'EDIER'
				or	[AgentCodePrevious] = 'EDINA'
				or	[AgentCodePrevious] = 'EDIST'
				or	[AgentCodePrevious] = 'EDILM'
				or	[AgentCodePrevious] = 'ASREO'
				or	[AgentCodePrevious] = 'NOTRK'
				or	[AgentCodePrevious] = 'NOPAY')
				and	([InsCoCodePrevious] = [ITEM_POL_INS_PAYEE]
				or	[InsCoCode] = [ITEM_POL_INS_PAYEE]
				or	[AgentCode] = [ITEM_POL_AG_PAYEE]
				or	[AgentCodePrevious] = [ITEM_POL_AG_PAYEE]
				or	[ITEM_POL_INS_PAYEE] is NULL
				or	[ITEM_POL_AG_PAYEE] is NULL)
		then	'No Action - Updates From Specialty Payees'
		when	[IllogicalCondition] = 'Payee Changed But Policy Number The Same'
		then	'Exceptions'
		else	NULL
		end),

'No Track Pay Code' = 
		(case
		when	[IllogicalCondition] = 'No Track Pay Code'
				and [PaymentType] = '8'
				and ([InsCoCode] = 'CHGOF'
				or	[InsCoCode] = 'GAPEX'
				or	[InsCoCode] = 'TLOSS'
				or	[InsCoCode] = '00000'
				or	[InsCoCode] = 'LANDN'
				or	[InsCoCode] = 'REO3P')
		then	'No Action - PayType = 8 and InsCoCode = CHGOF, GAPEX, TLOSS, 00000, LANDN or REO3P'
		when	[IllogicalCondition] = 'No Track Pay Code'
				and	([AgentCode] = 'LPREO'
				or	[AgentCode] = 'LANDO'
				or	[AgentCode] = 'CLAND'
				or	[AgentCode] = 'NULL'
				or	[AgentCode] is NULL)
		then	'No Action - REO & Land Only Specialty Payees'
		when	[IllogicalCondition] = 'No Track Pay Code'
				and	([PolicyNumberPrevious] = 'INSERT POLICY NUMBER'
				or	[PolicyNumberPrevious] = 'POLICY REQUESTED'
				or	[PolicyNumberPrevious] = 'COOP NO INS TRACKING'
				or	[PolicyNumberPrevious] = 'NULL'
				or	[PolicyNumberPrevious] = 'MASTER POLICY REQ'
				or	[PolicyNumberPrevious] = 'NEED INFO'
				or	[PolicyNumberPrevious] = 'SEE HAZN & 351 LINE'
				or	([AgentCode] = 'CONDO'
				and	[AgentCodePrevious] = 'CONDO')
				or	([InsCoCodePrevious] = 'NOINF'
				and	[InsCoCode] = 'NOINF'))
		then	'No Action - Dummy/Specialty Line Already Adjusted'
		when	[IllogicalCondition] = 'No Track Pay Code'
				and	[CustomLineType] <>'352'
				and	[MortgageType] = 'Second Mortgage'
				and	[PaymentType] = [PaymentTypePrevious]
		then	'No Action - Second Mortgage'
		when	[IllogicalCondition] = 'No Track Pay Code'
		then	'Exceptions'
		else	NULL
		end),

'Date Mismatch' = 
		(case
		when	[IllogicalCondition] = 'Date Mismatch'
				and DATEPART(month,[DueDate]) = DATEPART(month,[ExpirationDate])
				and DATEPART(year,[DueDate]) = DATEPART(year,[ExpirationDate])
				and DATEPART(month,[ITEM_POLCY_EXPDATE]) = DATEPART(month,[ExpirationDate])
				and DATEPART(year,[ITEM_POLCY_EXPDATE]) = DATEPART(year,[ExpirationDate])
				and [ITEM_COMPLETED] >= DATEADD(DAY,1,[ReportDate])
		then	'No Action - DueDate = ExpDate & Matching ExpDates'
		when	[IllogicalCondition] = 'Date Mismatch'
				and	[ITEM_COMPLETED] > DATEADD(DAY,-1,[ReportDate])
				and ([ITEM_ACTION_STATUS] <> '1'
				or	[ITEM_ACTION_STATUS] <> '3'
				or	[ITEM_ACTION_STATUS] <> '5'
				or	[ITEM_ACTION_STATUS] <> '23'
				or	[ITEM_ACTION_STATUS] <> '93')
				and	[ITEM_SOURCE] = '8'
		then	'No Action - EDI document'
		when	[IllogicalCondition] = 'Date Mismatch'
		then	'Exceptions'
		else	NULL
		end),

'Escrowed Line Prem of 1' = 
		(case
		when	[IllogicalCondition] = 'Escrowed Line Prem of 1'
				and [PremiumAmount] > '1'
		then	'No Action - PremAmt > $1'
		when	[IllogicalCondition] = 'Escrowed Line Prem of 1'
				and	[CLINT_CPI_NUMBER] is NULL
				and ([InsCoCodePrevious] = 'UNKNOWN'
				or	[InsCoCodePrevious] = '77777'
				or	[InsCoCodePrevious] = 'LANDO'
				or	[InsCoCodePrevious] = 'MAPIN'
				or	[InsCoCodePrevious] = 'ZONEI'
				or	[InsCoCodePrevious] = 'FLOW'
				or	[AgentCodePrevious] = 'UNKNOWN'
				or	[AgentCodePrevious] = '77777'
				or	[AgentCodePrevious] = 'LANDO'
				or	[AgentCodePrevious] = 'MAPIN'
				or	[AgentCodePrevious] = 'ZONEI'
				or	[AgentCodePrevious] = 'FLOW')
				and	([InsCoCode] = 'MAPIN'
				or	[InsCoCode] = 'ZONEI'
				or	[InsCoCode] = '77777'
				or	[InsCoCode] = 'LANDO'
				or	[InsCoCode] = 'CYCLE'
				or	[InsCoCode] = 'CONDO'
				or	[AgentCode] = 'MAPIN'
				or	[AgentCode] = 'ZONEI'
				or	[AgentCode] = '77777'
				or	[AgentCode] = 'LANDO'
				or	[AgentCode] = 'CYCLE'
				or	[AgentCode] = 'CONDO')
		then	'No Action - Specialty Temp Payee & No Docs Received'
		when	[IllogicalCondition] = 'Escrowed Line Prem of 1'
				and	[InsCoCode] = 'LANDO'
		then	'No Action - Land Only Loan'
		when	[IllogicalCondition] = 'Escrowed Line Prem of 1'
		then	'Exceptions'
		else	NULL
		end),

'Payment Issued Past or Future Exp Date' = 
		(case
		when	[IllogicalCondition] = 'Payment Issued Past or Future Exp Date'
		then	'Exceptions'
		else	NULL
		end),

'High Premium Amount' = 
		(case
		when	[IllogicalCondition] = 'High Premium Amount'
				and [PremiumAmountPrevious] >= '2'
				and [PremiumAmount] >= [PremiumAmountPrevious]*9.5									--TEST CONDITION WHERE DOC SOURCE<>8 & COMPLETED >= 2days ago
				and	(((DATEPART(weekday,[ProcessEligibleDate]) >= '3')
				and	(ABS(DATEDIFF(weekday,[ITEM_COMPLETED],[ProcessEligibleDate])) >= 1))
				or	((DATEPART(weekday,[ProcessEligibleDate]) <= '2')
				and	(ABS(DATEDIFF(weekday,[ITEM_COMPLETED],[ProcessEligibleDate])) >= 3)))
		then	'Exceptions - Greater than 9.5x'
		when	[IllogicalCondition] = 'High Premium Amount'
				and (FLOOR([ITEM_POL_PREMIUM]) = FLOOR([PremiumAmount])
				or	FLOOR([ITEM_ANNUAL_PREM]) = FLOOR([PremiumAmount]))
		then	'No Action - Matching Premium Amounts'
		when	[IllogicalCondition] = 'High Premium Amount'
		then	'Exceptions'
		else	NULL
		end),

'Coverage Compared to UPB' = 
		(case
		when	[IllogicalCondition] = 'Coverage Compared to UPB'
				and ([ForcedCoverageIndicator] = 'S'
				or	[ForcedCoverageIndicator] = 'R')
		then	'No Action - ForcedCovIndicator = S or R'
		when	[IllogicalCondition] = 'Coverage Compared to UPB'
				and	FLOOR([ITEM_POL_COV_AMNT]) = FLOOR([CoverageAmount])
		then	'No Action - Matching CovAmts'
		when	[IllogicalCondition] = 'Coverage Compared to UPB'
				and	((ABS(DATEDIFF(day,[LoanDate],[ReportDate])) <= '90')
				or	(ABS(DATEDIFF(day,[AcquisitionDate],[ReportDate])) <= '90'))
				and	[CLINT_CPI_NUMBER] is NULL
		then	'No Action - Recent Acq/Loan Date & No Docs'
		when	[IllogicalCondition] = 'Coverage Compared to UPB'
		then	'Exceptions'
		else	NULL
		end),

'Future Dated Cancels' = 
		(case
		when	[IllogicalCondition] = 'Future Dated Cancels'
		then	'Exceptions'
		else	NULL
		end),

'Unknown Payee' = 
		(case
		when	[IllogicalCondition] = 'Unknown Payee'
				and [ITEM_POL_INS_PAYEE] = [InsCoCode]
				and [ITEM_POL_AG_PAYEE] = [AgentCode]
		then	'No Action - Matching InscoCodes & AgentCodes'
		when	[IllogicalCondition] = 'Unknown Payee'
		then	'Exceptions'
		else	NULL
		end),

'LPI Pay Code But No LPI Payee' = 
		(case
		when	[IllogicalCondition] = 'LPI Pay Code But No LPI Payee'
		then	'Exceptions'
		else	NULL
		end),

'Illogical Coverage Code Changes' = 
		(case
		when	[IllogicalCondition] = 'Illogical Coverage Code Changes'
		then	'Exceptions'
		else	NULL
		end),

'Illogical Term' = 
		(case
		when	[IllogicalCondition] = 'Illogical Term'
				and [ITEM_POL_TERM] = [PolicyTerm]
		then	'No Action - Matching PolicyTerms'
		when	[IllogicalCondition] = 'Illogical Term'
				and	[PolicyTerm] = '36'
				and	[ExpirationDate] = [ExpirationDatePrevious]
				and	SUBSTRING([PolicyNumber],1,3) = 'BAN'
		then	'No Action - Multi-Year Policy'
		when	[IllogicalCondition] = 'Illogical Term'
		then	'Exceptions'
		else	NULL
		end),

'Dates Advanced - Potential Fraud' =		--Chase Only?
		(case
		when	[IllogicalCondition] = 'Dates Advanced - Potential Fraud'
		then	'Exceptions'
		else	NULL
		end),

'Pending Payments with Rolled Dates' = 
		(case
		when	[IllogicalCondition] = 'Pending Payments with Rolled Dates'
		then	'Exceptions'
		else	NULL
		end),

'Premium Greater Than Coverage' = 
		(case
		when	[IllogicalCondition] = 'Premium Greater Than Coverage'
				and ([PolicyNumber] = 'BELOW TRK LIMIT'
				or	[PolicyNumber] = 'ADQ REVIEW COMPLETED')
		then	'No Action - PolNum = BELOW TRK LIMIT or ADQ REVIEW COMPLETED'
		when	[IllogicalCondition] = 'Premium Greater Than Coverage'
		then	'Exceptions'
		else	NULL
		end),

'HO6 Policy on 351 Line' = 
		(case
		when	[IllogicalCondition] = 'HO6 Policy on 351 Line'
		then	'Exceptions'
		else	NULL
		end),

'High Coverage Amount' = 
		(case
		when	[IllogicalCondition] = 'High Coverage Amount'
				and [CoverageAmount] >= [CoverageAmountPrevious]*9.5
		then	'Exceptions'
		when	[IllogicalCondition] = 'High Coverage Amount'
				and ([ForcedCoverageIndicator] = 'S'
				or	[ForcedCoverageIndicator] = 'R')
		then	'No Action - ForcedCovIndicator = S or R'
		when	[IllogicalCondition] = 'High Coverage Amount'
				and FLOOR([ITEM_POL_COV_AMNT]) = FLOOR([CoverageAmount])
		then	'No Action - Matching CovAmts'
		when	[IllogicalCondition] = 'High Coverage Amount'
		then	'Exceptions'
		else	NULL
		end),

'Payee Mismatch' = 
		(case
		when	[IllogicalCondition] = 'Payee Mismatch'
				and	(((DATEPART(weekday,[ProcessEligibleDate]) >= '4')
				and	(ABS(DATEDIFF(weekday,[ITEM_COMPLETED],[ProcessEligibleDate])) <= 2))
				or	((DATEPART(weekday,[ProcessEligibleDate]) <= '3')
				and	(ABS(DATEDIFF(weekday,[ITEM_COMPLETED],[ProcessEligibleDate])) <= 4)))
				and [PaymentType] = '8'
		then	'No Action - PaymentType = 8'
		when	[IllogicalCondition] = 'Payee Mismatch'
				and [ITEM_POL_INS_PAYEE] = [InsCoCode]
				and [ITEM_POL_AG_PAYEE] = [AgentCode]
		then	'No Action - Matching InsCoCodes & AgentCodes'
		when	[IllogicalCondition] = 'Payee Mismatch'
		then	'Exceptions'
		else	NULL
		end),

'Invalid Payment Code' = 
		(case
		when	[IllogicalCondition] = 'Invalid Payment Code'
		then	'Exceptions'
		else	NULL
		end),

'Payments Made Dates Not Rolled' = 
		(case
		when	[IllogicalCondition] = 'Payments Made Dates Not Rolled'
				and [ITEM_POLCY_EXPDATE] = [ExpirationDate]
				and [AgentCode] <> 'XXXXX'
				and [AgentCode] <> '7CNCL'
		then	'No Action - Matching ExpDates'
		when	[IllogicalCondition] = 'Payments Made Dates Not Rolled'
		then	'Exceptions'
		else	NULL
		end),

'Coverage Amount of 0' = 
		(case
		when	[IllogicalCondition] = 'Coverage Amount of 0'
				and [CLINT_CPI_NUMBER] is not NULL																		
				and FLOOR([ITEM_POL_COV_AMNT]) = FLOOR([CoverageAmount])
				and [CoverageAmount] <> '0'
		then	'No Action - Matching CovAmt <> $0'
		when	[IllogicalCondition] = 'Coverage Amount of 0'
				and [ServiceBureauID] = '933'
				and	[PolicyNumber] = 'INSERT POLICY NUMBER'
				and	([InsCoCode] = '78888'
				or	[AgentCode] = '68888')
				and	([CLINT_CPI_NUMBER] is NULL
				or	(((DATEPART(weekday,[ProcessEligibleDate]) >= '3')
				and	(ABS(DATEDIFF(weekday,[ITEM_COMPLETED],[ProcessEligibleDate])) >= 1))
				or	((DATEPART(weekday,[ProcessEligibleDate]) <= '2')
				and	(ABS(DATEDIFF(weekday,[ITEM_COMPLETED],[ProcessEligibleDate])) >= 3))))
		then	'No Action - BB&T Client Update Process'
		when	[IllogicalCondition] = 'Coverage Amount of 0'
		then	'Exceptions'
		else	NULL
		end),

'Payments on New Loans' = 
		(case
		when	[IllogicalCondition] = 'Payments on New Loans'
				and [ITEM_DOC_TYPE] = '2'
				and FLOOR([ITEM_POL_PREMIUM]) = FLOOR([LastDisbursementAmount])
		then	'No Action - DocType = 2 & PolPrem = LastDisbAmt'
		when	[IllogicalCondition] = 'Payments on New Loans'
				and [ITEM_POL_PREMIUM] > '0'
				and [ITEM_COMPLETED] >= DATEADD(DAY,-14,[ReportDate])
				and ([ITEM_ACTION_STATUS] = '8'
				or	[ITEM_ACTION_STATUS] = '12'
				or	[ITEM_ACTION_STATUS] = '25'
				or	[ITEM_ACTION_STATUS] = '31'
				or	[ITEM_ACTION_STATUS] = '91')
		then	'No Action - Amt Due & Auto-Processed Doc'
		when	[IllogicalCondition] = 'Payments on New Loans'
		then	'Exceptions'
		else	NULL
		end),

'Rejected Payments' = 
		(case
		when	[IllogicalCondition] = 'Rejected Payments'
				and	[EscrowStatus] = 'Non Escrow'
				and	[EscrowStatusPrevious] = 'Non Escrow'
		then	'No Action - Non Escrow'
		when	[IllogicalCondition] = 'Rejected Payments'
				and	([ForeclosureStop] >= '8'
				and	[ServiceBureauID] <> '867')
				or	([ForeclosureStop] = '9'
				and	[ServiceBureauID] = '867')
		then	'No Action - Foreclosure Stop 8'
		when	[IllogicalCondition] = 'Rejected Payments'
		then	'Exceptions'
		else	NULL
		end),

'Unapplied Payments' = 
		(case
		when	[IllogicalCondition] = 'Unapplied Payments'
				and	[EscrowStatus] = 'Non Escrow'
				and	[EscrowStatusPrevious] = 'Non Escrow'
		then	'No Action - Non Escrow'
		when	[IllogicalCondition] = 'Unapplied Payments'
				and	([ForeclosureStop] >= '8'
				and	[ServiceBureauID] <> '867')
				or	([ForeclosureStop] = '9'
				and	[ServiceBureauID] = '867')
		then	'No Action - Foreclosure Stop 8'
		when	[IllogicalCondition] = 'Unapplied Payments'
		then	'Exceptions'
		else	NULL
		end)
		
		
	from [RAP].[BASE_NSSCAR_BK_SFL_FINAL]
	
	/*where	[IllogicalCondition] = 'Dates Rolled But No Payment Made'
			or [IllogicalCondition] = 'Illogical Premium Amount' 
			or [IllogicalCondition] = 'Illogical Coverage Amount'
			or [IllogicalCondition] = 'Illogical Escrow Status Change'
			or [IllogicalCondition] = 'Invalid Coverage Codes'
			or [IllogicalCondition] = 'Rejected Payments'
			or [IllogicalCondition] = 'Illogical Expiration Date'
			or [IllogicalCondition] = 'Illogical Agency Billed Setup'
			or [IllogicalCondition] = 'Payee Changed But Policy Number The Same'
			or [IllogicalCondition] = 'No Track Pay Code'
			or [IllogicalCondition] = 'Date Mismatch'
			or [IllogicalCondition] = 'Escrowed Line Prem of 1'
			or [IllogicalCondition] = 'Payment Issued Past or Future Exp Date'
			or [IllogicalCondition] = 'High Premium Amount'
			or [IllogicalCondition] = 'Coverage Compared to UPB'
			or [IllogicalCondition] = 'Future Dated Cancels'
			or [IllogicalCondition] = 'Unknown Payee'
			or [IllogicalCondition] = 'LPI Pay Code But No LPI Payee'
			or [IllogicalCondition] = 'Illogical Coverage Code Changes'
			or [IllogicalCondition] = 'Illogical Term'
			or [IllogicalCondition] = 'Dates Advanced - Potential Fraud'
			or [IllogicalCondition] = 'Pending Payments with Rolled Dates'
			or [IllogicalCondition] = 'Premium Greater Than Coverage'
			or [IllogicalCondition] = 'High Coverage Amount'
			or [IllogicalCondition] = 'Payee Mismatch'
			or [IllogicalCondition] = 'Invalid Payment Code'
			or [IllogicalCondition] = 'Payments Made Dates Not Rolled'
			or [IllogicalCondition] = 'Coverage Amount of 0'
			or [IllogicalCondition] = 'Payments on New Loans'
			or [IllogicalCondition] = 'Unapplied Payments'*/
	)Jarvis_NA_Detail)Jarvis_Overall_Results)Jarvis_System_Complete_ID

/*//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	END BODY
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\*/




END
