﻿using EMRSimulation.Application.Services;
using EMRSimulation.Domain.Dtos;

namespace EMRSimulation.Application.Services
{
    public interface IPatientService
    {
        Task<PatientDto> GetPatientById(int Id, int labId);
        Task<IEnumerable<PatientDto>> GetAllPatientsAsync(int labId);
        Task<int> AddPatientAsync(PatientDto addsDto);
        Task<IEnumerable<AddsDto>> GetPatientAdds(int labId, int patientId);
        Task<int> AddPatientAddsAsync(AddsDto addsDto);

        Task<int> AddMedicationPrnChartAsync(MedicationPrnChartDto addsDto);
        Task<int> AddPatientMedicationPrnAdministrationAsync(MedicationAdministrationPrnDto addsDto);
        Task<IEnumerable<MedicationPrnChartDto>> GetMedicationPrnChartAsync(int labId, int patientId);
        Task<IEnumerable<MedicationAdministrationPrnDto>> GetPatientMedicationPrnAdministrationAsync(int labId, int patientId, int patientMedicationChartId);

        Task<int> DeletePatientAsync(int labId, int Id);
        Task<int> DeletePatientAddsAsync(int Id);
        Task<(int id, string resultMessage)> DeleteMedicationPrnChartAsync(int Id);
        Task<int> DeleteMedicationPrnAdministrationAsync(int Id);

        Task<int> AddMedicationRegularChartAsync(MedicationRegularChartDto addsDto);
        Task<int> AddPatientMedicationRegularAdministrationAsync(MedicationAdministrationRegularDto addsDto);
        Task<IEnumerable<MedicationRegularChartDto>> GetMedicationRegularChartAsync(int labId, int patientId);
        Task<IEnumerable<MedicationAdministrationRegularDto>> GetPatientMedicationRegularAdministrationAsync(int labId, int patientId, int patientMedicationChartId);
        Task<(int id, string resultMessage)> DeleteMedicationRegularChartAsync(int Id);
        Task<int> DeleteMedicationRegularAdministrationAsync(int Id);

        Task<IvFluidChartDto> GetIvFluidChartByIdAsync(int Id, int labId);
        Task<IEnumerable<IvFluidChartDto>> GetIvFluidChartAsync(int labId, int patientId);
        Task<IEnumerable<IvFluidAdministrationDto>> GetIvFluidAdministrationAsync(int labId, int patientId, int ivFluidChartId);
        Task<int> AddPatientIvFluidAdministrationAsync(IvFluidAdministrationDto addsDto);
        Task<(int id, string resultMessage)> DeleteIvFluidChartAsync(int Id);
        Task<int> DeleteIvFluidAdministrationAsync(int Id);
        Task<int> AddIvFluidChartsync(IvFluidChartDto addsDto);
        Task<IEnumerable<MedicationDto>> GetMedicationAsync(int labId);
        Task<int> AddMedicationAsync(MedicationDto addsDto);

        Task<int> AddProgressNotesAsync(ProgressNotesDto addsDto);
        Task<IEnumerable<ProgressNotesDto>> GetProgressNotesAsync(int labId, int patientId);
        Task<int> DeleteProgressNotesAsync(int Id);

        Task<MedicationPrnChartDto> GetMedicationPrnChartByIdAsync(int Id, int labId);
        Task<MedicationRegularChartDto> GetMedicationRegularChartByIdAsync(int Id, int labId);
        Task<IEnumerable<ClearDataDto>> ClearPatientDataAsync(int labId, int patientId);
        Task<IEnumerable<ClearDataDto>> ClearLabDataAsync(int labId);
        Task<(int id, string resultMessage)> DeleteMedicationAsync(int Id);
        Task<int> AddRiskmanIncidentAsync(RiskmanDto dto);
        Task<IEnumerable<RiskmanDto>> GetRiskmanIncidentsAsync(int labId, int? patientId);
        Task<int> DeleteRiskmanIncidentAsync(int id);
        Task<RiskmanDto?> GetRiskmanIncidentByIdAsync(int labId, int id);
        Task<int> AddBradenAssessmentAsync(BradenDto dto);
        Task<int> AddBradenAssessmentFollowUpAsync(BradenDto dto); // ← NEW

        Task<IEnumerable<BradenDto>> GetBradenAssessmentsAsync(int labId, int? patientId);
        Task<BradenDto?> GetBradenAssessmentByIdAsync(int labId, int id); // for later view
        Task<int> DeleteBradenAssessmentAsync(int id);

        // IPatientService
        Task<int> AddFoodIntakeAsync(FoodIntakeDto dto);

        Task<IEnumerable<FoodIntakeListDto>> GetFoodIntakeListAsync(int labId, int? patientId);
        Task<FoodIntakeDto?> GetFoodIntakeByIdAsync(int labId, int id);
        Task<int> DeleteFoodIntakeAsync(int id);
        Task<int> UpdateFoodIntakeAsync(FoodIntakeDto dto);

        //Fluid balance chart
        Task<FluidBalanceChartDto> GetFluidBalanceChartByIdAsync(int Id, int labId);
        Task<IEnumerable<FluidBalanceChartDto>> GetFluidBalanceChartAsync(int labId, int patientId);
        Task<IEnumerable<FluidBalanceAdministrationDto>> GetFluidBalanceAdministrationAsync(int labId, int patientId, int fluidBalanceChartId);
        Task<int> AddPatientFluidBalanceAdministrationAsync(FluidBalanceAdministrationDto addsDto);
        Task<(int id, string resultMessage)> DeleteFluidBalanceChartAsync(int Id);
        Task<int> DeleteFluidBalanceAdministrationAsync(int Id);
        Task<int> AddFluidBalanceChartsync(FluidBalanceChartDto addsDto);

        
        //Neurological chart
        Task<NeurologicalChartDto> GetNeurologicalChartByIdAsync(int Id, int labId);
        Task<IEnumerable<NeurologicalChartDto>> GetNeurologicalChartAsync(int labId, int patientId);
        Task<IEnumerable<NeurologicalAdministrationDto>> GetNeurologicalAdministrationAsync(int labId, int patientId, int neurologicalChartId);
        Task<int> AddPatientNeurologicalAdministrationAsync(NeurologicalAdministrationDto addsDto);
        Task<(int id, string resultMessage)> DeleteNeurologicalChartAsync(int Id);
        Task<int> DeleteNeurologicalAdministrationAsync(int Id);
        Task<int> AddNeurologicalChartsync(NeurologicalChartDto addsDto);


    }
}
