using EMRSimulation.Application.Interfaces;
using EMRSimulation.Domain.Dtos;
using System.Reflection.Emit;

namespace EMRSimulation.Application.Services
{
    public class PatientService : IPatientService
    {
        private readonly IPatientRepository _patientRepository;

        public PatientService(IPatientRepository patientRepository)
        {
            _patientRepository = patientRepository;
        }

        public async Task<int> AddPatientAddsAsync(AddsDto addsDto)
        {
            // Assuming the repository method is asynchronous
            return await _patientRepository.AddPatientAddsAsync(addsDto);
        }

        public async Task<IEnumerable<PatientDto>> GetAllPatientsAsync(int labId)
        {
            return await _patientRepository.GetAllPatientsAsync(labId);
        }

        public async Task<IEnumerable<AddsDto>> GetPatientAdds(int labId, int patientId)
        {
            return await _patientRepository.GetPatientAdds(labId, patientId);
        }

        public async Task<PatientDto> GetPatientById(int Id, int labId)
        {
            return await _patientRepository.GetPatientById(Id, labId);
        }

        public async Task<int> AddPatientMedicationPrnAdministrationAsync(MedicationAdministrationPrnDto addsDto)
        {
            return await _patientRepository.AddPatientMedicationPrnAdministrationAsync(addsDto);
        }

        public async Task<IEnumerable<MedicationAdministrationPrnDto>> GetPatientMedicationPrnAdministrationAsync(int labId, int patientId, int patientMedicationChartId)
        {
            return await _patientRepository.GetPatientMedicationPrnAdministrationAsync(labId, patientId, patientMedicationChartId);
        }

        public async Task<IEnumerable<MedicationPrnChartDto>> GetMedicationPrnChartAsync(int labId, int patientId)
        {
            return await _patientRepository.GetMedicationPrnChartAsync(labId, patientId);
        }

        public async Task<IEnumerable<IvFluidChartDto>> GetIvFluidChartAsync(int labId, int patientId)
        {
            return await _patientRepository.GetIvFluidChartAsync(labId, patientId);
        }

        public async Task<IEnumerable<IvFluidAdministrationDto>> GetIvFluidAdministrationAsync(int labId, int patientId, int ivFluidChartId)
        {
            return await _patientRepository.GetIvFluidAdministrationAsync(labId, patientId, ivFluidChartId);
        }

        public async Task<int> AddPatientIvFluidAdministrationAsync(IvFluidAdministrationDto addsDto)
        {
            return await _patientRepository.AddPatientIvFluidAdministrationAsync(addsDto);
        }

        //neuro and Fluid chart
        public async Task<IEnumerable<FluidBalanceChartDto>> GetFluidBalanceChartAsync(int labId, int patientId)
        {
            return await _patientRepository.GetFluidBalanceChartAsync(labId, patientId);
        }

        public async Task<IEnumerable<FluidBalanceAdministrationDto>> GetFluidBalanceAdministrationAsync(int labId, int patientId, int fluidBalanceChartId)
        {
            return await _patientRepository.GetFluidBalanceAdministrationAsync(labId, patientId, fluidBalanceChartId);
        }

        public async Task<int> AddPatientFluidBalanceAdministrationAsync(FluidBalanceAdministrationDto addsDto)
        {
            return await _patientRepository.AddPatientFluidBalanceAdministrationAsync(addsDto);
        }

        public async Task<IEnumerable<NeurologicalChartDto>> GetNeurologicalChartAsync(int labId, int patientId)
        {
            return await _patientRepository.GetNeurologicalChartAsync(labId, patientId);
        }

        public async Task<IEnumerable<NeurologicalAdministrationDto>> GetNeurologicalAdministrationAsync(int labId, int patientId, int neurologicalChartId)
        {
            return await _patientRepository.GetNeurologicalAdministrationAsync(labId, patientId, neurologicalChartId);
        }

        public async Task<int> AddPatientNeurologicalAdministrationAsync(NeurologicalAdministrationDto addsDto)
        {
            return await _patientRepository.AddPatientNeurologicalAdministrationAsync(addsDto);
        }

        public async Task<int> DeletePatientAddsAsync(int Id)
        {
            return await _patientRepository.DeletePatientAddsAsync(Id);
        }

        public async Task<(int id, string resultMessage)> DeleteIvFluidChartAsync(int Id)
        {
            return await _patientRepository.DeleteIvFluidChartAsync(Id);
        }

        public async Task<int> DeleteIvFluidAdministrationAsync(int Id)
        {
            return await _patientRepository.DeleteIvFluidAdministrationAsync(Id);
        }

        //neuro and fluid
        public async Task<(int id, string resultMessage)> DeleteFluidBalanceChartAsync(int Id)
        {
        return await _patientRepository.DeleteFluidBalanceChartAsync(Id);
        }

        public async Task<int> DeleteFluidBalanceAdministrationAsync(int Id)
        {
        return await _patientRepository.DeleteFluidBalanceAdministrationAsync(Id);
        }

        public async Task<(int id, string resultMessage)> DeleteNeurologicalChartAsync(int Id)
        {
        return await _patientRepository.DeleteNeurologicalChartAsync(Id);
        }

        public async Task<int> DeleteNeurologicalAdministrationAsync(int Id)
        {
        return await _patientRepository.DeleteNeurologicalAdministrationAsync(Id);
        }
        public async Task<(int id, string resultMessage)> DeleteMedicationPrnChartAsync(int Id)
        {
        return await _patientRepository.DeleteMedicationPrnChartAsync(Id);
        }

        public async Task<int> DeleteMedicationPrnAdministrationAsync(int Id)
        {
            return await _patientRepository.DeleteMedicationPrnAdministrationAsync(Id);
        }

        public async Task<int> AddIvFluidChartsync(IvFluidChartDto addsDto)
        {
            return await _patientRepository.AddIvFluidChartsync(addsDto);
        }
//neuro
        public async Task<FluidBalanceChartDto> GetFluidBalanceChartByIdAsync(int Id, int labId)
        {
            return await _patientRepository.GetFluidBalanceChartByIdAsync(Id, labId);
        }

        public async Task<NeurologicalChartDto> GetNeurologicalChartByIdAsync(int Id, int labId)
        {
            return await _patientRepository.GetNeurologicalChartByIdAsync(Id, labId);
        }
        
        public async Task<int> AddMedicationPrnChartAsync(MedicationPrnChartDto addsDto)
        {
            return await _patientRepository.AddMedicationPrnChartAsync(addsDto);
        }

        public async Task<IEnumerable<MedicationDto>> GetMedicationAsync(int labId)
        {
            return await _patientRepository.GetMedicationAsync(labId);
        }

        public async Task<int> AddMedicationAsync(MedicationDto addsDto)
        {
            return await _patientRepository.AddMedicationAsync(addsDto);
        }

        public async Task<int> AddMedicationRegularChartAsync(MedicationRegularChartDto addsDto)
        {
            return await _patientRepository.AddMedicationRegularChartAsync(addsDto);
        }

        public async Task<int> AddPatientMedicationRegularAdministrationAsync(MedicationAdministrationRegularDto addsDto)
        {
            return await _patientRepository.AddPatientMedicationRegularAdministrationAsync(addsDto);
        }

        public async Task<IEnumerable<MedicationRegularChartDto>> GetMedicationRegularChartAsync(int labId, int patientId)
        {
            return await _patientRepository.GetMedicationRegularChartAsync(labId, patientId);
        }

        public async Task<IEnumerable<MedicationAdministrationRegularDto>> GetPatientMedicationRegularAdministrationAsync(int labId, int patientId, int patientMedicationChartId)
        {
            return await _patientRepository.GetPatientMedicationRegularAdministrationAsync(labId, patientId, patientMedicationChartId);
        }

        public async Task<(int id, string resultMessage)> DeleteMedicationRegularChartAsync(int Id)
        {
            return await _patientRepository.DeleteMedicationRegularChartAsync(Id);
        }

        public async Task<int> DeleteMedicationRegularAdministrationAsync(int Id)
        {
            return await _patientRepository.DeleteMedicationRegularAdministrationAsync(Id);
        }

        public async Task<int> AddProgressNotesAsync(ProgressNotesDto addsDto)
        {
            return await _patientRepository.AddProgressNotesAsync(addsDto);
        }

        public async Task<int> DeleteProgressNotesAsync(int Id)
        {
            return await _patientRepository.DeleteProgressNotesAsync(Id);
        }

        public async Task<IEnumerable<ProgressNotesDto>> GetProgressNotesAsync(int labId, int patientId)
        {
            return await _patientRepository.GetProgressNotesAsync(labId, patientId);
        }

        public async Task<IvFluidChartDto> GetIvFluidChartByIdAsync(int Id, int labId)
        {
            return await _patientRepository.GetIvFluidChartByIdAsync(Id, labId);
        }
        //update neruo
        public async Task<int> AddFluidBalanceChartsync(FluidBalanceChartDto addsDto)
        {
            return await _patientRepository.AddFluidBalanceChartsync(addsDto);
        }

        public async Task<int> AddNeurologicalChartsync(NeurologicalChartDto addsDto)
        {
            return await _patientRepository.AddNeurologicalChartsync(addsDto);
        }

        public async Task<MedicationPrnChartDto> GetMedicationPrnChartByIdAsync(int Id, int labId)
        {
            return await _patientRepository.GetMedicationPrnChartByIdAsync(Id, labId);
        }

        public async Task<MedicationRegularChartDto> GetMedicationRegularChartByIdAsync(int Id, int labId)
        {
            return await _patientRepository.GetMedicationRegularChartByIdAsync(Id, labId);
        }

        public async Task<int> AddPatientAsync(PatientDto addsDto)
        {
            return await _patientRepository.AddPatientAsync(addsDto);
        }

        public async Task<IEnumerable<ClearDataDto>> ClearPatientDataAsync(int labId, int patientId)
        {
            return await _patientRepository.ClearPatientDataAsync(labId, patientId);
        }

        public async Task<IEnumerable<ClearDataDto>> ClearLabDataAsync(int labId)
        {
            return await _patientRepository.ClearLabDataAsync(labId);
        }

        public async Task<int> DeletePatientAsync(int labId, int Id)
        {
            return await _patientRepository.DeletePatientAsync(labId, Id);
        }

        public async Task<(int id, string resultMessage)> DeleteMedicationAsync(int Id)
        {
            return await _patientRepository.DeleteMedicationAsync(Id);
        }
        public async Task<int> AddRiskmanIncidentAsync(RiskmanDto dto)
        {
            return await _patientRepository.AddRiskmanIncidentAsync(dto);
        }

        public async Task<IEnumerable<RiskmanDto>> GetRiskmanIncidentsAsync(int labId, int? patientId)
{
    return await _patientRepository.GetRiskmanIncidentsAsync(labId, patientId);
 }
        public async Task<int> DeleteRiskmanIncidentAsync(int id)
        {
            // TODO: Delete from database
            return await _patientRepository.DeleteRiskmanIncidentAsync(id);
        }
        public async Task<RiskmanDto?> GetRiskmanIncidentByIdAsync(int labId, int id)
        {
            return await _patientRepository.GetRiskmanIncidentByIdAsync(labId, id);
        }

        public async Task<int> AddBradenAssessmentAsync(BradenDto dto)
        {
            return await _patientRepository.AddBradenAssessmentAsync(dto);
        }
        public async Task<int> AddBradenAssessmentFollowUpAsync(BradenDto dto)
        {
            return await _patientRepository.AddBradenAssessmentFollowUpAsync(dto);
        }

        public async Task<IEnumerable<BradenDto>> GetBradenAssessmentsAsync(int labId, int? patientId)
        {
            return await _patientRepository.GetBradenAssessmentsAsync(labId, patientId);
        }

        public async Task<BradenDto?> GetBradenAssessmentByIdAsync(int labId, int id)
        {
            return await _patientRepository.GetBradenAssessmentByIdAsync(labId, id);
        }

        public async Task<int> DeleteBradenAssessmentAsync(int id)
        {
            return await _patientRepository.DeleteBradenAssessmentAsync(id);
        }

        public async Task<int> AddFoodIntakeAsync(FoodIntakeDto dto)
        {
            return await _patientRepository.AddFoodIntakeAsync(dto);
        }
        public async Task<IEnumerable<FoodIntakeListDto>> GetFoodIntakeListAsync(int labId, int? patientId)
        {
            return await _patientRepository.GetFoodIntakeHeadersAsync(labId, patientId);
        }

        public async Task<FoodIntakeDto?> GetFoodIntakeByIdAsync(int labId, int id)
        {
            return await _patientRepository.GetFoodIntakeByIdAsync(labId, id);
        }

        public async Task<int> DeleteFoodIntakeAsync(int id)
        {
            return await _patientRepository.DeleteFoodIntakeAsync(id);
        }

        public Task<int> UpdateFoodIntakeAsync(FoodIntakeDto dto)
    => _patientRepository.UpdateFoodIntakeAsync(dto);

    }
}


