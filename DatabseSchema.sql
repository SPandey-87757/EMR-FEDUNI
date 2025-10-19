USE [EmrSimulator]
GO
/****** Object:  Table [dbo].[IvFluidAdministration]    Script Date: 4/4/2025 2:31:48 AM ******/
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
/****** Object:  Table [dbo].[IvFluidChart]    Script Date: 4/4/2025 2:31:48 AM ******/
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
/****** Object:  Table [dbo].[Lab]    Script Date: 4/4/2025 2:31:48 AM ******/
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
/****** Object:  Table [dbo].[Medication]    Script Date: 4/4/2025 2:31:48 AM ******/
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
/****** Object:  Table [dbo].[MedicationPrnAdministration]    Script Date: 4/4/2025 2:31:48 AM ******/
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
/****** Object:  Table [dbo].[MedicationPrnChart]    Script Date: 4/4/2025 2:31:48 AM ******/
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
/****** Object:  Table [dbo].[MedicationRegularAdministration]    Script Date: 4/4/2025 2:31:48 AM ******/
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
/****** Object:  Table [dbo].[MedicationRegularChart]    Script Date: 4/4/2025 2:31:48 AM ******/
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
/****** Object:  Table [dbo].[Patient]    Script Date: 4/4/2025 2:31:48 AM ******/
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
/****** Object:  Table [dbo].[PatientAdds]    Script Date: 4/4/2025 2:31:48 AM ******/
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
/****** Object:  Table [dbo].[ProgressNotes]    Script Date: 4/4/2025 2:31:48 AM ******/
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
/****** Object:  Table [dbo].[Supervisor]    Script Date: 4/4/2025 2:31:48 AM ******/
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
/****** Object:  StoredProcedure [dbo].[ClearLabData]    Script Date: 4/4/2025 2:31:48 AM ******/
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
/****** Object:  StoredProcedure [dbo].[ClearPatientData]    Script Date: 4/4/2025 2:31:48 AM ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteIvFluidAdministration]    Script Date: 4/4/2025 2:31:48 AM ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteIvFluidChart]    Script Date: 4/4/2025 2:31:48 AM ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteMedication]    Script Date: 4/4/2025 2:31:48 AM ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteMedicationPrnAdministration]    Script Date: 4/4/2025 2:31:48 AM ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteMedicationPrnChart]    Script Date: 4/4/2025 2:31:48 AM ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteMedicationRegularAdministration]    Script Date: 4/4/2025 2:31:48 AM ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteMedicationRegularChart]    Script Date: 4/4/2025 2:31:48 AM ******/
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
/****** Object:  StoredProcedure [dbo].[DeletePatient]    Script Date: 4/4/2025 2:31:48 AM ******/
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
/****** Object:  StoredProcedure [dbo].[DeletePatientAdds]    Script Date: 4/4/2025 2:31:48 AM ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteProgressNote]    Script Date: 4/4/2025 2:31:48 AM ******/
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
/****** Object:  StoredProcedure [dbo].[GetIvFluidAdministration]    Script Date: 4/4/2025 2:31:48 AM ******/
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
/****** Object:  StoredProcedure [dbo].[GetIvFluidChart]    Script Date: 4/4/2025 2:31:48 AM ******/
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
GO
/****** Object:  StoredProcedure [dbo].[GetLab]    Script Date: 4/4/2025 2:31:48 AM ******/
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
/****** Object:  StoredProcedure [dbo].[GetMedication]    Script Date: 4/4/2025 2:31:48 AM ******/
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
/****** Object:  StoredProcedure [dbo].[GetMedicationPrnAdministration]    Script Date: 4/4/2025 2:31:48 AM ******/
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
/****** Object:  StoredProcedure [dbo].[GetMedicationPrnChart]    Script Date: 4/4/2025 2:31:48 AM ******/
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
/****** Object:  StoredProcedure [dbo].[GetMedicationRegularAdministration]    Script Date: 4/4/2025 2:31:48 AM ******/
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
/****** Object:  StoredProcedure [dbo].[GetMedicationRegularChart]    Script Date: 4/4/2025 2:31:48 AM ******/
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
/****** Object:  StoredProcedure [dbo].[GetPatient]    Script Date: 4/4/2025 2:31:48 AM ******/
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
/****** Object:  StoredProcedure [dbo].[GetPatientAdds]    Script Date: 4/4/2025 2:31:48 AM ******/
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
/****** Object:  StoredProcedure [dbo].[GetProgressNotes]    Script Date: 4/4/2025 2:31:48 AM ******/
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
/****** Object:  StoredProcedure [dbo].[InsertIvFluidAdministration]    Script Date: 4/4/2025 2:31:48 AM ******/
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
/****** Object:  StoredProcedure [dbo].[InsertIvFluidChart]    Script Date: 4/4/2025 2:31:48 AM ******/
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
/****** Object:  StoredProcedure [dbo].[InsertMedication]    Script Date: 4/4/2025 2:31:48 AM ******/
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
/****** Object:  StoredProcedure [dbo].[InsertMedicationPrnAdministration]    Script Date: 4/4/2025 2:31:48 AM ******/
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
/****** Object:  StoredProcedure [dbo].[InsertMedicationPrnChart]    Script Date: 4/4/2025 2:31:48 AM ******/
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
/****** Object:  StoredProcedure [dbo].[InsertMedicationRegularAdministration]    Script Date: 4/4/2025 2:31:48 AM ******/
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
/****** Object:  StoredProcedure [dbo].[InsertMedicationRegularChart]    Script Date: 4/4/2025 2:31:48 AM ******/
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
/****** Object:  StoredProcedure [dbo].[InsertPatient]    Script Date: 4/4/2025 2:31:48 AM ******/
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
/****** Object:  StoredProcedure [dbo].[InsertPatientAdds]    Script Date: 4/4/2025 2:31:48 AM ******/
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
/****** Object:  StoredProcedure [dbo].[InsertProgressNote]    Script Date: 4/4/2025 2:31:48 AM ******/
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
/****** Object:  StoredProcedure [dbo].[UpdatePatient]    Script Date: 4/4/2025 2:31:48 AM ******/
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
/****** Object:  StoredProcedure [dbo].[UpdatePatientAdds]    Script Date: 4/4/2025 2:31:48 AM ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateProgressNote]    Script Date: 4/4/2025 2:31:48 AM ******/
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
/****** Object:  StoredProcedure [dbo].[ValidateLabLogin]    Script Date: 4/4/2025 2:31:48 AM ******/
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
/****** Object:  StoredProcedure [dbo].[ValidateSupervisorLogin]    Script Date: 4/4/2025 2:31:48 AM ******/
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
