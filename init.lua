 CREATE OR REPLACE PACKAGE RetailCifPack AS
--{
    PROCEDURE RC001 (InpSolId IN VARCHAR2);
    PROCEDURE RC002 (InpSolId IN VARCHAR2);
    PROCEDURE RC003 (InpSolId IN VARCHAR2);
    PROCEDURE RC004 (InpSolId IN VARCHAR2);
    PROCEDURE RC005 (InpSolId IN VARCHAR2);
    PROCEDURE RC006 (InpSolId IN VARCHAR2);
    PROCEDURE RC008 (InpSolId IN VARCHAR2);
    PROCEDURE RC009 (InpSolId IN VARCHAR2);
--}
END RetailCifPack;
/

CREATE OR REPLACE PACKAGE BODY RetailCifPack AS
--{
    PROCEDURE RC001 (InpSolId IN VARCHAR2) IS
    --{
        v_ORGKEY						NVarchar2(50) := '';
        v_CIFID							NVarchar2(32) := '';
        v_ENTITYTYPE					NVarchar2(50) := '';
        v_CUST_TYPE_CODE				NVarchar2(100) := '';
        v_SALUTATION_CODE				NVarchar2(5) := '';
        v_CUST_FIRST_NAME				NVarchar2(80) := '';
        v_CUST_MIDDLE_NAME				NVarchar2(80) := '';
        v_CUST_LAST_NAME				NVarchar2(80) := '';
        v_PREFERREDNAME					NVarchar2(50) := '';
        v_SHORT_NAME					NVarchar2(10) := '';
        v_CUST_DOB						Date := '';
        v_GENDER						NVarchar2(10) := '';
        v_OCCUPATION_CODE				NVarchar2(5) := '';
        v_NATIONALITY_CODE				NVarchar2(5) := '';
        v_NATIVELANGTITLE				NVarchar2(5) := '';
        v_NATIVELANGNAME				NVarchar2(80) := '';
        v_DOCUMENT_RECIEVED				NVarchar2(1) := '';
        v_STAFFFLAG						NVarchar2(25) := '';
        v_STAFFEMPLOYEEID				NVarchar2(50) := '';
        v_MANAGER						NVarchar2(240) := '';
        v_CUSTOMERNREFLAG				NVarchar2(1) := '';
        v_DATEOFBECOMINGNRE				Date := '';
        v_CUSTOMERMINOR					NVarchar2(1) := '';
        v_MINORGUARDIANID				NVarchar2(50) := '';
        v_MINOR_GUARD_CODE				NVarchar2(1) := '';
        v_MINOR_GUARD_NAME				NVarchar2(40) := '';
        v_REGION						NVarchar2(50) := '';
        v_PRIMARY_SERVICE_CENTRE		NVARCHAR2(5) := '';
        v_RELATIONSHIPOPENINGDATE		Date := '';
        v_STATUS_CODE					NVarchar2(5) := '';
        v_CUSTSTATUSCHGDATE				Date := '';
        v_HOUSEHOLDID					NVarchar2(50) := '';
        v_HOUSEHOLDNAME					NVarchar2(50) := '';
        v_CRNCY_CODE_RETAIL				NVarchar2(3) := '';
        v_RATING_CODE					NVarchar2(5) := '';
        v_RATINGDATE					Date := '';
        v_CUST_PREF_TILL_DATE			Date := '';
        v_TDS_TBL_CODE					NVarchar2(5) := '';
        v_INTRODUCERID					NVarchar2(50) := '';
        v_INTRODUCERSALUTATION			NVarchar2(5) := '';
        v_INTRODUCERNAME				NVarchar2(40) := '';
        v_INTRODUCERSTATUSCODE			NVarchar2(100) := '';
        v_OFFLINE_CUM_DEBIT_LIMIT		Numeric(25) := '';
        v_CUST_TOT_TOD_ALWD_TIMES		Numeric(5) := '';
        v_CUST_COMMU_CODE				NVarchar2(5) := '';
        v_CARD_HOLDER					NVarchar2(1) := '';
        v_CUST_HLTH						NVarchar2(200) := '';
        v_CUST_HLTH_CODE				NVarchar2(300) := '';
        v_TFPARTYFLAG					NVarchar2(1) := '';
        v_PRIMARY_SOL_ID				NVarchar2(8) := '';
        v_CONSTITUTION_REF_CODE			NVarchar2(5) := '';
        v_CUST_OTHER_BANK_CODE			NVarchar2(6) := '';
        v_CUST_FIRST_ACCT_DATE			Date := '';
        v_CHARGE_LEVEL_CODE				NVarchar2(5) := '';
        v_CHRG_DR_FORACID				NVarchar2(16) := '';
        v_CHRG_DR_SOL_ID				NVarchar2(8) := '';
        v_CUST_CHRG_HISTORY_FLG			NVarchar2(1) := '';
        v_COMBINED_STMT_REQD			NVarchar2(1) := '';
        v_LOANS_STMT_TYPE				NVarchar2(1) := '';
        v_TD_STMT_TYPE					NVarchar2(1) := '';
        v_COMB_STMT_CHRG_CODE			NVarchar2(5) := '';
        v_DESPATCH_MODE					NVarchar2(1) := '';
        v_CS_LAST_PRINTED_DATE			Date := '';
        v_CS_NEXT_DUE_DATE				Date := '';
        v_ALLOW_SWEEPS					NVarchar2(1) := '';
        v_PS_FREQ_TYPE					NVarchar2(1) := '';
        v_PS_FREQ_WEEK_NUM				NVarchar2(1) := '';
        v_PS_FREQ_WEEK_DAY				Numeric(1) := '';
        v_PS_FREQ_START_DD				Numeric(2) := '';
        v_PS_FREQ_HLDY_STAT				NVarchar2(1) := '';
        v_ENTITY_TYPE					NVarchar2(30) := '';
        v_LINKEDRETAILCIF				NVarchar2(32) := '';
        v_HSHLDUFLAG					NVarchar2(1) := '';
        v_SMALL_STR1					NVarchar2(50) := '';
        v_SMALL_STR2					NVarchar2(50) := '';
        v_SMALL_STR3					NVarchar2(50) := '';
        v_SMALL_STR4					NVarchar2(50) := '';
        v_SMALL_STR5					NVarchar2(50) := '';
        v_SMALL_STR6					NVarchar2(50) := '';
        v_SMALL_STR7					NVarchar2(50) := '';
        v_SMALL_STR8					NVarchar2(50) := '';
        v_SMALL_STR9					NVarchar2(50) := '';
        v_SMALL_STR10					NVarchar2(50) := '';
        v_MED_STR1						NVarchar2(100) := '';
        v_MED_STR2						NVarchar2(100) := '';
        v_MED_STR3						NVarchar2(100) := '';
        v_MED_STR4						NVarchar2(100) := '';
        v_MED_STR5						NVarchar2(100) := '';
        v_MED_STR6						NVarchar2(100) := '';
        v_MED_STR7						NVarchar2(100) := '';
        v_MED_STR8						NVarchar2(100) := '';
        v_MED_STR9						NVarchar2(100) := '';
        v_MED_STR10						NVarchar2(100) := '';
        v_LARGE_STR1					NVarchar2(250) := '';
        v_LARGE_STR2					NVarchar2(250) := '';
        v_LARGE_STR3					NVarchar2(250) := '';
        v_LARGE_STR4					NVarchar2(250) := '';
        v_LARGE_STR5					NVarchar2(250) := '';
        v_DATE1							Date := '';
        v_DATE2							Date := '';
        v_DATE3							Date := '';
        v_DATE4							Date := '';
        v_DATE5							Date := '';
        v_DATE6							Date := '';
        v_DATE7							Date := '';
        v_DATE8							Date := '';
        v_DATE9							Date := '';
        v_DATE10						Date := '';
        v_NUMBER1						Numeric(38) := '';
        v_NUMBER2						Numeric(38) := '';
        v_NUMBER3						Numeric(38) := '';
        v_NUMBER4						Numeric(38) := '';
        v_NUMBER5						Numeric(38) := '';
        v_NUMBER6						Numeric(38) := '';
        v_NUMBER7						Numeric(38) := '';
        v_NUMBER8						Numeric(38) := '';
        v_NUMBER9						Numeric(38) := '';
        v_NUMBER10						Numeric(38) := '';
        v_DECIMAL1						Numeric(25) := '';
        v_DECIMAL2						Numeric(25) := '';
        v_DECIMAL3						Numeric(25) := '';
        v_DECIMAL4						Numeric(25) := '';
        v_DECIMAL5						Numeric(25) := '';
        v_DECIMAL6						Numeric(25) := '';
        v_DECIMAL7						Numeric(25) := '';
        v_DECIMAL8						Numeric(25) := '';
        v_DECIMAL9						Numeric(25) := '';
        v_DECIMAL10						Numeric(25) := '';
        v_CORE_CUST_ID					NVarchar2(9) := '';
        v_PERSONTYPE					NVarchar2(50) := '';
        v_CUST_LANGUAGE					NVarchar2(50) := '';
        v_CUST_STAFF_STATUS				NVarchar2(50) := '';
        v_PHONE							NVarchar2(25) := '';
        v_EXTENSION						NVarchar2(10) := '';
        v_FAX							NVarchar2(25) := '';
        v_FAX_HOME						NVarchar2(50) := '';
        v_PHONE_HOME					NVarchar2(25) := '';
        v_PHONE_HOME2					NVarchar2(50) := '';
        v_PHONE_CELL					NVarchar2(25) := '';
        v_EMAIL_HOME					NVarchar2(50) := '';
        v_EMAIL_PALM					NVarchar2(50) := '';
        v_EMAIL							NVarchar2(50) := '';
        v_CITY							NVarchar2(50) := '';
        v_PREFERREDCHANNELID			Numeric(38) := '';
        v_CUSTOMERRELATIONSHIPNUMBER	NVarchar2(50) := '';
        v_RELATIONSHIPVALUE				NVarchar2(38) := '';
        v_CATEGORY						NVarchar2(50) := '';
        v_NUMBEROFPRODUCTS				Numeric(38) := '';
        v_RELATIONSHIPMANAGERID			Numeric(38) := '';
        v_RELATIONSHIPCREATEDBYID		Numeric(38) := '';
        v_URL							NVarchar2(50) := '';
        v_STATUS						NVarchar2(50) := '';
        v_INDUSTRY						NVarchar2(50) := '';
        v_PARENTORG						NVarchar2(50) := '';
        v_COMPETITOR					NVarchar2(100) := '';
        v_SICCODE						NVarchar2(50) := '';
        v_CIN							NVarchar2(50) := '';
        v_DESIGNATION					NVarchar2(50) := '';
        v_ASSISTANT						NVarchar2(100) := '';
        v_INTERNALSCORE					NVarchar2(25) := '';
        v_CREDITBUREAUSCOREVALIDITY		Date := '';
        v_CREDITBUREAUSCORE				NVarchar2(20) := '';
        v_CREDITBUREAUREQUESTDATE		Date := '';
        v_CREDITBUREAUDESCRIPTION		NVarchar2(100) := '';
        v_MAIDENNAMEOFMOTHER			NVarchar2(50) := '';
        v_ANNUALREVENUE					Numeric(20) := '';
        v_REVENUEUNITS					NVarchar2(20) := '';
        v_TICKERSYMBOL					NVarchar2(50) := '';
        v_AUTOAPRPOVAL					NVarchar2(5) := '';
        v_FREEZEPRODUCTSALE				NVarchar2(5) := '';
        v_RELATIONSHIPFIELD1			NVarchar2(100) := '';
        v_RELATIONSHIPFIELD2			NVarchar2(100) := '';
        v_RELATIONSHIPFIELD3			NVarchar2(100) := '';
        v_DELINQUENCYFLAG				NVarchar2(1) := '';
        v_CUSTOMERNREFLAG_1				NVarchar2(1) := '';
        v_CombinedStatementFlg			NVarchar2(1) := '';
        v_CustomerTrade					NVarchar2(1) := '';
        v_PlaceOfBirth					NVarchar2(50) := '';
        v_CountryOfBirth				NVarchar2(50) := '';
        v_ProofOfAgeFlag				NVarchar2(1) := '';
        v_ProofOfAgeDocument			NVarchar2(50) := '';
        v_NameSuffix					NVarchar2(25) := '';
        v_MaidenName					NVarchar2(50) := '';
        v_CustomerProfitability			Numeric(20) := '';
        v_CurrentCrExposure				Numeric(20) := '';
        v_TotalCrExposure				Numeric(20) := '';
        v_PotentialCrLine				Numeric(20) := '';
        v_AvailableCrLimit				Numeric(20) := '';
        v_CREDITSCOREREQUESTEDFLAG		NVarchar2(1) := '';
        v_CREDIRTHISTORYREQUESTEDFLAG	NVarchar2(1) := '';
        v_GROUPID						NVarchar2(50) := '';
        v_FLG1							NVarchar2(10) := '';
        v_FLG2							NVarchar2(10) := '';
        v_FLG3							NVarchar2(10) := '';
        v_ALERT1						NVarchar2(10) := '';
        v_ALERT2						NVarchar2(10) := '';
        v_ALERT3						NVarchar2(10) := '';
        v_RELATIONSHIPOFFER1			NVarchar2(50) := '';
        v_RELATIONSHIPOFFER2			NVarchar2(50) := '';
        v_DTDATE1						Date := '';
        v_DTDATE2						Date := '';
        v_DTDATE3						Date := '';
        v_DTDATE4						Date := '';
        v_DTDATE5						Date := '';
        v_DTDATE6						Date := '';
        v_DTDATE7						Date := '';
        v_DTDATE8						Date := '';
        v_DTDATE9						Date := '';
        v_Amount1						Numeric(20) := '';
        v_Amount2						Numeric(20) := '';
        v_Amount3						Numeric(20) := '';
        v_Amount4						Numeric(20) := '';
        v_Amount5						Numeric(20) := '';
        v_strfield1						NVarchar2(100) := '';
        v_strfield2						NVarchar2(100) := '';
        v_strfield3						NVarchar2(100) := '';
        v_strfield4						NVarchar2(100) := '';
        v_strfield5						NVarchar2(100) := '';
        v_strfield6						NVarchar2(50) := '';
        v_strfield7						NVarchar2(50) := '';
        v_strfield8						NVarchar2(50) := '';
        v_strfield9						NVarchar2(50) := '';
        v_strfield10					NVarchar2(50) := '';
        v_strfield11					NVarchar2(50) := '';
        v_strfield12					NVarchar2(50) := '';
        v_strfield13					NVarchar2(50) := '';
        v_strfield14					NVarchar2(50) := '';
        v_strfield15					NVarchar2(50) := '';
        v_UserFlag1						NVarchar2(1) := '';
        v_UserFlag2						NVarchar2(1) := '';
        v_UserFlag3						NVarchar2(1) := '';
        v_UserFlag4						NVarchar2(1) := '';
        v_MLUserField1					NVarchar2(80) := '';
        v_MLUserField2					NVarchar2(80) := '';
        v_MLUserField3					NVarchar2(80) := '';
        v_MLUserField4					NVarchar2(200) := '';
        v_MLUserField5					NVarchar2(200) := '';
        v_MLUserField6					NVarchar2(200) := '';
        v_MLUserField7					NVarchar2(100) := '';
        v_MLUserField8					NVarchar2(100) := '';
        v_MLUserField9					NVarchar2(100) := '';
        v_MLUserField10					NVarchar2(100) := '';
        v_MLUserField11					NVarchar2(100) := '';
        v_Notes							NVarchar2(50) := '';
        v_PriorityCode					NVarchar2(50) := '';
        v_Created_From					NVarchar2(1) := '';
        v_Constitution_Code				NVarchar2(200) := '';
        v_StrField16					NVarchar2(50) := '';
        v_StrField17					NVarchar2(50) := '';
        v_StrField18					NVarchar2(50) := '';
        v_StrField19					NVarchar2(50) := '';
        v_StrField20					NVarchar2(50) := '';
        v_StrField21					NVarchar2(50) := '';
        v_StrField22					NVarchar2(50) := '';
        v_Amount6						Numeric(20) := '';
        v_Amount7						Numeric(20) := '';
        v_Amount8						Numeric(20) := '';
        v_Amount9						Numeric(20) := '';
        v_Amount10						Numeric(20) := '';
        v_Amount11						Numeric(20) := '';
        v_Amount12						Numeric(20) := '';
        v_IntField1						Numeric(38) := '';
        v_IntField2						Numeric(38) := '';
        v_IntField3						Numeric(38) := '';
        v_IntField4						Numeric(38) := '';
        v_IntField5						Numeric(38) := '';
        v_nick_name						NVarchar2(10) := '';
        v_mother_name					NVarchar2(20) := '';
        v_father_husband_name			NVarchar2(20) := '';
        v_previous_name					NVarchar2(20) := '';
        v_lead_source					NVarchar2(50) := '';
        v_relationship_type				NVarchar2(5) := '';
        v_rm_group_id					NVarchar2(5) := '';
        v_relationship_level			NVarchar2(5) := '';
        v_DSA_ID						NVarchar2(12) := '';
        v_photograph_id					NVarchar2(10) := '';
        v_Secure_id						NVarchar2(10) := '';
        v_DeliquencyPeriod				Numeric(38) := '';
        v_AddName1						NVarchar2(50) := '';
        v_AddName2						NVarchar2(50) := '';
        v_AddName3						NVarchar2(50) := '';
        v_AddName4						NVarchar2(50) := '';
        v_AddName5						NVarchar2(50) := '';
        v_OldEntityCreatedOn			Date := '';
        v_OldEntityType					NVarchar2(50) := '';
        v_OldEntityID					NVarchar2(20) := '';
        v_Document_Received				NVarchar2(1) := '';
        v_Suspend_Notes					NVarchar2(500) := '';
        v_Suspend_Reason				NVarchar2(250) := '';
        v_Blacklist_Notes				NVarchar2(500) := '';
        v_Blacklist_Reason				NVarchar2(250) := '';
        v_Negated_Notes					NVarchar2(500) := '';
        v_Negated_Reason				NVarchar2(250) := '';
        v_Segmentation_Class			NVarchar2(100) := '';
        v_Name							NVarchar2(100) := '';
        v_ManagerOpinion				NVarchar2(240) := '';
        v_Introd_Status					NVarchar2(50) := '';
        v_NativeLangCode				NVarchar2(10) := '';
        v_MinorAttainMajorDate			Date := '';
        v_NREBecomingOrdDate			Date := '';
        v_StartDate						Date := '';
        v_Add1_First_Name				NVarchar2(80) := '';
        v_Add1_Middle_Name				NVarchar2(80) := '';
        v_Add1_Last_Name				NVarchar2(80) := '';
        v_Add2_First_Name				NVarchar2(80) := '';
        v_Add2_Middle_Name				NVarchar2(80) := '';
        v_Add2_Last_Name				NVarchar2(80) := '';
        v_Add3_First_Name				NVarchar2(80) := '';
        v_Add3_Middle_Name				NVarchar2(80) := '';
        v_Add3_Last_Name				NVarchar2(80) := '';
        v_Add4_First_Name				NVarchar2(80) := '';
        v_Add4_Middle_Name				NVarchar2(80) := '';
        v_Add4_Last_Name				NVarchar2(80) := '';
        v_Add5_First_Name				NVarchar2(80) := '';
        v_Add5_Middle_Name				NVarchar2(80) := '';
        v_Add5_Last_Name				NVarchar2(80) := '';
        v_Dual_First_Name				NVarchar2(80) := '';
        v_Dual_Middle_Name				NVarchar2(80) := '';
        v_Dual_Last_Name				NVarchar2(80) := '';
        v_Cust_Community				NVarchar2(50) := '';
        v_Core_introd_cust_id			NVarchar2(9) := '';
        v_Introd_Salutation_code		NVarchar2(5) := '';
        v_Tds_cust_id					NVarchar2(9) := '';
        v_Nat_id_card_num				NVarchar2(16) := '';
        v_Psprt_issue_date				Date := '';
        v_Psprt_det						NVarchar2(25) := '';
        v_Psprt_exp_date				Date := '';
        v_Crncy_code					NVarchar2(3) := '';
        v_Pref_code						NVarchar2(15) := '';
        v_Introd_Status_Code			NVarchar2(5) := '';
        v_NativeLangTitle_code			NVarchar2(5) := '';
        v_Groupid_code					NVarchar2(5) := '';
        v_Sector						NVarchar2(50) := '';
        v_SubSector						NVarchar2(50) := '';
        v_CustCreationMode				NVarchar2(1) := '';
        v_First_Product_Processor		NVarchar2(50) := '';
        v_Interface_Reference_ID		NVarchar2(50) := '';
        v_cust_health_ref_code			NVarchar2(5) := '';
        v_TDS_CIFID						NVarchar2(50) := '';
        v_PREF_CODE_RCODE				NVarchar2(5) := '';
        v_CUST_SWIFT_CODE_DESC			NVarchar2(50) := '';
        v_IS_SWIFT_CODE_OF_BANK			NVarchar2(1) := '';
        v_NATIVELANGCODE_CODE			NVarchar2(5) := '';
        v_CreatedBySystemID				NVarchar2(50) := '';
        v_PreferredEmailType			NVarchar2(50) := '';
        v_PreferredPhone				NVarchar2(25) := '';
        v_FIRST_NAME_NATIVE				NVarchar2(80) := '';
        v_MIDDLE_NAME_NATIVE			NVarchar2(80) := '';
        v_LAST_NAME_NATIVE				NVarchar2(80) := '';
        v_SHORT_NAME_NATIVE				NVarchar2(50) := '';
        v_FIRST_NAME_NATIVE1			NVarchar2(80) := '';
        v_MIDDLE_NAME_NATIVE1			NVarchar2(80) := '';
        v_LAST_NAME_NATIVE1				NVarchar2(80) := '';
        v_SHORT_NAME_NATIVE1			NVarchar2(10) := '';
        v_SecondaryRM_ID				NVarchar2(50) := '';
        v_TertiaryRM_ID					NVarchar2(50) := '';
        v_SUBSEGMENT					NVarchar2(50) := '';
        v_ACCESSOWNERGROUP				Numeric(38) := '';
        v_ACCESSOWNERSEGMENT			NVarchar2(50) := '';
        v_ACCESSOWNERBC					Numeric(38) := '';
        v_ACCESSOWNERAGENT				Numeric(38) := '';
        v_ACCESSASSIGNEEAGENT			Numeric(38) := '';
        v_CHARGELEVELCODE				NVarchar2(50) := '';
        v_IntUserField1					Numeric(38) := '';
        v_IntUserField2					Numeric(38) := '';
        v_IntUserField3					Numeric(38) := '';
        v_IntUserField4					Numeric(38) := '';
        v_IntUserField5					Numeric(38) := '';
        v_StrUserField1					NVarchar2(100) := '';
        v_StrUserField2					NVarchar2(100) := '';
        v_StrUserField3					NVarchar2(100) := '';
        v_StrUserField4					NVarchar2(100) := '';
        v_StrUserField5					NVarchar2(100) := '';
        v_StrUserField6					NVarchar2(100) := '';
        v_StrUserField7					NVarchar2(100) := '';
        v_StrUserField8					NVarchar2(100) := '';
        v_StrUserField9					NVarchar2(100) := '';
        v_StrUserField10				NVarchar2(100) := '';
        v_StrUserField11				NVarchar2(100) := '';
        v_StrUserField12				NVarchar2(100) := '';
        v_StrUserField13				NVarchar2(100) := '';
        v_StrUserField14				NVarchar2(100) := '';
        v_StrUserField15				NVarchar2(100) := '';
        v_StrUserField16				NVarchar2(100) := '';
        v_StrUserField17				NVarchar2(100) := '';
        v_StrUserField18				NVarchar2(100) := '';
        v_StrUserField19				NVarchar2(100) := '';
        v_StrUserField20				NVarchar2(100) := '';
        v_StrUserField21				NVarchar2(100) := '';
        v_StrUserField22				NVarchar2(100) := '';
        v_StrUserField23				NVarchar2(100) := '';
        v_StrUserField24				NVarchar2(100) := '';
        v_StrUserField25				NVarchar2(100) := '';
        v_StrUserField26				NVarchar2(100) := '';
        v_StrUserField27				NVarchar2(100) := '';
        v_StrUserField28				NVarchar2(100) := '';
        v_StrUserField29				NVarchar2(100) := '';
        v_StrUserField30				NVarchar2(100) := '';
        v_DateUserField1				Date := '';
        v_DateUserField2				Date := '';
        v_DateUserField3				Date := '';
        v_DateUserField4				Date := '';
        v_DateUserField5				Date := '';
        v_BackEndID						NVarchar2(50) := '';
        v_RISK_PROFILE_SCORE			Numeric(38) := '';
        v_RISK_PROFILE_EXPIRY_DATE		Date := '';
        v_PreferredPhoneType			NVarchar2(50) := '';
        v_PreferredEmail				NVarchar2(150) := '';
        v_NoOfCreditCards				Numeric(38) := '';
        v_ReasonForMovingOut			NVarchar2(5) := '';
        v_CompetitorProductID			NVarchar2(50) := '';
        v_OCCUPATIONTYPE				NVarchar2(50) := '';
        v_BANK_ID						NVarchar2(8) := '';
        v_ZAKAT_DEDUCTION				NVarchar2(1) := '';
        v_ASSET_CLASSIFICATION			NVarchar2(1) := '';
        v_CUSTOMER_LEVEL_PROVISIONING	NVarchar2(1) := '';
        v_ISLAMIC_BANKING_CUSTOMER		NVarchar2(1) := '';
        v_PREFERREDCALENDER				NVarchar2(50) := '';
        v_IDTYPER1						NVarchar2(50) := '';
        v_IDTYPER2						NVarchar2(50) := '';
        v_IDTYPER3						NVarchar2(50) := '';
        v_IDTYPER4						NVarchar2(50) := '';
        v_IDTYPER5						NVarchar2(50) := '';
        v_CUST_LAST_NAME_ALT1			NVarchar2(80) := '';
        v_CUST_FIRST_NAME_ALT1			NVarchar2(80) := '';
        v_CUST_MIDDLE_NAME_ALT1			NVarchar2(80) := '';
        v_STRFIELD6_ALT1				NVarchar2(50) := '';
        v_NAME_ALT1						NVarchar2(80) := '';
        v_SHORT_NAME_ALT1				NVarchar2(10) := '';
        v_ISEBANKINGENABLED				NVarchar2(1) := '';
        v_PURGEFLAG						NVarchar2(1) := '';
        v_SUSPENDED						NVarchar2(1) := '';
        v_BLACKLISTED					NVarchar2(1) := '';
        v_NEGATED						NVarchar2(1) := '';
        v_ACCOUNTID						NVarchar2(38) := '';
        v_ADDRESS_LINE1					NVarchar2(200) := '';
        v_ADDRESS_LINE2					NVarchar2(200) := '';
        v_ADDRESS_LINE3					NVarchar2(200) := '';
        v_STATE							NVarchar2(200) := '';
        v_COUNTRY						NVarchar2(100) := '';
        v_ZIP							NVarchar2(100) := '';
        v_BOCREATEDBYLOGINID			NVarchar2(50) := '';
        v_SUBMITFORKYC					NVARCHAR2(1) := '';
        v_KYC_REVIEWDATE				Date := '';
        v_KYC_DATE						Date := '';
        v_RISKRATING					NVARCHAR2(30) := '';
        v_SENIORCITIZEN					NVARCHAR2(1) := '';
        v_SENCITIZENAPPLICABLEDATE		Date := '';
        v_SENCITIZENCONVERSIONFLAG		NVARCHAR2(1) := '';
        v_ForeignAccTaxReportingReq		NVARCHAR2(1) := '';
        v_ForeignTaxReportingCountry	NVARCHAR2(50) := '';
        v_ForeignTaxReportingStatus		NVARCHAR2(50) := '';
        v_LastForeignTaxReviewDate		Date := '';
        v_NextForeignTaxReviewDate		Date := '';
        v_FatcaRemarks					NVARCHAR2(100) := '';
        v_DateOfDeath					Date := '';
        v_DateOfNotification			Date := '';
        v_PHYSICAL_STATE				NVARCHAR2(30) := '';
        v_UNIQUEIDNUMBER				NVARCHAR2(25) := '';
        v_ENABLE_ALERTS					NVARCHAR2(1) := '';
        v_DEFAULTCHANNEL_ALERT			NVARCHAR2(300) := '';
        v_PREFERRED_MOBILE_ALERT_NO		NVARCHAR2(50) := '';
        v_PREFERRED_MOBILE_ALERT_TYPE	NVARCHAR2(50) := '';
        V_SURNAME						NVARCHAR2(80) := '';
        V_AGE							NUMBER;
        V_INDCLIENT_EMPLOYEE_NUM		NVARCHAR2(80) := '';
        v_status_date					Date;
        V_CLIENTS_IT_STAT_CODE			NVARCHAR2(50) := '';
        V_CLIENTS_IT_SUB_STAT_CODE		NVARCHAR2(50) := '';
        V_TAX_REGIME					CHAR(1) := '';

        FailFieldName       VARCHAR2(4000);
        FailFieldValue      VARCHAR2(4000);
        V_INSERT_REC_FLG    CHAR(1) := 'Y';

        CURSOR C1 (CurSolId varchar2) is
        SELECT INDCLIENT_CODE
            --,REPLACE(INDCLIENT_FIRST_NAME,'.','')
            ,INDCLIENT_FIRST_NAME
            --,REPLACE(INDCLIENT_MIDDLE_NAME,'.','')
            ,INDCLIENT_MIDDLE_NAME
            --,REPLACE(INDCLIENT_LAST_NAME,'.','')
            ,INDCLIENT_LAST_NAME
            --,REPLACE(INDCLIENT_SUR_NAME,'.','')
            ,INDCLIENT_SUR_NAME
            ,INDCLIENT_BIRTH_DATE
            ,INDCLIENT_SEX
            ,INDCLIENT_NATNL_CODE
            ,INDCLIENT_EMPLOYEE_NUM
            ,INDCLIENT_LANG_CODE
            ,INDCLIENT_OCCUPN_CODE
            ,INDCLIENT_MOTHER_MAID_NAME
            ,INDCLIENT_BIRTH_PLACE_CODE
            ,INDCLIENT_RELIGN_CODE
            ,INDCLIENT_FATHER_NAME
            ,INDCLIENT_DISABLED
            ,DECODE(INDCLIENT_RESIDENT_STATUS,'N','Y','N') NreFlag
        FROM CBS.INDCLIENTS B
        WHERE B.INDCLIENT_CODE in (SELECT CIF_ID FROM VALID_CIF WHERE SOL_ID = CurSolId AND CIF_TYPE = 'R');

        CURSOR TableCur is
        select * from rc001 where rownum < 2;

        TYPE CurRec IS TABLE OF C1%ROWTYPE INDEX BY PLS_INTEGER;
        V_CurRec CurRec;

        TYPE TableRec IS TABLE OF TableCur%ROWTYPE INDEX BY PLS_INTEGER;
        V_TableRec TableRec;

        V_BatchSize CONSTANT PLS_INTEGER := 10000;
        V_RowCount PLS_INTEGER := 0;

        BEGIN
        --{
            v_ENTITYTYPE := 'CUSTOMER';
            v_DOCUMENT_RECIEVED := 'Y';
            v_CRNCY_CODE_RETAIL := 'INR';
            v_CUST_CHRG_HISTORY_FLG := 'N';
            v_COMBINED_STMT_REQD := 'N';
            v_DESPATCH_MODE := 'N';
            v_BANK_ID := '01';
            v_ISEBANKINGENABLED := 'N';
            v_PURGEFLAG := 'N';
            v_REGION := 'MIG';
            v_Sector := 'MIG';
            v_SubSector := 'MIG';
            v_SUBSEGMENT := 'Retail';
            v_TFPARTYFLAG := 'N';
            v_ALLOW_SWEEPS := 'N';
            v_NativeLangCode := 'INFENG';
            V_CUST_LANGUAGE := 'INFENG';

            OPEN C1(InpSolId);
            --for i in c1(InpSolId)
            loop
            --{
                FETCH C1 BULK COLLECT INTO V_CurRec LIMIT V_BatchSize;
                EXIT WHEN V_CurRec.COUNT = 0;

                FOR i IN 1 .. V_CurRec.COUNT
                LOOP
                --{
                    V_INSERT_REC_FLG        := 'Y';

                    V_ORGKEY                := V_CurRec(i).INDCLIENT_CODE;
                    V_CIFID                 := V_CurRec(i).INDCLIENT_CODE;
                    V_CUST_FIRST_NAME       := TRIM(V_CurRec(I).INDCLIENT_FIRST_NAME);
                    V_CUST_MIDDLE_NAME      := TRIM(V_CurRec(I).INDCLIENT_MIDDLE_NAME);
                    V_CUST_LAST_NAME        := TRIM(V_CurRec(I).INDCLIENT_LAST_NAME);
                    V_SURNAME               := TRIM(V_CurRec(I).INDCLIENT_SUR_NAME);
                    V_SHORT_NAME            := SUBSTR(v_CUST_FIRST_NAME,0,10);
                    V_CUST_DOB              := V_CurRec(i).INDCLIENT_BIRTH_DATE;
                    V_GENDER                := V_CurRec(I).INDCLIENT_SEX;
                    V_NATIONALITY_CODE      := V_CurRec(I).INDCLIENT_NATNL_CODE;
                    V_STAFFEMPLOYEEID       := TRIM(V_CurRec(I).INDCLIENT_EMPLOYEE_NUM);
                    V_AGE                   := FLOOR(MONTHS_BETWEEN(SYSDATE,V_CurRec(I).INDCLIENT_BIRTH_DATE)/12);
                    V_STAFFFLAG             := 'N';
                    --V_CUST_LANGUAGE         := V_CurRec(I).INDCLIENT_LANG_CODE;
                    --v_NativeLangCode        := V_CurRec(I).INDCLIENT_LANG_CODE;
                    v_OCCUPATION_CODE       := V_CurRec(I).INDCLIENT_OCCUPN_CODE;
                    v_MAIDENNAMEOFMOTHER    := V_CurRec(i).INDCLIENT_MOTHER_MAID_NAME;
                    v_PlaceOfBirth          := V_CurRec(i).INDCLIENT_BIRTH_PLACE_CODE;
                    v_Cust_Community        := V_CurRec(i).INDCLIENT_RELIGN_CODE;
                    v_StrUserField1         := V_CurRec(i).INDCLIENT_FATHER_NAME;
                    --v_PHYSICAL_STATE        := V_CurRec(i).INDCLIENT_DISABLED; -- Commented as BPD values are not proper.
                    v_CUSTOMERNREFLAG       := V_CurRec(I).NreFlag;
                    v_CORE_CUST_ID          := V_CurRec(I).INDCLIENT_CODE;


                    BEGIN
                        SELECT 	CLIENTS_TITLE_CODE
                                ,SUBSTR(CLIENTS_NAME,0,50)
                                ,CLIENTS_HOME_BRN_CODE
                                ,NVL(CLIENTS_OPENING_DATE,CLIENTS_ENTD_ON)
                                ,NVL(TRIM(CLIENTS_ARM_CODE),'')
                                ,CLIENTS_RISK_CATEGORIZATION
                                ,CLIENTS_SEGMENT_CODE
                                ,CLIENTS_CUST_CATG
                                ,CLIENTS_CONST_CODE
                                ,CLIENTS_IT_STAT_CODE
                                ,CLIENTS_IT_SUB_STAT_CODE
                        INTO	V_SALUTATION_CODE
                                ,V_PREFERREDNAME
                                ,V_PRIMARY_SERVICE_CENTRE
                                ,V_RELATIONSHIPOPENINGDATE
                                ,V_MANAGER
                                ,V_RISKRATING
                                ,V_Segmentation_Class
                                ,v_CUST_TYPE_CODE
                                ,v_CONSTITUTION_REF_CODE
                                ,V_CLIENTS_IT_STAT_CODE
                                ,V_CLIENTS_IT_SUB_STAT_CODE
                        FROM 	CBS.CLIENTS
                        WHERE	CLIENTS_CODE = V_CurRec(I).INDCLIENT_CODE;
                    END;

                    v_PRIMARY_SOL_ID := V_PRIMARY_SERVICE_CENTRE;

                    IF(v_MANAGER is null) THEN
                    --{
                        v_MANAGER := 'UBSADMIN';
                    --}
                    END IF;

                    IF(v_CUSTOMERNREFLAG = 'Y') THEN
                    --{
                        v_DATEOFBECOMINGNRE := V_RELATIONSHIPOPENINGDATE;
                    --}
                    ELSE
                    --{
                        v_DATEOFBECOMINGNRE := '';
                    --}
                    END IF;

                    /*
                    BEGIN
                        SELECT MEMP_NUM INTO v_STAFFEMPLOYEEID FROM CBS.MEMP WHERE MEMP_NUM = v_STAFFEMPLOYEEID;
                        EXCEPTION WHEN NO_DATA_FOUND THEN
                        v_STAFFEMPLOYEEID := NULL;
                    END;
                    */

                    IF(v_STAFFEMPLOYEEID is NOT NULL) THEN
                    --{
                        v_STAFFFLAG := 'Y';
                    --}
                    END IF;

                    IF(V_AGE < 18) THEN
                    --{
                        V_CUSTOMERMINOR := 'Y';
                    --}
                    ELSE
                    --{
                        V_CUSTOMERMINOR := 'N';
                    --}
                    END IF;

                    IF(V_AGE >= 60) THEN
                    --{
                        v_SENIORCITIZEN := 'Y';
                    --}
                    ELSE
                    --{
                        v_SENIORCITIZEN := 'N';
                    --}
                    END IF;

                    IF (v_CUST_MIDDLE_NAME IS NULL) THEN
                    --{
                        v_CUST_MIDDLE_NAME := V_CUST_LAST_NAME;
                        V_CUST_LAST_NAME := V_SURNAME;
                    --}
                    END IF;

                    BEGIN
                        select DECODE(INDCLIENTSFATCA_REQD,'0','N','1','Y')
                        into v_ForeignAccTaxReportingReq
                        from CBS.indclientsfatca
                        where INDCLIENTSFATCA_CLIENTCODE = v_ORGKEY;
                        exception when NO_DATA_FOUND THEN
                        v_ForeignAccTaxReportingReq := 'N';
                    END;

                    IF(v_ForeignAccTaxReportingReq = 'Y') then
                    --{
                        v_ForeignTaxReportingCountry := 'IN';
                        v_ForeignTaxReportingStatus := 'ACT';
                    --}
                    ELSE
                    --{
                        v_ForeignTaxReportingCountry := '';
                        v_ForeignTaxReportingStatus := '';
                    --}
                    END IF;

                    BEGIN
                        SELECT CLNTSTATMRK_STATUS,CLNTSTATMRK_EFFDATE
                        INTO v_STATUS_CODE,v_status_date
                        FROM CBS.CLNTSTATMRK A
                        WHERE CLNTSTATMRK_CUSTNUM = V_ORGKEY
                        AND	 CLNTSTATMRK_EFFDATE = (SELECT MAX(CLNTSTATMRK_EFFDATE) FROM CBS.CLNTSTATMRK B WHERE A.CLNTSTATMRK_CUSTNUM = B.CLNTSTATMRK_CUSTNUM);
                        EXCEPTION WHEN NO_DATA_FOUND THEN
                        v_status_date := '';
                        v_status_code := 'A';
                    END;

                    BEGIN
                        SELECT 	FORM15REC_TAX_REGIME
                        into	V_TAX_REGIME
                        FROM 	CBS.FORM15RECV
                        WHERE 	SYSDATE BETWEEN FORM15REC_FORM_DATE AND FORM15REC_VALID_UPTO
                        AND 	FORM15REC_CLIENT_NUM = V_ORGKEY
                        --AND 	FORM15REC_FIN_YEAR = '2025';
                        AND 	FORM15REC_FIN_YEAR = EXTRACT(YEAR FROM UTK_FN_GET_CURR_FIN_YR_END_DT);
                        exception WHEN NO_DATA_FOUND THEN
                        V_TAX_REGIME := '';
                    END;

                    IF(V_TAX_REGIME IS NULL) THEN
                    --{
                        V_TAX_REGIME := 'N';
                    --}
                    END IF;

                    IF(v_status_code = 'D') THEN
                    --{
                        v_DateOfNotification := v_status_date;
                    --}
                    ELSE
                    --{
                        v_DateOfNotification := '';
                    --}
                    END IF;

                    IF(V_CLIENTS_IT_SUB_STAT_CODE = '01') THEN
                    --{
                        IF(V_CLIENTS_IT_STAT_CODE = 'I') THEN
                        --{
                            v_TDS_TBL_CODE := 'GEN10';
                        --}
                        ELSE
                        --{
                            v_TDS_TBL_CODE := 'SEN10';
                        --}
                        END IF;
                    --}
                    ELSIF (V_CLIENTS_IT_SUB_STAT_CODE = '02') THEN
                    --{
                        IF(V_CLIENTS_IT_STAT_CODE = 'I') THEN
                        --{
                            v_TDS_TBL_CODE := 'PNLGN';
                        --}
                        ELSE
                        --{
                            v_TDS_TBL_CODE := 'PNLSN';
                        --}
                        END IF;
                    --}
                    ELSIF (V_CLIENTS_IT_SUB_STAT_CODE = '03') THEN
                    --{
                        IF(V_TAX_REGIME = 'N') THEN
                        --{
                            IF(V_CLIENTS_IT_STAT_CODE = 'I') THEN
                            --{
                                v_TDS_TBL_CODE := '15GNR';
                            --}
                            ELSE
                            --{
                                v_TDS_TBL_CODE := '15HNR';
                            --}
                            END IF;
                        --}
                        ELSIF(V_TAX_REGIME = 'O') THEN
                        --{
                            IF(V_CLIENTS_IT_STAT_CODE = 'I') THEN
                            --{
                                v_TDS_TBL_CODE := '15GOR';
                            --}
                            ELSE
                            --{
                                v_TDS_TBL_CODE := '15HOR';
                            --}
                            END IF;
                        --}
                        END IF;
                    --}
                    ELSE
                    --{
                        v_TDS_TBL_CODE := 'GEN10';
                    --}
                    END IF;

                    --- CKYC NUMBER ---
                    BEGIN
                        SELECT 	TSSCR_CKYC_NUMBER
                        INTO 	v_StrUserField2
                        FROM	CBS.TSSCKCYCBSRESPONSE A
                        WHERE 	TSSCR_CLIENT_ID = V_ORGKEY
                        --AND TSSCR_PROCESSED_ON = (SELECT MAX(TSSCR_PROCESSED_ON) FROM CBS.tssckcycbsresponse B WHERE A.TSSCR_CLIENT_ID = B.TSSCR_CLIENT_ID);
                        AND (TSSCR_PROCESSED_ON,TSSCR_REC_SL) = (SELECT MAX(TSSCR_PROCESSED_ON),MAX(TSSCR_REC_SL) FROM CBS.tssckcycbsresponse B WHERE A.TSSCR_CLIENT_ID = B.TSSCR_CLIENT_ID);
                        EXCEPTION WHEN NO_DATA_FOUND THEN
                            BEGIN
                                SELECT 	CKYCHDTL_CKYC_NUM
                                INTO	v_StrUserField2
                                FROM	CBS.CKYCHEADERDTL A
                                WHERE	CKYCHDTL_CLIENT_CD = V_ORGKEY
                                AND     CKYCHDTL_ENTITY = '1'
                                AND     CKYCHDTL_BRAN_CODE = V_PRIMARY_SOL_ID
                                AND CKYCHDTL_PROC_DATE = (SELECT MAX(CKYCHDTL_PROC_DATE) FROM CBS.CKYCHEADERDTL B
                                                        WHERE A.CKYCHDTL_CLIENT_CD = B.CKYCHDTL_CLIENT_CD
                                                        AND A.CKYCHDTL_BRAN_CODE = B.CKYCHDTL_BRAN_CODE
                                                        AND A.CKYCHDTL_ENTITY = B.CKYCHDTL_ENTITY);
                                EXCEPTION WHEN NO_DATA_FOUND THEN
                                v_struserfield2 := '';
                            END;
                    END;

                    --- Removing Special Chars
                    V_CUST_FIRST_NAME       := CommonExtractionPack.RemoveSpecialChars(V_CUST_FIRST_NAME);
                    V_CUST_MIDDLE_NAME      := CommonExtractionPack.RemoveSpecialChars(V_CUST_MIDDLE_NAME);
                    V_CUST_LAST_NAME        := NVL(CommonExtractionPack.RemoveSpecialChars(V_CUST_LAST_NAME),'.');
                    V_SURNAME               := CommonExtractionPack.RemoveSpecialChars(V_SURNAME);
                    V_MAIDENNAMEOFMOTHER    := CommonExtractionPack.RemoveSpecialChars(V_MAIDENNAMEOFMOTHER);
                    V_StrUserField1         := CommonExtractionPack.RemoveSpecialChars(V_StrUserField1);
                    V_PREFERREDNAME         := CommonExtractionPack.RemoveSpecialChars(V_PREFERREDNAME);
                    V_SHORT_NAME            := CommonExtractionPack.RemoveSpecialChars(V_SHORT_NAME);

                    -- Category Code Mapping and validations
                   v_status_code := COMMONEXTRACTIONPACK.MAPPER_FUNC('MASTERCODE','CUSTOMER_STATUS',v_status_code,'CBS');
                   v_Segmentation_Class := COMMONEXTRACTIONPACK.MAPPER_FUNC('MASTERCODE','SEGMENTATION_CLASS',v_Segmentation_Class,'CBS');
                   v_CUST_TYPE_CODE := COMMONEXTRACTIONPACK.MAPPER_FUNC('MASTERCODE','ACCOUNT_TYPE',v_CUST_TYPE_CODE,'CBS');
                   v_OCCUPATION_CODE := COMMONEXTRACTIONPACK.MAPPER_FUNC('MASTERCODE','CONTACT_OCCUPATION',v_CUST_TYPE_CODE,'CBS');
                   v_CUST_LANGUAGE := COMMONEXTRACTIONPACK.MAPPER_FUNC('MASTERCODE','LANGUAGE',v_CUST_LANGUAGE,'CBS');

                    if(v_status_code is null) then
                    --{
                        FailFieldName := 'CUSTOMER_STATUS';
                        FailFieldValue := v_status_code;
                        V_INSERT_REC_FLG := 'N';
                    --}
                    END IF;

                    if(v_Segmentation_Class is null) then
                    --{
                        FailFieldName := 'Segmentation_Class';
                        FailFieldValue := v_Segmentation_Class;
                        V_INSERT_REC_FLG := 'N';
                    --}
                    END IF;

                    if(v_CUST_TYPE_CODE is null) then
                    --{
                        FailFieldName := 'CUST_TYPE_CODE';
                        FailFieldValue := v_CUST_TYPE_CODE;
                        V_INSERT_REC_FLG := 'N';
                    --}
                    END IF;

                    if(v_OCCUPATION_CODE is null) then
                    --{
                        FailFieldName := 'OCCUPATION_CODE';
                        FailFieldValue := v_OCCUPATION_CODE;
                        V_INSERT_REC_FLG := 'N';
                    --}
                    END IF;

                    if(v_CUST_LANGUAGE is null) then
                    --{
                        FailFieldName := 'LANGUAGE';
                        FailFieldValue := v_CUST_LANGUAGE;
                        V_INSERT_REC_FLG := 'N';
                    --}
                    END IF;

                    IF(V_INSERT_REC_FLG = 'N') THEN
                    --{
                        INSERT INTO RETCIFFAILTBL VALUES ('RC001',FailFieldName,v_orgkey,FailFieldValue);
                    --}
                    END IF;

                    V_TableRec(i).ORGKEY                            := v_ORGKEY;
                    V_TableRec(i).CIF_ID                            := v_CIFID;
                    V_TableRec(i).ENTITYTYPE                        := v_ENTITYTYPE;
                    V_TableRec(i).CUST_TYPE_CODE                    := v_CUST_TYPE_CODE;
                    V_TableRec(i).SALUTATION_CODE                   := v_SALUTATION_CODE;
                    V_TableRec(i).CUST_FIRST_NAME                   := v_CUST_FIRST_NAME;
                    V_TableRec(i).CUST_MIDDLE_NAME                  := v_CUST_MIDDLE_NAME;
                    V_TableRec(i).CUST_LAST_NAME                    := v_CUST_LAST_NAME;
                    V_TableRec(i).PREFERREDNAME                     := v_PREFERREDNAME;
                    V_TableRec(i).SHORT_NAME                        := v_SHORT_NAME;
                    V_TableRec(i).CUST_DOB                          := v_CUST_DOB;
                    V_TableRec(i).GENDER                            := v_GENDER;
                    V_TableRec(i).OCCUPATION_CODE                   := v_OCCUPATION_CODE;
                    V_TableRec(i).NATIONALITY_CODE                  := v_NATIONALITY_CODE;
                    V_TableRec(i).NATIVELANGTITLE                   := v_NATIVELANGTITLE;
                    V_TableRec(i).NATIVELANGNAME                    := v_NATIVELANGNAME;
                    V_TableRec(i).DOCUMENT_RECIEVED                 := v_DOCUMENT_RECIEVED;
                    V_TableRec(i).STAFFFLAG                         := v_STAFFFLAG;
                    V_TableRec(i).STAFFEMPLOYEEID                   := v_STAFFEMPLOYEEID;
                    V_TableRec(i).MANAGER                           := v_MANAGER;
                    V_TableRec(i).CUSTOMERNREFLAG                   := v_CUSTOMERNREFLAG;
                    V_TableRec(i).DATEOFBECOMINGNRE                 := v_DATEOFBECOMINGNRE;
                    V_TableRec(i).CUSTOMERMINOR                     := v_CUSTOMERMINOR;
                    V_TableRec(i).MINORGUARDIANID                   := v_MINORGUARDIANID;
                    V_TableRec(i).MINOR_GUARD_CODE                  := v_MINOR_GUARD_CODE;
                    V_TableRec(i).MINOR_GUARD_NAME                  := v_MINOR_GUARD_NAME;
                    V_TableRec(i).REGION                            := v_REGION;
                    V_TableRec(i).PRIMARY_SERVICE_CENTRE            := v_PRIMARY_SERVICE_CENTRE;
                    V_TableRec(i).RELATIONSHIPOPENINGDATE           := v_RELATIONSHIPOPENINGDATE;
                    V_TableRec(i).STATUS_CODE                       := v_STATUS_CODE;
                    V_TableRec(i).CUSTSTATUSCHGDATE                 := v_CUSTSTATUSCHGDATE;
                    V_TableRec(i).HOUSEHOLD_ID                      := v_HOUSEHOLDID;
                    V_TableRec(i).HOUSEHOLD_NAME                    := v_HOUSEHOLDNAME;
                    V_TableRec(i).CRNCY_CODE_RETAIL                 := v_CRNCY_CODE_RETAIL;
                    V_TableRec(i).RATING_CODE                       := v_RATING_CODE;
                    V_TableRec(i).RATING_DATE                       := v_RATINGDATE;
                    V_TableRec(i).CUST_PREF_TILL_DATE               := v_CUST_PREF_TILL_DATE;
                    V_TableRec(i).TDS_TBL_CODE                      := v_TDS_TBL_CODE;
                    V_TableRec(i).INTRODUCER_ID                     := v_INTRODUCERID;
                    V_TableRec(i).INTRODUCER_SALUTATION             := v_INTRODUCERSALUTATION;
                    V_TableRec(i).INTRODUCER_NAME                   := v_INTRODUCERNAME;
                    V_TableRec(i).INTRODUCER_STATUS_CODE            := v_INTRODUCERSTATUSCODE;
                    V_TableRec(i).OFFLINE_CUM_DEBIT_LIMIT           := v_OFFLINE_CUM_DEBIT_LIMIT;
                    V_TableRec(i).CUST_TOT_TOD_ALWD_TIMES           := v_CUST_TOT_TOD_ALWD_TIMES;
                    V_TableRec(i).CUST_COMMU_CODE                   := v_CUST_COMMU_CODE;
                    V_TableRec(i).CARD_HOLDER                       := v_CARD_HOLDER;
                    V_TableRec(i).CUST_HLTH                         := v_CUST_HLTH;
                    V_TableRec(i).CUST_HLTH_CODE                    := v_CUST_HLTH_CODE;
                    V_TableRec(i).TFPARTYFLAG                       := v_TFPARTYFLAG;
                    V_TableRec(i).PRIMARY_SOL_ID                    := v_PRIMARY_SOL_ID;
                    V_TableRec(i).CONSTITUTION_REF_CODE             := v_CONSTITUTION_REF_CODE;
                    V_TableRec(i).CUST_OTHER_BANK_CODE              := v_CUST_OTHER_BANK_CODE;
                    V_TableRec(i).CUST_FIRST_ACCT_DATE              := v_CUST_FIRST_ACCT_DATE;
                    V_TableRec(i).CHARGE_LEVEL_CODE                 := v_CHARGE_LEVEL_CODE;
                    V_TableRec(i).CHRG_DR_FORACID                   := v_CHRG_DR_FORACID;
                    V_TableRec(i).CHRG_DR_SOL_ID                    := v_CHRG_DR_SOL_ID;
                    V_TableRec(i).CUST_CHRG_HISTORY_FLG             := v_CUST_CHRG_HISTORY_FLG;
                    V_TableRec(i).COMBINED_STMT_REQD                := v_COMBINED_STMT_REQD;
                    V_TableRec(i).LOANS_STMT_TYPE                   := v_LOANS_STMT_TYPE;
                    V_TableRec(i).TD_STMT_TYPE                      := v_TD_STMT_TYPE;
                    V_TableRec(i).COMB_STMT_CHRG_CODE               := v_COMB_STMT_CHRG_CODE;
                    V_TableRec(i).DESPATCH_MODE                     := v_DESPATCH_MODE;
                    V_TableRec(i).CS_LAST_PRINTED_DATE              := v_CS_LAST_PRINTED_DATE;
                    V_TableRec(i).CS_NEXT_DUE_DATE                  := v_CS_NEXT_DUE_DATE;
                    V_TableRec(i).ALLOW_SWEEPS                      := v_ALLOW_SWEEPS;
                    V_TableRec(i).PS_FREQ_TYPE                      := v_PS_FREQ_TYPE;
                    V_TableRec(i).PS_FREQ_WEEK_NUM                  := v_PS_FREQ_WEEK_NUM;
                    V_TableRec(i).PS_FREQ_WEEK_DAY                  := v_PS_FREQ_WEEK_DAY;
                    V_TableRec(i).PS_FREQ_START_DD                  := v_PS_FREQ_START_DD;
                    V_TableRec(i).PS_FREQ_HLDY_STAT                 := v_PS_FREQ_HLDY_STAT;
                    V_TableRec(i).ENTITY_TYPE                       := v_ENTITY_TYPE;
                    V_TableRec(i).LINKEDRETAILCIF                   := v_LINKEDRETAILCIF;
                    V_TableRec(i).HSHLDU_FLAG                       := v_HSHLDUFLAG;
                    V_TableRec(i).SMALL_STR1                        := v_SMALL_STR1;
                    V_TableRec(i).SMALL_STR2                        := v_SMALL_STR2;
                    V_TableRec(i).SMALL_STR3                        := v_SMALL_STR3;
                    V_TableRec(i).SMALL_STR4                        := v_SMALL_STR4;
                    V_TableRec(i).SMALL_STR5                        := v_SMALL_STR5;
                    V_TableRec(i).SMALL_STR6                        := v_SMALL_STR6;
                    V_TableRec(i).SMALL_STR7                        := v_SMALL_STR7;
                    V_TableRec(i).SMALL_STR8                        := v_SMALL_STR8;
                    V_TableRec(i).SMALL_STR9                        := v_SMALL_STR9;
                    V_TableRec(i).SMALL_STR10                       := v_SMALL_STR10;
                    V_TableRec(i).MED_STR1                          := v_MED_STR1;
                    V_TableRec(i).MED_STR2                          := v_MED_STR2;
                    V_TableRec(i).MED_STR3                          := v_MED_STR3;
                    V_TableRec(i).MED_STR4                          := v_MED_STR4;
                    V_TableRec(i).MED_STR5                          := v_MED_STR5;
                    V_TableRec(i).MED_STR6                          := v_MED_STR6;
                    V_TableRec(i).MED_STR7                          := v_MED_STR7;
                    V_TableRec(i).MED_STR8                          := v_MED_STR8;
                    V_TableRec(i).MED_STR9                          := v_MED_STR9;
                    V_TableRec(i).MED_STR10                         := v_MED_STR10;
                    V_TableRec(i).LARGE_STR1                        := v_LARGE_STR1;
                    V_TableRec(i).LARGE_STR2                        := v_LARGE_STR2;
                    V_TableRec(i).LARGE_STR3                        := v_LARGE_STR3;
                    V_TableRec(i).LARGE_STR4                        := v_LARGE_STR4;
                    V_TableRec(i).LARGE_STR5                        := v_LARGE_STR5;
                    V_TableRec(i).DATE1                             := v_DATE1;
                    V_TableRec(i).DATE2                             := v_DATE2;
                    V_TableRec(i).DATE3                             := v_DATE3;
                    V_TableRec(i).DATE4                             := v_DATE4;
                    V_TableRec(i).DATE5                             := v_DATE5;
                    V_TableRec(i).DATE6                             := v_DATE6;
                    V_TableRec(i).DATE7                             := v_DATE7;
                    V_TableRec(i).DATE8                             := v_DATE8;
                    V_TableRec(i).DATE9                             := v_DATE9;
                    V_TableRec(i).DATE10                            := v_DATE10;
                    V_TableRec(i).NUMBER1                           := v_NUMBER1;
                    V_TableRec(i).NUMBER2                           := v_NUMBER2;
                    V_TableRec(i).NUMBER3                           := v_NUMBER3;
                    V_TableRec(i).NUMBER4                           := v_NUMBER4;
                    V_TableRec(i).NUMBER5                           := v_NUMBER5;
                    V_TableRec(i).NUMBER6                           := v_NUMBER6;
                    V_TableRec(i).NUMBER7                           := v_NUMBER7;
                    V_TableRec(i).NUMBER8                           := v_NUMBER8;
                    V_TableRec(i).NUMBER9                           := v_NUMBER9;
                    V_TableRec(i).NUMBER10                          := v_NUMBER10;
                    V_TableRec(i).DECIMAL1                          := v_DECIMAL1;
                    V_TableRec(i).DECIMAL2                          := v_DECIMAL2;
                    V_TableRec(i).DECIMAL3                          := v_DECIMAL3;
                    V_TableRec(i).DECIMAL4                          := v_DECIMAL4;
                    V_TableRec(i).DECIMAL5                          := v_DECIMAL5;
                    V_TableRec(i).DECIMAL6                          := v_DECIMAL6;
                    V_TableRec(i).DECIMAL7                          := v_DECIMAL7;
                    V_TableRec(i).DECIMAL8                          := v_DECIMAL8;
                    V_TableRec(i).DECIMAL9                          := v_DECIMAL9;
                    V_TableRec(i).DECIMAL10                         := v_DECIMAL10;
                    V_TableRec(i).CORE_CUST_ID                      := v_CORE_CUST_ID;
                    V_TableRec(i).PERSON_TYPE                       := v_PERSONTYPE;
                    V_TableRec(i).CUST_LANGUAGE                     := v_CUST_LANGUAGE;
                    V_TableRec(i).CUST_STAFF_STATUS                 := v_CUST_STAFF_STATUS;
                    V_TableRec(i).PHONE                             := v_PHONE;
                    V_TableRec(i).EXTENSION                         := v_EXTENSION;
                    V_TableRec(i).FAX                               := v_FAX;
                    V_TableRec(i).FAX_HOME                          := v_FAX_HOME;
                    V_TableRec(i).PHONE_HOME                        := v_PHONE_HOME;
                    V_TableRec(i).PHONE_HOME2                       := v_PHONE_HOME2;
                    V_TableRec(i).PHONE_CELL                        := v_PHONE_CELL;
                    V_TableRec(i).EMAIL_HOME                        := v_EMAIL_HOME;
                    V_TableRec(i).EMAIL_PALM                        := v_EMAIL_PALM;
                    V_TableRec(i).EMAIL                             := v_EMAIL;
                    V_TableRec(i).CITY                              := v_CITY;
                    V_TableRec(i).PREFERREDCHANNELID                := v_PREFERREDCHANNELID;
                    V_TableRec(i).CUSTOMER_RELATIONSHIP_NUMBER      := v_CUSTOMERRELATIONSHIPNUMBER;
                    V_TableRec(i).RELATIONSHIPVALUE                 := v_RELATIONSHIPVALUE;
                    V_TableRec(i).CATEGORY                          := v_CATEGORY;
                    V_TableRec(i).NUMBEROFPRODUCTS                  := v_NUMBEROFPRODUCTS;
                    V_TableRec(i).RELATIONSHIP_MANAGER_ID           := v_RELATIONSHIPMANAGERID;
                    V_TableRec(i).RELATIONSHIP_CREATED_BY_ID        := v_RELATIONSHIPCREATEDBYID;
                    V_TableRec(i).URL                               := v_URL;
                    V_TableRec(i).STATUS                            := v_STATUS;
                    V_TableRec(i).INDUSTRY                          := v_INDUSTRY;
                    V_TableRec(i).PARENTORG                         := v_PARENTORG;
                    V_TableRec(i).COMPETITOR                        := v_COMPETITOR;
                    V_TableRec(i).SIC_CODE                          := v_SICCODE;
                    V_TableRec(i).CIN                               := v_CIN;
                    V_TableRec(i).DESIGNATION                       := v_DESIGNATION;
                    V_TableRec(i).ASSISTANT                         := v_ASSISTANT;
                    V_TableRec(i).INTERNAL_SCORE                    := v_INTERNALSCORE;
                    V_TableRec(i).CREDIT_BUREAU_SCORE_VALIDITY      := v_CREDITBUREAUSCOREVALIDITY;
                    V_TableRec(i).CREDIT_BUREAU_SCORE               := v_CREDITBUREAUSCORE;
                    V_TableRec(i).CREDIT_BUREAU_REQUEST_DATE        := v_CREDITBUREAUREQUESTDATE;
                    V_TableRec(i).CREDIT_BUREAU_DESCRIPTION         := v_CREDITBUREAUDESCRIPTION;
                    V_TableRec(i).MAIDENNAMEOFMOTHER                := v_MAIDENNAMEOFMOTHER;
                    V_TableRec(i).ANNUAL_REVENUE                    := v_ANNUALREVENUE;
                    V_TableRec(i).REVENUE_UNITS                     := v_REVENUEUNITS;
                    V_TableRec(i).TICKER_SYMBOL                     := v_TICKERSYMBOL;
                    V_TableRec(i).AUTO_APRPOVAL                     := v_AUTOAPRPOVAL;
                    V_TableRec(i).FREEZE_PRODUCT_SALE               := v_FREEZEPRODUCTSALE;
                    V_TableRec(i).RELATIONSHIP_FIELD_1              := v_RELATIONSHIPFIELD1;
                    V_TableRec(i).RELATIONSHIP_FIELD_2              := v_RELATIONSHIPFIELD2;
                    V_TableRec(i).RELATIONSHIP_FIELD_3              := v_RELATIONSHIPFIELD3;
                    V_TableRec(i).DELINQUENCYFLAG                   := v_DELINQUENCYFLAG;
                    V_TableRec(i).CUSTOMER_NRE_FLAG                 := v_CUSTOMERNREFLAG_1;
                    V_TableRec(i).COMBINEDSTATEMENTFLG              := v_CombinedStatementFlg;
                    V_TableRec(i).CUSTOMERTRADE                     := v_CustomerTrade;
                    V_TableRec(i).PLACEOFBIRTH                      := v_PlaceOfBirth;
                    V_TableRec(i).COUNTRYOFBIRTH                    := v_CountryOfBirth;
                    V_TableRec(i).PROOFOFAGEFLAG                    := v_ProofOfAgeFlag;
                    V_TableRec(i).PROOFOFAGEDOCUMENT                := v_ProofOfAgeDocument;
                    V_TableRec(i).NAMESUFFIX                        := v_NameSuffix;
                    V_TableRec(i).MAIDENNAME                        := v_MaidenName;
                    V_TableRec(i).CUSTOMERPROFITABILITY             := v_CustomerProfitability;
                    V_TableRec(i).CURRENTCREXPOSURE                 := v_CurrentCrExposure;
                    V_TableRec(i).TOTALCREXPOSURE                   := v_TotalCrExposure;
                    V_TableRec(i).POTENTIALCRLINE                   := v_PotentialCrLine;
                    V_TableRec(i).AVAILABLECRLIMIT                  := v_AvailableCrLimit;
                    V_TableRec(i).CREDIT_SCORE_REQUESTED_FLAG       := v_CREDITSCOREREQUESTEDFLAG;
                    V_TableRec(i).CREDIRT_HISTORY_REQUESTED_FLAG    := v_CREDIRTHISTORYREQUESTEDFLAG;
                    V_TableRec(i).GROUP_ID                          := v_GROUPID;
                    V_TableRec(i).FLG1                              := v_FLG1;
                    V_TableRec(i).FLG2                              := v_FLG2;
                    V_TableRec(i).FLG3                              := v_FLG3;
                    V_TableRec(i).ALERT1                            := v_ALERT1;
                    V_TableRec(i).ALERT2                            := v_ALERT2;
                    V_TableRec(i).ALERT3                            := v_ALERT3;
                    V_TableRec(i).RELATIONSHIPOFFER1                := v_RELATIONSHIPOFFER1;
                    V_TableRec(i).RELATIONSHIPOFFER2                := v_RELATIONSHIPOFFER2;
                    V_TableRec(i).DTDATE1                           := v_DTDATE1;
                    V_TableRec(i).DTDATE2                           := v_DTDATE2;
                    V_TableRec(i).DTDATE3                           := v_DTDATE3;
                    V_TableRec(i).DTDATE4                           := v_DTDATE4;
                    V_TableRec(i).DTDATE5                           := v_DTDATE5;
                    V_TableRec(i).DTDATE6                           := v_DTDATE6;
                    V_TableRec(i).DTDATE7                           := v_DTDATE7;
                    V_TableRec(i).DTDATE8                           := v_DTDATE8;
                    V_TableRec(i).DTDATE9                           := v_DTDATE9;
                    V_TableRec(i).AMOUNT1                           := v_Amount1;
                    V_TableRec(i).AMOUNT2                           := v_Amount2;
                    V_TableRec(i).AMOUNT3                           := v_Amount3;
                    V_TableRec(i).AMOUNT4                           := v_Amount4;
                    V_TableRec(i).AMOUNT5                           := v_Amount5;
                    V_TableRec(i).STRFIELD1                         := v_strfield1;
                    V_TableRec(i).STRFIELD2                         := v_strfield2;
                    V_TableRec(i).STRFIELD3                         := v_strfield3;
                    V_TableRec(i).STRFIELD4                         := v_strfield4;
                    V_TableRec(i).STRFIELD5                         := v_strfield5;
                    V_TableRec(i).STRFIELD6                         := v_strfield6;
                    V_TableRec(i).STRFIELD7                         := v_strfield7;
                    V_TableRec(i).STRFIELD8                         := v_strfield8;
                    V_TableRec(i).STRFIELD9                         := v_strfield9;
                    V_TableRec(i).STRFIELD10                        := v_strfield10;
                    V_TableRec(i).STRFIELD11                        := v_strfield11;
                    V_TableRec(i).STRFIELD12                        := v_strfield12;
                    V_TableRec(i).STRFIELD13                        := v_strfield13;
                    V_TableRec(i).STRFIELD14                        := v_strfield14;
                    V_TableRec(i).STRFIELD15                        := v_strfield15;
                    V_TableRec(i).USERFLAG1                         := v_UserFlag1;
                    V_TableRec(i).USERFLAG2                         := v_UserFlag2;
                    V_TableRec(i).USERFLAG3                         := v_UserFlag3;
                    V_TableRec(i).USERFLAG4                         := v_UserFlag4;
                    V_TableRec(i).MLUSERFIELD1                      := v_MLUserField1;
                    V_TableRec(i).MLUSERFIELD2                      := v_MLUserField2;
                    V_TableRec(i).MLUSERFIELD3                      := v_MLUserField3;
                    V_TableRec(i).MLUSERFIELD4                      := v_MLUserField4;
                    V_TableRec(i).MLUSERFIELD5                      := v_MLUserField5;
                    V_TableRec(i).MLUSERFIELD6                      := v_MLUserField6;
                    V_TableRec(i).MLUSERFIELD7                      := v_MLUserField7;
                    V_TableRec(i).MLUSERFIELD8                      := v_MLUserField8;
                    V_TableRec(i).MLUSERFIELD9                      := v_MLUserField9;
                    V_TableRec(i).MLUSERFIELD10                     := v_MLUserField10;
                    V_TableRec(i).MLUSERFIELD11                     := v_MLUserField11;
                    V_TableRec(i).NOTES                             := v_Notes;
                    V_TableRec(i).PRIORITYCODE                      := v_PriorityCode;
                    V_TableRec(i).CREATED_FROM                      := v_Created_From;
                    V_TableRec(i).CONSTITUTION_CODE                 := v_Constitution_Code;
                    V_TableRec(i).STRFIELD16                        := v_StrField16;
                    V_TableRec(i).STRFIELD17                        := v_StrField17;
                    V_TableRec(i).STRFIELD18                        := v_StrField18;
                    V_TableRec(i).STRFIELD19                        := v_StrField19;
                    V_TableRec(i).STRFIELD20                        := v_StrField20;
                    V_TableRec(i).STRFIELD21                        := v_StrField21;
                    V_TableRec(i).STRFIELD22                        := v_StrField22;
                    V_TableRec(i).AMOUNT6                           := v_Amount6;
                    V_TableRec(i).AMOUNT7                           := v_Amount7;
                    V_TableRec(i).AMOUNT8                           := v_Amount8;
                    V_TableRec(i).AMOUNT9                           := v_Amount9;
                    V_TableRec(i).AMOUNT10                          := v_Amount10;
                    V_TableRec(i).AMOUNT11                          := v_Amount11;
                    V_TableRec(i).AMOUNT12                          := v_Amount12;
                    V_TableRec(i).INTFIELD1                         := v_IntField1;
                    V_TableRec(i).INTFIELD2                         := v_IntField2;
                    V_TableRec(i).INTFIELD3                         := v_IntField3;
                    V_TableRec(i).INTFIELD4                         := v_IntField4;
                    V_TableRec(i).INTFIELD5                         := v_IntField5;
                    V_TableRec(i).NICK_NAME                         := v_nick_name;
                    V_TableRec(i).MOTHER_NAME                       := v_mother_name;
                    V_TableRec(i).FATHER_HUSBAND_NAME               := v_father_husband_name;
                    V_TableRec(i).PREVIOUS_NAME                     := v_previous_name;
                    V_TableRec(i).LEAD_SOURCE                       := v_lead_source;
                    V_TableRec(i).RELATIONSHIP_TYPE                 := v_relationship_type;
                    V_TableRec(i).RM_GROUP_ID                       := v_rm_group_id;
                    V_TableRec(i).RELATIONSHIP_LEVEL                := v_relationship_level;
                    V_TableRec(i).DSA_ID                            := v_DSA_ID;
                    V_TableRec(i).PHOTOGRAPH_ID                     := v_photograph_id;
                    V_TableRec(i).SECURE_ID                         := v_Secure_id;
                    V_TableRec(i).DELIQUENCYPERIOD                  := v_DeliquencyPeriod;
                    V_TableRec(i).ADDNAME1                          := v_AddName1;
                    V_TableRec(i).ADDNAME2                          := v_AddName2;
                    V_TableRec(i).ADDNAME3                          := v_AddName3;
                    V_TableRec(i).ADDNAME4                          := v_AddName4;
                    V_TableRec(i).ADDNAME5                          := v_AddName5;
                    V_TableRec(i).OLDENTITYCREATEDON                := v_OldEntityCreatedOn;
                    V_TableRec(i).OLDENTITYTYPE                     := v_OldEntityType;
                    V_TableRec(i).OLDENTITYID                       := v_OldEntityID;
                    V_TableRec(i).DOCUMENT_RECEIVED                 := v_Document_Received;
                    V_TableRec(i).SUSPEND_NOTES                     := v_Suspend_Notes;
                    V_TableRec(i).SUSPEND_REASON                    := v_Suspend_Reason;
                    V_TableRec(i).BLACKLIST_NOTES                   := v_Blacklist_Notes;
                    V_TableRec(i).BLACKLIST_REASON                  := v_Blacklist_Reason;
                    V_TableRec(i).NEGATED_NOTES                     := v_Negated_Notes;
                    V_TableRec(i).NEGATED_REASON                    := v_Negated_Reason;
                    V_TableRec(i).SEGMENTATION_CLASS                := v_Segmentation_Class;
                    V_TableRec(i).NAME                              := v_Name;
                    V_TableRec(i).MANAGEROPINION                    := v_ManagerOpinion;
                    V_TableRec(i).INTROD_STATUS                     := v_Introd_Status;
                    V_TableRec(i).NATIVELANGCODE                    := v_NativeLangCode;
                    V_TableRec(i).MINORATTAINMAJORDATE              := v_MinorAttainMajorDate;
                    V_TableRec(i).NREBECOMINGORDDATE                := v_NREBecomingOrdDate;
                    V_TableRec(i).STARTDATE                         := v_StartDate;
                    V_TableRec(i).ADD1_FIRST_NAME                   := v_Add1_First_Name;
                    V_TableRec(i).ADD1_MIDDLE_NAME                  := v_Add1_Middle_Name;
                    V_TableRec(i).ADD1_LAST_NAME                    := v_Add1_Last_Name;
                    V_TableRec(i).ADD2_FIRST_NAME                   := v_Add2_First_Name;
                    V_TableRec(i).ADD2_MIDDLE_NAME                  := v_Add2_Middle_Name;
                    V_TableRec(i).ADD2_LAST_NAME                    := v_Add2_Last_Name;
                    V_TableRec(i).ADD3_FIRST_NAME                   := v_Add3_First_Name;
                    V_TableRec(i).ADD3_MIDDLE_NAME                  := v_Add3_Middle_Name;
                    V_TableRec(i).ADD3_LAST_NAME                    := v_Add3_Last_Name;
                    V_TableRec(i).ADD4_FIRST_NAME                   := v_Add4_First_Name;
                    V_TableRec(i).ADD4_MIDDLE_NAME                  := v_Add4_Middle_Name;
                    V_TableRec(i).ADD4_LAST_NAME                    := v_Add4_Last_Name;
                    V_TableRec(i).ADD5_FIRST_NAME                   := v_Add5_First_Name;
                    V_TableRec(i).ADD5_MIDDLE_NAME                  := v_Add5_Middle_Name;
                    V_TableRec(i).ADD5_LAST_NAME                    := v_Add5_Last_Name;
                    V_TableRec(i).DUAL_FIRST_NAME                   := v_Dual_First_Name;
                    V_TableRec(i).DUAL_MIDDLE_NAME                  := v_Dual_Middle_Name;
                    V_TableRec(i).DUAL_LAST_NAME                    := v_Dual_Last_Name;
                    V_TableRec(i).CUST_COMMUNITY                    := v_Cust_Community;
                    V_TableRec(i).CORE_INTROD_CUST_ID               := v_Core_introd_cust_id;
                    V_TableRec(i).INTROD_SALUTATION_CODE            := v_Introd_Salutation_code;
                    V_TableRec(i).TDS_CUST_ID                       := v_Tds_cust_id;
                    V_TableRec(i).NAT_ID_CARD_NUM                   := v_Nat_id_card_num;
                    V_TableRec(i).PSPRT_ISSUE_DATE                  := v_Psprt_issue_date;
                    V_TableRec(i).PSPRT_DET                         := v_Psprt_det;
                    V_TableRec(i).PSPRT_EXP_DATE                    := v_Psprt_exp_date;
                    V_TableRec(i).CRNCY_CODE                        := v_Crncy_code;
                    V_TableRec(i).PREF_CODE                         := v_Pref_code;
                    V_TableRec(i).INTROD_STATUS_CODE                := v_Introd_Status_Code;
                    V_TableRec(i).NATIVELANGTITLE_CODE              := v_NativeLangTitle_code;
                    V_TableRec(i).GROUPID_CODE                      := v_Groupid_code;
                    V_TableRec(i).SECTOR                            := v_Sector;
                    V_TableRec(i).SUBSECTOR                         := v_SubSector;
                    V_TableRec(i).CUSTCREATIONMODE                  := v_CustCreationMode;
                    V_TableRec(i).FIRST_PRODUCT_PROCESSOR           := v_First_Product_Processor;
                    V_TableRec(i).INTERFACE_REFERENCE_ID            := v_Interface_Reference_ID;
                    V_TableRec(i).CUST_HEALTH_REF_CODE              := v_cust_health_ref_code;
                    V_TableRec(i).TDS_CIFID                         := v_TDS_CIFID;
                    V_TableRec(i).PREF_CODE_RCODE                   := v_PREF_CODE_RCODE;
                    V_TableRec(i).CUST_SWIFT_CODE_DESC              := v_CUST_SWIFT_CODE_DESC;
                    V_TableRec(i).IS_SWIFT_CODE_OF_BANK             := v_IS_SWIFT_CODE_OF_BANK;
                    V_TableRec(i).NATIVELANGCODE_CODE               := v_NATIVELANGCODE_CODE;
                    V_TableRec(i).CREATEDBYSYSTEMID                 := v_CreatedBySystemID;
                    V_TableRec(i).PREFERREDEMAILTYPE                := v_PreferredEmailType;
                    V_TableRec(i).PREFERREDPHONE                    := v_PreferredPhone;
                    V_TableRec(i).FIRST_NAME_NATIVE                 := v_FIRST_NAME_NATIVE;
                    V_TableRec(i).MIDDLE_NAME_NATIVE                := v_MIDDLE_NAME_NATIVE;
                    V_TableRec(i).LAST_NAME_NATIVE                  := v_LAST_NAME_NATIVE;
                    V_TableRec(i).SHORT_NAME_NATIVE                 := v_SHORT_NAME_NATIVE;
                    V_TableRec(i).FIRST_NAME_NATIVE1                := v_FIRST_NAME_NATIVE1;
                    V_TableRec(i).MIDDLE_NAME_NATIVE1               := v_MIDDLE_NAME_NATIVE1;
                    V_TableRec(i).LAST_NAME_NATIVE1                 := v_LAST_NAME_NATIVE1;
                    V_TableRec(i).SHORT_NAME_NATIVE1                := v_SHORT_NAME_NATIVE1;
                    V_TableRec(i).SECONDARYRM_ID                    := v_SecondaryRM_ID;
                    V_TableRec(i).TERTIARYRM_ID                     := v_TertiaryRM_ID;
                    V_TableRec(i).SUBSEGMENT                        := v_SUBSEGMENT;
                    V_TableRec(i).ACCESSOWNERGROUP                  := v_ACCESSOWNERGROUP;
                    V_TableRec(i).ACCESSOWNERSEGMENT                := v_ACCESSOWNERSEGMENT;
                    V_TableRec(i).ACCESSOWNERBC                     := v_ACCESSOWNERBC;
                    V_TableRec(i).ACCESSOWNERAGENT                  := v_ACCESSOWNERAGENT;
                    V_TableRec(i).ACCESSASSIGNEEAGENT               := v_ACCESSASSIGNEEAGENT;
                    V_TableRec(i).CHARGELEVELCODE                   := v_CHARGELEVELCODE;
                    V_TableRec(i).INTUSERFIELD1                     := v_IntUserField1;
                    V_TableRec(i).INTUSERFIELD2                     := v_IntUserField2;
                    V_TableRec(i).INTUSERFIELD3                     := v_IntUserField3;
                    V_TableRec(i).INTUSERFIELD4                     := v_IntUserField4;
                    V_TableRec(i).INTUSERFIELD5                     := v_IntUserField5;
                    V_TableRec(i).STRUSERFIELD1                     := v_StrUserField1;
                    V_TableRec(i).STRUSERFIELD2                     := v_StrUserField2;
                    V_TableRec(i).STRUSERFIELD3                     := v_StrUserField3;
                    V_TableRec(i).STRUSERFIELD4                     := v_StrUserField4;
                    V_TableRec(i).STRUSERFIELD5                     := v_StrUserField5;
                    V_TableRec(i).STRUSERFIELD6                     := v_StrUserField6;
                    V_TableRec(i).STRUSERFIELD7                     := v_StrUserField7;
                    V_TableRec(i).STRUSERFIELD8                     := v_StrUserField8;
                    V_TableRec(i).STRUSERFIELD9                     := v_StrUserField9;
                    V_TableRec(i).STRUSERFIELD10                    := v_StrUserField10;
                    V_TableRec(i).STRUSERFIELD11                    := v_StrUserField11;
                    V_TableRec(i).STRUSERFIELD12                    := v_StrUserField12;
                    V_TableRec(i).STRUSERFIELD13                    := v_StrUserField13;
                    V_TableRec(i).STRUSERFIELD14                    := v_StrUserField14;
                    V_TableRec(i).STRUSERFIELD15                    := v_StrUserField15;
                    V_TableRec(i).STRUSERFIELD16                    := v_StrUserField16;
                    V_TableRec(i).STRUSERFIELD17                    := v_StrUserField17;
                    V_TableRec(i).STRUSERFIELD18                    := v_StrUserField18;
                    V_TableRec(i).STRUSERFIELD19                    := v_StrUserField19;
                    V_TableRec(i).STRUSERFIELD20                    := v_StrUserField20;
                    V_TableRec(i).STRUSERFIELD21                    := v_StrUserField21;
                    V_TableRec(i).STRUSERFIELD22                    := v_StrUserField22;
                    V_TableRec(i).STRUSERFIELD23                    := v_StrUserField23;
                    V_TableRec(i).STRUSERFIELD24                    := v_StrUserField24;
                    V_TableRec(i).STRUSERFIELD25                    := v_StrUserField25;
                    V_TableRec(i).STRUSERFIELD26                    := v_StrUserField26;
                    V_TableRec(i).STRUSERFIELD27                    := v_StrUserField27;
                    V_TableRec(i).STRUSERFIELD28                    := v_StrUserField28;
                    V_TableRec(i).STRUSERFIELD29                    := v_StrUserField29;
                    V_TableRec(i).STRUSERFIELD30                    := v_StrUserField30;
                    V_TableRec(i).DATEUSERFIELD1                    := v_DateUserField1;
                    V_TableRec(i).DATEUSERFIELD2                    := v_DateUserField2;
                    V_TableRec(i).DATEUSERFIELD3                    := v_DateUserField3;
                    V_TableRec(i).DATEUSERFIELD4                    := v_DateUserField4;
                    V_TableRec(i).DATEUSERFIELD5                    := v_DateUserField5;
                    V_TableRec(i).BACKENDID                         := v_BackEndID;
                    V_TableRec(i).RISK_PROFILE_SCORE                := v_RISK_PROFILE_SCORE;
                    V_TableRec(i).RISK_PROFILE_EXPIRY_DATE          := v_RISK_PROFILE_EXPIRY_DATE;
                    V_TableRec(i).PREFERREDPHONETYPE                := v_PreferredPhoneType;
                    V_TableRec(i).PREFERREDEMAIL                    := v_PreferredEmail;
                    V_TableRec(i).NOOFCREDITCARDS                   := v_NoOfCreditCards;
                    V_TableRec(i).REASONFORMOVINGOUT                := v_ReasonForMovingOut;
                    V_TableRec(i).COMPETITORPRODUCTID               := v_CompetitorProductID;
                    V_TableRec(i).OCCUPATION_TYPE                   := v_OCCUPATIONTYPE;
                    V_TableRec(i).BANK_ID                           := v_BANK_ID;
                    V_TableRec(i).ZAKAT_DEDUCTION                   := v_ZAKAT_DEDUCTION;
                    V_TableRec(i).ASSET_CLASSIFICATION              := v_ASSET_CLASSIFICATION;
                    V_TableRec(i).CUSTOMER_LEVEL_PROVISIONING       := v_CUSTOMER_LEVEL_PROVISIONING;
                    V_TableRec(i).ISLAMIC_BANKING_CUSTOMER          := v_ISLAMIC_BANKING_CUSTOMER;
                    V_TableRec(i).PREFERREDCALENDER                 := v_PREFERREDCALENDER;
                    V_TableRec(i).IDTYPER1                          := v_IDTYPER1;
                    V_TableRec(i).IDTYPER2                          := v_IDTYPER2;
                    V_TableRec(i).IDTYPER3                          := v_IDTYPER3;
                    V_TableRec(i).IDTYPER4                          := v_IDTYPER4;
                    V_TableRec(i).IDTYPER5                          := v_IDTYPER5;
                    V_TableRec(i).CUST_LAST_NAME_ALT1               := v_CUST_LAST_NAME_ALT1;
                    V_TableRec(i).CUST_FIRST_NAME_ALT1              := v_CUST_FIRST_NAME_ALT1;
                    V_TableRec(i).CUST_MIDDLE_NAME_ALT1             := v_CUST_MIDDLE_NAME_ALT1;
                    V_TableRec(i).STRFIELD6_ALT1                    := v_STRFIELD6_ALT1;
                    V_TableRec(i).NAME_ALT1                         := v_NAME_ALT1;
                    V_TableRec(i).SHORT_NAME_ALT1                   := v_SHORT_NAME_ALT1;
                    V_TableRec(i).ISEBANKINGENABLED                 := v_ISEBANKINGENABLED;
                    V_TableRec(i).PURGEFLAG                         := v_PURGEFLAG;
                    V_TableRec(i).SUSPENDED                         := v_SUSPENDED;
                    V_TableRec(i).BLACKLISTED                       := v_BLACKLISTED;
                    V_TableRec(i).NEGATED                           := v_NEGATED;
                    V_TableRec(i).ACCOUNTID                         := v_ACCOUNTID;
                    V_TableRec(i).ADDRESS_LINE1                     := v_ADDRESS_LINE1;
                    V_TableRec(i).ADDRESS_LINE2                     := v_ADDRESS_LINE2;
                    V_TableRec(i).ADDRESS_LINE3                     := v_ADDRESS_LINE3;
                    V_TableRec(i).STATE                             := v_STATE;
                    V_TableRec(i).COUNTRY                           := v_COUNTRY;
                    V_TableRec(i).ZIP                               := v_ZIP;
                    V_TableRec(i).BOCREATEDBYLOGINID                := v_BOCREATEDBYLOGINID;
                    V_TableRec(i).SUBMITFORKYC                      := v_SUBMITFORKYC;
                    V_TableRec(i).KYC_REVIEWDATE                    := v_KYC_REVIEWDATE;
                    V_TableRec(i).KYC_DATE                          := v_KYC_DATE;
                    V_TableRec(i).RISKRATING                        := v_RISKRATING;
                    V_TableRec(i).SENIORCITIZEN                     := v_SENIORCITIZEN;
                    V_TableRec(i).SENCITIZENAPPLICABLEDATE          := v_SENCITIZENAPPLICABLEDATE;
                    V_TableRec(i).SENCITIZENCONVERSIONFLAG          := v_SENCITIZENCONVERSIONFLAG;
                    V_TableRec(i).FOREIGNACCTAXREPORTINGREQ         := v_ForeignAccTaxReportingReq;
                    V_TableRec(i).FOREIGNTAXREPORTINGCOUNTRY        := v_ForeignTaxReportingCountry;
                    V_TableRec(i).FOREIGNTAXREPORTINGSTATUS         := v_ForeignTaxReportingStatus;
                    V_TableRec(i).LASTFOREIGNTAXREVIEWDATE          := v_LastForeignTaxReviewDate;
                    V_TableRec(i).NEXTFOREIGNTAXREVIEWDATE          := v_NextForeignTaxReviewDate;
                    V_TableRec(i).FATCAREMARKS                      := v_FatcaRemarks;
                    V_TableRec(i).DATEOFDEATH                       := v_DateOfDeath;
                    V_TableRec(i).DATEOFNOTIFICATION                := v_DateOfNotification;
                    V_TableRec(i).PHYSICAL_STATE                    := v_PHYSICAL_STATE;
                    V_TableRec(i).UNIQUEIDNUMBER                    := v_UNIQUEIDNUMBER;
                    V_TableRec(i).ENABLE_ALERTS                     := v_ENABLE_ALERTS;
                    V_TableRec(i).DEFAULTCHANNEL_ALERT              := v_DEFAULTCHANNEL_ALERT;
                    V_TableRec(i).PREFERRED_MOBILE_ALERT_NO         := v_PREFERRED_MOBILE_ALERT_NO;
                    V_TableRec(i).PREFERRED_MOBILE_ALERT_TYPE       := v_PREFERRED_MOBILE_ALERT_TYPE;
                    V_TableRec(i).SOL_ID                            := InpSolId;
                --}
                END LOOP;

                FORALL i IN INDICES OF V_TABLEREC
                    INSERT INTO RC001 VALUES V_TABLEREC(i);

                commit;

                v_TableRec.delete;
            --}
            end loop;
            CLOSE c1;
        --}
        END RC001;
    --} Procuder RC001 End

    PROCEDURE RC002 (InpSolId IN VARCHAR2) IS
    --{
        V_ORGKEY				NVarchar2(50) := '';
        V_ADDRESSCATEGORY		NVarchar2(100) := '';
        V_START_DATE			Date := '';
        V_PhoneNo1LocalCode		NVarchar2(20) := '';
        V_PhoneNo1CityCode		NVarchar2(20) := '';
        V_PhoneNo1CountryCode	NVarchar2(20) := '';
        V_PhoneNo2LocalCode		NVarchar2(20) := '';
        V_PhoneNo2CityCode		NVarchar2(20) := '';
        V_PhoneNo2CountryCode	NVarchar2(20) := '';
        V_WorkExtension			NVarchar2(10) := '';
        V_FaxNoLocalCode		NVarchar2(20) := '';
        V_FaxNoCityCode			NVarchar2(20) := '';
        V_FaxNoCountryCode		NVarchar2(20) := '';
        V_Email					NVarchar2(50) := '';
        V_PagerNoLocalCode		NVarchar2(20) := '';
        V_PagerNoCityCode		NVarchar2(20) := '';
        V_PagerNoCountryCode	NVarchar2(20) := '';
        V_TelexLocalCode		NVarchar2(20) := '';
        V_TelexCityCode			NVarchar2(20) := '';
        V_TelexCountryCode		NVarchar2(20) := '';
        V_HOUSE_NO				NVarchar2(10) := '';
        V_PREMISE_NAME			NVarchar2(50) := '';
        V_BUILDING_LEVEL		NVarchar2(10) := '';
        V_STREET_NO				NVarchar2(50) := '';
        V_STREET_NAME			NVarchar2(50) := '';
        V_SUBURB				NVarchar2(50) := '';
        V_LOCALITY_NAME			NVarchar2(50) := '';
        V_TOWN					NVarchar2(50) := '';
        V_DOMICILE				NVarchar2(50) := '';
        V_CITY_CODE				NVarchar2(100) := '';
        V_STATE_CODE			NVarchar2(100) := '';
        V_ZIP					NVarchar2(100) := '';
        V_COUNTRY_CODE			NVarchar2(100) := '';
        V_ADDRESS_LINE1			NVarchar2(45) := '';
        V_ADDRESS_LINE2			NVarchar2(45) := '';
        V_ADDRESS_LINE3			NVarchar2(45) := '';
        V_END_DATE				Date := '';
        V_SMALL_STR1			NVarchar2(50) := '';
        V_SMALL_STR2			NVarchar2(50) := '';
        V_SMALL_STR3			NVarchar2(50) := '';
        V_SMALL_STR4			NVarchar2(50) := '';
        V_SMALL_STR5			NVarchar2(50) := '';
        V_SMALL_STR6			NVarchar2(50) := '';
        V_SMALL_STR7			NVarchar2(50) := '';
        V_SMALL_STR8			NVarchar2(50) := '';
        V_SMALL_STR9			NVarchar2(50) := '';
        V_SMALL_STR10			NVarchar2(50) := '';
        V_MED_STR1				NVarchar2(100) := '';
        V_MED_STR2				NVarchar2(100) := '';
        V_MED_STR3				NVarchar2(100) := '';
        V_MED_STR4				NVarchar2(100) := '';
        V_MED_STR5				NVarchar2(100) := '';
        V_MED_STR6				NVarchar2(100) := '';
        V_MED_STR7				NVarchar2(100) := '';
        V_MED_STR8				NVarchar2(100) := '';
        V_MED_STR9				NVarchar2(100) := '';
        V_MED_STR10				NVarchar2(100) := '';
        V_LARGE_STR1			NVarchar2(250) := '';
        V_LARGE_STR2			NVarchar2(250) := '';
        V_LARGE_STR3			NVarchar2(250) := '';
        V_LARGE_STR4			NVarchar2(250) := '';
        V_LARGE_STR5			NVarchar2(250) := '';
        V_DATE1					Date := '';
        V_DATE2					Date := '';
        V_DATE3					Date := '';
        V_DATE4					Date := '';
        V_DATE5					Date := '';
        V_DATE6					Date := '';
        V_DATE7					Date := '';
        V_DATE8					Date := '';
        V_DATE9					Date := '';
        V_DATE10				Date := '';
        V_NUMBER1				Numeric(38) := '';
        V_NUMBER2				Numeric(38) := '';
        V_NUMBER3				Numeric(38) := '';
        V_NUMBER4				Numeric(38) := '';
        V_NUMBER5				Numeric(38) := '';
        V_NUMBER6				Numeric(38) := '';
        V_NUMBER7				Numeric(38) := '';
        V_NUMBER8				Numeric(38) := '';
        V_NUMBER9				Numeric(38) := '';
        V_NUMBER10				Numeric(38) := '';
        V_DECIMAL1				Numeric(25) := '';
        V_DECIMAL2				Numeric(25) := '';
        V_DECIMAL3				Numeric(25) := '';
        V_DECIMAL4				Numeric(25) := '';
        V_DECIMAL5				Numeric(25) := '';
        V_DECIMAL6				Numeric(25) := '';
        V_DECIMAL7				Numeric(25) := '';
        V_DECIMAL8				Numeric(25) := '';
        V_DECIMAL9				Numeric(25) := '';
        V_DECIMAL10				Numeric(25) := '';
        V_CIFID					NVarchar2(32) := '';
        V_preferredAddress		NVarchar2(50) := '';
        V_HoldMailInitiatedBy	NVarchar2(50) := '';
        V_HoldMailFlag			NVarchar2(50) := '';
        V_BusinessCenter		NVarchar2(50) := '';
        V_HoldMailReason		NVarchar2(200) := '';
        V_PreferredFormat		NVarchar2(50) := '';
        V_FreeTextAddress		NVarchar2(2000) := '';
        V_FreeTextLabel			NVarchar2(200) := '';
        V_IS_ADDRESS_PROOF_RCVD	NVarchar2(1) := '';
        V_LASTUPDATE_DATE		Date := '';
        V_BANK_ID				NVarchar2(8) := '';
        V_IsAddressVerified		NVarchar2(1) := '';
        V_ADDRESS				NVARCHAR2(350) := '';

        /*
        cursor c1 is
        select * from addrdtls
        where addrdtls_inv_num in
        (select CLIENTS_ADDR_INV_NUM from clients
        where clients_code in ('1590996','1801140','1575847','358307','358441','355094'));
        */
        CURSOR C2(CurSolId varchar2) IS
        SELECT CIF_ID FROM VALID_CIF WHERE SOL_ID = CurSolId AND CIF_TYPE = 'R';

        CURSOR C1 (InpCif number) is
        select CLIENTS_CODE
        ,NVL(ADDRDTLS_PIN_ZIP_CODE,'MIG') ZIP_CODE
        ,NVL(NVL(ADDRDTLS_EFF_FROM_DATE,CLIENTS_OPENING_DATE),CLIENTS_ENTD_ON) ADDRDTLS_EFF_FROM_DATE
        ,ADDRDTLS_ADDR1
        ,ADDRDTLS_ADDR2
        ,ADDRDTLS_ADDR3
        ,ADDRDTLS_ADDR4
        ,ADDRDTLS_ADDR5
        ,ADDRDTLS_LOCN_CODE
        ,ADDRDTLS_ADDR_TYPE
        ,CASE WHEN ROW_NUMBER()
        OVER (PARTITION BY ADDRDTLS_INV_NUM ORDER BY CASE ADDRDTLS_ADDR_TYPE WHEN '03' THEN 1 WHEN '02' THEN 2 WHEN '01' THEN 3 WHEN '04' THEN 4 END) = 1
        THEN 'Y' ELSE 'N' END AS preferredaddrflag
        from cbs.addrdtls,cbs.clients
        where clients.CLIENTS_ADDR_INV_NUM = addrdtls.addrdtls_inv_num
        AND CLIENTS_CODE = InpCif
        AND (TRIM(ADDRDTLS_ADDR1) IS NOT NULL
            OR TRIM(ADDRDTLS_ADDR2) IS NOT NULL
            OR TRIM(ADDRDTLS_ADDR3) IS NOT NULL
            OR TRIM(ADDRDTLS_ADDR4) IS NOT NULL
            OR TRIM(ADDRDTLS_ADDR5) IS NOT NULL);

        BEGIN
        --{
            V_END_DATE := TO_DATE('31-12-2099','DD-MM-YYYY');
            V_BANK_ID := '01';

            FOR J IN C2(InpSolId)
            LOOP
            --{
                FOR I IN C1(J.CIF_ID)
                LOOP
                --{
                    V_ADDRESS :=  '';

                    V_ZIP := NVL(REPLACE(TRIM(I.ZIP_CODE),'.',''),'MIG');

                    V_ORGKEY := I.CLIENTS_CODE;

                    V_START_DATE := I.ADDRDTLS_EFF_FROM_DATE;

                    V_preferredAddress := i.preferredaddrflag;

                    IF(TRIM(I.ADDRDTLS_ADDR1) IS NOT NULL) THEN
                    --{
                        V_ADDRESS :=  I.ADDRDTLS_ADDR1;
                    --}
                    END IF;

                    IF(TRIM(I.ADDRDTLS_ADDR2) IS NOT NULL) THEN
                    --{
                        V_ADDRESS := V_ADDRESS ||' '|| I.ADDRDTLS_ADDR2;
                    --}
                    END IF;

                    IF(TRIM(I.ADDRDTLS_ADDR3) IS NOT NULL) THEN
                    --{
                        V_ADDRESS := V_ADDRESS ||' '|| I.ADDRDTLS_ADDR3;
                    --}
                    END IF;

                    IF(TRIM(I.ADDRDTLS_ADDR4) IS NOT NULL) THEN
                    --{
                        V_ADDRESS := V_ADDRESS ||' '|| I.ADDRDTLS_ADDR4;
                    --}
                    END IF;

                    IF(TRIM(I.ADDRDTLS_ADDR5) IS NOT NULL) THEN
                    --{
                        V_ADDRESS := V_ADDRESS ||' '|| I.ADDRDTLS_ADDR5;
                    --}
                    END IF;

                    V_ADDRESS := CommonExtractionPack.RemoveSpecialChars(V_ADDRESS);

                    V_ADDRESS_LINE1 := NULL;
                    V_ADDRESS_LINE2 := NULL;
                    V_ADDRESS_LINE3 := NULL;

                    V_HOUSE_NO			:= NULL;
                    V_PREMISE_NAME		:= NULL;
                    V_BUILDING_LEVEL	:= NULL;
                    V_STREET_NO			:= NULL;
                    V_STREET_NAME		:= NULL;
                    V_SUBURB			:= NULL;
                    V_LOCALITY_NAME		:= NULL;
                    V_TOWN				:= NULL;
                    V_DOMICILE			:= NULL;

                    IF(length(V_ADDRESS) > 135) THEN
                    --{
                        V_PreferredFormat := 'STRUCTURED_FORMAT';

                        V_HOUSE_NO			:= SUBSTR(V_ADDRESS,0,10);
                        V_PREMISE_NAME		:= SUBSTR(V_ADDRESS,11,50);
                        V_BUILDING_LEVEL	:= SUBSTR(V_ADDRESS,61,10);
                        V_STREET_NO			:= SUBSTR(V_ADDRESS,71,50);
                        V_STREET_NAME		:= SUBSTR(V_ADDRESS,121,50);
                        V_SUBURB			:= SUBSTR(V_ADDRESS,171,50);
                        V_LOCALITY_NAME		:= SUBSTR(V_ADDRESS,221,50);
                        V_TOWN				:= SUBSTR(V_ADDRESS,271,50);
                        V_DOMICILE			:= SUBSTR(V_ADDRESS,321,50);
                    --}
                    ELSE
                    --{
                        V_FreeTextAddress := V_ADDRESS;
                        V_FreeTextLabel	:= V_ADDRESS;
                        V_PreferredFormat := 'FREE_TEXT_FORMAT';

                        V_ADDRESS_LINE1 := SUBSTR(V_ADDRESS,0,45);
                        V_ADDRESS_LINE2 := SUBSTR(V_ADDRESS,46,45);
                        V_ADDRESS_LINE3 := SUBSTR(V_ADDRESS,91,45);
                    --}
                    END IF;

                    V_CITY_CODE := I.ADDRDTLS_LOCN_CODE;

                    BEGIN
                        SELECT LOCN_STATE_CODE,LOCN_CNTRY_CODE
                        INTO V_STATE_CODE,V_COUNTRY_CODE
                        FROM CBS.LOCATION
                        WHERE LOCN_CODE = V_CITY_CODE;
                        EXCEPTION WHEN NO_DATA_FOUND THEN
                        V_STATE_CODE	:= NULL;
                        V_COUNTRY_CODE	:= NULL;
                    END;

                    V_COUNTRY_CODE := NVL(TRIM(V_COUNTRY_CODE),'MIG');
                    V_ADDRESSCATEGORY := CommonExtractionPack.MAPPER_FUNC('MASTERCODE','ADDRTYPE',I.ADDRDTLS_ADDR_TYPE,'CBS');

                    V_CITY_CODE := NVL(CommonExtractionPack.location('CITY',V_CITY_CODE),'MIG');
                    V_STATE_CODE := NVL(CommonExtractionPack.location('STATE',V_STATE_CODE),'MIG');

                    IF(V_preferredAddress = 'Y') THEN
                    --{
                        V_ADDRESSCATEGORY := 'Mailing';
                    --}
                    END IF;

                    INSERT INTO RC002 VALUES
                    (
                        V_ORGKEY,
                        V_ADDRESSCATEGORY,
                        V_START_DATE,
                        V_PhoneNo1LocalCode,
                        V_PhoneNo1CityCode,
                        V_PhoneNo1CountryCode,
                        V_PhoneNo2LocalCode,
                        V_PhoneNo2CityCode,
                        V_PhoneNo2CountryCode,
                        V_WorkExtension,
                        V_FaxNoLocalCode,
                        V_FaxNoCityCode,
                        V_FaxNoCountryCode,
                        V_Email,
                        V_PagerNoLocalCode,
                        V_PagerNoCityCode,
                        V_PagerNoCountryCode,
                        V_TelexLocalCode,
                        V_TelexCityCode,
                        V_TelexCountryCode,
                        V_HOUSE_NO,
                        V_PREMISE_NAME,
                        V_BUILDING_LEVEL,
                        V_STREET_NO,
                        V_STREET_NAME,
                        V_SUBURB,
                        V_LOCALITY_NAME,
                        V_TOWN,
                        V_DOMICILE,
                        V_CITY_CODE,
                        V_STATE_CODE,
                        V_ZIP,
                        V_COUNTRY_CODE,
                        V_ADDRESS_LINE1,
                        V_ADDRESS_LINE2,
                        V_ADDRESS_LINE3,
                        V_END_DATE,
                        V_SMALL_STR1,
                        V_SMALL_STR2,
                        V_SMALL_STR3,
                        V_SMALL_STR4,
                        V_SMALL_STR5,
                        V_SMALL_STR6,
                        V_SMALL_STR7,
                        V_SMALL_STR8,
                        V_SMALL_STR9,
                        V_SMALL_STR10,
                        V_MED_STR1,
                        V_MED_STR2,
                        V_MED_STR3,
                        V_MED_STR4,
                        V_MED_STR5,
                        V_MED_STR6,
                        V_MED_STR7,
                        V_MED_STR8,
                        V_MED_STR9,
                        V_MED_STR10,
                        V_LARGE_STR1,
                        V_LARGE_STR2,
                        V_LARGE_STR3,
                        V_LARGE_STR4,
                        V_LARGE_STR5,
                        V_DATE1,
                        V_DATE2,
                        V_DATE3,
                        V_DATE4,
                        V_DATE5,
                        V_DATE6,
                        V_DATE7,
                        V_DATE8,
                        V_DATE9,
                        V_DATE10,
                        V_NUMBER1,
                        V_NUMBER2,
                        V_NUMBER3,
                        V_NUMBER4,
                        V_NUMBER5,
                        V_NUMBER6,
                        V_NUMBER7,
                        V_NUMBER8,
                        V_NUMBER9,
                        V_NUMBER10,
                        V_DECIMAL1,
                        V_DECIMAL2,
                        V_DECIMAL3,
                        V_DECIMAL4,
                        V_DECIMAL5,
                        V_DECIMAL6,
                        V_DECIMAL7,
                        V_DECIMAL8,
                        V_DECIMAL9,
                        V_DECIMAL10,
                        V_CIFID,
                        V_preferredAddress,
                        V_HoldMailInitiatedBy,
                        V_HoldMailFlag,
                        V_BusinessCenter,
                        V_HoldMailReason,
                        V_PreferredFormat,
                        V_FreeTextAddress,
                        V_FreeTextLabel,
                        V_IS_ADDRESS_PROOF_RCVD,
                        V_LASTUPDATE_DATE,
                        V_BANK_ID,
                        V_IsAddressVerified,
                        InpSolId
                    );
                --}
                END LOOP;
            --}
            END LOOP;
        --}
        END RC002;
    --} Procudre RC002 End

    PROCEDURE RC003 (InpSolId IN VARCHAR2) IS
    --{
        V_ORGKEY				NVarchar2(50) := '';
        V_CIF_ID				NVarchar2(32) := '';
        V_STRTEXT1				NVarchar2(255) := '';
        V_STRTEXT2				NVarchar2(255) := '';
        V_TYPE					NVarchar2(50) := '';
        V_CUSTOMERCURRENCY		NVarchar2(3) := '';
        V_CREDITDISCOUNTPERCENT	DECIMAL(9) := '';
        V_DEBITDISCOUNTPERCENT	DECIMAL(9) := '';
        V_WITHHOLDTAXPCNT		DECIMAL(9) := '';
        V_WITHHOLDTAXFLOORLMT	DECIMAL(20) := '';
        V_DTDATE1				DATE := '';
        V_DTDATE2				DATE := '';
        V_countryofissue_code	NVarchar2(5)  := '';
        V_SMALL_STR1			NVarchar2(50) := '';
        V_SMALL_STR2			NVarchar2(50) := '';
        V_SMALL_STR3			NVarchar2(50) := '';
        V_SMALL_STR4			NVarchar2(50) := '';
        V_SMALL_STR5			NVarchar2(50) := '';
        V_SMALL_STR6			NVarchar2(50) := '';
        V_SMALL_STR7			NVarchar2(50) := '';
        V_SMALL_STR8			NVarchar2(50) := '';
        V_SMALL_STR9			NVarchar2(50) := '';
        V_SMALL_STR10			NVarchar2(50) := '';
        V_MED_STR1				NVarchar2(100) := '';
        V_MED_STR2				NVarchar2(100) := '';
        V_MED_STR3				NVarchar2(100) := '';
        V_MED_STR4				NVarchar2(100) := '';
        V_MED_STR5				NVarchar2(100) := '';
        V_MED_STR6				NVarchar2(100) := '';
        V_MED_STR7				NVarchar2(100) := '';
        V_MED_STR8				NVarchar2(100) := '';
        V_MED_STR9				NVarchar2(100) := '';
        V_MED_STR10				NVarchar2(100) := '';
        V_LARGE_STR1			NVarchar2(250) := '';
        V_LARGE_STR2			NVarchar2(250) := '';
        V_LARGE_STR3			NVarchar2(250) := '';
        V_LARGE_STR4			NVarchar2(250) := '';
        V_LARGE_STR5			NVarchar2(250) := '';
        V_DATE1					DATE := '';
        V_DATE2					DATE := '';
        V_DATE3					DATE := '';
        V_DATE4					DATE := '';
        V_DATE5					DATE := '';
        V_DATE6					DATE := '';
        V_DATE7					DATE := '';
        V_DATE8					DATE := '';
        V_DATE9					DATE := '';
        V_DATE10				DATE := '';
        V_NUMBER1				NUMBER(38) := '';
        V_NUMBER2				NUMBER(38) := '';
        V_NUMBER3				NUMBER(38) := '';
        V_NUMBER4				NUMBER(38) := '';
        V_NUMBER5				NUMBER(38) := '';
        V_NUMBER6				NUMBER(38) := '';
        V_NUMBER7				NUMBER(38) := '';
        V_NUMBER8				NUMBER(38) := '';
        V_NUMBER9				NUMBER(38) := '';
        V_NUMBER10				NUMBER(38) := '';
        V_DECIMAL1				NUMBER(25,6) := '';
        V_DECIMAL2				NUMBER(25,6) := '';
        V_DECIMAL3				NUMBER(25,6) := '';
        V_DECIMAL4				NUMBER(25,6) := '';
        V_DECIMAL5				NUMBER(25,6) := '';
        V_DECIMAL6				NUMBER(25,6) := '';
        V_DECIMAL7				NUMBER(25,6) := '';
        V_DECIMAL8				NUMBER(25,6) := '';
        V_DECIMAL9				NUMBER(25,6) := '';
        V_DECIMAL10				NUMBER(25,6) := '';
        V_STRTEXT3				NVarchar2(255) := '';
        V_STRTEXT4				NVarchar2(255) := '';
        V_STRTEXT5				NVarchar2(255) := '';
        V_STRTEXT6				NVarchar2(255) := '';
        V_STRTEXT7				NVarchar2(255) := '';
        V_STRTEXT8				NVarchar2(255) := '';
        V_STRTEXT9				NVarchar2(255) := '';
        V_STRTEXT10				NVarchar2(255) := '';
        V_INTINTEGER1			NUMBER(38) := '';
        V_INTINTEGER2			NUMBER(38) := '';
        V_INTINTEGER3			NUMBER(38) := '';
        V_INTINTEGER4			NUMBER(38) := '';
        V_INTINTEGER5			NUMBER(38) := '';
        V_INTINTEGER6			NUMBER(38) := '';
        V_INTINTEGER7			NUMBER(38) := '';
        V_INTINTEGER8			NUMBER(38) := '';
        V_INTINTEGER9			NUMBER(38) := '';
        V_INTINTEGER10			NUMBER(38) := '';
        V_INTINTEGER11			NUMBER(38) := '';
        V_INTINTEGER12			NUMBER(38) := '';
        V_INTINTEGER13			NUMBER(38) := '';
        V_INTINTEGER14			NUMBER(38) := '';
        V_INTINTEGER15			NUMBER(38) := '';
        V_DTDATE3				DATE := '';
        V_DTDATE4				DATE := '';
        V_DTDATE5				DATE := '';
        V_DBFLOAT1				DECIMAL(17) := '';
        V_DBFLOAT2				DECIMAL(17) := '';
        V_DBFLOAT3				DECIMAL(17) := '';
        V_DBFLOAT4				DECIMAL(17) := '';
        V_DBFLOAT5				DECIMAL(17) := '';
        V_STRTEXT11				NVarchar2(50) := '';
        V_STRTEXT12				NVarchar2(50) := '';
        V_STRTEXT13				NVarchar2(50) := '';
        V_STRTEXT14				NVarchar2(50) := '';
        V_STRTEXT15				NVarchar2(50) := '';
        V_STRTEXT16				NVarchar2(50) := '';
        V_STRTEXT17				NVarchar2(50) := '';
        V_STRTEXT18				NVarchar2(50) := '';
        V_STRTEXT19				NVarchar2(50) := '';
        V_STRTEXT20				NVarchar2(50) := '';
        V_STRTEXT21				NVarchar2(50) := '';
        V_STRTEXT22				NVarchar2(50) := '';
        V_STRTEXT23				NVarchar2(50) := '';
        V_STRTEXT24				NVarchar2(50) := '';
        V_STRTEXT25				NVarchar2(50) := '';
        V_STRTEXT26				NVarchar2(50) := '';
        V_STRTEXT27				NVarchar2(50) := '';
        V_EmployerID			NVarchar2(50) := '';
        V_EmployeeID			NVarchar2(10) := '';
        V_STRTEXT1_CODE			NVarchar2(5) := '';
        V_STRTEXT2_CODE			NVarchar2(5) := '';
        V_strText28				NVarchar2(50) := '';
        V_BANK_ID				NVarchar2(8) := '';

        cursor c1(CurSolId varchar2) is
        SELECT CIF_ID FROM VALID_CIF WHERE SOL_ID = CurSolId AND CIF_TYPE = 'R';

        BEGIN
        --{
            V_TYPE := 'CURRENCY';
            V_BANK_ID := '01';
            V_CUSTOMERCURRENCY := 'INR';
            V_STRTEXT10 := 'INR';
            V_DBFLOAT1 := 0;
            V_DBFLOAT2 := 0;
            V_DBFLOAT3 := 0;
            V_DBFLOAT4 := 0;

            FOR I IN C1(InpSolId)
            LOOP
            --{
                V_ORGKEY := I.CIF_ID;
                V_CIF_ID := I.CIF_ID;

                INSERT INTO RC003 VALUES
                (
                    V_ORGKEY,
                    V_CIF_ID,
                    V_STRTEXT1,
                    V_STRTEXT2,
                    V_TYPE,
                    V_CUSTOMERCURRENCY,
                    V_CREDITDISCOUNTPERCENT,
                    V_DEBITDISCOUNTPERCENT,
                    V_WITHHOLDTAXPCNT,
                    V_WITHHOLDTAXFLOORLMT,
                    V_DTDATE1,
                    V_DTDATE2,
                    V_countryofissue_code,
                    V_SMALL_STR1,
                    V_SMALL_STR2,
                    V_SMALL_STR3,
                    V_SMALL_STR4,
                    V_SMALL_STR5,
                    V_SMALL_STR6,
                    V_SMALL_STR7,
                    V_SMALL_STR8,
                    V_SMALL_STR9,
                    V_SMALL_STR10,
                    V_MED_STR1,
                    V_MED_STR2,
                    V_MED_STR3,
                    V_MED_STR4,
                    V_MED_STR5,
                    V_MED_STR6,
                    V_MED_STR7,
                    V_MED_STR8,
                    V_MED_STR9,
                    V_MED_STR10,
                    V_LARGE_STR1,
                    V_LARGE_STR2,
                    V_LARGE_STR3,
                    V_LARGE_STR4,
                    V_LARGE_STR5,
                    V_DATE1,
                    V_DATE2,
                    V_DATE3,
                    V_DATE4,
                    V_DATE5,
                    V_DATE6,
                    V_DATE7,
                    V_DATE8,
                    V_DATE9,
                    V_DATE10,
                    V_NUMBER1,
                    V_NUMBER2,
                    V_NUMBER3,
                    V_NUMBER4,
                    V_NUMBER5,
                    V_NUMBER6,
                    V_NUMBER7,
                    V_NUMBER8,
                    V_NUMBER9,
                    V_NUMBER10,
                    V_DECIMAL1,
                    V_DECIMAL2,
                    V_DECIMAL3,
                    V_DECIMAL4,
                    V_DECIMAL5,
                    V_DECIMAL6,
                    V_DECIMAL7,
                    V_DECIMAL8,
                    V_DECIMAL9,
                    V_DECIMAL10,
                    V_STRTEXT3,
                    V_STRTEXT4,
                    V_STRTEXT5,
                    V_STRTEXT6,
                    V_STRTEXT7,
                    V_STRTEXT8,
                    V_STRTEXT9,
                    V_STRTEXT10,
                    V_INTINTEGER1,
                    V_INTINTEGER2,
                    V_INTINTEGER3,
                    V_INTINTEGER4,
                    V_INTINTEGER5,
                    V_INTINTEGER6,
                    V_INTINTEGER7,
                    V_INTINTEGER8,
                    V_INTINTEGER9,
                    V_INTINTEGER10,
                    V_INTINTEGER11,
                    V_INTINTEGER12,
                    V_INTINTEGER13,
                    V_INTINTEGER14,
                    V_INTINTEGER15,
                    V_DTDATE3,
                    V_DTDATE4,
                    V_DTDATE5,
                    V_DBFLOAT1,
                    V_DBFLOAT2,
                    V_DBFLOAT3,
                    V_DBFLOAT4,
                    V_DBFLOAT5,
                    V_STRTEXT11,
                    V_STRTEXT12,
                    V_STRTEXT13,
                    V_STRTEXT14,
                    V_STRTEXT15,
                    V_STRTEXT16,
                    V_STRTEXT17,
                    V_STRTEXT18,
                    V_STRTEXT19,
                    V_STRTEXT20,
                    V_STRTEXT21,
                    V_STRTEXT22,
                    V_STRTEXT23,
                    V_STRTEXT24,
                    V_STRTEXT25,
                    V_STRTEXT26,
                    V_STRTEXT27,
                    V_EmployerID,
                    V_EmployeeID,
                    V_STRTEXT1_CODE,
                    V_STRTEXT2_CODE,
                    V_strText28,
                    V_BANK_ID,
                    InpSolId
                );
            --}
            END LOOP;
        --}
        END RC003;
    --} Procudre RC003 End

    PROCEDURE RC004 (InpSolId IN VARCHAR2) IS
    --{
        V_ORGKEY				NVarchar2(50) := '';
        V_CHILDENTITY           NVarchar2(50) := '';
        V_CHILDENTITYID         NVarchar2(32) := '';
        V_Relationship          NVarchar2(50) := '';
        V_TITLE                 NVarchar2(5) := '';
        V_FIRSTNAME             NVarchar2(80) := '';
        V_MIDDLENAME            NVarchar2(80) := '';
        V_LASTNAME              NVarchar2(80) := '';
        V_DOB                   DATE := '';
        V_GENDER                NVarchar2(10) := '';
        V_ISDEPENDANT           NVarchar2(1) := '';
        V_GAURDIANTYPE          NVarchar2(1) := '';
        V_ISPRIMARY             NVarchar2(1) := '';
        V_HOUSE_NO              NVarchar2(10) := '';
        V_PREMISE_NAME          NVarchar2(50) := '';
        V_BUILDING_LEVEL        NVarchar2(10) := '';
        V_STREET_NO             NVarchar2(50) := '';
        V_STREET_NAME           NVarchar2(50) := '';
        V_SUBURB                NVarchar2(50) := '';
        V_locality_name         NVarchar2(50) := '';
        V_town                  NVarchar2(50) := '';
        V_DOMICILE              NVarchar2(50) := '';
        V_CITY_CODE             NVarchar2(5) := '';
        V_STATE_CODE            NVarchar2(5) := '';
        V_ZIP                   NVarchar2(100) := '';
        V_COUNTRY_CODE          NVarchar2(5) := '';
        V_STATUS_CODE           NVarchar2(5) := '';
        V_NEWCONTACTSKEY        NUMBER(32) := '';
        V_CIF_ID                NVarchar2(32) := '';
        V_START_DATE            DATE := '';
        V_PERCENTAGEBENEFITTED	NUMBER(6) := '';
        V_PHONENO1LOCALCODE     NVarchar2(20) := '';
        V_PHONENO1CITYCODE      NVarchar2(20) := '';
        V_PHONENO1COUNTRYCODE   NVarchar2(20) := '';
        V_WORKEXTENSION         NVarchar2(20) := '';
        V_PHONENO2LOCALCODE     NVarchar2(20) := '';
        V_PHONENO2CITYCODE      NVarchar2(20) := '';
        V_PHONENO2COUNTRYCODE   NVarchar2(20) := '';
        V_TELEXLOCALCODE        NVarchar2(20) := '';
        V_TELEXCITYCODE         NVarchar2(20) := '';
        V_TELEXCOUNTRYCODE      NVarchar2(20) := '';
        V_FAXNOLOCALCODE        NVarchar2(20) := '';
        V_FAXNOCITYCODE         NVarchar2(20) := '';
        V_FAXNOCOUNTRYCODE      NVarchar2(20) := '';
        V_PAGERNOLOCALCODE      NVarchar2(20) := '';
        V_PAGERNOCITYCODE       NVarchar2(20) := '';
        V_PAGERNOCOUNTRYCODDE   NVarchar2(20) := '';
        V_EMAIL                 NVarchar2(50) := '';
        V_CHILDENTITYTYPE       NVarchar2(50) := '';
        V_BEN_OWN_KEY           NVarchar2(50) := '';
        V_BANK_ID               NVarchar2(8) := '';
        V_RELATIONSHIP_ALT1     NVarchar2(50) := '';
        V_RELATIONSHIP_CATEGORY	NVarchar2(50) := '';

        CURSOR C1(CurSolId varchar2) is
        SELECT * FROM RC001 WHERE CUSTOMERMINOR = 'Y' AND PRIMARY_SOL_ID = CurSolId;

        BEGIN
        --{
            FOR I IN C1(InpSolId)
            LOOP
            --{
                INSERT INTO RC004 VALUES
                (
                    V_ORGKEY,
                    V_CHILDENTITY,
                    V_CHILDENTITYID,
                    V_Relationship,
                    V_TITLE,
                    V_FIRSTNAME,
                    V_MIDDLENAME,
                    V_LASTNAME,
                    V_DOB,
                    V_GENDER,
                    V_ISDEPENDANT,
                    V_GAURDIANTYPE,
                    V_ISPRIMARY,
                    V_HOUSE_NO,
                    V_PREMISE_NAME,
                    V_BUILDING_LEVEL,
                    V_STREET_NO,
                    V_STREET_NAME,
                    V_SUBURB,
                    V_locality_name,
                    V_town,
                    V_DOMICILE,
                    V_CITY_CODE,
                    V_STATE_CODE,
                    V_ZIP,
                    V_COUNTRY_CODE,
                    V_STATUS_CODE,
                    V_NEWCONTACTSKEY,
                    V_CIF_ID,
                    V_START_DATE,
                    V_PERCENTAGEBENEFITTED,
                    V_PHONENO1LOCALCODE,
                    V_PHONENO1CITYCODE,
                    V_PHONENO1COUNTRYCODE,
                    V_WORKEXTENSION,
                    V_PHONENO2LOCALCODE,
                    V_PHONENO2CITYCODE,
                    V_PHONENO2COUNTRYCODE,
                    V_TELEXLOCALCODE,
                    V_TELEXCITYCODE,
                    V_TELEXCOUNTRYCODE,
                    V_FAXNOLOCALCODE,
                    V_FAXNOCITYCODE,
                    V_FAXNOCOUNTRYCODE,
                    V_PAGERNOLOCALCODE,
                    V_PAGERNOCITYCODE,
                    V_PAGERNOCOUNTRYCODDE,
                    V_EMAIL,
                    V_CHILDENTITYTYPE,
                    V_BEN_OWN_KEY,
                    V_BANK_ID,
                    V_RELATIONSHIP_ALT1,
                    V_RELATIONSHIP_CATEGORY,
                    InpSolId
                );
            --}
            END LOOP;
        --}
        END RC004;
    --} Procudre RC004 End

    PROCEDURE RC005 (InpSolId IN VARCHAR2) IS
    --{
        V_ORGKEY 					NVarchar2(50) := '';
        V_DOCDUEDATE 				DATE := '';
        V_DOCRECEIVEDDATE			DATE := '';
        V_DOCEXPIRYDATE				DATE := '';
        V_DOCDELFLG					NVarchar2(1) := '';
        V_DOCREMARKS				NVarchar2(255) := '';
        V_SCANNED					NVarchar2(1) := '';
        V_DOCCODE					NVarchar2(20) := '';
        V_DOCDESCR					NVarchar2(255) := '';
        V_REFERENCENUMBER			NVarchar2(100) := '';
        V_TYPE						NVarchar2(50) := '';
        V_ISMANDATORY				NVarchar2(1) := '';
        V_SCANREQUIRED				NVarchar2(10) := '';
        V_ROLE						NVarchar2(50) := '';
        V_DOCTYPECODE				NVarchar2(50) := '';
        V_DOCTYPEDESCR				NVarchar2(2000) := '';
        V_MINDOCSREQD				NUMBER(38) := '';
        V_WAIVEDORDEFEREDDATE		DATE := '';
        V_COUNTRYOFISSUE			NVarchar2(50) := '';
        V_PLACEOFISSUE				NVarchar2(200) := '';
        V_DOCISSUEDATE				DATE := '';
        V_IDENTIFICATIONTYPE		NVarchar2(50) := '';
        V_CORE_CUST_ID				NVarchar2(9) := '';
        V_IS_DOCUMENT_VERIFIED		NVarchar2(1) := '';
        V_BEN_OWN_KEY				NVarchar2(50) := '';
        V_BANK_ID					NVarchar2(8) := '';
        V_DOCTYPEDESCR_ALT1			NVarchar2(2000) := '';
        V_DOCDESCR_ALT1				NVarchar2(255) := '';
        V_DOCCODETYPE				NVARCHAR2(50) := '';

        cursor c1(CurSolId varchar2) is
        SELECT CIF_ID FROM VALID_CIF WHERE SOL_ID = CurSolId AND CIF_TYPE = 'R';

        cursor c2 (inpCifId NUMBER) is
        SELECT INDCLIENT_CODE
        ,PIDDOCS_PID_TYPE
        ,DECODE(PIDDOCS_PID_TYPE,'001',PIDDOCS_UID_NUM,PIDDOCS_DOCID_NUM) REFERENCENUMBER
        ,PIDDOCS_ISSUE_DATE
        ,NVL(TRIM(PIDDOCS_ISSUE_PLACE),'MIG') PIDDOCS_ISSUE_PLACE
        ,PIDDOCS_EXP_DATE
        FROM CBS.INDCLIENTS,CBS.piddocs
        WHERE piddocs.PIDDOCS_INV_NUM = indclients.INDCLIENT_PID_INV_NUM
        AND ((PIDDOCS_PID_TYPE = '001' and PIDDOCS_UID_NUM is not null) or (PIDDOCS_PID_TYPE != '001' and PIDDOCS_DOCID_NUM is not null))
        AND PIDDOCS_PID_TYPE IN (SELECT OLD_VALUE FROM PID_MAPPER_TABLE)
        and INDCLIENT_CODE = inpCifId;

        BEGIN
        --{
            V_BANK_ID := '01';
            V_COUNTRYOFISSUE := 'IN';

            FOR J IN C1(InpSolId)
            LOOP
            --{
                FOR I in c2(J.cif_id)
                LOOP
                --{
                    V_DOCEXPIRYDATE := I.PIDDOCS_EXP_DATE;
                    V_REFERENCENUMBER := I.REFERENCENUMBER;
                    V_DOCISSUEDATE := I.PIDDOCS_ISSUE_DATE;
                    V_PLACEOFISSUE := I.PIDDOCS_ISSUE_PLACE;
                    V_DOCCODETYPE := CommonExtractionPack.mapper_func('DOCCODE','',I.PIDDOCS_PID_TYPE,'');
                    V_ORGKEY := I.INDCLIENT_CODE;

                    V_DOCCODE := substr(V_DOCCODETYPE,0,instr(V_DOCCODETYPE,',')-1);
                    V_DOCTYPECODE := substr(V_DOCCODETYPE,instr(V_DOCCODETYPE,',')+1);

                    IF(V_DOCISSUEDATE IS NULL) THEN
                    --{
                        BEGIN
                            SELECT NVL(CLIENTS_OPENING_DATE,CLIENTS_ENTD_ON)
                            INTO	V_DOCISSUEDATE
                            FROM	CBS.CLIENTS
                            WHERE	CLIENTS_CODE = I.INDCLIENT_CODE;
                            EXCEPTION WHEN NO_DATA_FOUND THEN
                            V_DOCISSUEDATE := '';
                        END;
                    --}
                    END IF;

                    V_REFERENCENUMBER := CommonExtractionPack.RemoveSpecialChars(V_REFERENCENUMBER);

                    V_PLACEOFISSUE := NVL(CommonExtractionPack.Location('CITYDESC',V_PLACEOFISSUE),'MIG');

                    INSERT INTO RC005 VALUES
                    (
                        V_ORGKEY,
                        V_DOCDUEDATE,
                        V_DOCRECEIVEDDATE,
                        V_DOCEXPIRYDATE,
                        V_DOCDELFLG,
                        V_DOCREMARKS,
                        V_SCANNED,
                        V_DOCCODE,
                        V_DOCDESCR,
                        V_REFERENCENUMBER,
                        V_TYPE,
                        V_ISMANDATORY,
                        V_SCANREQUIRED,
                        V_ROLE,
                        V_DOCTYPECODE,
                        V_DOCTYPEDESCR,
                        V_MINDOCSREQD,
                        V_WAIVEDORDEFEREDDATE,
                        V_COUNTRYOFISSUE,
                        V_PLACEOFISSUE,
                        V_DOCISSUEDATE,
                        V_IDENTIFICATIONTYPE,
                        V_CORE_CUST_ID,
                        V_IS_DOCUMENT_VERIFIED,
                        V_BEN_OWN_KEY,
                        V_BANK_ID,
                        V_DOCTYPEDESCR_ALT1,
                        V_DOCDESCR_ALT1,
                        InpSolId
                    );
                --}
                END LOOP;
            --}
            END LOOP;
        --}
        END RC005;
    --} Procudre RC005 End

    PROCEDURE RC006 (InpSolId IN VARCHAR2) IS
    --{
        V_ORGKEY				NVarchar2(50) := '';
        V_PHONEEMAILTYPE        NVarchar2(200) := '';
        V_PHONEOREMAIL          NVarchar2(50) := '';
        V_PHONE_NO              NVarchar2(25) := '';
        V_PHONENOLOCALCODE      NVarchar2(20) := '';
        V_PHONENOCITYCODE       NVarchar2(20) := '';
        V_PHONENOCOUNTRYCODE    NVarchar2(20) := '';
        V_WORKEXTENSION         NVarchar2(30) := '';
        V_EMAIL                 NVarchar2(50) := '';
        V_EMAILPALM             NVarchar2(50) := '';
        V_URL                   NVarchar2(150) := '';
        V_PHONE_PREFERREDFLAG   CHAR(1) := '';
        V_EMAIL_PREFERREDFLAG   CHAR(1) := '';
        V_Start_Date            DATE := '';
        V_End_Date              DATE := '';
        V_USERFIELD1            NVarchar2(200) := '';
        V_USERFIELD2            NVarchar2(200) := '';
        V_USERFIELD3            NVarchar2(200) := '';
        V_DATE1                 DATE := '';
        V_DATE2                 DATE := '';
        V_DATE3                 DATE := '';
        V_BANK_ID               NVarchar2(8) := '';
        V_INDCLIENT_TEL_RES     NVARCHAR2(15) := '';
        V_INDCLIENT_TEL_OFF     NVARCHAR2(15) := '';
        V_INDCLIENT_TEL_OFF1    NVARCHAR2(15) := '';
        V_INDCLIENT_EXTN_NUM    NVARCHAR2(5) := '';
        V_INDCLIENT_TEL_FAX     NVARCHAR2(15) := '';
        V_INDCLIENT_TEL_GSM     NVARCHAR2(15) := '';
        V_INDCLIENT_EMAIL_ADDR1 NVARCHAR2(65) := '';
        V_INDCLIENT_EMAIL_ADDR2 NVARCHAR2(65) := '';
        V_PHONE_RES_TYPE        NVARCHAR2(200) := '';
        V_PHONE_RES_TYPE1       NVARCHAR2(200) := '';
        V_PHONE_CELLPH_TYPE     NVARCHAR2(200) := '';
        V_PHONE_CELLPH_TYPE1    NVARCHAR2(200) := '';
        V_PHONE_WORK_TYPE       NVARCHAR2(200) := '';
        V_PHONE_WORK_TYPE1      NVARCHAR2(200) := '';
        V_EMAIL_TYPE            NVARCHAR2(200) := '';
        V_EMAIL_TYPE1           NVARCHAR2(200) := '';
        V_CELLPH_CNTRY_CODE     NVARCHAR2(5) := '';
        V_CELLPH_NUMBER         NVARCHAR2(10) := '';
        V_PHONE_FAX_TYPE        NVARCHAR2(200) := '';
        V_PREFERRED_ALLOCATED   CHAR(1) := 'N';

        CURSOR C1(CurSolId varchar2) IS
        SELECT CIF_ID FROM VALID_CIF WHERE SOL_ID = CurSolId AND CIF_TYPE = 'R';

        BEGIN
        --{
            V_BANK_ID := '01';

            V_PHONE_RES_TYPE := 'HOMEPH1';
            V_PHONE_RES_TYPE1 := 'HOMEPH2';
            V_PHONE_CELLPH_TYPE := 'Mobile1';
            V_PHONE_CELLPH_TYPE1 := 'Mobile2';
            V_PHONE_WORK_TYPE := 'WORKPH1';
            V_PHONE_WORK_TYPE1 := 'WORKPH2';

            V_EMAIL_TYPE := 'COMMEML';
            V_EMAIL_TYPE1 := 'HOMEEML';

            V_PHONE_FAX_TYPE := 'FAX1';

            FOR I IN C1(InpSolId)
            LOOP
            --{
                V_ORGKEY := I.CIF_ID;

                V_PREFERRED_ALLOCATED := 'N';

                V_PHONE_PREFERREDFLAG := 'N';
                V_EMAIL_PREFERREDFLAG := 'N';

                BEGIN
                    SELECT  TRIM(INDCLIENT_TEL_RES)
                            ,TRIM(INDCLIENT_TEL_OFF)
                            ,TRIM(INDCLIENT_TEL_OFF1)
                            ,TRIM(INDCLIENT_EXTN_NUM)
                            ,TRIM(INDCLIENT_TEL_FAX)
                            ,TRIM(INDCLIENT_TEL_GSM)
                            ,TRIM(INDCLIENT_EMAIL_ADDR1)
                            ,TRIM(INDCLIENT_EMAIL_ADDR2)
                    INTO    V_INDCLIENT_TEL_RES
                            ,V_INDCLIENT_TEL_OFF
                            ,V_INDCLIENT_TEL_OFF1
                            ,V_INDCLIENT_EXTN_NUM
                            ,V_INDCLIENT_TEL_FAX
                            ,V_INDCLIENT_TEL_GSM
                            ,V_INDCLIENT_EMAIL_ADDR1
                            ,V_INDCLIENT_EMAIL_ADDR2
                    FROM    CBS.INDCLIENTS
                    WHERE   INDCLIENT_CODE = I.CIF_ID;
                END;

                BEGIN
                    SELECT SMSBREG_CALL_CODE, SMSBREG_MOBILE_NUMBER
                    INTO V_CELLPH_CNTRY_CODE, V_CELLPH_NUMBER
                    FROM CBS.SMSBREG A
                    WHERE SMSBREG_ACTIVE = 1
                    AND SMSBREG_REG_SL = (SELECT MAX(SMSBREG_REG_SL) FROM CBS.SMSBREG B WHERE A.SMSBREG_MOBILE_OWNER = B.SMSBREG_MOBILE_OWNER AND B.SMSBREG_ACTIVE = 1)
                    AND SMSBREG_REG_DATE = (SELECT MAX(SMSBREG_REG_DATE) FROM CBS.SMSBREG B WHERE A.SMSBREG_MOBILE_OWNER = B.SMSBREG_MOBILE_OWNER and B.SMSBREG_ACTIVE = 1)
                    AND SMSBREG_MOBILE_OWNER = I.CIF_ID;
                    EXCEPTION WHEN NO_DATA_FOUND THEN
                    V_CELLPH_CNTRY_CODE := '';
                    V_CELLPH_NUMBER := '';
                END;

                IF(V_INDCLIENT_EMAIL_ADDR1 IS NOT NULL) THEN
                --{
                    V_EMAIL_PREFERREDFLAG := 'Y';

                    INSERT INTO RC006
                    (ORGKEY,PHONEEMAILTYPE,PHONEOREMAIL,EMAIL,PREFERREDFLAG,BANK_ID,SOL_ID)
                    VALUES (V_ORGKEY,V_EMAIL_TYPE,'EMAIL',V_INDCLIENT_EMAIL_ADDR1,V_EMAIL_PREFERREDFLAG,V_BANK_ID,InpSolId);
                --}
                END IF;

                IF(V_INDCLIENT_EMAIL_ADDR2 IS NOT NULL) THEN
                --{
                    IF (V_EMAIL_PREFERREDFLAG = 'Y') THEN
                    --{
                        V_EMAIL_PREFERREDFLAG := 'N';
                    --}
                    ELSE
                    --{
                        V_EMAIL_PREFERREDFLAG := 'Y';
                    --}
                    END IF;
                    INSERT INTO RC006
                    (ORGKEY,PHONEEMAILTYPE,PHONEOREMAIL,EMAIL,PREFERREDFLAG,BANK_ID,SOL_ID)
                    VALUES (V_ORGKEY,V_EMAIL_TYPE,'EMAIL',V_INDCLIENT_EMAIL_ADDR1,V_EMAIL_PREFERREDFLAG,V_BANK_ID,InpSolId);
                --}
                END IF;

                IF(CommonExtractionPack.CheckNumber(V_CELLPH_NUMBER) != 'N') THEN
                --{
                    V_PHONE_PREFERREDFLAG := 'Y';
                    V_PREFERRED_ALLOCATED := 'Y';

                    INSERT INTO RC006
                    (ORGKEY ,PHONEEMAILTYPE ,PHONEOREMAIL ,PHONE_NO ,PHONENOLOCALCODE ,PHONENOCITYCODE ,PHONENOCOUNTRYCODE ,WORKEXTENSION ,PREFERREDFLAG ,BANK_ID,SOL_ID)
                    VALUES (V_ORGKEY,V_PHONE_CELLPH_TYPE,'PHONE',V_CELLPH_CNTRY_CODE||V_CELLPH_NUMBER,V_CELLPH_NUMBER,null,V_CELLPH_CNTRY_CODE,null,V_PHONE_PREFERREDFLAG,V_BANK_ID,InpSolId);
                --}
                END IF;

                IF(CommonExtractionPack.CheckNumber(V_INDCLIENT_TEL_GSM) != 'N') THEN
                --{
                    IF(NVL(V_CELLPH_NUMBER,'NN') != V_INDCLIENT_TEL_GSM) THEN
                    --{
                        IF(V_PREFERRED_ALLOCATED = 'N') THEN
                        --{
                            V_PHONE_PREFERREDFLAG := 'Y';
                            V_PREFERRED_ALLOCATED := 'Y';
                        --}
                        ELSE
                        --{
                            V_PHONE_PREFERREDFLAG := 'N';
                        --}
                        END IF;

                        V_CELLPH_CNTRY_CODE := '91';

                        INSERT INTO RC006
                        (ORGKEY ,PHONEEMAILTYPE ,PHONEOREMAIL ,PHONE_NO ,PHONENOLOCALCODE ,PHONENOCITYCODE ,PHONENOCOUNTRYCODE ,WORKEXTENSION ,PREFERREDFLAG ,BANK_ID,SOL_ID)
                        VALUES (V_ORGKEY,V_PHONE_CELLPH_TYPE1,'PHONE',V_CELLPH_CNTRY_CODE||V_INDCLIENT_TEL_GSM,V_INDCLIENT_TEL_GSM,null,V_CELLPH_CNTRY_CODE,null,V_PHONE_PREFERREDFLAG,V_BANK_ID,InpSolId);
                    --}
                    END IF;
                --}
                END IF;

                IF(CommonExtractionPack.CheckNumber(V_INDCLIENT_TEL_RES) != 'N') THEN
                --{
                    IF(V_PREFERRED_ALLOCATED = 'N') THEN
                    --{
                        V_PHONE_PREFERREDFLAG := 'Y';
                        V_PREFERRED_ALLOCATED := 'Y';
                    --}
                    ELSE
                    --{
                        V_PHONE_PREFERREDFLAG := 'N';
                    --}
                    END IF;

                    INSERT INTO RC006
                    (ORGKEY ,PHONEEMAILTYPE ,PHONEOREMAIL ,PHONE_NO ,PHONENOLOCALCODE ,PHONENOCITYCODE ,PHONENOCOUNTRYCODE ,WORKEXTENSION ,PREFERREDFLAG ,BANK_ID,SOL_ID)
                    VALUES (V_ORGKEY,V_PHONE_RES_TYPE,'PHONE',V_INDCLIENT_TEL_RES,V_INDCLIENT_TEL_RES,null,null,null,V_PHONE_PREFERREDFLAG,V_BANK_ID,InpSolId);
                --}
                END IF;

                IF(CommonExtractionPack.CheckNumber(V_INDCLIENT_TEL_OFF) != 'N') THEN
                --{
                    IF(V_PREFERRED_ALLOCATED = 'N') THEN
                    --{
                        V_PHONE_PREFERREDFLAG := 'Y';
                        V_PREFERRED_ALLOCATED := 'Y';
                    --}
                    ELSE
                    --{
                        V_PHONE_PREFERREDFLAG := 'N';
                    --}
                    END IF;

                    INSERT INTO RC006
                    (ORGKEY ,PHONEEMAILTYPE ,PHONEOREMAIL ,PHONE_NO ,PHONENOLOCALCODE ,PHONENOCITYCODE ,PHONENOCOUNTRYCODE ,WORKEXTENSION ,PREFERREDFLAG ,BANK_ID,SOL_ID)
                    VALUES (V_ORGKEY,V_PHONE_WORK_TYPE,'PHONE',V_INDCLIENT_TEL_OFF,V_INDCLIENT_TEL_OFF,null,null,V_INDCLIENT_EXTN_NUM,V_PHONE_PREFERREDFLAG,V_BANK_ID,InpSolId);
                --}
                END IF;

                IF(CommonExtractionPack.CheckNumber(V_INDCLIENT_TEL_OFF1) != 'N') THEN
                --{
                    IF(V_PREFERRED_ALLOCATED = 'N') THEN
                    --{
                        V_PHONE_PREFERREDFLAG := 'Y';
                        V_PREFERRED_ALLOCATED := 'Y';
                    --}
                    ELSE
                    --{
                        V_PHONE_PREFERREDFLAG := 'N';
                    --}
                    END IF;

                    INSERT INTO RC006
                    (ORGKEY ,PHONEEMAILTYPE ,PHONEOREMAIL ,PHONE_NO ,PHONENOLOCALCODE ,PHONENOCITYCODE ,PHONENOCOUNTRYCODE ,WORKEXTENSION ,PREFERREDFLAG ,BANK_ID,SOL_ID)
                    VALUES (V_ORGKEY,V_PHONE_WORK_TYPE1,'PHONE',V_INDCLIENT_TEL_OFF1,V_INDCLIENT_TEL_OFF1,null,null,V_INDCLIENT_EXTN_NUM,V_PHONE_PREFERREDFLAG,V_BANK_ID,InpSolId);
                --}
                END IF;

                IF(CommonExtractionPack.CheckNumber(V_INDCLIENT_TEL_FAX) != 'N') THEN
                --{
                    IF(V_PREFERRED_ALLOCATED = 'N') THEN
                    --{
                        V_PHONE_PREFERREDFLAG := 'Y';
                        V_PREFERRED_ALLOCATED := 'Y';
                    --}
                    ELSE
                    --{
                        V_PHONE_PREFERREDFLAG := 'N';
                    --}
                    END IF;

                    INSERT INTO RC006
                    (ORGKEY ,PHONEEMAILTYPE ,PHONEOREMAIL ,PHONE_NO ,PHONENOLOCALCODE ,PHONENOCITYCODE ,PHONENOCOUNTRYCODE ,WORKEXTENSION ,PREFERREDFLAG ,BANK_ID,SOL_ID)
                    VALUES (V_ORGKEY,V_PHONE_FAX_TYPE,'PHONE',V_INDCLIENT_TEL_FAX,V_INDCLIENT_TEL_FAX,null,null,null,V_PHONE_PREFERREDFLAG,V_BANK_ID,InpSolId);
                --}
                END IF;

            --}
            END LOOP;
        --}
        END RC006;
    --} Procudre RC006 End

    PROCEDURE RC008 (InpSolId IN VARCHAR2) IS
    --{
        V_ORGKEY							NVarchar2(50) := '';
        V_MARITAL_STATUS_CODE               NVarchar2(5) := '';
        V_EMPLOYMENT_STATUS                 NVarchar2(50) := '';
        V_ANNUAL_SALARY_INCOME              Numeric(20) := '';
        V_TDSEXCEMPTENDDATE                 Date := '';
        V_TDSEXCEMPTSUBMITDATE              Date := '';
        V_TDSEXCEMPTREFNUM                  NVarchar2(30) := '';
        V_TDSEXCEMPTREMARKS                 NVarchar2(80) := '';
        V_CUSTCASTE                         NVarchar2(50) := '';
        V_CUSTBUSINESSASSETS                Numeric(20) := '';
        V_CUSTPROPERTYASSETS                Numeric(20) := '';
        V_CUSTINVESTMENTS                   Numeric(20) := '';
        V_CUSTNETWORTH                      Numeric(20) := '';
        V_CUSTDEPOSITSINOTHERBANKS          Numeric(20) := '';
        V_ADVANCEASONDATE                   Date := '';
        V_TOTALFUNDBASE                     Numeric(25) := '';
        V_TOTALNONFUNDBASE                  Numeric(25) := '';
        V_CUSTFINYEARENDMONTH               Numeric(2) := '';
        V_NATIONALITY_CODE                  NVarchar2(5) := '';
        V_RESIDENCECOUNTRY_CODE             NVarchar2(5) := '';
        V_NRERELATIVENAME                   NVarchar2(40) := '';
        V_NRECOUNTRYTYPE                    NVarchar2(1) := '';
        V_DEMOGRAPHICTYPE                   NVarchar2(50) := '';
        V_PHONE_HOME                        NVarchar2(20) := '';
        V_PHONE_WORK                        NVarchar2(20) := '';
        V_EXTENSION                         NVarchar2(10) := '';
        V_PHONE_CELL                        NVarchar2(20) := '';
        V_FAX_WORK                          NVarchar2(20) := '';
        V_EMAIL_HOME                        NVarchar2(50) := '';
        V_EMAIL_WORK                        NVarchar2(50) := '';
        V_EMAIL_PALM                        NVarchar2(50) := '';
        V_URL                               NVarchar2(50) := '';
        V_CUSTOMER_SEGMENT                  NVarchar2(50) := '';
        V_CUSTOMER_TYPE                     NVarchar2(50) := '';
        V_NATIONALITY                       NVarchar2(50) := '';
        V_RESIDENCE_COUNTRY                 NVarchar2(50) := '';
        V_RESIDENCE_SINCE                   Date := '';
        V_MARITAL_STATUS                    NVarchar2(50) := '';
        V_ANNIVERSARY_DATE                  Date := '';
        V_INCOME_NATURE                     NVarchar2(50) := '';
        V_PAYMENT_MODE                      NVarchar2(50) := '';
        V_ANNUAL_RENTAL_INCOME              Numeric(20) := '';
        V_ANNUAL_STOCK_BOND_INCOME          Numeric(20) := '';
        V_ANNUAL_OTHERS_INCOME              Numeric(20) := '';
        V_ANNUAL_TOTAL_INCOME               Numeric(20) := '';
        V_REFERENCE_CURRENCY_INCOME         NVarchar2(50) := '';
        V_BASE_CURRENCY_INCOME              NVarchar2(50) := '';
        V_ANNUAL_OPERATING_EXP              Numeric(20) := '';
        V_ANNUAL_LOAN_INSTAL                Numeric(20) := '';
        V_ANNUAL_INTPROD_EXP                Numeric(20) := '';
        V_ANNUAL_EXTPROD_EXP                Numeric(20) := '';
        V_ANNUAL_COMMIT_EXP                 Numeric(20) := '';
        V_ANNUAL_OTHER_EXP                  Numeric(20) := '';
        V_REFERENCE_CURRENCY_EXP            NVarchar2(50) := '';
        V_BASE_CURRENCY_EXP                 NVarchar2(50) := '';
        V_ANNUAL_TOTAL_EXP                  Numeric(20) := '';
        V_HomePhoneNoCountryCode            NVarchar2(20) := '';
        V_HomePhoneNoCityCode               NVarchar2(20) := '';
        V_HomePhoneNoLocalCode              NVarchar2(20) := '';
        V_WorkPhoneNoCountryCode            NVarchar2(20) := '';
        V_WorkPhoneNoCityCode               NVarchar2(20) := '';
        V_WorkPhoneNoLocalCode              NVarchar2(20) := '';
        V_CellPhoneNoCountryCode            NVarchar2(20) := '';
        V_CellPhoneNoCityCode               NVarchar2(20) := '';
        V_CellPhoneNoLocalCode              NVarchar2(20) := '';
        V_FaxNoCountryCode                  NVarchar2(20) := '';
        V_FaxNoCityCode                     NVarchar2(20) := '';
        V_FaxNoLocalCode                    NVarchar2(20) := '';
        V_PagerNo                           NVarchar2(20) := '';
        V_PagerNoCountryCode                NVarchar2(20) := '';
        V_PagerNoAreaCode                   NVarchar2(20) := '';
        V_PagerNoLocalCode                  NVarchar2(20) := '';
        V_SALALLOWANCES                     Numeric(20) := '';
        V_SALPRORATAMONTHLYINCENTIVE        Numeric(20) := '';
        V_SALINTERESTSUBSIDY                Numeric(20) := '';
        V_SALOTHERINCOME2                   Numeric(20) := '';
        V_SALOTHERINCOME3                   Numeric(20) := '';
        V_TOTALESTACCOUNTVALUE              Numeric(20) := '';
        V_TOTALINVESTMENT                   Numeric(20) := '';
        V_TOTALMONTHLYDEBTSERVICEAMT        Numeric(20) := '';
        V_SELFEMPTAXRETURNFIELD             NVarchar2(20) := '';
        V_SELFEMPGROSSRECIPTCURRENTYR       Numeric(20) := '';
        V_SELFEMPGROSSRECEIPTPRIORYEAR      Numeric(20) := '';
        V_SELFEMPNETPROFITCURRENTYR         Numeric(20) := '';
        V_SELFEMPNETPROFITPRIORYR           Numeric(20) := '';
        V_SELFEMPDEPRECIATIONCURRENTYEAR    Numeric(20) := '';
        V_SELFEMPDEPRECIATIONPRIORYEAR      Numeric(20) := '';
        V_SELFEMPAVERAGEANNUALTURNOVER      Numeric(20) := '';
        V_TOTALHOUSEHOLDINCM                Numeric(20) := '';
        V_DoNotMailFlag                     NVarchar2(1) := '';
        V_DoNotCallFlag                     NVarchar2(1) := '';
        V_HOLDMAILFLAG                      NVarchar2(1) := '';
        V_HOLDMAILDESCRIPTION               NVarchar2(100) := '';
        V_DONOTSENDEMAILFLG                 NVarchar2(1) := '';
        V_HOLDMAILSTARTDATE                 Date := '';
        V_HOLDMAILENDDATE                   Date := '';
        V_PREFCONTTIME                      NVarchar2(50) := '';
        V_PrefDaytimeContNo                 NVarchar2(20) := '';
        V_PrefDaytimeContNoLocal            NVarchar2(20) := '';
        V_PrefDaytimeContNoArea             NVarchar2(20) := '';
        V_PrefDaytimeContNoCountry          NVarchar2(20) := '';
        V_PHONEOTHER                        NVarchar2(20) := '';
        V_PHONEOTHERLOCAL                   NVarchar2(20) := '';
        V_PHONEOTHERAREA                    NVarchar2(20) := '';
        V_PHONEOTHERCOUNTRY                 NVarchar2(20) := '';
        V_CU_ANNUAL_SALARY_INCOME           NVarchar2(3) := '';
        V_CU_ANNUAL_RENTAL_INCOME           NVarchar2(3) := '';
        V_CU_ANNUAL_STOCK_BOND_INCOME       NVarchar2(3) := '';
        V_CU_ANNUAL_OTHERS_INCOME           NVarchar2(3) := '';
        V_CU_ANNUAL_TOTAL_INCOME            NVarchar2(3) := '';
        V_CU_ANNUAL_OPERATING_EXP           NVarchar2(3) := '';
        V_CU_ANNUAL_LOAN_INSTAL             NVarchar2(3) := '';
        V_CU_ANNUAL_INTPROD_EXP             NVarchar2(3) := '';
        V_CU_ANNUAL_EXTPROD_EXP             NVarchar2(3) := '';
        V_CU_ANNUAL_COMMIT_EXP              NVarchar2(3) := '';
        V_CU_ANNUAL_OTHER_EXP               NVarchar2(3) := '';
        V_CU_ANNUAL_TOTAL_EXP               NVarchar2(3) := '';
        V_CU_SALALLOWANCES                  NVarchar2(3) := '';
        V_CU_SALPRORATAMONTHLYINCENTIVE	    NVarchar2(3) := '';
        V_CU_SALINTERESTSUBSIDY             NVarchar2(3) := '';
        V_CU_SALOTHERINCOME2                NVarchar2(3) := '';
        V_CU_SALOTHERINCOME3                NVarchar2(3) := '';
        V_CU_TOTALESTACCOUNTVALUE           NVarchar2(3) := '';
        V_CU_TOTALINVESTMENT                NVarchar2(3) := '';
        V_CU_TOTALMONTHLYDEBTSERVICEAMT     NVarchar2(3) := '';
        V_CU_SELFEMPTAXRETURNFIELD          NVarchar2(3) := '';
        V_CU_SELFEMPGROSSRECIPTCURRENTYR	NVarchar2(3) := '';
        V_CU_SELFEMPGROSSRECEIPTPRIORYR     NVarchar2(3) := '';
        V_CU_SELFEMPNETPROFITCURRENTYR      NVarchar2(3) := '';
        V_CU_SELFEMPNETPROFITPRIORYR        NVarchar2(3) := '';
        V_CU_SELFEMPDEPRCURRYR              NVarchar2(3) := '';
        V_CU_SELFEMPDEPRPRIORYR             NVarchar2(3) := '';
        V_CU_SelfempAvgAnnualTurnover       NVarchar2(3) := '';
        V_CU_TOTALHOUSEHOLDINCM             NVarchar2(3) := '';
        V_CU_INVESTMENTSHARESANDUNITS       NVarchar2(3) := '';
        V_USERFIELD1                        NVarchar2(50) := '';
        V_USERFIELD2                        NVarchar2(50) := '';
        V_USERFIELD3                        NVarchar2(50) := '';
        V_USERFLAG1                         NVarchar2(1) := '';
        V_USERFLAG2                         NVarchar2(1) := '';
        V_ALERT1                            NVarchar2(150) := '';
        V_ALERT2                            NVarchar2(150) := '';
        V_ALERT3                            NVarchar2(150) := '';
        V_ALERT4                            NVarchar2(150) := '';
        V_ALERT5                            NVarchar2(150) := '';
        V_BANK_DEFINED_DEMO_VAR1            NVarchar2(200) := '';
        V_BANK_DEFINED_DEMO_VAR2            NVarchar2(200) := '';
        V_BANK_DEFINED_DEMO_VAR3            NVarchar2(200) := '';
        V_BANK_DEFINED_DEMO_VAR4            NVarchar2(200) := '';
        V_BANK_DEFINED_DEMO_VAR5            NVarchar2(200) := '';
        V_BANK_DEFINED_DEMO_VAR6            NVarchar2(200) := '';
        V_BANK_DEFINED_DEMO_VAR7            NVarchar2(200) := '';
        V_BANK_DEFINED_DEMO_VAR8            NVarchar2(200) := '';
        V_BANK_DEFINED_DEMO_VAR9            NVarchar2(200) := '';
        V_BANK_DEFINED_DEMO_DATE1           Date := '';
        V_BANK_DEFINED_DEMO_DATE2           Date := '';
        V_BANK_DEFINED_DEMO_DATE3           Date := '';
        V_BANK_DEFINED_DEMO_DATE4           Date := '';
        V_BANK_DEFINED_DEMO_DATE5           Date := '';
        V_BANK_DEFINED_DEMO_DATE6           Date := '';
        V_BANK_DEFINED_DEMO_DATE7           Date := '';
        V_USERFIELD4                        NVarchar2(50) := '';
        V_USERFIELD5                        NVarchar2(50) := '';
        V_USERFIELD6                        NVarchar2(50) := '';
        V_USERFIELD7                        NVarchar2(50) := '';
        V_USERFIELD8                        NVarchar2(50) := '';
        V_USERFIELD9                        NVarchar2(50) := '';
        V_USERFIELD10                       NVarchar2(50) := '';
        V_AMOUNT1                           Numeric(20) := '';
        V_AMOUNT2                           Numeric(20) := '';
        V_AMOUNT3                           Numeric(20) := '';
        V_AMOUNT4                           Numeric(20) := '';
        V_AMOUNT5                           Numeric(20) := '';
        V_AMOUNT6                           Numeric(20) := '';
        V_AMOUNT7                           Numeric(20) := '';
        V_INTFIELD1                         Numeric(38) := '';
        V_INTFIELD2                         Numeric(38) := '';
        V_INTFIELD3                         Numeric(38) := '';
        V_INTFIELD4                         Numeric(38) := '';
        V_INTFIELD5                         Numeric(38) := '';
        V_TOTAL_DEDUCTIONS                  Numeric(20) := '';
        V_CU_TOTAL_DEDUCTIONS               NVarchar2(3) := '';
        V_NET_SAVINGS                       Numeric(20) := '';
        V_CU_NET_SAVINGS                    NVarchar2(3) := '';
        V_NET_HOUSEHOLD_INCOME              Numeric(20) := '';
        V_CU_NETHOUSEHOLDINCOME             NVarchar2(3) := '';
        V_SHAREHOLDERTYPE                   NVarchar2(5) := '';
        V_SHAREHOLDEREFFECTIVEDATE          Date := '';
        V_TOTALSHARESVALUE                  Numeric(20) := '';
        V_CU_TOTALSHARESVALUE               NVarchar2(3) := '';
        V_NUMBEROFSHARES                    Numeric(10) := '';
        V_CUSTOTHERBANKCODE                 NVarchar2(6) := '';
        V_CU_CustDepositsInOtherBanks	    NVarchar2(3) := '';
        V_CU_CUSTBUSINESSASSETS             NVarchar2(3) := '';
        V_CU_CUSTPROPERTYASSETS             NVarchar2(3) := '';
        V_CU_CUSTINVESTMENTS                NVarchar2(3) := '';
        V_CU_CUSTNETWORTH                   NVarchar2(3) := '';
        V_CUSTASSETSASONDATE                DATE := '';
        V_CU_CUSTASSETSASONDATE             NVarchar2(3) := '';
        V_EMPLOYERSNAME                     NVarchar2(50) := '';
        V_SOURCEOFINCOME                    NVarchar2(50) := '';
        V_CU_TOTALFUNDBASE                  NVarchar2(3) := '';
        V_CU_TotalNonFundBase               NVarchar2(3) := '';
        V_OTHERLIMITS                       Numeric(20) := '';
        V_CU_OTHERLIMITS                    NVarchar2(3) := '';
        V_TDSTABLECODE                      NVarchar2(5) := '';
        V_TDSTABLE                          NVarchar2(50) := '';
        V_TDSCUSTID                         NVarchar2(9) := '';
        V_EMPLOYERID                        NVarchar2(12) := '';
        V_NRERELATIVECODE                   NVarchar2(5) := '';
        V_NRERELATIVE                       NVarchar2(50) := '';
        V_EMPLOYERID_CODE                   NVarchar2(12) := '';
        V_CHANNELSACCESSED                  NVarchar2(500) := '';
        V_OUTSTANDING_MORTAGE               Numeric(20) := '';
        V_CU_OUTSTANDING_MORTGAGE           NVarchar2(3) := '';
        V_BANK_ID                           NVarchar2(8) := '';
        V_EMPLOYERSNAME_ALT1                NVarchar2(10) := '';
        V_NRERELATIVENAME_ALT1              NVarchar2(40) := '';
        V_TAX_EXMPT_START_DATE              Date := '';
        V_TAX_RATE_TABLE_CODE               NVarchar2(50) := '';
        V_NO_TAX_RECAL_BEYOND_DATE          Date := '';
        V_DEMOGRAPHICID                     NUMERIC(38) := '';
        V_CU_INCOME_FROM                    NVarchar2(3) := '';
        V_CU_INCOME_TO                      NVarchar2(3) := '';
        V_INCOME_FROM                       Numeric(20) := '';
        V_INCOME_TO                         Numeric(20) := '';
        V_INCOME_FREQ                       NVarchar2(50) := '';

        CURSOR C1(CurSolId varchar2) IS
        SELECT CIF_ID FROM VALID_CIF WHERE SOL_ID = CurSolId AND CIF_TYPE = 'R';

        BEGIN
        --{
            V_BANK_ID := '01';

            FOR I IN C1(InpSolId)
            LOOP
            --{
                V_ORGKEY := I.CIF_ID;
                BEGIN
                    SELECT
                        --INDCLIENT_MARITAL_STATUS
                        DECODE(INDCLIENT_MARITAL_STATUS,'N','M','U','M','P','D','O','D',INDCLIENT_MARITAL_STATUS)
                        ,INDCLIENT_EMPLOY_TYPE
                        ,INDCLIENT_CASTE_CODE
                        ,case INDCLIENT_ANNUAL_INCOME_SLAB
                            when '1' then 50000
                            when '2' then 100000
                            when '3' then 300000
                            when '4' then 500000
                            when '5' then 750000
                            when '6' then 1000000
                            when '7' then 1000001
                            when '9' then 1000001
                            else 0
                        end
                        ,INDCLIENT_NATNL_CODE
                        ,CASE DECODE(INDCLIENT_MARITAL_STATUS,'N','M','U','M','P','D','O','D',INDCLIENT_MARITAL_STATUS)
                            WHEN 'M' THEN 'Married'
                            WHEN 'W' THEN 'Widow/Widower'
                            WHEN 'O' THEN 'Others'
                            WHEN 'N' THEN 'Unmarried'
                            WHEN 'S' THEN 'Single'
                            WHEN 'U' THEN 'Unmarried'
                            WHEN 'D' THEN 'Divorsed'
                        END
                    INTO V_MARITAL_STATUS_CODE
                        ,V_EMPLOYMENT_STATUS
                        ,V_CUSTCASTE
                        ,V_ANNUAL_SALARY_INCOME
                        ,V_NATIONALITY
                        ,V_MARITAL_STATUS
                    FROM CBS.indclients
                    WHERE INDCLIENT_CODE = I.CIF_ID;
                    EXCEPTION WHEN NO_DATA_FOUND THEN
                    V_MARITAL_STATUS_CODE := '';
                    V_EMPLOYMENT_STATUS := '';
                    V_ANNUAL_SALARY_INCOME := '';
                    V_NATIONALITY := '';
                    V_MARITAL_STATUS := '';
                END;

                V_EMPLOYMENT_STATUS := CommonExtractionPack.mapper_func('MASTERCODE','EMPLOYMENT_STATUS',V_EMPLOYMENT_STATUS,'CBS');
                V_CUSTCASTE := NVL(CommonExtractionPack.mapper_func('MASTERCODE','CASTE',V_CUSTCASTE,'CBS'),'MIG');

                INSERT INTO RC008 VALUES
                (
                    V_ORGKEY,
                    V_MARITAL_STATUS_CODE,
                    V_EMPLOYMENT_STATUS,
                    V_ANNUAL_SALARY_INCOME,
                    V_TDSEXCEMPTENDDATE,
                    V_TDSEXCEMPTSUBMITDATE,
                    V_TDSEXCEMPTREFNUM,
                    V_TDSEXCEMPTREMARKS,
                    V_CUSTCASTE,
                    V_CUSTBUSINESSASSETS,
                    V_CUSTPROPERTYASSETS,
                    V_CUSTINVESTMENTS,
                    V_CUSTNETWORTH,
                    V_CUSTDEPOSITSINOTHERBANKS,
                    V_ADVANCEASONDATE,
                    V_TOTALFUNDBASE,
                    V_TOTALNONFUNDBASE,
                    V_CUSTFINYEARENDMONTH,
                    V_NATIONALITY_CODE,
                    V_RESIDENCECOUNTRY_CODE,
                    V_NRERELATIVENAME,
                    V_NRECOUNTRYTYPE,
                    V_DEMOGRAPHICTYPE,
                    V_PHONE_HOME,
                    V_PHONE_WORK,
                    V_EXTENSION,
                    V_PHONE_CELL,
                    V_FAX_WORK,
                    V_EMAIL_HOME,
                    V_EMAIL_WORK,
                    V_EMAIL_PALM,
                    V_URL,
                    V_CUSTOMER_SEGMENT,
                    V_CUSTOMER_TYPE,
                    V_NATIONALITY,
                    V_RESIDENCE_COUNTRY,
                    V_RESIDENCE_SINCE,
                    V_MARITAL_STATUS,
                    V_ANNIVERSARY_DATE,
                    V_INCOME_NATURE,
                    V_PAYMENT_MODE,
                    V_ANNUAL_RENTAL_INCOME,
                    V_ANNUAL_STOCK_BOND_INCOME,
                    V_ANNUAL_OTHERS_INCOME,
                    V_ANNUAL_TOTAL_INCOME,
                    V_REFERENCE_CURRENCY_INCOME,
                    V_BASE_CURRENCY_INCOME,
                    V_ANNUAL_OPERATING_EXP,
                    V_ANNUAL_LOAN_INSTAL,
                    V_ANNUAL_INTPROD_EXP,
                    V_ANNUAL_EXTPROD_EXP,
                    V_ANNUAL_COMMIT_EXP,
                    V_ANNUAL_OTHER_EXP,
                    V_REFERENCE_CURRENCY_EXP,
                    V_BASE_CURRENCY_EXP,
                    V_ANNUAL_TOTAL_EXP,
                    V_HomePhoneNoCountryCode,
                    V_HomePhoneNoCityCode,
                    V_HomePhoneNoLocalCode,
                    V_WorkPhoneNoCountryCode,
                    V_WorkPhoneNoCityCode,
                    V_WorkPhoneNoLocalCode,
                    V_CellPhoneNoCountryCode,
                    V_CellPhoneNoCityCode,
                    V_CellPhoneNoLocalCode,
                    V_FaxNoCountryCode,
                    V_FaxNoCityCode,
                    V_FaxNoLocalCode,
                    V_PagerNo,
                    V_PagerNoCountryCode,
                    V_PagerNoAreaCode,
                    V_PagerNoLocalCode,
                    V_SALALLOWANCES,
                    V_SALPRORATAMONTHLYINCENTIVE,
                    V_SALINTERESTSUBSIDY,
                    V_SALOTHERINCOME2,
                    V_SALOTHERINCOME3,
                    V_TOTALESTACCOUNTVALUE,
                    V_TOTALINVESTMENT,
                    V_TOTALMONTHLYDEBTSERVICEAMT,
                    V_SELFEMPTAXRETURNFIELD,
                    V_SELFEMPGROSSRECIPTCURRENTYR,
                    V_SELFEMPGROSSRECEIPTPRIORYEAR,
                    V_SELFEMPNETPROFITCURRENTYR,
                    V_SELFEMPNETPROFITPRIORYR,
                    V_SELFEMPDEPRECIATIONCURRENTYEAR,
                    V_SELFEMPDEPRECIATIONPRIORYEAR,
                    V_SELFEMPAVERAGEANNUALTURNOVER,
                    V_TOTALHOUSEHOLDINCM,
                    V_DoNotMailFlag,
                    V_DoNotCallFlag,
                    V_HOLDMAILFLAG,
                    V_HOLDMAILDESCRIPTION,
                    V_DONOTSENDEMAILFLG,
                    V_HOLDMAILSTARTDATE,
                    V_HOLDMAILENDDATE,
                    V_PREFCONTTIME,
                    V_PrefDaytimeContNo,
                    V_PrefDaytimeContNoLocal,
                    V_PrefDaytimeContNoArea,
                    V_PrefDaytimeContNoCountry,
                    V_PHONEOTHER,
                    V_PHONEOTHERLOCAL,
                    V_PHONEOTHERAREA,
                    V_PHONEOTHERCOUNTRY,
                    V_CU_ANNUAL_SALARY_INCOME,
                    V_CU_ANNUAL_RENTAL_INCOME,
                    V_CU_ANNUAL_STOCK_BOND_INCOME,
                    V_CU_ANNUAL_OTHERS_INCOME,
                    V_CU_ANNUAL_TOTAL_INCOME,
                    V_CU_ANNUAL_OPERATING_EXP,
                    V_CU_ANNUAL_LOAN_INSTAL,
                    V_CU_ANNUAL_INTPROD_EXP,
                    V_CU_ANNUAL_EXTPROD_EXP,
                    V_CU_ANNUAL_COMMIT_EXP,
                    V_CU_ANNUAL_OTHER_EXP,
                    V_CU_ANNUAL_TOTAL_EXP,
                    V_CU_SALALLOWANCES,
                    V_CU_SALPRORATAMONTHLYINCENTIVE,
                    V_CU_SALINTERESTSUBSIDY,
                    V_CU_SALOTHERINCOME2,
                    V_CU_SALOTHERINCOME3,
                    V_CU_TOTALESTACCOUNTVALUE,
                    V_CU_TOTALINVESTMENT,
                    V_CU_TOTALMONTHLYDEBTSERVICEAMT,
                    V_CU_SELFEMPTAXRETURNFIELD,
                    V_CU_SELFEMPGROSSRECIPTCURRENTYR,
                    V_CU_SELFEMPGROSSRECEIPTPRIORYR,
                    V_CU_SELFEMPNETPROFITCURRENTYR,
                    V_CU_SELFEMPNETPROFITPRIORYR,
                    V_CU_SELFEMPDEPRCURRYR,
                    V_CU_SELFEMPDEPRPRIORYR,
                    V_CU_SelfempAvgAnnualTurnover,
                    V_CU_TOTALHOUSEHOLDINCM,
                    V_CU_INVESTMENTSHARESANDUNITS,
                    V_USERFIELD1,
                    V_USERFIELD2,
                    V_USERFIELD3,
                    V_USERFLAG1,
                    V_USERFLAG2,
                    V_ALERT1,
                    V_ALERT2,
                    V_ALERT3,
                    V_ALERT4,
                    V_ALERT5,
                    V_BANK_DEFINED_DEMO_VAR1,
                    V_BANK_DEFINED_DEMO_VAR2,
                    V_BANK_DEFINED_DEMO_VAR3,
                    V_BANK_DEFINED_DEMO_VAR4,
                    V_BANK_DEFINED_DEMO_VAR5,
                    V_BANK_DEFINED_DEMO_VAR6,
                    V_BANK_DEFINED_DEMO_VAR7,
                    V_BANK_DEFINED_DEMO_VAR8,
                    V_BANK_DEFINED_DEMO_VAR9,
                    V_BANK_DEFINED_DEMO_DATE1,
                    V_BANK_DEFINED_DEMO_DATE2,
                    V_BANK_DEFINED_DEMO_DATE3,
                    V_BANK_DEFINED_DEMO_DATE4,
                    V_BANK_DEFINED_DEMO_DATE5,
                    V_BANK_DEFINED_DEMO_DATE6,
                    V_BANK_DEFINED_DEMO_DATE7,
                    V_USERFIELD4,
                    V_USERFIELD5,
                    V_USERFIELD6,
                    V_USERFIELD7,
                    V_USERFIELD8,
                    V_USERFIELD9,
                    V_USERFIELD10,
                    V_AMOUNT1,
                    V_AMOUNT2,
                    V_AMOUNT3,
                    V_AMOUNT4,
                    V_AMOUNT5,
                    V_AMOUNT6,
                    V_AMOUNT7,
                    V_INTFIELD1,
                    V_INTFIELD2,
                    V_INTFIELD3,
                    V_INTFIELD4,
                    V_INTFIELD5,
                    V_TOTAL_DEDUCTIONS,
                    V_CU_TOTAL_DEDUCTIONS,
                    V_NET_SAVINGS,
                    V_CU_NET_SAVINGS,
                    V_NET_HOUSEHOLD_INCOME,
                    V_CU_NETHOUSEHOLDINCOME,
                    V_SHAREHOLDERTYPE,
                    V_SHAREHOLDEREFFECTIVEDATE,
                    V_TOTALSHARESVALUE,
                    V_CU_TOTALSHARESVALUE,
                    V_NUMBEROFSHARES,
                    V_CUSTOTHERBANKCODE,
                    V_CU_CustDepositsInOtherBanks,
                    V_CU_CUSTBUSINESSASSETS,
                    V_CU_CUSTPROPERTYASSETS,
                    V_CU_CUSTINVESTMENTS,
                    V_CU_CUSTNETWORTH,
                    V_CUSTASSETSASONDATE,
                    V_CU_CUSTASSETSASONDATE,
                    V_EMPLOYERSNAME,
                    V_SOURCEOFINCOME,
                    V_CU_TOTALFUNDBASE,
                    V_CU_TotalNonFundBase,
                    V_OTHERLIMITS,
                    V_CU_OTHERLIMITS,
                    V_TDSTABLECODE,
                    V_TDSTABLE,
                    V_TDSCUSTID,
                    V_EMPLOYERID,
                    V_NRERELATIVECODE,
                    V_NRERELATIVE,
                    V_EMPLOYERID_CODE,
                    V_CHANNELSACCESSED,
                    V_OUTSTANDING_MORTAGE,
                    V_CU_OUTSTANDING_MORTGAGE,
                    V_BANK_ID,
                    V_EMPLOYERSNAME_ALT1,
                    V_NRERELATIVENAME_ALT1,
                    V_TAX_EXMPT_START_DATE,
                    V_TAX_RATE_TABLE_CODE,
                    V_NO_TAX_RECAL_BEYOND_DATE,
                    V_DEMOGRAPHICID,
                    V_CU_INCOME_FROM,
                    V_CU_INCOME_TO,
                    V_INCOME_FROM,
                    V_INCOME_TO,
                    V_INCOME_FREQ,
                    InpSolId
                );
            --}
            END LOOP;
        --}
        END RC008;
    --} Procudre RC008 End

    PROCEDURE RC009 (InpSolId IN VARCHAR2) IS
    --{
        V_ORGKEY						NVarchar2(50) := '';
        V_COMMUNICATION_LANGUAGE        NVarchar2(50) := '';
        V_PREFERRED_ADDRESS_MODE        NVarchar2(50) := '';
        V_BEHAVIOURAL_SCORE             NVarchar2(100) := '';
        V_RISK_BEHAVIOUR                NVarchar2(100) := '';
        V_OTHER_BEHAVIOURAL_PROFILE     NVarchar2(100) := '';
        V_LIFE_CYCLE_STAGE              NVarchar2(100) := '';
        V_SERVICE_PERSONALISE           NVarchar2(200) := '';
        V_PSYCHOGRAPHICTYPE             NVarchar2(50) := '';
        V_PRIORITY_IDENTIFIER           NVarchar2(25) := '';
        V_HOUSEHOLD_NUMBER              NVarchar2(10) := '';
        V_PREFERRED_REP                 Numeric(38) := '';
        V_SEGMENTATION_CLASS            NVarchar2(100) := '';
        V_PREFERREDNAME                 NVarchar2(50) := '';
        V_NUMBEROFDEPENDANTS            Numeric(38) := '';
        V_NUMBEROFDEPENDANTCHILDREN     Numeric(38) := '';
        V_STMTDATEFORCOMBSTMT           Date := '';
        V_SUBSEGMENT                    NVarchar2(50) := '';
        V_HOBBYFIELD1                   NVarchar2(50) := '';
        V_HOBBYFIELD2                   NVarchar2(50) := '';
        V_HOBBYFIELD3                   NVarchar2(50) := '';
        V_HOBBYFIELD4                   NVarchar2(50) := '';
        V_HOBBYFIELD5                   NVarchar2(50) := '';
        V_HOBBYFIELD6                   NVarchar2(50) := '';
        V_PROFILE_FIELD1                NVarchar2(200) := '';
        V_PROFILE_FIELD2                NVarchar2(200) := '';
        V_PROFILE_FIELD3                NVarchar2(200) := '';
        V_PROFILE_FIELD4                NVarchar2(200) := '';
        V_ALERT1                        NVarchar2(100) := '';
        V_ALERT2                        NVarchar2(100) := '';
        V_ALERT3                        NVarchar2(100) := '';
        V_ALERT4                        NVarchar2(100) := '';
        V_ALERT5                        NVarchar2(100) := '';
        V_FLAG1                         NVarchar2(5) := '';
        V_FLAG2                         NVarchar2(5) := '';
        V_FLAG3                         NVarchar2(5) := '';
        V_FLAG4                         NVarchar2(5) := '';
        V_FLAG5                         NVarchar2(5) := '';
        V_BANK_DEFINED_PREFER_VAR1      NVarchar2(20) := '';
        V_BANK_DEFINED_PREFER_VAR2      NVarchar2(20) := '';
        V_BANK_DEFINED_PREFER_VAR3      NVarchar2(20) := '';
        V_BANK_DEFINED_PREFER_DATE1     Date := '';
        V_BANK_DEFINED_PREFER_DATE2     Date := '';
        V_BANK_DEFINED_PREFER_DATE3     Date := '';
        V_USERFIELD1                    NVarchar2(50) := '';
        V_USERFIELD2                    NVarchar2(50) := '';
        V_USERFIELD3                    NVarchar2(50) := '';
        V_USERFIELD4                    NVarchar2(50) := '';
        V_USERFIELD5                    NVarchar2(50) := '';
        V_USERFIELD6                    NVarchar2(50) := '';
        V_SPSERVICEREQUIRED1            NVarchar2(25) := '';
        V_SPSERVICEREQUIRED2            NVarchar2(25) := '';
        V_SPSERVICEREQUIRED3            NVarchar2(25) := '';
        V_SPSERVICEREQUIRED4            NVarchar2(25) := '';
        V_SPSERVICEREQUIRED5            NVarchar2(25) := '';
        V_USERFLAG1                     NVarchar2(1) := '';
        V_USERFLAG2                     NVarchar2(1) := '';
        V_PREFRELSHIPDISCOUNT1          Numeric(20) := '';
        V_PREFRELSHIPDISCOUNT2          Numeric(20) := '';
        V_PREFRELSHIPDISCOUNTPERCENT1   Numeric(9) := '';
        V_PREFRELSHIPDISCOUNTPERCENT2   Numeric(9) := '';
        V_USERFIELD7                    NVarchar2(50) := '';
        V_USERFIELD8                    NVarchar2(50) := '';
        V_USERFIELD9                    NVarchar2(50) := '';
        V_USERFIELD10                   NVarchar2(50) := '';
        V_USERFIELD11                   NVarchar2(50) := '';
        V_USERFIELD12                   NVarchar2(50) := '';
        V_USERFIELD13                   NVarchar2(50) := '';
        V_AMOUNT1                       Numeric(20) := '';
        V_AMOUNT2                       Numeric(20) := '';
        V_AMOUNT3                       Numeric(20) := '';
        V_AMOUNT4                       Numeric(20) := '';
        V_AMOUNT5                       Numeric(20) := '';
        V_AMOUNT6                       Numeric(20) := '';
        V_AMOUNT7                       Numeric(20) := '';
        V_INTFIELD1                     Numeric(38) := '';
        V_INTFIELD2                     Numeric(38) := '';
        V_INTFIELD3                     Numeric(38) := '';
        V_INTFIELD4                     Numeric(38) := '';
        V_INTFIELD5                     Numeric(38) := '';
        V_STATEMENTTYPE                 NVarchar2(5) := '';
        V_STATEMENTFREQUENCY            NVarchar2(5) := '';
        V_STMTDATEWEEKDAY               Numeric(1) := '';
        V_STMTMONTHLYSTARTDATE          Numeric(2) := '';
        V_ACTIONDURINGHOLIDAY           NVarchar2(10) := '';
        V_DESPATCHMODE                  NVarchar2(5) := '';
        V_CALENDERTYPE                  NVarchar2(5) := '';
        V_DISCOUNTAVAILED               NVarchar2(1) := '';
        V_DISCOUNTTYPE                  NVarchar2(5) := '';
        V_PREFEFFECTIVEDATE             Date := '';
        V_PREFEXPIRYDATE                Date := '';
        V_LASTCONTACTEDDATE             Date := '';
        V_LASTCONTACTEDCHANNEL          NVarchar2(20) := '';
        V_FAMILYTYPE                    NVarchar2(50) := '';
        V_NOOFEARNERS                   Numeric(2) := '';
        V_REMARKS                       NVarchar2(50) := '';
        V_COMMUNITY                     NVarchar2(50) := '';
        V_LTVINDICATOR                  NVarchar2(5) := '';
        V_ASSETCLASSIFICATION           NVarchar2(5) := '';
        V_ASSETCLASSIFICATIONDESC       NVarchar2(50) := '';
        V_ASSETCLASSIFIEDON             Date := '';
        V_CUSTHEALTHCODE                NVarchar2(5) := '';
        V_CREDITDISCOUNTPERCENT         Numeric(9) := '';
        V_DEBITDISCOUNTPERCENT          Numeric(9) := '';
        V_PREFERRENTIALEXPIRYDATE       Date := '';
        V_INTERESTDESCRIPTION           NVarchar2(20) := '';
        V_STMTWEEKOFMONTH               NVarchar2(1) := '';
        V_CUSTCHARGECODE                NVarchar2(5) := '';
        V_CUSTCHARGE                    NVarchar2(50) := '';
        V_CHARGEDEBITFORACID            NVarchar2(16) := '';
        V_CHARGEDEBITSOLID              NVarchar2(8) := '';
        V_CHARGEHISTORYFLAG             NVarchar2(1) := '';
        V_CUSTOMERCURRENCY              NVarchar2(3) := '';
        V_LOANSSTATEMENTTYPE            NVarchar2(1) := '';
        V_TDSSTATEMENTTYPE              NVarchar2(1) := '';
        V_COMBSTMTCHARGECODE            NVarchar2(5) := '';
        V_TDSCUSTFLOORLIMIT             Numeric(20) := '';
        V_COMMUNITY_CODE                NVarchar2(5) := '';
        V_CUST_HEALTH_REF_CODE          NVarchar2(5) := '';
        V_CUST_PREF_TILL_DATE           Date := '';
        V_CU_TDSCUSTFLOORLIMIT          NVarchar2(3) := '';
        V_CHECKSUM                      NVarchar2(100) := '';
        V_PREFERRED_LOCALE              NVarchar2(50) := '';
        V_BANK_ID                       NVarchar2(8) := '';
        V_EXT_SYS_PRICING               NVarchar2(50) := '';
        V_PRICING_EFFECTIVE_DATE        Date := '';
        V_PRICING_REVIEW_DATE           Date := '';
        V_RELATIONSHIP_PRICING_ID       NVarchar2(30) := '';
        V_NATURE_OF_ACT                 NVARCHAR2(50) := '';
        V_PSYCHOGRAPHICID               NUMERIC(38) := '';

        CURSOR C1(CurSolId varchar2) IS
        SELECT CIF_ID FROM VALID_CIF WHERE SOL_ID = CurSolId AND CIF_TYPE = 'R';

        BEGIN
        --{
            V_BANK_ID := '01';
            V_PREFERRED_LOCALE := 'en_US';

            FOR I IN C1(InpSolId)
            LOOP
            --{
                V_ORGKEY := I.CIF_ID;

                BEGIN
                    SELECT  SUBSTR(CLIENTS_NAME,0,50)
                    INTO    V_PREFERREDNAME
                    FROM    CBS.CLIENTS
                    WHERE   CLIENTS_CODE = I.CIF_ID;
                END;

                V_PREFERREDNAME := CommonExtractionPack.RemoveSpecialChars(V_PREFERREDNAME);

                INSERT INTO RC009 VALUES
                (
                    V_ORGKEY,
                    V_COMMUNICATION_LANGUAGE,
                    V_PREFERRED_ADDRESS_MODE,
                    V_BEHAVIOURAL_SCORE,
                    V_RISK_BEHAVIOUR,
                    V_OTHER_BEHAVIOURAL_PROFILE,
                    V_LIFE_CYCLE_STAGE,
                    V_SERVICE_PERSONALISE,
                    V_PSYCHOGRAPHICTYPE,
                    V_PRIORITY_IDENTIFIER,
                    V_HOUSEHOLD_NUMBER,
                    V_PREFERRED_REP,
                    V_SEGMENTATION_CLASS,
                    V_PREFERREDNAME,
                    V_NUMBEROFDEPENDANTS,
                    V_NUMBEROFDEPENDANTCHILDREN,
                    V_STMTDATEFORCOMBSTMT,
                    V_SUBSEGMENT,
                    V_HOBBYFIELD1,
                    V_HOBBYFIELD2,
                    V_HOBBYFIELD3,
                    V_HOBBYFIELD4,
                    V_HOBBYFIELD5,
                    V_HOBBYFIELD6,
                    V_PROFILE_FIELD1,
                    V_PROFILE_FIELD2,
                    V_PROFILE_FIELD3,
                    V_PROFILE_FIELD4,
                    V_ALERT1,
                    V_ALERT2,
                    V_ALERT3,
                    V_ALERT4,
                    V_ALERT5,
                    V_FLAG1,
                    V_FLAG2,
                    V_FLAG3,
                    V_FLAG4,
                    V_FLAG5,
                    V_BANK_DEFINED_PREFER_VAR1,
                    V_BANK_DEFINED_PREFER_VAR2,
                    V_BANK_DEFINED_PREFER_VAR3,
                    V_BANK_DEFINED_PREFER_DATE1,
                    V_BANK_DEFINED_PREFER_DATE2,
                    V_BANK_DEFINED_PREFER_DATE3,
                    V_USERFIELD1,
                    V_USERFIELD2,
                    V_USERFIELD3,
                    V_USERFIELD4,
                    V_USERFIELD5,
                    V_USERFIELD6,
                    V_SPSERVICEREQUIRED1,
                    V_SPSERVICEREQUIRED2,
                    V_SPSERVICEREQUIRED3,
                    V_SPSERVICEREQUIRED4,
                    V_SPSERVICEREQUIRED5,
                    V_USERFLAG1,
                    V_USERFLAG2,
                    V_PREFRELSHIPDISCOUNT1,
                    V_PREFRELSHIPDISCOUNT2,
                    V_PREFRELSHIPDISCOUNTPERCENT1,
                    V_PREFRELSHIPDISCOUNTPERCENT2,
                    V_USERFIELD7,
                    V_USERFIELD8,
                    V_USERFIELD9,
                    V_USERFIELD10,
                    V_USERFIELD11,
                    V_USERFIELD12,
                    V_USERFIELD13,
                    V_AMOUNT1,
                    V_AMOUNT2,
                    V_AMOUNT3,
                    V_AMOUNT4,
                    V_AMOUNT5,
                    V_AMOUNT6,
                    V_AMOUNT7,
                    V_INTFIELD1,
                    V_INTFIELD2,
                    V_INTFIELD3,
                    V_INTFIELD4,
                    V_INTFIELD5,
                    V_STATEMENTTYPE,
                    V_STATEMENTFREQUENCY,
                    V_STMTDATEWEEKDAY,
                    V_STMTMONTHLYSTARTDATE,
                    V_ACTIONDURINGHOLIDAY,
                    V_DESPATCHMODE,
                    V_CALENDERTYPE,
                    V_DISCOUNTAVAILED,
                    V_DISCOUNTTYPE,
                    V_PREFEFFECTIVEDATE,
                    V_PREFEXPIRYDATE,
                    V_LASTCONTACTEDDATE,
                    V_LASTCONTACTEDCHANNEL,
                    V_FAMILYTYPE,
                    V_NOOFEARNERS,
                    V_REMARKS,
                    V_COMMUNITY,
                    V_LTVINDICATOR,
                    V_ASSETCLASSIFICATION,
                    V_ASSETCLASSIFICATIONDESC,
                    V_ASSETCLASSIFIEDON,
                    V_CUSTHEALTHCODE,
                    V_CREDITDISCOUNTPERCENT,
                    V_DEBITDISCOUNTPERCENT,
                    V_PREFERRENTIALEXPIRYDATE,
                    V_INTERESTDESCRIPTION,
                    V_STMTWEEKOFMONTH,
                    V_CUSTCHARGECODE,
                    V_CUSTCHARGE,
                    V_CHARGEDEBITFORACID,
                    V_CHARGEDEBITSOLID,
                    V_CHARGEHISTORYFLAG,
                    V_CUSTOMERCURRENCY,
                    V_LOANSSTATEMENTTYPE,
                    V_TDSSTATEMENTTYPE,
                    V_COMBSTMTCHARGECODE,
                    V_TDSCUSTFLOORLIMIT,
                    V_COMMUNITY_CODE,
                    V_CUST_HEALTH_REF_CODE,
                    V_CUST_PREF_TILL_DATE,
                    V_CU_TDSCUSTFLOORLIMIT,
                    V_CHECKSUM,
                    V_PREFERRED_LOCALE,
                    V_BANK_ID,
                    V_EXT_SYS_PRICING,
                    V_PRICING_EFFECTIVE_DATE,
                    V_PRICING_REVIEW_DATE,
                    V_RELATIONSHIP_PRICING_ID,
                    V_NATURE_OF_ACT,
                    V_PSYCHOGRAPHICID,
                    InpSolId
                );
            --}
            END LOOP;
        --}
        END RC009;
    --} Procudre RC009 End
--}
END RetailCifPack;
/
