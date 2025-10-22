USE [EmrSimulator]
GO
/****** Object:  Table [dbo].[BradenAssessment]    Script Date: 20/10/2025 5:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BradenAssessment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LabId] [int] NOT NULL,
	[PatientId] [int] NOT NULL,
	[DateOfAssessment] [date] NOT NULL,
	[NurseInitials] [nvarchar](10) NOT NULL,
	[Sensory] [int] NOT NULL,
	[Moisture] [int] NOT NULL,
	[Activity] [int] NOT NULL,
	[Mobility] [int] NOT NULL,
	[Nutrition] [int] NOT NULL,
	[Friction] [int] NOT NULL,
	[TotalScore] [int] NOT NULL,
	[RiskKey] [nvarchar](50) NOT NULL,
	[Shift] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FoodIntakeHeader]    Script Date: 20/10/2025 5:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoodIntakeHeader](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LabId] [int] NOT NULL,
	[PatientId] [int] NOT NULL,
	[DayText] [nvarchar](10) NULL,
	[IntakeDate] [date] NOT NULL,
	[Shift1Signature] [nvarchar](40) NULL,
	[Shift1Designation] [nvarchar](40) NULL,
	[Shift2Signature] [nvarchar](40) NULL,
	[Shift2Designation] [nvarchar](40) NULL,
	[BreakfastComment] [nvarchar](200) NULL,
	[MorningTeaComment] [nvarchar](200) NULL,
	[LunchComment] [nvarchar](200) NULL,
	[AfternoonTeaComment] [nvarchar](200) NULL,
	[DinnerComment] [nvarchar](200) NULL,
	[SupperComment] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FoodIntakeItem]    Script Date: 20/10/2025 5:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoodIntakeItem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[HeaderId] [int] NOT NULL,
	[Meal] [nvarchar](30) NOT NULL,
	[Label] [nvarchar](50) NOT NULL,
	[Notes] [nvarchar](200) NULL,
	[Amount] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IvFluidAdministration]    Script Date: 20/10/2025 5:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IvFluidAdministration](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LabId] [int] NULL,
	[PatientId] [int] NULL,
	[IvFluidChartId] [int] NULL,
	[StartDate] [date] NULL,
	[StartTime] [varchar](50) NULL,
	[EndDate] [date] NULL,
	[EndTime] [varchar](50) NULL,
	[VolGiven] [varchar](50) NULL,
	[PharmacistReview] [varchar](200) NULL,
	[NurseSign] [varchar](50) NULL,
	[CoSign] [varchar](50) NULL,
 CONSTRAINT [PK_IvFluidAdministration] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IvFluidChart]    Script Date: 20/10/2025 5:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IvFluidChart](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LabId] [int] NULL,
	[PatientId] [int] NULL,
	[Date] [date] NULL,
	[FlaskVol] [varchar](50) NULL,
	[Strength] [varchar](50) NULL,
	[Rate] [varchar](50) NULL,
	[Dose] [varchar](50) NULL,
	[OfficerSign] [varchar](50) NULL,
 CONSTRAINT [PK_IvFluidChart] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


/****** Object: Table [dbo].[FluidBalanceAdministration] Script Date: 04/05/2025 2:31:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FluidBalanceAdministration](
    [Id] [int] IDENTITY(1,1) NOT NULL,
	[LabId] [int] NULL,
	[PatientId] [int] NULL,
	[FluidBalanceChartId] [int] NULL,
	[StartDate] [date] NULL,
	[StartTime] [varchar](50) NULL,
	[EndDate] [date] NULL,
	[EndTime] [varchar](50) NULL,
	[VolGiven] [varchar](50) NULL,
	[PharmacistReview] [varchar](200) NULL,
	[NurseSign] [varchar](50) NULL,
	[CoSign] [varchar](50) NULL,

    -- Signature Fields (Optional)

    CONSTRAINT [PK_FluidBalanceAdministration] PRIMARY KEY CLUSTERED 
    (
        [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FluidBalanceChart]    Script Date: 4/4/2025 2:31:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FluidBalanceChart](
	[Id] [int] IDENTITY(1,1) NOT NULL,
    [LabId] [int] NULL,
    [PatientId] [int] NULL,
    [Date] [date] NULL,
    [IV_Fluids] [int] NULL,
    [Oral_Intake] [int] NULL,
    [Enteric_Intake] [int] NULL,
    [Other_Fluids] [int] NULL,
    [Cumulative_Intake] [int] NULL,
    [Urine_Output] [int] NULL,
    [Faecal_Output] [int] NULL,
    [Vomitus] [int] NULL,
    [Drainage] [int] NULL,
    [Gastric_Aspirate] [int] NULL,
    [Bladder_Scan] [int] NULL,
    [Other_Output] [int] NULL,
    [Cumulative_Output] [int] NULL,
	[Difference] [int] NULL,

    CONSTRAINT [PK_FluidBalanceChart] PRIMARY KEY CLUSTERED 
    (
        [Id] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[NeurologicalAdministration]    Script Date: 6/5/2025 2:31:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[NeurologicalAdministration](
    [Id] [int] IDENTITY(1,1) NOT NULL,
	[LabId] [int] NULL,
	[PatientId] [int] NULL,
	[NeurologicalChartId] [int] NULL,
	[StartDate] [date] NULL,
	[StartTime] [varchar](50) NULL,
	[EndDate] [date] NULL,
	[EndTime] [varchar](50) NULL,
	[PharmacistReview] [varchar](200) NULL,
	[NurseSign] [varchar](50) NULL,
	[CoSign] [varchar](50) NULL,

    -- Signature Fields (Optional)

    CONSTRAINT [PK_NeurologicalAdministration] PRIMARY KEY CLUSTERED 
    (
        [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[NeurologicalChart]    Script Date: 6/5/2025 2:31:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[NeurologicalChart](
    [Id] [int] IDENTITY(1,1) NOT NULL,
    [LabId] [int] NULL,
    [PatientId] [int] NULL,
    [Date] [date] NULL,
    [Time] [time] NULL,
    [EyesOpenScore] [int] NULL,
    [VerbalResponseScore] [varchar](1) NULL,  -- Supports 'T' for intubated
    [MotorResponseScore] [int] NULL,
    [TotalComaScale] [int] NULL,
    [EndotrachealTube] [bit] NULL,
    [RightPupilSize] [int] NULL,
    [RightPupilReaction] [varchar](50) NULL,
    [LeftPupilSize] [int] NULL,
    [LeftPupilReaction] [varchar](50) NULL,
    [ArmResponse] [varchar](50) NULL,
    [LegResponse] [varchar](50) NULL,
	[OfficerSign] [varchar](50) NULL,


    CONSTRAINT [PK_NeurologicalChart] PRIMARY KEY CLUSTERED 
    (
        [Id] ASC
    ) WITH (
        PAD_INDEX = OFF, 
        STATISTICS_NORECOMPUTE = OFF, 
        IGNORE_DUP_KEY = OFF, 
        ALLOW_ROW_LOCKS = ON, 
        ALLOW_PAGE_LOCKS = ON, 
        OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
    ) ON [PRIMARY]
) ON [PRIMARY]
GO

/*************Object_13/05/2025****/
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'NeurologicalObservationOptions')
BEGIN
    CREATE TABLE [dbo].[NeurologicalObservationOptions](
        [Id] [int] IDENTITY(1,1) NOT NULL,
        [category] [varchar](50) NOT NULL,
        [value] [varchar](50) NOT NULL,
        [description] [varchar](255) NULL,
        CONSTRAINT [PK_NeurologicalObservationOptions] PRIMARY KEY CLUSTERED ([Id] ASC)
    ) ON [PRIMARY]
END
GO


-- Inserting options for Eyes Open Score (GCS - Eye Opening)
INSERT INTO NeurologicalObservationOptions (category, value, description) VALUES
('EyesOpenScore', '4', 'Spontaneously'),
('EyesOpenScore', '3', 'To speech'),
('EyesOpenScore', '2', 'To pain'),
('EyesOpenScore', '1', 'Nil');

-- Inserting options for Verbal Response Score (GCS - Verbal Response)
INSERT INTO NeurologicalObservationOptions (category, value, description) VALUES
('VerbalResponseScore', '5', 'Oriented'),
('VerbalResponseScore', '4', 'Confused'),
('VerbalResponseScore', '3', 'Inappropriate'),
('VerbalResponseScore', '2', 'Incomprehensible'),
('VerbalResponseScore', '1', 'Nil'),
('VerbalResponseScore', 'T', 'Intubated');

-- Inserting options for Motor Response Score (GCS - Motor Response)
INSERT INTO NeurologicalObservationOptions (category, value, description) VALUES
('MotorResponseScore', '6', 'Obeys commands'),
('MotorResponseScore', '5', 'Localises to pain'),
('MotorResponseScore', '4', 'Withdraws to pain'),
('MotorResponseScore', '3', 'Abnormal flexion'),
('MotorResponseScore', '2', 'Extensor'),
('MotorResponseScore', '1', 'Nil');

-- Inserting options for Pupil Reaction
INSERT INTO NeurologicalObservationOptions (category, value, description) VALUES
('PupilReaction', '+', 'reacts'),
('PupilReaction', '-', 'no reaction');

-- Inserting options for Pupil Size (in mm)
INSERT INTO NeurologicalObservationOptions (category, value, description) VALUES
('PupilSize', '1', '1 mm'),
('PupilSize', '2', '2 mm'),
('PupilSize', '3', '3 mm'),
('PupilSize', '4', '4 mm'),
('PupilSize', '5', '5 mm'),
('PupilSize', '6', '6 mm'),
('PupilSize', '7', '7 mm'),
('PupilSize', '8', '8 mm');

-- Inserting options for Endotracheal Tube status
INSERT INTO NeurologicalObservationOptions (category, value, description) VALUES
('EndotrachealTube', '0', 'No'),
('EndotrachealTube', '1', 'Yes');

-- Inserting options for Limb Movement for Arms and Legs
INSERT INTO NeurologicalObservationOptions (category, value, description) VALUES
('LimbMovement', 'Normal power', 'Normal strength and movement'),
('LimbMovement', 'Mild weakness', 'Slight loss of strength or movement'),
('LimbMovement', 'Severe weakness', 'Significant loss of strength or movement'),
('LimbMovement', 'Spastic flexion', 'Involuntary flexion of the limb'),
('LimbMovement', 'Extension', 'Involuntary extension of the limb'),
('LimbMovement', 'No response', 'No movement or response to stimulus');

GO

/****** Object:  Table [dbo].[Lab]    Script Date: 20/10/2025 5:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lab](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LabName] [varchar](50) NULL,
	[Active] [bit] NULL,
	[LabLogin] [varchar](10) NULL,
	[LabPassword] [varchar](10) NULL,
 CONSTRAINT [PK_Lab] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medication]    Script Date: 20/10/2025 5:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medication](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LabId] [int] NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_Medication] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicationPrnAdministration]    Script Date: 20/10/2025 5:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicationPrnAdministration](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LabId] [int] NULL,
	[PatientId] [int] NULL,
	[PatientMedicationChartId] [int] NULL,
	[DoseDate] [date] NULL,
	[DoseTime] [varchar](50) NULL,
	[Route] [varchar](50) NULL,
	[StudentSign] [varchar](50) NULL,
	[Reason] [varchar](200) NULL,
	[CoSign] [varchar](50) NULL,
	[Dose] [varchar](50) NULL,
 CONSTRAINT [PK_MedicationAdministration] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicationPrnChart]    Script Date: 20/10/2025 5:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicationPrnChart](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LabId] [int] NULL,
	[PatientId] [int] NULL,
	[MedicationId] [int] NULL,
	[Dose] [varchar](50) NULL,
	[DoseFrequency] [varchar](50) NULL,
	[DoseDate] [date] NULL,
	[DoseTime] [varchar](50) NULL,
	[Indication] [varchar](50) NULL,
	[Route] [varchar](50) NULL,
	[Pharmacy] [varchar](50) NULL,
	[Prescriber] [varchar](50) NULL,
	[PrescriberSign] [varchar](50) NULL,
 CONSTRAINT [PK_PatientMedicationChart] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicationRegularAdministration]    Script Date: 20/10/2025 5:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicationRegularAdministration](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LabId] [int] NULL,
	[PatientId] [int] NULL,
	[PatientMedicationChartId] [int] NULL,
	[DoseDate] [date] NULL,
	[DoseTime] [varchar](50) NULL,
	[Route] [varchar](50) NULL,
	[StudentSign] [varchar](50) NULL,
	[Reason] [varchar](200) NULL,
	[CoSign] [varchar](50) NULL,
	[Dose] [varchar](50) NULL,
 CONSTRAINT [PK_MedicationRegularAdministration] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicationRegularChart]    Script Date: 20/10/2025 5:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicationRegularChart](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LabId] [int] NULL,
	[PatientId] [int] NULL,
	[MedicationId] [int] NULL,
	[Dose] [varchar](50) NULL,
	[DoseFrequency] [varchar](50) NULL,
	[DoseDate] [date] NULL,
	[DoseTime] [varchar](50) NULL,
	[Indication] [varchar](50) NULL,
	[Route] [varchar](50) NULL,
	[Pharmacy] [varchar](50) NULL,
	[Prescriber] [varchar](50) NULL,
	[PrescriberSign] [varchar](50) NULL,
 CONSTRAINT [PK_MedicationRegularChart] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 20/10/2025 5:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[DateOfBirth] [datetime] NULL,
	[Gender] [varchar](10) NULL,
	[Address] [nvarchar](200) NULL,
	[AdmitDate] [datetime] NULL,
	[Weight] [varchar](10) NULL,
	[Height] [varchar](10) NULL,
	[Age] [varchar](10) NULL,
	[Allergy] [varchar](200) NULL,
	[Intolerance] [varchar](200) NULL,
	[Alerts] [varchar](200) NULL,
	[LabId] [int] NULL,
	[UriNumber] [varchar](50) NULL,
	[Alert] [int] NULL,
 CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PatientAdds]    Script Date: 20/10/2025 5:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientAdds](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NOT NULL,
	[RespiratoryRate] [varchar](20) NULL,
	[HeartRate] [varchar](20) NULL,
	[Temperature] [varchar](20) NULL,
	[Consciousness] [varchar](50) NULL,
	[OxygenSaturation] [varchar](20) NULL,
	[OxygenFlow] [varchar](20) NULL,
	[BloodPressure] [varchar](20) NULL,
	[LabId] [int] NULL,
	[RespiratoryRateValue] [int] NULL,
	[OxygenSaturationValue] [int] NULL,
	[BloodPressureValue] [int] NULL,
	[HeartRateValue] [int] NULL,
	[TemperatureValue] [int] NULL,
	[RespiratoryAlert] [int] NULL,
	[OxygenSaturationAlert] [int] NULL,
	[BloodPressureAlert] [int] NULL,
	[HeartRateAlert] [int] NULL,
	[ConsciousnessAlert] [int] NULL,
	[TotalScore] [int] NULL,
	[BloodPressureDiastolicValue] [int] NULL,
	[BloodPressureDiastolic] [varchar](20) NULL,
 CONSTRAINT [PK_ADDS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProgressNotes]    Script Date: 20/10/2025 5:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProgressNotes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LabId] [int] NULL,
	[Notes] [text] NULL,
	[Sign] [varchar](50) NULL,
	[NotesDate] [datetime] NULL,
	[PatientId] [int] NULL,
	[NotesFrom] [varchar](10) NULL,
 CONSTRAINT [PK_PatientProgressNotes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RiskmanIncident]    Script Date: 20/10/2025 5:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RiskmanIncident](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LabId] [int] NOT NULL,
	[PatientId] [int] NOT NULL,
	[IncidentDate] [date] NULL,
	[IncidentTime] [varchar](50) NULL,
	[URINumber] [nvarchar](50) NULL,
	[Campus] [nvarchar](50) NULL,
	[WardLocationType] [nvarchar](100) NULL,
	[PersonName] [nvarchar](100) NULL,
	[DateOfBirth] [date] NULL,
	[Sex] [nvarchar](40) NULL,
	[IndigenousStatus] [nvarchar](120) NULL,
	[BriefSummary] [nvarchar](200) NULL,
	[Details] [nvarchar](max) NULL,
	[EventType] [nvarchar](60) NULL,
	[EventSubType] [nvarchar](200) NULL,
	[IsClinicalIncident] [bit] NULL,
	[ClinicalHarmLevel] [nvarchar](20) NULL,
	[HarmDuration] [nvarchar](20) NULL,
	[RequiredCareLevelClinical] [nvarchar](40) NULL,
	[EmergencyResponseType] [nvarchar](40) NULL,
	[EmergencyResponseOutcome] [nvarchar](80) NULL,
	[ContributingAdditionalDetail] [nvarchar](max) NULL,
	[ReporterIsAffectedStaff] [bit] NULL,
	[OhsTypeOfInjury] [nvarchar](80) NULL,
	[OhsTypeOfInjuryOther] [nvarchar](120) NULL,
	[OhsBodyPartAffected] [nvarchar](80) NULL,
	[OhsBodyPartOther] [nvarchar](120) NULL,
	[OhsLevelOfHarmSustained] [nvarchar](40) NULL,
	[OhsRequiredLevelOfCare] [nvarchar](80) NULL,
	[OhsActionsRequired] [nvarchar](max) NULL,
	[SignedBy] [nvarchar](100) NULL,
	[SignedDate] [date] NULL,
	[Apse] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RiskmanIncidentContributingFactor]    Script Date: 20/10/2025 5:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RiskmanIncidentContributingFactor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IncidentId] [int] NOT NULL,
	[FactorCode] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supervisor]    Script Date: 20/10/2025 5:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supervisor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[UserLogin] [varchar](10) NULL,
	[UserPassword] [varchar](10) NULL,
	[LabId] [int] NULL,
 CONSTRAINT [PK_Supervisor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FoodIntakeItem]  WITH CHECK ADD FOREIGN KEY([HeaderId])
REFERENCES [dbo].[FoodIntakeHeader] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RiskmanIncidentContributingFactor]  WITH CHECK ADD  CONSTRAINT [FK_RICF_RiskmanIncident] FOREIGN KEY([IncidentId])
REFERENCES [dbo].[RiskmanIncident] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RiskmanIncidentContributingFactor] CHECK CONSTRAINT [FK_RICF_RiskmanIncident]
GO
/****** Object:  StoredProcedure [dbo].[ClearLabData]    Script Date: 20/10/2025 5:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ClearLabData]
    @LabId INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Declare a table variable to store the results
    DECLARE @DeletedRowsSummary TABLE (
		TableName NVARCHAR(100),
        RowsDeleted INT
		);

    DECLARE @RowsDeleted INT;

    -- Delete from IvFluidChart
    DELETE FROM [dbo].[IvFluidChart]
    WHERE LabId = @LabId;
    SET @RowsDeleted = @@ROWCOUNT;
    INSERT INTO @DeletedRowsSummary (TableName, RowsDeleted) VALUES ('Iv Fluid Chart', @RowsDeleted);

    -- Delete from FluidBalanceChart
    DELETE FROM [dbo].[FluidBalanceChart]
    WHERE LabId = @LabId;
    SET @RowsDeleted = @@ROWCOUNT;
    INSERT INTO @DeletedRowsSummary (TableName, RowsDeleted) VALUES ('Fluid Balance Chart', @RowsDeleted);

    -- Delete from NeurologicalChart
    DELETE FROM [dbo].[NeurologicalChart]
    WHERE LabId = @LabId;
    SET @RowsDeleted = @@ROWCOUNT;
    INSERT INTO @DeletedRowsSummary (TableName, RowsDeleted) VALUES ('Neurological Chart', @RowsDeleted);


    -- Delete from MedicationPrnChart
    DELETE FROM [dbo].[MedicationPrnChart]
    WHERE LabId = @LabId
    SET @RowsDeleted = @@ROWCOUNT;
    INSERT INTO @DeletedRowsSummary (TableName, RowsDeleted) VALUES ('PRN Medication Chart', @RowsDeleted);

    -- Delete from MedicationRegularChart
    DELETE FROM [dbo].[MedicationRegularChart]
    WHERE LabId = @LabId;
    SET @RowsDeleted = @@ROWCOUNT;
    INSERT INTO @DeletedRowsSummary (TableName, RowsDeleted) VALUES ('Regular Medication Chart', @RowsDeleted);

    -- Delete from PatientAdds
    DELETE FROM [dbo].[PatientAdds]
    WHERE LabId = @LabId;
    SET @RowsDeleted = @@ROWCOUNT;
    INSERT INTO @DeletedRowsSummary (TableName, RowsDeleted) VALUES ('Student Patient Adds', @RowsDeleted);

    -- Delete from IvFluidAdministration
    DELETE FROM [dbo].[IvFluidAdministration]
    WHERE LabId = @LabId;
    SET @RowsDeleted = @@ROWCOUNT;
    INSERT INTO @DeletedRowsSummary (TableName, RowsDeleted) VALUES ('Student Iv Fluid', @RowsDeleted);


    -- Delete from NeurologicalAdministration
    DELETE FROM [dbo].[NeurologicalAdministration]
    WHERE LabID = @LabId;
    SET @RowsDeleted = @@ROWCOUNT;
    INSERT INTO @DeletedRowsSummary (TableName, RowsDeleted) VALUES ('Student Neurological ', @RowsDeleted);

    -- Delete from FluidBalanceAdministration
    DELETE FROM [dbo].[FluidBalanceAdministration]
    WHERE LabID = @LabId;
    SET @RowsDeleted = @@ROWCOUNT;
    INSERT INTO @DeletedRowsSummary (TableName, RowsDeleted) VALUES ('Student Fluid Balance ', @RowsDeleted);


    -- Delete from MedicationPrnAdministration
    DELETE FROM [dbo].[MedicationPrnAdministration]
    WHERE LabId = @LabId;
    SET @RowsDeleted = @@ROWCOUNT;
    INSERT INTO @DeletedRowsSummary (TableName, RowsDeleted) VALUES ('Student PRN Medication', @RowsDeleted);

    -- Delete from MedicationRegularAdministration
    DELETE FROM [dbo].[MedicationRegularAdministration]
    WHERE LabId = @LabId;
    SET @RowsDeleted = @@ROWCOUNT;
    INSERT INTO @DeletedRowsSummary (TableName, RowsDeleted) VALUES ('Student Regular Medication', @RowsDeleted);

    -- Delete from ProgressNotes
    DELETE FROM [dbo].[ProgressNotes]
    WHERE LabId = @LabId;
    SET @RowsDeleted = @@ROWCOUNT;
    INSERT INTO @DeletedRowsSummary (TableName, RowsDeleted) VALUES ('Student Progress Notes', @RowsDeleted);

	UPDATE Patient SET Alert = 0 WHERE LabId = @LabId

    -- Return the summary table
    SELECT * FROM @DeletedRowsSummary;
END;

GO
/****** Object:  StoredProcedure [dbo].[ClearPatientData]    Script Date: 20/10/2025 5:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ClearPatientData]
	@LabId INT,
    @PatientId INT
AS
BEGIN
    SET NOCOUNT ON;

	SET NOCOUNT ON;

    DECLARE @DeletedTables TABLE (
		TableName NVARCHAR(100), 
		RowsDeleted INT
		);

    -- Delete from IvFluidAdministration and track rows affected
    DECLARE @RowsDeleted INT;

	DELETE FROM [dbo].[IvFluidChart]
    WHERE LabId = @LabId
	AND PatientId = @PatientId;
    SET @RowsDeleted = @@ROWCOUNT;
    INSERT INTO @DeletedTables (TableName, RowsDeleted) VALUES ('Iv Fluid Chart', @RowsDeleted);

    DELETE FROM [dbo].[IvFluidAdministration]
	WHERE LabId = @LabId
    AND PatientId = @PatientId;
    SET @RowsDeleted = @@ROWCOUNT;
    INSERT INTO @DeletedTables (TableName, RowsDeleted) VALUES ('Student Iv Fluid', @RowsDeleted);


-- Delete from FluidBalanceAdministration and track rows affected
     DELETE FROM [dbo].[FluidBalanceChart]
     WHERE LabId = @LabId
     AND PatientId = @PatientId;
     SET @RowsDeleted = @@ROWCOUNT;
     INSERT INTO @DeletedTables (TableName, RowsDeleted) VALUES ('Fluid Balance Chart', @RowsDeleted);

     
     DELETE FROM [dbo].[FluidBalanceAdministration]
     WHERE LabId = @LabId
     AND PatientId = @PatientId;
     SET @RowsDeleted = @@ROWCOUNT;
     INSERT INTO @DeletedTables (TableName, RowsDeleted) VALUES ('Student Fluid Balance', @RowsDeleted);

	 
 -- Delete from NeurologicalAdministration and track rows affected
     DELETE FROM [dbo].[NeurologicalChart]
     WHERE LabId = @LabId
     AND PatientId = @PatientId;
     SET @RowsDeleted = @@ROWCOUNT;
     INSERT INTO @DeletedTables (TableName, RowsDeleted) VALUES ('Neurological Chart', @RowsDeleted);

    DELETE FROM [dbo].[NeurologicalAdministration]
    WHERE LabId = @LabId
    AND PatientId = @PatientId;
    SET @RowsDeleted = @@ROWCOUNT;
    INSERT INTO @DeletedTables (TableName, RowsDeleted) VALUES ('Student Neurological', @RowsDeleted);


-- Delete from MedicationPrnChart
    DELETE FROM [dbo].[MedicationPrnChart]
    WHERE LabId = @LabId
	AND PatientId = @PatientId;
    SET @RowsDeleted = @@ROWCOUNT;
    INSERT INTO @DeletedTables (TableName, RowsDeleted) VALUES ('PRN Medication Chart', @RowsDeleted);

    -- Delete from MedicationPrnAdministration and track rows affected
    DELETE FROM [dbo].[MedicationPrnAdministration]
    WHERE LabId = @LabId
    AND PatientId = @PatientId;
    SET @RowsDeleted = @@ROWCOUNT;
    INSERT INTO @DeletedTables (TableName, RowsDeleted) VALUES ('Student PRN Medication', @RowsDeleted);

	-- Delete from MedicationRegularChart
    DELETE FROM [dbo].[MedicationRegularChart]
    WHERE LabId = @LabId
	AND PatientId = @PatientId;
    SET @RowsDeleted = @@ROWCOUNT;
    INSERT INTO @DeletedTables (TableName, RowsDeleted) VALUES ('Regular Medication Chart', @RowsDeleted);

    -- Delete from MedicationRegularAdministration and track rows affected
    DELETE FROM [dbo].[MedicationRegularAdministration]
    WHERE LabId = @LabId
    AND PatientId = @PatientId;
    SET @RowsDeleted = @@ROWCOUNT;
    INSERT INTO @DeletedTables (TableName, RowsDeleted) VALUES ('Student Regular Medication', @RowsDeleted);

    -- Delete from PatientAdds and track rows affected
    DELETE FROM [dbo].[PatientAdds]
    WHERE LabId = @LabId
    AND PatientId = @PatientId;
    SET @RowsDeleted = @@ROWCOUNT;
    INSERT INTO @DeletedTables (TableName, RowsDeleted) VALUES ('Student Patient Adds', @RowsDeleted);

	-- Delete from Patient Progress Notes and track rows affected
    DELETE FROM [dbo].[ProgressNotes]
    WHERE LabId = @LabId
    AND PatientId = @PatientId
	AND NotesFrom = 'student'
    SET @RowsDeleted = @@ROWCOUNT;
    INSERT INTO @DeletedTables (TableName, RowsDeleted) VALUES ('Student Progress Notes', @RowsDeleted);

	UPDATE Patient SET Alert = 0 WHERE Id = @PatientId

    -- Return the list of deleted tables and number of rows deleted
    SELECT * FROM @DeletedTables;
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteBradenAssessment]    Script Date: 20/10/2025 5:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteBradenAssessment]
  @Id INT
AS
BEGIN
  SET NOCOUNT ON;

  DELETE FROM dbo.BradenAssessment WHERE Id = @Id;

  SELECT CAST(@@ROWCOUNT AS INT) AS RowsAffected;
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteFoodIntake]    Script Date: 20/10/2025 5:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[DeleteFoodIntake]
  @Id INT
AS
BEGIN
  SET NOCOUNT ON;

  -- Items will delete automatically via FK ON DELETE CASCADE
  DELETE FROM dbo.FoodIntakeHeader WHERE Id = @Id;

  SELECT CAST(@@ROWCOUNT AS INT) AS RowsAffected;
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteIvFluidAdministration]    Script Date: 20/10/2025 5:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteIvFluidAdministration]
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM [dbo].[IvFluidAdministration]
    WHERE Id = @Id;

    -- Optionally, return the number of rows affected
    SELECT @@ROWCOUNT AS RowsAffected;
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteIvFluidChart]    Script Date: 20/10/2025 5:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteIvFluidChart]
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;

	IF NOT EXISTS(SELECT 1 FROM IvFluidChart WHERE Id = @Id)
    BEGIN
        SELECT 0 AS RowsAffected, 'Member Order does not exist' AS ResultMessage;
    END
    ELSE
    BEGIN
        IF EXISTS(SELECT 1 FROM IvFluidAdministration WHERE IvFluidChartId = @Id)
        BEGIN
            SELECT 0 AS RowsAffected, 'Member Order is being used in student Iv Fluid chart' AS ResultMessage;
        END
        ELSE
        BEGIN
            DELETE FROM IvFluidChart WHERE Id = @Id;

            SELECT @@ROWCOUNT AS RowsAffected, 'Member Order deleted successfully' AS ResultMessage;
        END
    END
END

GO


/****** Object:  StoredProcedure [dbo].[DeleteFluidBalanceAdministration]    Script Date: 4/4/2025 2:31:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteFluidBalanceAdministration]
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM [dbo].[FluidBalanceAdministration]
    WHERE Id = @Id;

    -- Optionally, return the number of rows affected
    SELECT @@ROWCOUNT AS RowsAffected;
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteFluidBalanceChart]    Script Date: 4/4/2025 2:31:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteFluidBalanceChart]
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;

	IF NOT EXISTS(SELECT 1 FROM FluidBalanceChart WHERE Id = @Id)
    BEGIN
        SELECT 0 AS RowsAffected, 'Fluid  Record does not exist' AS ResultMessage;
    END
    ELSE
    BEGIN
        IF EXISTS(SELECT 1 FROM FluidBalanceAdministration WHERE FluidBalanceChartId = @Id)
        BEGIN
            SELECT 0 AS RowsAffected, 'Fluid Record is being used in student Fluid Balance chart' AS ResultMessage;
        END
        ELSE
        BEGIN
            DELETE FROM FluidBalanceChart WHERE Id = @Id;

            SELECT @@ROWCOUNT AS RowsAffected, 'Fluid Record deleted successfully' AS ResultMessage;
        END
    END
END
GO

/****** Object:  StoredProcedure [dbo].[DeleteNeurologicalAdministration]    Script Date: 6/5/2025 2:31:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteNeurologicalAdministration]
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM [dbo].[NeurologicalAdministration]
    WHERE Id = @Id;

    -- Optionally, return the number of rows affected
    SELECT @@ROWCOUNT AS RowsAffected;
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteNeurologicalChart]    Script Date: 6/5/2025 2:31:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteNeurologicalChart]
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;

	IF NOT EXISTS(SELECT 1 FROM NeurologicalChart WHERE Id = @Id)
    BEGIN
        SELECT 0 AS RowsAffected, 'Neurological Record does not exist' AS ResultMessage;
    END
    ELSE
    BEGIN
        IF EXISTS(SELECT 1 FROM NeurologicalAdministration WHERE NeurologicalChartId = @Id)
        BEGIN
            SELECT 0 AS RowsAffected, 'Neurological Record is being used in student Neurological chart' AS ResultMessage;
        END
        ELSE
        BEGIN
            DELETE FROM NeurologicalChart WHERE Id = @Id;

            SELECT @@ROWCOUNT AS RowsAffected, 'Neurological Record deleted successfully' AS ResultMessage;
        END
    END
END
GO


/****** Object:  StoredProcedure [dbo].[DeleteMedication]    Script Date: 20/10/2025 5:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteMedication]
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;

    IF NOT EXISTS(SELECT 1 FROM Medication WHERE Id = @Id)
    BEGIN
        SELECT 0 AS RowsAffected, 'Medication does not exist' AS ResultMessage;
    END
    ELSE
    BEGIN
        IF EXISTS(SELECT 1 FROM MedicationPrnChart WHERE MedicationId = @Id)
            OR EXISTS(SELECT 1 FROM MedicationRegularChart WHERE MedicationId = @Id)
        BEGIN
            SELECT 0 AS RowsAffected, 'Medication is being used in PRN or Regular Medication chart' AS ResultMessage;
        END
        ELSE
        BEGIN
            DELETE FROM Medication WHERE Id = @Id;

            SELECT @@ROWCOUNT AS RowsAffected, 'Medication deleted successfully' AS ResultMessage;
        END
    END
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteMedicationPrnAdministration]    Script Date: 20/10/2025 5:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteMedicationPrnAdministration]
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM [dbo].[MedicationPrnAdministration]
    WHERE Id = @Id;

    -- Optionally, return the number of rows affected
    SELECT @@ROWCOUNT AS RowsAffected;
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteMedicationPrnChart]    Script Date: 20/10/2025 5:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteMedicationPrnChart]
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;

	IF NOT EXISTS(SELECT 1 FROM MedicationPrnChart WHERE Id = @Id)
    BEGIN
        SELECT 0 AS RowsAffected, 'Medication Prn does not exist' AS ResultMessage;
    END
    ELSE
    BEGIN
        IF EXISTS(SELECT 1 FROM MedicationPrnAdministration WHERE PatientMedicationChartId = @Id)
        BEGIN
            SELECT 0 AS RowsAffected, 'Medication Prn is being used in student medication prn chart' AS ResultMessage;
        END
        ELSE
        BEGIN
            DELETE FROM MedicationPrnChart WHERE Id = @Id;

            SELECT @@ROWCOUNT AS RowsAffected, 'Medication Prn deleted successfully' AS ResultMessage;
        END
    END

END

GO
/****** Object:  StoredProcedure [dbo].[DeleteMedicationRegularAdministration]    Script Date: 20/10/2025 5:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteMedicationRegularAdministration]
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM [dbo].[MedicationRegularAdministration]
    WHERE Id = @Id;

    -- Optionally, return the number of rows affected
    SELECT @@ROWCOUNT AS RowsAffected;
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteMedicationRegularChart]    Script Date: 20/10/2025 5:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteMedicationRegularChart]
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;

	IF NOT EXISTS(SELECT 1 FROM MedicationRegularChart WHERE Id = @Id)
    BEGIN
        SELECT 0 AS RowsAffected, 'Medication Regular does not exist' AS ResultMessage;
    END
    ELSE
    BEGIN
        IF EXISTS(SELECT 1 FROM MedicationRegularAdministration WHERE PatientMedicationChartId = @Id)
        BEGIN
            SELECT 0 AS RowsAffected, 'Medication Regular is being used in student medication Regular chart' AS ResultMessage;
        END
        ELSE
        BEGIN
            DELETE FROM MedicationRegularChart WHERE Id = @Id;

            SELECT @@ROWCOUNT AS RowsAffected, 'Medication Regular deleted successfully' AS ResultMessage;
        END
    END

END

GO
/****** Object:  StoredProcedure [dbo].[DeletePatient]    Script Date: 20/10/2025 5:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeletePatient]
    @Id INT,
	@LabId INT
AS
BEGIN

-- Delete from IvFluidAdministration and track rows affected
	DELETE FROM [dbo].[IvFluidChart]
    WHERE LabId = @LabId
	AND PatientId = @Id;

    DELETE FROM [dbo].[IvFluidAdministration]
	WHERE LabId = @LabId
    AND PatientId = @Id;


-- Delete from FluidBalanceAdministration and track rows affected
	DELETE FROM [dbo].[FluidBalanceChart]
        WHERE LabId = @LabId
    AND PatientId = @Id;

    DELETE FROM [dbo].[FluidBalanceAdministration]
        WHERE LabId = @LabId
    AND PatientId = @Id;

-- Delete from NeurologicalAdministration and track rows affected
	DELETE FROM [dbo].[NeurologicalChart]
        WHERE LabId = @LabId
    AND PatientId = @Id;

    DELETE FROM [dbo].[NeurologicalAdministration]
        WHERE LabId = @LabId
    AND PatientId = @Id;

	DELETE FROM [dbo].[MedicationPrnChart]
    WHERE LabId = @LabId
	AND PatientId = @Id;

    DELETE FROM [dbo].[MedicationPrnAdministration]
    WHERE LabId = @LabId
    AND PatientId = @Id;

	DELETE FROM [dbo].[MedicationRegularChart]
    WHERE LabId = @LabId
	AND PatientId = @Id;

    -- Delete from MedicationRegularAdministration and track rows affected
    DELETE FROM [dbo].[MedicationRegularAdministration]
    WHERE LabId = @LabId
    AND PatientId = @Id;

    -- Delete from PatientAdds and track rows affected
    DELETE FROM [dbo].[PatientAdds]
    WHERE LabId = @LabId
    AND PatientId = @Id;

	-- Delete from Patient Progress Notes and track rows affected
    DELETE FROM [dbo].[ProgressNotes]
    WHERE LabId = @LabId
    AND PatientId = @Id
	AND NotesFrom = 'student'

    DELETE FROM Patient
    WHERE [Id] = @Id
	AND LabId = @LabId;

	-- Optionally, return the number of rows affected
    SELECT @@ROWCOUNT AS RowsAffected;
END

GO
/****** Object:  StoredProcedure [dbo].[DeletePatientAdds]    Script Date: 20/10/2025 5:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeletePatientAdds]
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;

	DECLARE @PatientID INT = 0
	DECLARE @RowsAffected INT = 0

	SELECT @PatientID = PAtientId FROM PatientAdds WHERE Id = @Id

    DELETE FROM [dbo].[PatientAdds]
    WHERE Id = @Id;
    
	-- Optionally, return the number of rows affected
    SET @RowsAffected = @@ROWCOUNT

	IF NOT EXISTS (SELECT 1 FROM PatientAdds WHERE (RespiratoryAlert = 1 OR OxygenSaturationAlert = 1 OR BloodPressureAlert = 1 OR HeartRateAlert = 1 OR ConsciousnessAlert = 1) AND PatientId = @PatientID)
	BEGIN
		UPDATE Patient SET Alert = 0 WHERE Id = @PatientId
	END

	SELECT @RowsAffected AS RowsAffected
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteProgressNote]    Script Date: 20/10/2025 5:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteProgressNote]
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Delete the record with the provided Id
    DELETE FROM ProgressNotes
    WHERE Id = @Id;

    -- Return the number of rows affected
    SELECT @@ROWCOUNT AS RowsAffected;
END



GO
/****** Object:  StoredProcedure [dbo].[DeleteRiskmanIncident]    Script Date: 20/10/2025 5:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[DeleteRiskmanIncident]
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM dbo.RiskmanIncident WHERE Id = @Id;

    SELECT CAST(@@ROWCOUNT AS INT) AS RowsAffected;  -- your UI expects a number > 0
END
GO
/****** Object:  StoredProcedure [dbo].[GetBradenAssessmentById]    Script Date: 20/10/2025 5:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetBradenAssessmentById]
  @LabId INT,
  @Id INT
AS
BEGIN
  SET NOCOUNT ON;

  SELECT
      Id, LabId, PatientId, DateOfAssessment, NurseInitials,
      Sensory, Moisture, Activity, Mobility, Nutrition, Friction,
      TotalScore, RiskKey, Shift
  FROM dbo.BradenAssessment
  WHERE LabId = @LabId
    AND Id    = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[GetBradenAssessments]    Script Date: 20/10/2025 5:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetBradenAssessments]
  @LabId INT,
  @PatientId INT = NULL
AS
BEGIN
  SET NOCOUNT ON;

  SELECT
      Id,
      LabId,
      PatientId,
      DateOfAssessment,
      Shift,
      NurseInitials,
      TotalScore,
      RiskKey
  FROM dbo.BradenAssessment
  WHERE LabId = @LabId
    AND (@PatientId IS NULL OR PatientId = @PatientId)
  ORDER BY DateOfAssessment DESC, Id DESC;
END
GO
/****** Object:  StoredProcedure [dbo].[GetFoodIntakeById]    Script Date: 20/10/2025 5:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetFoodIntakeById]
  @LabId INT,
  @Id    INT
AS
BEGIN
  SET NOCOUNT ON;

  SELECT TOP (1)
    h.Id, h.LabId, h.PatientId, h.DayText, h.IntakeDate,
    h.Shift1Signature, h.Shift1Designation,
    h.Shift2Signature, h.Shift2Designation,
    h.BreakfastComment, h.MorningTeaComment,
    h.LunchComment, h.AfternoonTeaComment, h.DinnerComment, h.SupperComment
  FROM dbo.FoodIntakeHeader h
  WHERE h.LabId = @LabId AND h.Id = @Id;

  SELECT
    i.Id, i.Meal, i.Label, i.Notes, i.Amount
  FROM dbo.FoodIntakeItem i
  WHERE i.HeaderId = @Id
  ORDER BY CASE i.Meal
             WHEN 'Breakfast'     THEN 1
             WHEN 'Morning tea'   THEN 2
             WHEN 'Lunch'         THEN 3
             WHEN 'Afternoon tea' THEN 4
             WHEN 'Dinner'        THEN 5
             WHEN 'Supper'        THEN 6
             ELSE 99
           END,
           i.Id;
END
GO
/****** Object:  StoredProcedure [dbo].[GetFoodIntakeHeaders]    Script Date: 20/10/2025 5:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[GetFoodIntakeHeaders]
  @LabId INT,
  @PatientId INT = NULL
AS
BEGIN
  SET NOCOUNT ON;

  SELECT
    h.Id,
    h.LabId,
    h.PatientId,
    h.DayText,
    h.IntakeDate,
    -- Meals recorded as a quick summary: "Breakfast, Morning tea, Lunch"
    (
      SELECT STRING_AGG(m.Meal, N', ')
      FROM (
        SELECT DISTINCT i.Meal
        FROM dbo.FoodIntakeItem i
        WHERE i.HeaderId = h.Id
      ) AS m
    ) AS MealsRecordedSummary
  FROM dbo.FoodIntakeHeader h
  WHERE h.LabId = @LabId
    AND (@PatientId IS NULL OR h.PatientId = @PatientId)
  ORDER BY h.IntakeDate DESC, h.Id DESC;
END
GO
/****** Object:  StoredProcedure [dbo].[GetIvFluidAdministration]    Script Date: 20/10/2025 5:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetIvFluidAdministration]
    @LabId INT,
    @PatientId INT,
    @IvFluidChartId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        Id,
        LabId,
        PatientId,
        IvFluidChartId,
        StartDate,
        StartTime,
        EndDate,
        EndTime,
        VolGiven,
        PharmacistReview,
        NurseSign,
		CoSign
    FROM [dbo].[IvFluidAdministration]
    WHERE LabId = @LabId 
      AND PatientId = @PatientId
      AND IvFluidChartId = @IvFluidChartId;
END

GO
/****** Object:  StoredProcedure [dbo].[GetIvFluidChart]    Script Date: 20/10/2025 5:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetIvFluidChart]
    @Id INT = 0,
    @LabId INT = 0,
    @PatientId INT = 0
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        Id,
        LabId,
        PatientId,
        [Date],
        FlaskVol,
        Strength,
        Rate,
        Dose,
        OfficerSign
    FROM [dbo].[IvFluidChart]
    WHERE (@LabId = 0 OR LabId = @LabId) 
      AND (@PatientId = 0 OR PatientId = @PatientId)
      AND (@Id = 0 OR Id = @Id);
END


/****** Object:  StoredProcedure [dbo].[GetFluidBalanceAdministration]     ******/
CREATE PROCEDURE [dbo].[GetFluidBalanceAdministration]
    @LabId INT,
    @PatientId INT,
    @FluidBalanceChartId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        Id,
        LabId,
        PatientId,
        FluidBalanceChartId,
        StartDate,
        StartTime,
        EndDate,
        EndTime,
        VolGiven,
        PharmacistReview,
        NurseSign,
		CoSign
    FROM [dbo].[FluidBalanceAdministration]
    WHERE LabId = @LabId 
      AND PatientId = @PatientId
      AND FluidBalanceChartId = @FluidBalanceChartId;
END
GO

/****** Object:  StoredProcedure [dbo].[GetFluidBlanceChart]   ******/
CREATE PROCEDURE [dbo].[GetFluidBalanceChart]
    @Id INT = 0,
    @LabId INT = 0,
    @PatientId INT = 0
AS
BEGIN
    SET NOCOUNT ON;

    
    SELECT 
        Id,
        LabId,
        PatientId,
        [Date],
        IV_Fluids,
        Oral_Intake,
        Enteric_Intake,
        Other_Fluids,
        Cumulative_Intake,
        Urine_Output,
        Faecal_Output,
        Vomitus,
        Drainage,
        Gastric_Aspirate,
        Bladder_Scan,
        Other_Output,
		[Difference],
        Cumulative_Output
		
        
    FROM [dbo].[FluidBalanceChart]
    WHERE (@LabId = 0 OR LabId = @LabId) 
      AND (@PatientId = 0 OR PatientId = @PatientId)
      AND (@Id = 0 OR Id = @Id);
END
GO

/****** Object:  StoredProcedure [dbo].[GetNeurologicalAdministration]     ******/
CREATE PROCEDURE [dbo].[GetNeurologicalAdministration]
    @LabId INT,
    @PatientId INT,
    @NeurologicalChartId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        Id,
        LabId,
        PatientId,
        NeurologicalChartId,
        StartDate,
        StartTime,
        EndDate,
        EndTime,
        PharmacistReview,
        NurseSign,
		CoSign
    FROM [dbo].[NeurologicalAdministration]
    WHERE LabId = @LabId 
      AND PatientId = @PatientId
      AND NeurologicalChartId = @NeurologicalChartId;
END
GO

/****** Object:  StoredProcedure [dbo].[GetNeurologicalChart]   ******/
 
CREATE PROCEDURE [dbo].[GetNeurologicalChart]
    @Id INT = 0,
    @LabId INT = 0,
    @PatientId INT = 0
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        Id,
        LabId,
        PatientId,
        [Date],
		[Time],
		EyesOpenScore,
		VerbalResponseScore,  -- Supports 'T' for intubated
		MotorResponseScore,
		TotalComaScale,
		EndotrachealTube,
		RightPupilSize,
		RightPupilReaction,
		LeftPupilSize,
		LeftPupilReaction,
		ArmResponse,
		LegResponse,
		OfficerSign
        
    FROM [dbo].[NeurologicalChart]
    WHERE (@LabId = 0 OR LabId = @LabId) 
      AND (@PatientId = 0 OR PatientId = @PatientId)
      AND (@Id = 0 OR Id = @Id);
END
GO


GO
/****** Object:  StoredProcedure [dbo].[GetLab]    Script Date: 20/10/2025 5:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetLab] 
	-- Add the parameters for the stored procedure here
	@Id INT = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Lab
	WHERE Id = @Id
END

GO
/****** Object:  StoredProcedure [dbo].[GetMedication]    Script Date: 20/10/2025 5:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetMedication] 
	-- Add the parameters for the stored procedure here
	@LabId INT = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Medication
	WHERE LabId = @LabId 
END

GO
/****** Object:  StoredProcedure [dbo].[GetMedicationPrnAdministration]    Script Date: 20/10/2025 5:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetMedicationPrnAdministration]
    @LabId INT,
    @PatientId INT,
    @PatientMedicationChartId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        *
    FROM [dbo].[MedicationPrnAdministration]
    WHERE LabId = @LabId 
      AND PatientId = @PatientId
      AND PatientMedicationChartId = @PatientMedicationChartId;
END

GO
/****** Object:  StoredProcedure [dbo].[GetMedicationPrnChart]    Script Date: 20/10/2025 5:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetMedicationPrnChart] 
	-- Add the parameters for the stored procedure here
	@Id INT = 0,
	@LabId INT = 0,
	@PatientId INT = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Id, 
		(SELECT Name FROM Medication M WHERE M.Id = C.MedicationId AND M.LabId = @LabId) AS MedicationName, *
		
	FROM MedicationPrnChart C 
	WHERE (@LabId = 0 OR LabId = @LabId) 
      AND (@PatientId = 0 OR PatientId = @PatientId)
      AND (@Id = 0 OR Id = @Id);
END

GO
/****** Object:  StoredProcedure [dbo].[GetMedicationRegularAdministration]    Script Date: 20/10/2025 5:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetMedicationRegularAdministration]
    @LabId INT,
    @PatientId INT,
    @PatientMedicationChartId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        *
    FROM [dbo].[MedicationRegularAdministration]
    WHERE LabId = @LabId 
      AND PatientId = @PatientId
      AND PatientMedicationChartId = @PatientMedicationChartId;
END

GO
/****** Object:  StoredProcedure [dbo].[GetMedicationRegularChart]    Script Date: 20/10/2025 5:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetMedicationRegularChart] 
	-- Add the parameters for the stored procedure here
	@Id INT = 0,
	@LabId INT = 0,
	@PatientId INT = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Id, 
		(SELECT Name FROM Medication M WHERE M.Id = C.MedicationId AND M.LabId = @LabId) AS MedicationName, *
		
	FROM MedicationRegularChart C 
	WHERE (@LabId = 0 OR LabId = @LabId) 
      AND (@PatientId = 0 OR PatientId = @PatientId)
      AND (@Id = 0 OR Id = @Id);
END

GO
/****** Object:  StoredProcedure [dbo].[GetPatient]    Script Date: 20/10/2025 5:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetPatient] 
    @Id INT = 0,
    @LabId INT = 0
AS
BEGIN
    SET NOCOUNT ON;

    -- Select results based on the combination of parameters
    SELECT * 
    FROM Patient
    WHERE (@Id = 0 OR Id = @Id)
      AND (@LabId = 0 OR LabId = @LabId);
END

GO
/****** Object:  StoredProcedure [dbo].[GetPatientAdds]    Script Date: 20/10/2025 5:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetPatientAdds] 
	-- Add the parameters for the stored procedure here
	@LabId INT = 0,
	@PatientId INT = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	FROM PatientAdds
	WHERE LabId = @LabId 
	AND PatientId = @PatientId
END

GO
/****** Object:  StoredProcedure [dbo].[GetProgressNotes]    Script Date: 20/10/2025 5:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

CREATE PROCEDURE [dbo].[GetProgressNotes]
    @LabId INT = NULL, -- Optional parameter to filter by Id
	@PatientId INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

	SELECT Id, LabId, Notes, Sign, NotesDate, PatientId, NotesFrom
		FROM ProgressNotes
	WHERE LabId = @LabId
	AND PatientId = @PatientId
	ORDER BY NotesFrom DESC
    
END

GO
/****** Object:  StoredProcedure [dbo].[GetRiskmanIncident]    Script Date: 20/10/2025 5:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetRiskmanIncident]
  @LabId INT,
  @PatientId INT = NULL
AS
BEGIN
  SET NOCOUNT ON;

  SELECT
      Id, LabId, PatientId, IncidentDate, IncidentTime, URINumber,
      Campus, WardLocationType, PersonName,
      DateOfBirth, Sex, IndigenousStatus, BriefSummary, Details, EventType, EventSubType
  FROM dbo.RiskmanIncident
  WHERE LabId = @LabId
    AND (@PatientId IS NULL OR PatientId = @PatientId)
  ORDER BY IncidentDate DESC, Id DESC;
END
GO
/****** Object:  StoredProcedure [dbo].[GetRiskmanIncidentById]    Script Date: 20/10/2025 5:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetRiskmanIncidentById]
    @LabId INT,
    @Id    INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        i.Id, i.LabId, i.PatientId, i.IncidentDate, i.IncidentTime, i.URINumber,
        i.Campus, i.WardLocationType, i.PersonName, i.DateOfBirth, i.Sex, i.IndigenousStatus,
        i.BriefSummary, i.Details, i.EventType, i.EventSubType,
        i.IsClinicalIncident, i.Apse, i.ClinicalHarmLevel, i.HarmDuration, i.RequiredCareLevelClinical,
        i.EmergencyResponseType, i.EmergencyResponseOutcome,
        i.ContributingAdditionalDetail,
        i.ReporterIsAffectedStaff, i.OhsTypeOfInjury, i.OhsTypeOfInjuryOther, i.OhsBodyPartAffected, i.OhsBodyPartOther,
        i.OhsLevelOfHarmSustained, i.OhsRequiredLevelOfCare, i.OhsActionsRequired,
        i.SignedBy, i.SignedDate,
        -- aggregated factors for the repo to split into List<string>
        (SELECT STRING_AGG(LTRIM(RTRIM(cf.FactorCode)), ',')
           FROM dbo.RiskmanIncidentContributingFactor cf
          WHERE cf.IncidentId = i.Id) AS FactorsCsv
    FROM dbo.RiskmanIncident i
    WHERE i.LabId = @LabId
      AND i.Id    = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[InsertBradenAssessment]    Script Date: 20/10/2025 5:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertBradenAssessment]
  @LabId INT,
  @PatientId INT,
  @DateOfAssessment DATE,
  @NurseInitials NVARCHAR(10),
  @Sensory INT,
  @Moisture INT,
  @Activity INT,
  @Mobility INT,
  @Nutrition INT,
  @Friction INT,
  @TotalScore INT,
  @RiskKey NVARCHAR(50),
  @Shift NVARCHAR(20) = NULL
AS
BEGIN
  SET NOCOUNT ON;

  -- ✅ Guard: block any second “initial” row for this LabId+PatientId
  -- UPDLOCK+HOLDLOCK prevents race conditions under concurrency
  IF EXISTS (
      SELECT 1
      FROM dbo.BradenAssessment WITH (UPDLOCK, HOLDLOCK)
      WHERE LabId = @LabId AND PatientId = @PatientId
  )
  BEGIN
    SELECT CAST(-1 AS INT);
    RETURN;
  END

  INSERT INTO dbo.BradenAssessment
  (
    LabId, PatientId, DateOfAssessment, NurseInitials,
    Sensory, Moisture, Activity, Mobility, Nutrition, Friction,
    TotalScore, RiskKey, Shift
  )
  VALUES
  (
    @LabId, @PatientId, @DateOfAssessment, @NurseInitials,
    @Sensory, @Moisture, @Activity, @Mobility, @Nutrition, @Friction,
    @TotalScore, @RiskKey, @Shift
  );

  SELECT CAST(SCOPE_IDENTITY() AS INT);
END
GO
/****** Object:  StoredProcedure [dbo].[InsertBradenAssessmentFollowUp]    Script Date: 20/10/2025 5:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertBradenAssessmentFollowUp]
  @LabId INT,
  @PatientId INT,
  @DateOfAssessment DATE,
  @NurseInitials NVARCHAR(10),
  @Sensory INT,
  @Moisture INT,
  @Activity INT,
  @Mobility INT,
  @Nutrition INT,
  @Friction INT,
  @TotalScore INT,
  @RiskKey NVARCHAR(50),
  @Shift NVARCHAR(20) = NULL
AS
BEGIN
  SET NOCOUNT ON;

  -- ✅ Guard: must already have an initial assessment
  IF NOT EXISTS (
      SELECT 1
      FROM dbo.BradenAssessment
      WHERE LabId = @LabId AND PatientId = @PatientId
  )
  BEGIN
    SELECT CAST(-1 AS INT);  -- signal: no initial exists
    RETURN;
  END

  INSERT INTO dbo.BradenAssessment
  (
    LabId, PatientId, DateOfAssessment, NurseInitials,
    Sensory, Moisture, Activity, Mobility, Nutrition, Friction,
    TotalScore, RiskKey, Shift
  )
  VALUES
  (
    @LabId, @PatientId, @DateOfAssessment, @NurseInitials,
    @Sensory, @Moisture, @Activity, @Mobility, @Nutrition, @Friction,
    @TotalScore, @RiskKey, @Shift
  );

  SELECT CAST(SCOPE_IDENTITY() AS INT);
END
GO
/****** Object:  StoredProcedure [dbo].[InsertFoodIntake]    Script Date: 20/10/2025 5:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertFoodIntake]
  @LabId               INT,
  @PatientId           INT,
  @DayText             NVARCHAR(10) = NULL,
  @IntakeDate          DATE,
  @Shift1Signature     NVARCHAR(40) = NULL,
  @Shift1Designation   NVARCHAR(40) = NULL,
  @Shift2Signature     NVARCHAR(40) = NULL,
  @Shift2Designation   NVARCHAR(40) = NULL,
  @BreakfastComment    NVARCHAR(200) = NULL,
  @MorningTeaComment   NVARCHAR(200) = NULL,
  @LunchComment        NVARCHAR(200) = NULL,
  @AfternoonTeaComment NVARCHAR(200) = NULL,
  @DinnerComment       NVARCHAR(200) = NULL,
  @SupperComment       NVARCHAR(200) = NULL,
  @ItemsJson           NVARCHAR(MAX)
AS
BEGIN
  SET NOCOUNT ON;

  DECLARE @NewHeaderId INT;

  INSERT INTO dbo.FoodIntakeHeader
  (
    LabId, PatientId, DayText, IntakeDate,
    Shift1Signature, Shift1Designation, Shift2Signature, Shift2Designation,
    BreakfastComment, MorningTeaComment,
    LunchComment, AfternoonTeaComment, DinnerComment, SupperComment
  )
  VALUES
  (
    @LabId, @PatientId, @DayText, @IntakeDate,
    @Shift1Signature, @Shift1Designation, @Shift2Signature, @Shift2Designation,
    @BreakfastComment, @MorningTeaComment,
    @LunchComment, @AfternoonTeaComment, @DinnerComment, @SupperComment
  );

  SET @NewHeaderId = SCOPE_IDENTITY();

  INSERT INTO dbo.FoodIntakeItem (HeaderId, Meal, Label, Notes, Amount)
  SELECT
    @NewHeaderId, j.Meal, j.Label, j.Notes, j.Amount
  FROM OPENJSON(@ItemsJson)
  WITH
  (
    Meal   NVARCHAR(30)  '$.Meal',
    Label  NVARCHAR(50)  '$.Label',
    Notes  NVARCHAR(200) '$.Notes',
    Amount NVARCHAR(10)  '$.Amount'
  ) AS j;

  SELECT CAST(@NewHeaderId AS INT);
END
GO
/****** Object:  StoredProcedure [dbo].[InsertIvFluidAdministration]    Script Date: 20/10/2025 5:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertIvFluidAdministration]
    @LabId INT,
    @PatientId INT,
    @IvFluidChartId INT,
    @StartDate DATE,
    @StartTime VARCHAR(50) = NULL,
    @EndDate DATE,
    @EndTime VARCHAR(50) = NULL,
    @VolGiven VARCHAR(50) = NULL,
    @PharmacistReview VARCHAR(200) = NULL,
    @NurseSign VARCHAR(50) = NULL,
	@CoSign VARCHAR(50) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[IvFluidAdministration]
    (
        LabId,
        PatientId,
        IvFluidChartId,
        StartDate,
        StartTime,
        EndDate,
        EndTime,
        VolGiven,
        PharmacistReview,
        NurseSign,
		CoSign
    )
    VALUES
    (
        @LabId,
        @PatientId,
        @IvFluidChartId,
        @StartDate,
        @StartTime,
        @EndDate,
        @EndTime,
        @VolGiven,
        @PharmacistReview,
        @NurseSign,
		@CoSign
    );

    -- Optionally return the newly inserted Id
    SELECT CAST(SCOPE_IDENTITY() AS INT) AS Id;
END

GO
/****** Object:  StoredProcedure [dbo].[InsertIvFluidChart]    Script Date: 20/10/2025 5:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertIvFluidChart]
    @LabId INT,
    @PatientId INT,
    @Date DATE,
    @FlaskVol VARCHAR(50) = NULL,
    @Strength VARCHAR(50) = NULL,
    @Rate VARCHAR(50) = NULL,
    @Dose VARCHAR(50) = NULL,
    @OfficerSign VARCHAR(50) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[IvFluidChart]
    (
        LabId,
        PatientId,
        [Date],
        FlaskVol,
        Strength,
        Rate,
        Dose,
        OfficerSign
    )
    VALUES
    (
        @LabId,
        @PatientId,
        @Date,
        @FlaskVol,
        @Strength,
        @Rate,
        @Dose,
        @OfficerSign
    );

    -- Optionally return the newly inserted Id
     SELECT CAST(SCOPE_IDENTITY() AS INT) AS Id;
END

GO


	/****** Object:  StoredProcedure [dbo].[InsertFluidBalanceAdministration]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertFluidBalanceAdministration]
    @LabId INT,
    @PatientId INT,
    @FluidBalanceChartId INT,
    @StartDate DATE,
    @StartTime VARCHAR(50) = NULL,
    @EndDate DATE,
    @EndTime VARCHAR(50) = NULL,
    @VolGiven VARCHAR(50) = NULL,
    @PharmacistReview VARCHAR(200) = NULL,
    @NurseSign VARCHAR(50) = NULL,
	@CoSign VARCHAR(50) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[FluidBalanceAdministration]
    (
        LabId,
        PatientId,
        FluidBalanceChartId,
        StartDate,
        StartTime,
        EndDate,
        EndTime,
        VolGiven,
        PharmacistReview,
        NurseSign,
		CoSign
    )
    VALUES
    (
        @LabId,
        @PatientId,
        @FluidBalanceChartId,
        @StartDate,
        @StartTime,
        @EndDate,
        @EndTime,
        @VolGiven,
        @PharmacistReview,
        @NurseSign,
		@CoSign
    );

    -- Optionally return the newly inserted Id
    SELECT CAST(SCOPE_IDENTITY() AS INT) AS Id;
END
GO
/****** Object:  StoredProcedure [dbo].[InsertFluidBalanceChart]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertFluidBalanceChart]
    @LabId INT,
    @PatientId INT,
    @Date DATE,
    @IV_Fluids VARCHAR(50) = NULL,
    @Oral_Intake VARCHAR(50) = NULL,
    @Enteric_Intake VARCHAR(50) = NULL,
    @Other_Fluids VARCHAR(50) = NULL,
    @Cumulative_Intake VARCHAR(50) = NULL,
    @Urine_Output VARCHAR(50) = NULL,
    @Faecal_Output VARCHAR(50) = NULL,
    @Vomitus VARCHAR(50) = NULL,
    @Drainage VARCHAR(50) = NULL,
    @Gastric_Aspirate VARCHAR(50) = NULL,
    @Bladder_Scan VARCHAR(50) = NULL,
    @Other_Output VARCHAR(50) = NULL,
    @Cumulative_Output VARCHAR(50) = NULL,
	@Difference VARCHAR(50) = NULL
    
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[FluidBalanceChart]
    (
        LabId,
        PatientId,
        [Date],
        IV_Fluids,
        Oral_Intake,
        Enteric_Intake,
        Other_Fluids,
        Cumulative_Intake,
        Urine_Output,
        Faecal_Output,
        Vomitus,
        Drainage,
        Gastric_Aspirate,
        Bladder_Scan,
        Other_Output,
        Cumulative_Output,
		[Difference]
        
    )
    VALUES
    (
        @LabId,
        @PatientId,
        @Date,
        @IV_Fluids,
        @Oral_Intake,
        @Enteric_Intake,
        @Other_Fluids,
        @Cumulative_Intake,
        @Urine_Output,
        @Faecal_Output,
        @Vomitus,
        @Drainage,
        @Gastric_Aspirate,
        @Bladder_Scan,
        @Other_Output,
        @Cumulative_Output,
		@Difference
       
    );
	    -- Optionally return the newly inserted Id
     SELECT CAST(SCOPE_IDENTITY() AS INT) AS Id;
END
GO

		/****** Object:  StoredProcedure [dbo].[InsertNeurologicalAdministration]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertNeurologicalAdministration]
    @LabId INT,
    @PatientId INT,
    @NeurologicalChartId INT,
    @StartDate DATE,
    @StartTime VARCHAR(50) = NULL,
    @EndDate DATE,
    @EndTime VARCHAR(50) = NULL,
    @PharmacistReview VARCHAR(200) = NULL,
    @NurseSign VARCHAR(50) = NULL,
	@CoSign VARCHAR(50) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[NeurologicalAdministration]
    (
        LabId,
        PatientId,
        NeurologicalChartId,
        StartDate,
        StartTime,
        EndDate,
        EndTime,
        PharmacistReview,
        NurseSign,
		CoSign
    )
    VALUES
    (
        @LabId,
        @PatientId,
        @NeurologicalChartId,
        @StartDate,
        @StartTime,
        @EndDate,
        @EndTime,
        @PharmacistReview,
        @NurseSign,
		@CoSign
    );

    -- Optionally return the newly inserted Id
    SELECT CAST(SCOPE_IDENTITY() AS INT) AS Id;
END
GO
/****** Object:  StoredProcedure [dbo].[InsertNeurologicalChart]    ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertNeurologicalChart]
    @LabId INT,
    @PatientId INT,
	@Date DATE,
    @Time TIME,
    @EyesOpenScore INT NULL,
    @VerbalResponseScore VARCHAR(1) = NULL,  -- Supports 'T' for intubated
    @MotorResponseScore INT NULL,
    @TotalComaScale INT NULL,
    @EndotrachealTube BIT NULL,
    @RightPupilSize INT NULL,
    @RightPupilReaction VARCHAR(50) = NULL,
    @LeftPupilSize INT NULL,
    @LeftPupilReaction VARCHAR(50) = NULL,
    @ArmResponse VARCHAR(50) = NULL,
    @LegResponse VARCHAR(50) = NULL,
	@OfficerSign VARCHAR(50) = NULL
   
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[NeurologicalChart]
    (
        LabId,   
		PatientId,
		[Date],
		[Time],
		EyesOpenScore,
		VerbalResponseScore,  -- Supports 'T' for intubated
		MotorResponseScore,
		TotalComaScale,
		EndotrachealTube,
		RightPupilSize,
		RightPupilReaction,
		LeftPupilSize,
		LeftPupilReaction,
		ArmResponse,
		LegResponse,
		OfficerSign

    )
    VALUES
    (
		@LabId,
		@PatientId,
		@Date,
		@Time,
		@EyesOpenScore,
		@VerbalResponseScore,  -- Supports 'T' for intubated
		@MotorResponseScore,
		@TotalComaScale,
		@EndotrachealTube,
		@RightPupilSize,
		@RightPupilReaction,
		@LeftPupilSize,
		@LeftPupilReaction,
		@ArmResponse,
		@LegResponse,
		@OfficerSign
    );
	    -- Optionally return the newly inserted Id
    SELECT CAST(SCOPE_IDENTITY() AS INT) AS Id;
END
GO




/****** Object:  StoredProcedure [dbo].[InsertMedication]    Script Date: 20/10/2025 5:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertMedication]
    @LabId INT,
    @Name VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[Medication]
    (
        LabId,
        Name
    )
    VALUES
    (
        @LabId,
        @Name
    );

    -- Optionally return the ID of the newly inserted record
   SELECT CAST(SCOPE_IDENTITY() AS INT) AS Id;
END

GO
/****** Object:  StoredProcedure [dbo].[InsertMedicationPrnAdministration]    Script Date: 20/10/2025 5:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertMedicationPrnAdministration]
    @LabId INT,
    @PatientId INT,
    @PatientMedicationChartId INT,
    @DoseDate DATE,
    @DoseTime VARCHAR(50) = NULL,
	@Dose VARCHAR(50) = NULL,
    @Route VARCHAR(50) = NULL,
    @StudentSign VARCHAR(50) = NULL,
	@Reason VARCHAR(200) = NULL,
	@CoSign VARCHAR(50) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[MedicationPrnAdministration]
    (
        LabId,
        PatientId,
        PatientMedicationChartId,
        DoseDate,
        DoseTime,
		Dose,
        Route,
        StudentSign,
		Reason,
		CoSign
    )
    VALUES
    (
        @LabId,
        @PatientId,
        @PatientMedicationChartId,
        @DoseDate,
        @DoseTime,
		@Dose,
        @Route,
        @StudentSign,
		@Reason,
		@CoSign
    );

    -- Optionally return the newly inserted Id
    SELECT CAST(SCOPE_IDENTITY() AS INT) AS Id;
END

GO
/****** Object:  StoredProcedure [dbo].[InsertMedicationPrnChart]    Script Date: 20/10/2025 5:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertMedicationPrnChart]
    @LabId INT,
    @PatientId INT,
    @MedicationId INT,
    @Dose VARCHAR(50) = NULL,
    @DoseFrequency VARCHAR(50) = NULL,
    @DoseDate DATE,
    @DoseTime VARCHAR(50) = NULL,
    @Indication VARCHAR(50) = NULL,
    @Route VARCHAR(50) = NULL,
    @Pharmacy VARCHAR(50) = NULL,
    @Prescriber VARCHAR(50) = NULL,
    @PrescriberSign VARCHAR(50) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[MedicationPrnChart]
    (
        LabId,
        PatientId,
        MedicationId,
        Dose,
        DoseFrequency,
        DoseDate,
        DoseTime,
        Indication,
        Route,
        Pharmacy,
        Prescriber,
        PrescriberSign
    )
    VALUES
    (
        @LabId,
        @PatientId,
        @MedicationId,
        @Dose,
        @DoseFrequency,
        @DoseDate,
        @DoseTime,
        @Indication,
        @Route,
        @Pharmacy,
        @Prescriber,
        @PrescriberSign
    );

    -- Optionally return the ID of the newly inserted record
    SELECT CAST(SCOPE_IDENTITY() AS INT) AS Id;
END

GO
/****** Object:  StoredProcedure [dbo].[InsertMedicationRegularAdministration]    Script Date: 20/10/2025 5:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertMedicationRegularAdministration]
    @LabId INT,
    @PatientId INT,
    @PatientMedicationChartId INT,
    @DoseDate DATE,
    @DoseTime VARCHAR(50) = NULL,
	@Dose VARCHAR(50) = NULL,
    @Route VARCHAR(50) = NULL,
    @StudentSign VARCHAR(50) = NULL,
	@Reason VARCHAR(200) = NULL,
	@CoSign VARCHAR(50) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[MedicationRegularAdministration]
    (
        LabId,
        PatientId,
        PatientMedicationChartId,
        DoseDate,
        DoseTime,
		Dose,
        Route,
        StudentSign,
		Reason,
		CoSign
    )
    VALUES
    (
        @LabId,
        @PatientId,
        @PatientMedicationChartId,
        @DoseDate,
        @DoseTime,
		@Dose,
        @Route,
        @StudentSign,
		@Reason,
		@CoSign
    );

    -- Optionally return the newly inserted Id
    SELECT CAST(SCOPE_IDENTITY() AS INT) AS Id;
END

GO
/****** Object:  StoredProcedure [dbo].[InsertMedicationRegularChart]    Script Date: 20/10/2025 5:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertMedicationRegularChart]
    @LabId INT,
    @PatientId INT,
    @MedicationId INT,
    @Dose VARCHAR(50) = NULL,
    @DoseFrequency VARCHAR(50) = NULL,
    @DoseDate DATE,
    @DoseTime VARCHAR(50) = NULL,
    @Indication VARCHAR(50) = NULL,
    @Route VARCHAR(50) = NULL,
    @Pharmacy VARCHAR(50) = NULL,
    @Prescriber VARCHAR(50) = NULL,
    @PrescriberSign VARCHAR(50) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO [dbo].[MedicationRegularChart]
    (
        LabId,
        PatientId,
        MedicationId,
        Dose,
        DoseFrequency,
        DoseDate,
        DoseTime,
        Indication,
        Route,
        Pharmacy,
        Prescriber,
        PrescriberSign
    )
    VALUES
    (
        @LabId,
        @PatientId,
        @MedicationId,
        @Dose,
        @DoseFrequency,
        @DoseDate,
        @DoseTime,
        @Indication,
        @Route,
        @Pharmacy,
        @Prescriber,
        @PrescriberSign
    );

    -- Optionally return the ID of the newly inserted record
    SELECT CAST(SCOPE_IDENTITY() AS INT) AS Id;
END

GO
/****** Object:  StoredProcedure [dbo].[InsertPatient]    Script Date: 20/10/2025 5:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertPatient]
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50),
    @DateOfBirth DATETIME,
    @Gender VARCHAR(10),
    @Address NVARCHAR(200),
    @AdmitDate DATETIME,
    @Weight VARCHAR(10),
    @Height VARCHAR(10),
    @Age VARCHAR(10),
    @Allergy VARCHAR(200),
    @Intolerance VARCHAR(200),
    @LabId INT,
    @UriNumber VARCHAR(50)
AS
BEGIN
    INSERT INTO Patient (
        [FirstName],
        [LastName],
        [DateOfBirth],
        [Gender],
        [Address],
        [AdmitDate],
        [Weight],
        [Height],
        [Age],
        [Allergy],
        [Intolerance],
        [LabId],
        [UriNumber]
    ) VALUES (
        @FirstName,
        @LastName,
        @DateOfBirth,
        @Gender,
        @Address,
        @AdmitDate,
        @Weight,
        @Height,
        @Age,
        @Allergy,
        @Intolerance,
        @LabId,
        @UriNumber
    );

	-- Optionally return the newly inserted Id
    SELECT CAST(SCOPE_IDENTITY() AS INT) AS Id;
END

GO
/****** Object:  StoredProcedure [dbo].[InsertPatientAdds]    Script Date: 20/10/2025 5:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertPatientAdds]
	@PatientId INT,
	@LabId INT,
    @RespiratoryRate VARCHAR(20) = NULL,
    @HeartRate VARCHAR(20) = NULL,
    @Temperature VARCHAR(20) = NULL,
    @Consciousness VARCHAR(50) = NULL,
    @OxygenSaturation VARCHAR(20) = NULL,
    @OxygenFlow VARCHAR(20) = NULL,
    @BloodPressure VARCHAR(20) = NULL,
	@BloodPressureDiastolic VARCHAR(20) = NULL,

	@RespiratoryRateValue INT = NULL,
	@OxygenSaturationValue INT = NULL,
	@BloodPressureValue	INT = NULL,
	@BloodPressureDiastolicValue	INT = NULL,
	@HeartRateValue	INT = NULL,
	@TemperatureValue INT = NULL,


	@RespiratoryAlert INT = NULL,
	@OxygenSaturationAlert INT	= NULL,
	@BloodPressureAlert	INT	= NULL,
	@HeartRateAlert	INT	= NULL,
	@ConsciousnessAlert INT = NULL,
	@TotalScore INT = NULL

AS
BEGIN
    -- Set NOCOUNT ON to avoid extra result sets being returned.
    SET NOCOUNT ON;

	IF (@RespiratoryAlert = 1 OR @OxygenSaturationAlert = 1 OR @BloodPressureAlert = 1 OR @HeartRateAlert = 1 OR @ConsciousnessAlert = 1)
	BEGIN
		UPDATE Patient SET Alert = 1 WHERE Id = @PatientId AND LabId = @LabId
	END

    INSERT INTO PatientAdds (PatientId, LabId, RespiratoryRate, HeartRate, Temperature, Consciousness, OxygenSaturation, OxygenFlow, BloodPressure, 
	BloodPressureDiastolic, RespiratoryRateValue, OxygenSaturationValue, BloodPressureValue, BloodPressureDiastolicValue, HeartRateValue, TemperatureValue,
	RespiratoryAlert, OxygenSaturationAlert, BloodPressureAlert, HeartRateAlert, ConsciousnessAlert, TotalScore)
    VALUES (@PatientId, @LabId, @RespiratoryRate, @HeartRate, @Temperature, @Consciousness, @OxygenSaturation, @OxygenFlow, @BloodPressure, 
	@BloodPressureDiastolic, @RespiratoryRateValue, @OxygenSaturationValue, @BloodPressureValue, @BloodPressureDiastolicValue, @HeartRateValue, @TemperatureValue,
	@RespiratoryAlert, @OxygenSaturationAlert, @BloodPressureAlert, @HeartRateAlert, @ConsciousnessAlert, @TotalScore);

    -- Return the identity of the new record
    SELECT CAST(SCOPE_IDENTITY() AS INT) AS Id;
END


GO
/****** Object:  StoredProcedure [dbo].[InsertProgressNote]    Script Date: 20/10/2025 5:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertProgressNote]
    @LabId INT = NULL,
    @Notes TEXT = NULL,
    @Sign VARCHAR(50) = NULL,
    @NotesDate DATETIME = NULL,
    @PatientId INT = NULL,
	@NotesFrom VARCHAR(10) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO ProgressNotes (LabId, Notes, Sign, NotesDate, PatientId, NotesFrom)
    VALUES (@LabId, @Notes, @Sign, @NotesDate, @PatientId, @NotesFrom);

    -- Return the Id of the newly inserted record
    SELECT CAST(SCOPE_IDENTITY() AS INT) AS Id;
END


GO
/****** Object:  StoredProcedure [dbo].[InsertRiskmanIncident]    Script Date: 20/10/2025 5:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertRiskmanIncident]
    @LabId INT,
    @PatientId INT,
    @IncidentDate DATE = NULL,
    @IncidentTime VARCHAR(50) = NULL,
    @URINumber NVARCHAR(50) = NULL,
    @Campus NVARCHAR(50) = NULL,
    @WardLocationType NVARCHAR(100) = NULL,
    @PersonName NVARCHAR(100) = NULL,
    @DateOfBirth DATE = NULL,
    @Sex NVARCHAR(40) = NULL,
    @IndigenousStatus NVARCHAR(120) = NULL,
    @BriefSummary NVARCHAR(200) = NULL,
    @Details NVARCHAR(MAX) = NULL,
    @EventType NVARCHAR(60) = NULL,
    @EventSubType NVARCHAR(200) = NULL,

    -- #4 Clinical Incident (Apse is now BIT)
    @IsClinicalIncident            BIT            = NULL,
    @Apse                          BIT            = NULL,
    @ClinicalHarmLevel             NVARCHAR(20)   = NULL,
    @HarmDuration                  NVARCHAR(20)   = NULL,
    @RequiredCareLevelClinical     NVARCHAR(40)   = NULL,

    -- #5 Emergency Response
    @EmergencyResponseType         NVARCHAR(40)   = NULL,
    @EmergencyResponseOutcome      NVARCHAR(80)   = NULL,

    -- #6 Contributing Factors
    @ContributingAdditionalDetail  NVARCHAR(MAX)  = NULL,
    @ContributingFactorsCsv        NVARCHAR(MAX)  = NULL,

    -- #7 OHS
    @ReporterIsAffectedStaff       BIT            = NULL,
    @OhsTypeOfInjury               NVARCHAR(80)   = NULL,
    @OhsTypeOfInjuryOther          NVARCHAR(120)  = NULL,
    @OhsBodyPartAffected           NVARCHAR(80)   = NULL,
    @OhsBodyPartOther              NVARCHAR(120)  = NULL,
    @OhsLevelOfHarmSustained       NVARCHAR(40)   = NULL,
    @OhsRequiredLevelOfCare        NVARCHAR(80)   = NULL,
    @OhsActionsRequired            NVARCHAR(MAX)  = NULL,

    -- Sign Off
    @SignedBy                      NVARCHAR(100)  = NULL,
    @SignedDate                    DATE           = NULL
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        BEGIN TRAN;

        INSERT INTO dbo.RiskmanIncident
        (
            LabId, PatientId, IncidentDate, IncidentTime, URINumber,
            Campus, WardLocationType, PersonName, DateOfBirth, Sex, IndigenousStatus,
            BriefSummary, Details, EventType, EventSubType,
            IsClinicalIncident, Apse, ClinicalHarmLevel, HarmDuration, RequiredCareLevelClinical,
            EmergencyResponseType, EmergencyResponseOutcome,
            ContributingAdditionalDetail,
            ReporterIsAffectedStaff, OhsTypeOfInjury, OhsTypeOfInjuryOther, OhsBodyPartAffected, OhsBodyPartOther,
            OhsLevelOfHarmSustained, OhsRequiredLevelOfCare, OhsActionsRequired,
            SignedBy, SignedDate
        )
        VALUES
        (
            @LabId, @PatientId, @IncidentDate, @IncidentTime, @URINumber,
            @Campus, @WardLocationType, @PersonName, @DateOfBirth, @Sex, @IndigenousStatus,
            @BriefSummary, @Details, @EventType, @EventSubType,
            @IsClinicalIncident, @Apse, @ClinicalHarmLevel, @HarmDuration, @RequiredCareLevelClinical,
            @EmergencyResponseType, @EmergencyResponseOutcome,
            @ContributingAdditionalDetail,
            @ReporterIsAffectedStaff, @OhsTypeOfInjury, @OhsTypeOfInjuryOther, @OhsBodyPartAffected, @OhsBodyPartOther,
            @OhsLevelOfHarmSustained, @OhsRequiredLevelOfCare, @OhsActionsRequired,
            @SignedBy, @SignedDate
        );

        DECLARE @NewId INT = CAST(SCOPE_IDENTITY() AS INT);

        IF (@ContributingFactorsCsv IS NOT NULL AND LTRIM(RTRIM(@ContributingFactorsCsv)) <> '')
        BEGIN
            INSERT INTO dbo.RiskmanIncidentContributingFactor(IncidentId, FactorCode)
            SELECT @NewId, LTRIM(RTRIM(value))
            FROM STRING_SPLIT(@ContributingFactorsCsv, ',');
        END

        COMMIT;
        SELECT @NewId AS Id;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK;
        THROW;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateFoodIntake]    Script Date: 20/10/2025 5:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateFoodIntake]
  @Id                 INT,
  @LabId              INT,
  @PatientId          INT,
  @DayText            NVARCHAR(10) = NULL,
  @IntakeDate         DATE,
  @Shift1Signature    NVARCHAR(40) = NULL,
  @Shift1Designation  NVARCHAR(40) = NULL,
  @Shift2Signature    NVARCHAR(40) = NULL,
  @Shift2Designation  NVARCHAR(40) = NULL,
  @BreakfastComment    NVARCHAR(200) = NULL,
  @MorningTeaComment   NVARCHAR(200) = NULL,
  @LunchComment        NVARCHAR(200) = NULL,
  @AfternoonTeaComment NVARCHAR(200) = NULL,
  @DinnerComment       NVARCHAR(200) = NULL,
  @SupperComment       NVARCHAR(200) = NULL,
  @ItemsJson          NVARCHAR(MAX)
AS
BEGIN
  SET NOCOUNT ON;

  IF NOT EXISTS (
    SELECT 1 FROM dbo.FoodIntakeHeader
    WHERE Id=@Id AND LabId=@LabId AND PatientId=@PatientId
  )
  BEGIN
    SELECT CAST(0 AS INT); RETURN;
  END

  UPDATE dbo.FoodIntakeHeader
  SET DayText            = @DayText,
      IntakeDate         = @IntakeDate,
      Shift1Signature    = @Shift1Signature,
      Shift1Designation  = @Shift1Designation,
      Shift2Signature    = @Shift2Signature,
      Shift2Designation  = @Shift2Designation,
      BreakfastComment    = @BreakfastComment,
      MorningTeaComment   = @MorningTeaComment,
      LunchComment        = @LunchComment,
      AfternoonTeaComment = @AfternoonTeaComment,
      DinnerComment       = @DinnerComment,
      SupperComment       = @SupperComment
  WHERE Id=@Id;

  DELETE FROM dbo.FoodIntakeItem WHERE HeaderId=@Id;

  INSERT INTO dbo.FoodIntakeItem (HeaderId, Meal, Label, Notes, Amount)
  SELECT
    @Id, j.Meal, j.Label, j.Notes, j.Amount
  FROM OPENJSON(@ItemsJson)
  WITH (
    Meal   NVARCHAR(30)  '$.Meal',
    Label  NVARCHAR(50)  '$.Label',
    Notes  NVARCHAR(200) '$.Notes',
    Amount NVARCHAR(10)  '$.Amount'
  ) AS j;

  SELECT CAST(1 AS INT);
END
GO
/****** Object:  StoredProcedure [dbo].[UpdatePatient]    Script Date: 20/10/2025 5:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdatePatient]
    @Id INT,
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50),
    @DateOfBirth DATETIME,
    @Gender VARCHAR(10),
    @Address NVARCHAR(200),
    @AdmitDate DATETIME,
    @Weight VARCHAR(10),
    @Height VARCHAR(10),
    @Age VARCHAR(10),
    @Allergy VARCHAR(200),
    @Intolerance VARCHAR(200),
    @LabId INT,
    @UriNumber VARCHAR(50)
AS
BEGIN
    UPDATE Patient
    SET 
        [FirstName] = @FirstName,
        [LastName] = @LastName,
        [DateOfBirth] = @DateOfBirth,
        [Gender] = @Gender,
        [Address] = @Address,
        [AdmitDate] = @AdmitDate,
        [Weight] = @Weight,
        [Height] = @Height,
        [Age] = @Age,
        [Allergy] = @Allergy,
        [Intolerance] = @Intolerance,
        [LabId] = @LabId,
        [UriNumber] = @UriNumber
    WHERE 
        [Id] = @Id;

		-- Check if any rows were affected
    IF @@ROWCOUNT = 0
    BEGIN
        -- Optionally return an error or handle no rows affected
        RAISERROR('No record found with the given Id.', 16, 1);
    END
END

GO
/****** Object:  StoredProcedure [dbo].[UpdatePatientAdds]    Script Date: 20/10/2025 5:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdatePatientAdds]
	@Id INT = 0,
	@PatientId INT,
	@LabId INT,
    @RespiratoryRate VARCHAR(20) = NULL,
    @HeartRate VARCHAR(20) = NULL,
    @Temperature VARCHAR(20) = NULL,
    @Consciousness VARCHAR(50) = NULL,
    @OxygenSaturation VARCHAR(20) = NULL,
    @OxygenFlow VARCHAR(20) = NULL,
    @BloodPressure VARCHAR(20) = NULL,
	@BloodPressureDiastolic VARCHAR(20) = NULL,

	@RespiratoryRateValue INT = NULL,
	@OxygenSaturationValue INT = NULL,
	@BloodPressureValue	INT = NULL,
	@BloodPressureDiastolicValue	INT = NULL,
	@HeartRateValue	INT = NULL,
	@TemperatureValue INT = NULL,


	@RespiratoryAlert INT = NULL,
	@OxygenSaturationAlert INT	= NULL,
	@BloodPressureAlert	INT	= NULL,
	@HeartRateAlert	INT	= NULL,
	@ConsciousnessAlert INT = NULL,
	@TotalScore INT = NULL
AS
BEGIN
    -- Set NOCOUNT ON to avoid extra result sets being returned.
    SET NOCOUNT ON;

    UPDATE PatientAdds
    SET 
        PatientId = @PatientId,
		LabId = @LabId,
        RespiratoryRate = @RespiratoryRate,
        HeartRate = @HeartRate,
        Temperature = @Temperature,
        Consciousness = @Consciousness,
        OxygenSaturation = @OxygenSaturation,
        OxygenFlow = @OxygenFlow,
        BloodPressure = @BloodPressure,
		BloodPressureDiastolic = @BloodPressureDiastolic,
		ConsciousnessAlert = @ConsciousnessAlert,
		TotalScore = @TotalScore
    WHERE Id = @Id

	-- Check if any rows were affected
    IF @@ROWCOUNT = 0
    BEGIN
        -- Optionally return an error or handle no rows affected
        RAISERROR('No record found with the given Id.', 16, 1);
    END
END


GO
/****** Object:  StoredProcedure [dbo].[UpdateProgressNote]    Script Date: 20/10/2025 5:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateProgressNote]
    @Id INT,
    @LabId INT = NULL,
    @Notes VARCHAR(500) = NULL,
    @Sign VARCHAR(50) = NULL,
    @NotesDate DATETIME = NULL,
    @PatientId INT = NULL,
	@NotesFrom VARCHAR(10) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE ProgressNotes
    SET 
        LabId = @LabId,
        Notes = @Notes,
        Sign = @Sign,
        NotesDate = @NotesDate,
        PatientId = @PatientId,
		NotesFrom = @NotesFrom
    WHERE Id = @Id;

    -- Check if any rows were affected
    IF @@ROWCOUNT = 0
    BEGIN
        -- Optionally return an error or handle no rows affected
        RAISERROR('No record found with the given Id.', 16, 1);
    END
END



GO
/****** Object:  StoredProcedure [dbo].[ValidateLabLogin]    Script Date: 20/10/2025 5:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ValidateLabLogin] 
	@Login VARCHAR(50),
    @Password VARCHAR(255),
    @LabID INT OUTPUT,
	@LabName VARCHAR(50) OUTPUT,
    @ResultMessage VARCHAR(50) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON

	 -- Declare variables to hold results
    DECLARE @Id INT, @IsActive BIT, @LabIdName VARCHAR(50);

	SET @Id = 0
	SET @IsActive = 0
	SET @LabID = 0
	SET @LabName = ''
	SET @ResultMessage = 'Valid'
   

   -- Check if login credentials are correct
    SELECT @Id = Id, @IsActive = Active, @LabIdName = LabName
    FROM [dbo].[Lab]
    WHERE LabLogin = @Login AND LabPassword = @Password;

    -- If the lab login is not valid, return "Invalid login attempt"
	IF (@Id IS NULL OR @Id = 0)
    BEGIN
        SELECT @LabID = @Id, @LabName = '', @ResultMessage = 'Invalid login attempt'
		Return
    END

	-- If no active lab is found, return "Lab Not Active"
	IF (@IsActive = 0)
	BEGIN
		SELECT @LabID = @Id, @LabName = @LabIdName, @ResultMessage = 'Lab Not Active'
		Return
	END

	-- Successful
	SELECT @LabID = @Id, @LabName = @LabIdName, @ResultMessage = @ResultMessage
    
END

GO
/****** Object:  StoredProcedure [dbo].[ValidateSupervisorLogin]    Script Date: 20/10/2025 5:39:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ValidateSupervisorLogin] 
	@UserLogin VARCHAR(50),
    @UserPassword VARCHAR(255),
    @SupervisorId INT OUTPUT,
	@UserName VARCHAR(50) OUTPUT,
	@LabId INT OUTPUT,
	@LabName VARCHAR(50) OUTPUT,
    @ResultMessage NVARCHAR(50) OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON

	-- Declare variables to hold results
    DECLARE @Id INT, @IsActive BIT, @LabIdName VARCHAR(50);

	SET @Id = 0
	SET @IsActive = 0
	SET @LabID = 0
	SET @LabName = ''

	 -- Check the login credentials against the database
    IF EXISTS (SELECT 1 FROM Supervisor WHERE UserLogin = @UserLogin AND UserPassword = @UserPassword)
    BEGIN

		SELECT @LabId = LabId, @SupervisorId = Id, @UserName = UserName, @LabName = @LabIdName, @ResultMessage = 'Valid' FROM Supervisor WHERE UserLogin = @UserLogin AND UserPassword = @UserPassword

		IF (@LabId IS NULL OR @LabId = 0)
		BEGIN
			SELECT @LabID = 0, @LabName = '', @SupervisorId = 0, @UserName = '', @ResultMessage = 'Supervisor has no lab assigned'
			Return
		END
		ELSE
		BEGIN 
			-- Check for lab
			SELECT @IsActive = Active, @LabIdName = LabName
			FROM [dbo].[Lab]
			WHERE Id = @LabId

			-- If no active lab is found, return "Lab Not Active"
			IF (@IsActive = 0)
			BEGIN
				SELECT @LabID = 0, @LabName = '', @SupervisorId = 0, @UserName = '', @ResultMessage = 'Lab Not Active'
				Return
			END
		END

		SELECT @LabId = @LabId, @SupervisorId = @SupervisorId, @UserName = @UserName, @LabName = @LabIdName, @ResultMessage = 'Valid'
		Return
    END
    ELSE
    BEGIN
		SELECT @LabID = @Id, @LabName = '', @SupervisorId = 0, @UserName = '', @ResultMessage = 'Invalid login attempt'
    END
    
END

GO
