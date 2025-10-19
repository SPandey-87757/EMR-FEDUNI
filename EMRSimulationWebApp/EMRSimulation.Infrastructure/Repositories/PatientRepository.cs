﻿using EMRSimulation.Application.Interfaces;
using EMRSimulation.Domain.Dtos;
using EMRSimulation.Infrastructure.Connection;
using EMRSimulation.Infrastructure.Repositories;
using Microsoft.VisualBasic;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Reflection.Emit;
using System.Text;
using System.Text.Json;
using System.Text.Json.Serialization;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace EMRSimulation.Infrastructure.Repositories
{
    public class PatientRepository : IPatientRepository
    {
        private readonly IDbConnectionFactory _dbConnectionFactory;

        public PatientRepository(IDbConnectionFactory dbConnectionFactory)
        {
            _dbConnectionFactory = dbConnectionFactory;
        }

        public async Task<PatientDto> GetPatientById(int Id, int labId)
        {
            var patient = new PatientDto();

            // Create and open the database connection using the connection factory
            using (var connection = await _dbConnectionFactory.CreateAsync())
            {
                // Ensure we're working with SqlCommand for asynchronous operations
                using (var command = (SqlCommand)connection.CreateCommand())
                {
                    command.CommandText = "GetPatient"; // Assuming stored procedure name is GetPatients
                    command.CommandType = CommandType.StoredProcedure;

                    // Add parameters to the command
                    command.Parameters.Add(new SqlParameter("@Id", Id));
                    command.Parameters.Add(new SqlParameter("@LabId", labId));

                    // Execute the stored procedure and read the results asynchronously
                    using (var reader = await command.ExecuteReaderAsync())
                    {
                        while (await reader.ReadAsync())
                        {

                            patient.Id = reader.GetInt32(reader.GetOrdinal("Id"));
                            patient.LabId = reader.GetInt32(reader.GetOrdinal("LabId"));
                            patient.FirstName = reader.IsDBNull(reader.GetOrdinal("FirstName")) ? null : reader.GetString(reader.GetOrdinal("FirstName"));
                            patient.LastName = reader.IsDBNull(reader.GetOrdinal("LastName")) ? null : reader.GetString(reader.GetOrdinal("LastName"));
                            patient.DateOfBirth = reader.GetDateTime(reader.GetOrdinal("DateOfBirth"));
                            patient.Gender = reader.IsDBNull(reader.GetOrdinal("Gender")) ? null : reader.GetString(reader.GetOrdinal("Gender"));
                            patient.Address = reader.IsDBNull(reader.GetOrdinal("Address")) ? null : reader.GetString(reader.GetOrdinal("Address"));
                            patient.AdmitDate = reader.GetDateTime(reader.GetOrdinal("AdmitDate"));
                            patient.Weight = reader.IsDBNull(reader.GetOrdinal("Weight")) ? null : reader.GetString(reader.GetOrdinal("Weight"));
                            patient.Height = reader.IsDBNull(reader.GetOrdinal("Height")) ? null : reader.GetString(reader.GetOrdinal("Height"));
                            patient.Age = reader.IsDBNull(reader.GetOrdinal("Age")) ? null : reader.GetString(reader.GetOrdinal("Age"));
                            patient.Allergy = reader.IsDBNull(reader.GetOrdinal("Allergy")) ? null : reader.GetString(reader.GetOrdinal("Allergy"));
                            patient.Intolerance = reader.IsDBNull(reader.GetOrdinal("Intolerance")) ? null : reader.GetString(reader.GetOrdinal("Intolerance"));
                            patient.Alerts = reader.IsDBNull(reader.GetOrdinal("Alerts")) ? null : reader.GetString(reader.GetOrdinal("Alerts"));
                            patient.UriNumber = reader.IsDBNull(reader.GetOrdinal("UriNumber")) ? null : reader.GetString(reader.GetOrdinal("UriNumber"));
                            patient.Alert = reader.IsDBNull(reader.GetOrdinal("Alert")) ? null : reader.GetInt32(reader.GetOrdinal("Alert"));
                        }
                    }
                }
            }

            return patient;
        }
        public async Task<IEnumerable<PatientDto>> GetAllPatientsAsync(int labId)
        {
            var patients = new List<PatientDto>();

            // Create and open the database connection using the connection factory
            using (var connection = await _dbConnectionFactory.CreateAsync())
            {
                // Ensure we're working with SqlCommand for asynchronous operations
                using (var command = (SqlCommand)connection.CreateCommand())
                {
                    command.CommandText = "GetPatient"; // Assuming stored procedure name is GetPatients
                    command.CommandType = CommandType.StoredProcedure;

                    // Add parameters to the command
                    command.Parameters.Add(new SqlParameter("@LabId", labId));

                    // Execute the stored procedure and read the results asynchronously
                    using (var reader = await command.ExecuteReaderAsync())
                    {
                        while (await reader.ReadAsync())
                        {
                            var patient = new PatientDto
                            {
                                Id = reader.GetInt32(reader.GetOrdinal("Id")),
                                LabId = reader.GetInt32(reader.GetOrdinal("LabId")),
                                FirstName = reader.IsDBNull(reader.GetOrdinal("FirstName")) ? null : reader.GetString(reader.GetOrdinal("FirstName")),
                                LastName = reader.IsDBNull(reader.GetOrdinal("LastName")) ? null : reader.GetString(reader.GetOrdinal("LastName")),
                                DateOfBirth = reader.GetDateTime(reader.GetOrdinal("DateOfBirth")),
                                Gender = reader.IsDBNull(reader.GetOrdinal("Gender")) ? null : reader.GetString(reader.GetOrdinal("Gender")),
                                Address = reader.IsDBNull(reader.GetOrdinal("Address")) ? null : reader.GetString(reader.GetOrdinal("Address")),
                                AdmitDate = reader.GetDateTime(reader.GetOrdinal("AdmitDate")),
                                Weight = reader.IsDBNull(reader.GetOrdinal("Weight")) ? null : reader.GetString(reader.GetOrdinal("Weight")),
                                Height = reader.IsDBNull(reader.GetOrdinal("Height")) ? null : reader.GetString(reader.GetOrdinal("Height")),
                                Age = reader.IsDBNull(reader.GetOrdinal("Age")) ? null : reader.GetString(reader.GetOrdinal("Age")),
                                Allergy = reader.IsDBNull(reader.GetOrdinal("Allergy")) ? null : reader.GetString(reader.GetOrdinal("Allergy")),
                                Intolerance = reader.IsDBNull(reader.GetOrdinal("Intolerance")) ? null : reader.GetString(reader.GetOrdinal("Intolerance")),
                                Alerts = reader.IsDBNull(reader.GetOrdinal("Alerts")) ? null : reader.GetString(reader.GetOrdinal("Alerts")),
                                UriNumber = reader.IsDBNull(reader.GetOrdinal("UriNumber")) ? null : reader.GetString(reader.GetOrdinal("UriNumber")),
                                Alert = reader.IsDBNull(reader.GetOrdinal("Alert")) ? null : reader.GetInt32(reader.GetOrdinal("Alert"))
                            };

                            patients.Add(patient);
                        }
                    }
                }
            }

            return patients;
        }

        public async Task<IEnumerable<AddsDto>> GetPatientAdds(int labId, int patientId)
        {
            var patients = new List<AddsDto>();

            // Create and open the database connection using the connection factory
            using (var connection = await _dbConnectionFactory.CreateAsync())
            {
                // Ensure we're working with SqlCommand for asynchronous operations
                using (var command = (SqlCommand)connection.CreateCommand())
                {
                    command.CommandText = "GetPatientAdds"; // Assuming stored procedure name is GetPatients
                    command.CommandType = CommandType.StoredProcedure;

                    // Add parameters to the command
                    command.Parameters.Add(new SqlParameter("@LabId", labId));
                    command.Parameters.Add(new SqlParameter("@PatientId", patientId));

                    // Execute the stored procedure and read the results asynchronously
                    using (var reader = await command.ExecuteReaderAsync())
                    {
                        while (await reader.ReadAsync())
                        {
                            var patient = new AddsDto
                            {
                                Id = reader.GetInt32(reader.GetOrdinal("Id")),
                                LabId = reader.GetInt32(reader.GetOrdinal("LabId")),
                                PatientId = reader.GetInt32(reader.GetOrdinal("PatientId")),
                                RespiratoryRate = reader.IsDBNull(reader.GetOrdinal("RespiratoryRate")) ? null : reader.GetString(reader.GetOrdinal("RespiratoryRate")),
                                HeartRate = reader.IsDBNull(reader.GetOrdinal("HeartRate")) ? null : reader.GetString(reader.GetOrdinal("HeartRate")),
                                Temperature = reader.IsDBNull(reader.GetOrdinal("Temperature")) ? null : reader.GetString(reader.GetOrdinal("Temperature")),
                                Consciousness = reader.IsDBNull(reader.GetOrdinal("Consciousness")) ? null : reader.GetString(reader.GetOrdinal("Consciousness")),
                                OxygenSaturation = reader.IsDBNull(reader.GetOrdinal("OxygenSaturation")) ? null : reader.GetString(reader.GetOrdinal("OxygenSaturation")),
                                OxygenFlow = reader.IsDBNull(reader.GetOrdinal("OxygenFlow")) ? null : reader.GetString(reader.GetOrdinal("OxygenFlow")),
                                BloodPressure = reader.IsDBNull(reader.GetOrdinal("BloodPressure")) ? null : reader.GetString(reader.GetOrdinal("BloodPressure")),
                                BloodPressureDiastolic = reader.IsDBNull(reader.GetOrdinal("BloodPressureDiastolic")) ? null : reader.GetString(reader.GetOrdinal("BloodPressureDiastolic")),

                                RespiratoryRateValue = reader.IsDBNull(reader.GetOrdinal("RespiratoryRateValue")) ? null : reader.GetInt32(reader.GetOrdinal("RespiratoryRateValue")),
                                OxygenSaturationValue = reader.IsDBNull(reader.GetOrdinal("OxygenSaturationValue")) ? null : reader.GetInt32(reader.GetOrdinal("OxygenSaturationValue")),
                                BloodPressureValue = reader.IsDBNull(reader.GetOrdinal("BloodPressureValue")) ? null : reader.GetInt32(reader.GetOrdinal("BloodPressureValue")),
                                BloodPressureDiastolicValue = reader.IsDBNull(reader.GetOrdinal("BloodPressureDiastolicValue")) ? null : reader.GetInt32(reader.GetOrdinal("BloodPressureDiastolicValue")),
                                HeartRateValue = reader.IsDBNull(reader.GetOrdinal("HeartRateValue")) ? null : reader.GetInt32(reader.GetOrdinal("HeartRateValue")),
                                TemperatureValue = reader.IsDBNull(reader.GetOrdinal("TemperatureValue")) ? null : reader.GetInt32(reader.GetOrdinal("TemperatureValue")),
                                RespiratoryAlert = reader.IsDBNull(reader.GetOrdinal("RespiratoryAlert")) ? null : reader.GetInt32(reader.GetOrdinal("RespiratoryAlert")),
                                OxygenSaturationAlert = reader.IsDBNull(reader.GetOrdinal("OxygenSaturationAlert")) ? null : reader.GetInt32(reader.GetOrdinal("OxygenSaturationAlert")),
                                BloodPressureAlert = reader.IsDBNull(reader.GetOrdinal("BloodPressureAlert")) ? null : reader.GetInt32(reader.GetOrdinal("BloodPressureAlert")),
                                HeartRateAlert = reader.IsDBNull(reader.GetOrdinal("HeartRateAlert")) ? null : reader.GetInt32(reader.GetOrdinal("HeartRateAlert")),
                                ConsciousnessAlert = reader.IsDBNull(reader.GetOrdinal("ConsciousnessAlert")) ? null : reader.GetInt32(reader.GetOrdinal("ConsciousnessAlert")),
                                TotalScore = reader.IsDBNull(reader.GetOrdinal("TotalScore")) ? null : reader.GetInt32(reader.GetOrdinal("TotalScore"))
                            };

                            patients.Add(patient);
                        }
                    }
                }
            }

            return patients;
        }

        public async Task<int> AddPatientAddsAsync(AddsDto addsDto)
        {
            if (addsDto.Id > 0)
            {
                await UpdatePatientAddsAsync(addsDto);
                return addsDto.Id;
            }
            else
            {
                int newId = await InsertPatientAddsAsync(addsDto);
                return newId;
            }
        }

        public async Task<int> InsertPatientAddsAsync(AddsDto addsDto)
        {
            using (var connection = await _dbConnectionFactory.CreateAsync())
            {
                using (var command = (SqlCommand)connection.CreateCommand())
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "InsertPatientAdds"; // Stored procedure name

                    // Add parameters to the command
                    command.Parameters.Add(new SqlParameter("@LabId", addsDto.LabId));
                    command.Parameters.Add(new SqlParameter("@PatientId", addsDto.PatientId));
                    command.Parameters.Add(new SqlParameter("@RespiratoryRate", addsDto.RespiratoryRate ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@HeartRate", addsDto.HeartRate ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@Temperature", addsDto.Temperature ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@Consciousness", addsDto.Consciousness ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@OxygenSaturation", addsDto.OxygenSaturation ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@OxygenFlow", addsDto.OxygenFlow ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@BloodPressure", addsDto.BloodPressure ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@BloodPressureDiastolic", addsDto.BloodPressureDiastolic ?? (object)DBNull.Value));

                    command.Parameters.Add(new SqlParameter("@RespiratoryRateValue", addsDto.RespiratoryRateValue ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@OxygenSaturationValue", addsDto.OxygenSaturationValue ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@BloodPressureValue", addsDto.BloodPressureValue ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@BloodPressureDiastolicValue", addsDto.BloodPressureDiastolicValue ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@HeartRateValue", addsDto.HeartRateValue ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@TemperatureValue", addsDto.TemperatureValue ?? (object)DBNull.Value));

                    command.Parameters.Add(new SqlParameter("@RespiratoryAlert", addsDto.RespiratoryAlert ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@OxygenSaturationAlert", addsDto.OxygenSaturationAlert ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@BloodPressureAlert", addsDto.BloodPressureAlert ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@HeartRateAlert", addsDto.HeartRateAlert ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@ConsciousnessAlert", addsDto.ConsciousnessAlert ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@TotalScore", addsDto.TotalScore ?? (object)DBNull.Value));

                    // Execute the command and return the new identity value
                    var newId = await command.ExecuteScalarAsync();
                    return (int)newId;
                }
            }
        }

        public async Task UpdatePatientAddsAsync(AddsDto addsDto)
        {
            using (var connection = await _dbConnectionFactory.CreateAsync())
            {
                using (var command = (SqlCommand)connection.CreateCommand())
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "UpdatePatientAdds"; // Stored procedure name

                    // Add parameters to the command
                    command.Parameters.Add(new SqlParameter("@Id", addsDto.Id));
                    command.Parameters.Add(new SqlParameter("@LabId", addsDto.LabId));
                    command.Parameters.Add(new SqlParameter("@PatientId", addsDto.PatientId));
                    command.Parameters.Add(new SqlParameter("@RespiratoryRate", addsDto.RespiratoryRate ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@HeartRate", addsDto.HeartRate ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@Temperature", addsDto.Temperature ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@Consciousness", addsDto.Consciousness ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@OxygenSaturation", addsDto.OxygenSaturation ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@OxygenFlow", addsDto.OxygenFlow ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@BloodPressure", addsDto.BloodPressure ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@BloodPressureDiastolic", addsDto.BloodPressureDiastolic ?? (object)DBNull.Value));

                    command.Parameters.Add(new SqlParameter("@RespiratoryRateValue", addsDto.RespiratoryRateValue ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@OxygenSaturationValue", addsDto.OxygenSaturationValue ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@BloodPressureValue", addsDto.BloodPressureValue ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@BloodPressureDiastolicValue", addsDto.BloodPressureDiastolicValue ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@HeartRateValue", addsDto.HeartRateValue ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@TemperatureValue", addsDto.TemperatureValue ?? (object)DBNull.Value));

                    command.Parameters.Add(new SqlParameter("@RespiratoryAlert", addsDto.RespiratoryAlert ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@OxygenSaturationAlert", addsDto.OxygenSaturationAlert ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@BloodPressureAlert", addsDto.BloodPressureAlert ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@HeartRateAlert", addsDto.HeartRateAlert ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@ConsciousnessAlert", addsDto.ConsciousnessAlert ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@TotalScore", addsDto.TotalScore ?? (object)DBNull.Value));

                    // Execute the command
                    await command.ExecuteNonQueryAsync();
                }
            }
        }

        public async Task<int> AddIvFluidChartsync(IvFluidChartDto addsDto)
        {
            using (var connection = await _dbConnectionFactory.CreateAsync())
            {
                using (var command = (SqlCommand)connection.CreateCommand())
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "InsertIvFluidChart"; // Stored procedure name

                    // Add parameters to the command
                    command.Parameters.Add(new SqlParameter("@LabId", addsDto.LabId));
                    command.Parameters.Add(new SqlParameter("@PatientId", addsDto.PatientId));
                    command.Parameters.Add(new SqlParameter("@Date", addsDto.Date ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@FlaskVol", addsDto.FlaskVol ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@Strength", addsDto.Strength ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@Rate", addsDto.Rate ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@Dose", addsDto.Dose ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@OfficerSign", addsDto.OfficerSign ?? (object)DBNull.Value));

                    // Execute the command and return the new identity value
                    var newId = await command.ExecuteScalarAsync();
                    return (int)newId;
                }
            }
        }

        public async Task<int> AddMedicationPrnChartAsync(MedicationPrnChartDto addsDto)
        {
            using (var connection = await _dbConnectionFactory.CreateAsync())
            {
                using (var command = (SqlCommand)connection.CreateCommand())
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "InsertMedicationPrnChart"; // Stored procedure name

                    // Add parameters to the command
                    command.Parameters.Add(new SqlParameter("@LabId", addsDto.LabId));
                    command.Parameters.Add(new SqlParameter("@PatientId", addsDto.PatientId));
                    command.Parameters.Add(new SqlParameter("@MedicationId", addsDto.MedicationId));
                    command.Parameters.Add(new SqlParameter("@Dose", addsDto.Dose ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@DoseFrequency", addsDto.DoseFrequency ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@DoseDate", addsDto.DoseDate ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@DoseTime", addsDto.DoseTime ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@Indication", addsDto.Indication ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@Route", addsDto.Route ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@Pharmacy", addsDto.Pharmacy ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@Prescriber", addsDto.Prescriber ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@PrescriberSign", addsDto.PrescriberSign ?? (object)DBNull.Value));

                    // Execute the command and return the new identity value
                    var newId = await command.ExecuteScalarAsync();
                    return (int)newId;
                }
            }
        }

        public async Task<int> AddPatientMedicationPrnAdministrationAsync(MedicationAdministrationPrnDto addsDto)
        {
            using (var connection = await _dbConnectionFactory.CreateAsync())
            {
                using (var command = (SqlCommand)connection.CreateCommand())
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "InsertMedicationPrnAdministration"; // Stored procedure name

                    // Add parameters to the command
                    command.Parameters.Add(new SqlParameter("@LabId", addsDto.LabId));
                    command.Parameters.Add(new SqlParameter("@PatientId", addsDto.PatientId));
                    command.Parameters.Add(new SqlParameter("@PatientMedicationChartId", addsDto.PatientMedicationChartId));
                    command.Parameters.Add(new SqlParameter("@DoseDate", addsDto.DoseDate ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@DoseTime", addsDto.DoseTime ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@Dose", addsDto.Dose ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@Route", addsDto.Route ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@StudentSign", addsDto.StudentSign ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@Reason", addsDto.Reason ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@CoSign", addsDto.CoSign ?? (object)DBNull.Value));

                    // Execute the command and return the new identity value
                    var newId = await command.ExecuteScalarAsync();
                    return (int)newId;
                }
            }
        }

        public async Task<int> AddMedicationAsync(MedicationDto addsDto)
        {
            using (var connection = await _dbConnectionFactory.CreateAsync())
            {
                using (var command = (SqlCommand)connection.CreateCommand())
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "InsertMedication"; // Stored procedure name

                    // Add parameters to the command
                    command.Parameters.Add(new SqlParameter("@LabId", addsDto.LabId));
                    command.Parameters.Add(new SqlParameter("@Name", addsDto.Name));

                    // Execute the command and return the new identity value
                    var newId = await command.ExecuteScalarAsync();
                    return (int)newId;
                }
            }
        }

        public async Task<IEnumerable<MedicationDto>> GetMedicationAsync(int labId)
        {
            var patients = new List<MedicationDto>();

            // Create and open the database connection using the connection factory
            using (var connection = await _dbConnectionFactory.CreateAsync())
            {
                // Ensure we're working with SqlCommand for asynchronous operations
                using (var command = (SqlCommand)connection.CreateCommand())
                {
                    command.CommandText = "GetMedication"; // Assuming stored procedure name is GetPatients
                    command.CommandType = CommandType.StoredProcedure;

                    // Add parameters to the command
                    command.Parameters.Add(new SqlParameter("@LabId", labId));

                    // Execute the stored procedure and read the results asynchronously
                    using (var reader = await command.ExecuteReaderAsync())
                    {
                        while (await reader.ReadAsync())
                        {
                            var patient = new MedicationDto
                            {
                                Id = reader.GetInt32(reader.GetOrdinal("Id")),
                                LabId = reader.GetInt32(reader.GetOrdinal("LabId")),
                                Name = reader.GetString(reader.GetOrdinal("Name"))
                            };

                            patients.Add(patient);
                        }
                    }
                }
            }

            return patients;
        }
        public async Task<IEnumerable<MedicationAdministrationPrnDto>> GetPatientMedicationPrnAdministrationAsync(int labId, int patientId, int patientMedicationChartId)
        {
            var patients = new List<MedicationAdministrationPrnDto>();

            // Create and open the database connection using the connection factory
            using (var connection = await _dbConnectionFactory.CreateAsync())
            {
                // Ensure we're working with SqlCommand for asynchronous operations
                using (var command = (SqlCommand)connection.CreateCommand())
                {
                    command.CommandText = "GetMedicationPrnAdministration"; // Assuming stored procedure name is GetPatients
                    command.CommandType = CommandType.StoredProcedure;

                    // Add parameters to the command
                    command.Parameters.Add(new SqlParameter("@LabId", labId));
                    command.Parameters.Add(new SqlParameter("@PatientId", patientId));
                    command.Parameters.Add(new SqlParameter("@PatientMedicationChartId", patientMedicationChartId));

                    // Execute the stored procedure and read the results asynchronously
                    using (var reader = await command.ExecuteReaderAsync())
                    {
                        while (await reader.ReadAsync())
                        {
                            var patient = new MedicationAdministrationPrnDto
                            {
                                Id = reader.GetInt32(reader.GetOrdinal("Id")),
                                LabId = reader.GetInt32(reader.GetOrdinal("LabId")),
                                PatientId = reader.GetInt32(reader.GetOrdinal("PatientId")),
                                PatientMedicationChartId = reader.GetInt32(reader.GetOrdinal("PatientMedicationChartId")),
                                DoseDate = reader.GetDateTime(reader.GetOrdinal("DoseDate")),
                                DoseTime = reader.IsDBNull(reader.GetOrdinal("DoseTime")) ? null : reader.GetString(reader.GetOrdinal("DoseTime")),
                                Dose = reader.IsDBNull(reader.GetOrdinal("Dose")) ? null : reader.GetString(reader.GetOrdinal("Dose")),
                                Route = reader.IsDBNull(reader.GetOrdinal("Route")) ? null : reader.GetString(reader.GetOrdinal("Route")),
                                StudentSign = reader.IsDBNull(reader.GetOrdinal("StudentSign")) ? null : reader.GetString(reader.GetOrdinal("StudentSign")),
                                Reason = reader.IsDBNull(reader.GetOrdinal("Reason")) ? null : reader.GetString(reader.GetOrdinal("Reason")),
                                CoSign = reader.IsDBNull(reader.GetOrdinal("CoSign")) ? null : reader.GetString(reader.GetOrdinal("CoSign"))
                            };

                            patients.Add(patient);
                        }
                    }
                }
            }

            return patients;
        }

        public async Task<IEnumerable<MedicationPrnChartDto>> GetMedicationPrnChartAsync(int labId, int patientId)
        {
            var patients = new List<MedicationPrnChartDto>();

            // Create and open the database connection using the connection factory
            using (var connection = await _dbConnectionFactory.CreateAsync())
            {
                // Ensure we're working with SqlCommand for asynchronous operations
                using (var command = (SqlCommand)connection.CreateCommand())
                {
                    command.CommandText = "GetMedicationPrnChart"; // Assuming stored procedure name is GetPatients
                    command.CommandType = CommandType.StoredProcedure;

                    // Add parameters to the command
                    command.Parameters.Add(new SqlParameter("@LabId", labId));
                    command.Parameters.Add(new SqlParameter("@PatientId", patientId));

                    // Execute the stored procedure and read the results asynchronously
                    using (var reader = await command.ExecuteReaderAsync())
                    {
                        while (await reader.ReadAsync())
                        {
                            var patient = new MedicationPrnChartDto
                            {
                                Id = reader.GetInt32(reader.GetOrdinal("Id")),
                                LabId = reader.GetInt32(reader.GetOrdinal("LabId")),
                                PatientId = reader.GetInt32(reader.GetOrdinal("PatientId")),
                                MedicationId = reader.GetInt32(reader.GetOrdinal("MedicationId")),
                                MedicationName = reader.GetString(reader.GetOrdinal("MedicationName")),
                                Dose = reader.IsDBNull(reader.GetOrdinal("Dose")) ? null : reader.GetString(reader.GetOrdinal("Dose")),
                                DoseTime = reader.IsDBNull(reader.GetOrdinal("DoseTime")) ? null : reader.GetString(reader.GetOrdinal("DoseTime")),
                                DoseFrequency = reader.IsDBNull(reader.GetOrdinal("DoseFrequency")) ? null : reader.GetString(reader.GetOrdinal("DoseFrequency")),
                                DoseDate = reader.GetDateTime(reader.GetOrdinal("DoseDate")),
                                Indication = reader.IsDBNull(reader.GetOrdinal("Indication")) ? null : reader.GetString(reader.GetOrdinal("Indication")),
                                Route = reader.IsDBNull(reader.GetOrdinal("Route")) ? null : reader.GetString(reader.GetOrdinal("Route")),
                                Pharmacy = reader.IsDBNull(reader.GetOrdinal("Pharmacy")) ? null : reader.GetString(reader.GetOrdinal("Pharmacy")),
                                Prescriber = reader.IsDBNull(reader.GetOrdinal("Prescriber")) ? null : reader.GetString(reader.GetOrdinal("Prescriber")),
                                PrescriberSign = reader.IsDBNull(reader.GetOrdinal("PrescriberSign")) ? null : reader.GetString(reader.GetOrdinal("PrescriberSign"))
                            };

                            patients.Add(patient);
                        }
                    }
                }
            }

            return patients;
        }

        public async Task<IEnumerable<IvFluidChartDto>> GetIvFluidChartAsync(int labId, int patientId)
        {
            var patients = new List<IvFluidChartDto>();

            // Create and open the database connection using the connection factory
            using (var connection = await _dbConnectionFactory.CreateAsync())
            {
                // Ensure we're working with SqlCommand for asynchronous operations
                using (var command = (SqlCommand)connection.CreateCommand())
                {
                    command.CommandText = "GetIvFluidChart"; // Assuming stored procedure name is GetPatients
                    command.CommandType = CommandType.StoredProcedure;

                    // Add parameters to the command
                    command.Parameters.Add(new SqlParameter("@LabId", labId));
                    command.Parameters.Add(new SqlParameter("@PatientId", patientId));

                    // Execute the stored procedure and read the results asynchronously
                    using (var reader = await command.ExecuteReaderAsync())
                    {
                        while (await reader.ReadAsync())
                        {
                            var patient = new IvFluidChartDto
                            {
                                Id = reader.GetInt32(reader.GetOrdinal("Id")),
                                LabId = reader.GetInt32(reader.GetOrdinal("LabId")),
                                PatientId = reader.GetInt32(reader.GetOrdinal("PatientId")),
                                Date = reader.GetDateTime(reader.GetOrdinal("Date")),
                                FlaskVol = reader.IsDBNull(reader.GetOrdinal("FlaskVol")) ? null : reader.GetString(reader.GetOrdinal("FlaskVol")),
                                Strength = reader.IsDBNull(reader.GetOrdinal("Strength")) ? null : reader.GetString(reader.GetOrdinal("Strength")),
                                Rate = reader.IsDBNull(reader.GetOrdinal("Rate")) ? null : reader.GetString(reader.GetOrdinal("Rate")),
                                Dose = reader.IsDBNull(reader.GetOrdinal("Dose")) ? null : reader.GetString(reader.GetOrdinal("Dose")),
                                OfficerSign = reader.IsDBNull(reader.GetOrdinal("OfficerSign")) ? null : reader.GetString(reader.GetOrdinal("OfficerSign"))
                            };

                            patients.Add(patient);
                        }
                    }
                }
            }

            return patients;
        }

        public async Task<int> AddPatientIvFluidAdministrationAsync(IvFluidAdministrationDto addsDto)
        {
            using (var connection = await _dbConnectionFactory.CreateAsync())
            {
                using (var command = (SqlCommand)connection.CreateCommand())
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "InsertIvFluidAdministration"; // Stored procedure name

                    // Add parameters to the command
                    command.Parameters.Add(new SqlParameter("@LabId", addsDto.LabId));
                    command.Parameters.Add(new SqlParameter("@PatientId", addsDto.PatientId));
                    command.Parameters.Add(new SqlParameter("@IvFluidChartId", addsDto.IvFluidChartId));
                    command.Parameters.Add(new SqlParameter("@StartDate", addsDto.StartDate ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@StartTime", addsDto.StartTime ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@EndDate", addsDto.EndDate ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@EndTime", addsDto.EndTime ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@VolGiven", addsDto.VolGiven ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@PharmacistReview", addsDto.PharmacistReview ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@NurseSign", addsDto.NurseSign ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@CoSign", addsDto.CoSign ?? (object)DBNull.Value));

                    // Execute the command and return the new identity value
                    var newId = await command.ExecuteScalarAsync();
                    return (int)newId;
                }
            }
        }

        public async Task<IEnumerable<IvFluidAdministrationDto>> GetIvFluidAdministrationAsync(int labId, int patientId, int ivFluidChartId)
        {
            var patients = new List<IvFluidAdministrationDto>();

            // Create and open the database connection using the connection factory
            using (var connection = await _dbConnectionFactory.CreateAsync())
            {
                // Ensure we're working with SqlCommand for asynchronous operations
                using (var command = (SqlCommand)connection.CreateCommand())
                {
                    command.CommandText = "GetIvFluidAdministration"; // Assuming stored procedure name is GetPatients
                    command.CommandType = CommandType.StoredProcedure;

                    // Add parameters to the command
                    command.Parameters.Add(new SqlParameter("@LabId", labId));
                    command.Parameters.Add(new SqlParameter("@PatientId", patientId));
                    command.Parameters.Add(new SqlParameter("@IvFluidChartId", ivFluidChartId));

                    // Execute the stored procedure and read the results asynchronously
                    using (var reader = await command.ExecuteReaderAsync())
                    {
                        while (await reader.ReadAsync())
                        {
                            var patient = new IvFluidAdministrationDto
                            {
                                Id = reader.GetInt32(reader.GetOrdinal("Id")),
                                LabId = reader.GetInt32(reader.GetOrdinal("LabId")),
                                PatientId = reader.GetInt32(reader.GetOrdinal("PatientId")),
                                IvFluidChartId = reader.GetInt32(reader.GetOrdinal("IvFluidChartId")),
                                StartDate = reader.GetDateTime(reader.GetOrdinal("StartDate")),
                                StartTime = reader.IsDBNull(reader.GetOrdinal("StartTime")) ? null : reader.GetString(reader.GetOrdinal("StartTime")),
                                EndDate = reader.IsDBNull(reader.GetOrdinal("EndDate")) ? null : reader.GetDateTime(reader.GetOrdinal("EndDate")),
                                EndTime = reader.IsDBNull(reader.GetOrdinal("EndTime")) ? null : reader.GetString(reader.GetOrdinal("EndTime")),
                                VolGiven = reader.IsDBNull(reader.GetOrdinal("VolGiven")) ? null : reader.GetString(reader.GetOrdinal("VolGiven")),
                                PharmacistReview = reader.IsDBNull(reader.GetOrdinal("PharmacistReview")) ? null : reader.GetString(reader.GetOrdinal("PharmacistReview")),
                                NurseSign = reader.IsDBNull(reader.GetOrdinal("NurseSign")) ? null : reader.GetString(reader.GetOrdinal("NurseSign")),
                                CoSign = reader.IsDBNull(reader.GetOrdinal("CoSign")) ? null : reader.GetString(reader.GetOrdinal("CoSign"))
                            };

                            patients.Add(patient);
                        }
                    }
                }
            }

            return patients;
        }

        public async Task<(int id, string resultMessage)> DeleteIvFluidChartAsync(int Id)
        {
            int id = 0;
            string resultMessage = "";

            // Create and open the database connection using the connection factory
            using (var connection = await _dbConnectionFactory.CreateAsync())
            {
                // Ensure we're working with SqlCommand for asynchronous operations
                using (var command = (SqlCommand)connection.CreateCommand())
                {
                    command.CommandText = "DeleteIvFluidChart"; // Assuming stored procedure name is GetPatients
                    command.CommandType = CommandType.StoredProcedure;

                    // Add parameters to the command
                    command.Parameters.Add(new SqlParameter("@Id", Id));

                    // Execute the stored procedure and read the results asynchronously
                    using (var reader = await command.ExecuteReaderAsync())
                    {
                        while (await reader.ReadAsync())
                        {
                            id = reader.GetInt32(reader.GetOrdinal("RowsAffected"));
                            resultMessage = reader.GetString(reader.GetOrdinal("ResultMessage"));
                        }
                    }
                }
            }

            return (id, resultMessage);
        }

        public async Task<int> DeleteIvFluidAdministrationAsync(int Id)
        {
            using (var connection = await _dbConnectionFactory.CreateAsync())
            {
                using (var command = (SqlCommand)connection.CreateCommand())
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "DeleteIvFluidAdministration"; // Stored procedure name

                    // Add parameters to the command
                    command.Parameters.Add(new SqlParameter("@Id", Id));

                    // Execute the command and return the new identity value
                    var newId = await command.ExecuteScalarAsync();
                    return (int)newId;
                }
            }
        }

        public async Task<(int id, string resultMessage)> DeleteMedicationPrnChartAsync(int Id)
        {
            int id = 0;
            string resultMessage = "";

            // Create and open the database connection using the connection factory
            using (var connection = await _dbConnectionFactory.CreateAsync())
            {
                // Ensure we're working with SqlCommand for asynchronous operations
                using (var command = (SqlCommand)connection.CreateCommand())
                {
                    command.CommandText = "DeleteMedicationPrnChart"; // Assuming stored procedure name is GetPatients
                    command.CommandType = CommandType.StoredProcedure;

                    // Add parameters to the command
                    command.Parameters.Add(new SqlParameter("@Id", Id));

                    // Execute the stored procedure and read the results asynchronously
                    using (var reader = await command.ExecuteReaderAsync())
                    {
                        while (await reader.ReadAsync())
                        {
                            id = reader.GetInt32(reader.GetOrdinal("RowsAffected"));
                            resultMessage = reader.GetString(reader.GetOrdinal("ResultMessage"));
                        }
                    }
                }
            }

            return (id, resultMessage);
        }

        public async Task<int> DeleteMedicationPrnAdministrationAsync(int Id)
        {
            using (var connection = await _dbConnectionFactory.CreateAsync())
            {
                using (var command = (SqlCommand)connection.CreateCommand())
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "DeleteMedicationPrnAdministration"; // Stored procedure name

                    // Add parameters to the command
                    command.Parameters.Add(new SqlParameter("@Id", Id));

                    // Execute the command and return the new identity value
                    var newId = await command.ExecuteScalarAsync();
                    return (int)newId;
                }
            }
        }

        public async Task<int> AddMedicationRegularChartAsync(MedicationRegularChartDto addsDto)
        {
            using (var connection = await _dbConnectionFactory.CreateAsync())
            {
                using (var command = (SqlCommand)connection.CreateCommand())
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "InsertMedicationRegularChart"; // Stored procedure name

                    // Add parameters to the command
                    command.Parameters.Add(new SqlParameter("@LabId", addsDto.LabId));
                    command.Parameters.Add(new SqlParameter("@PatientId", addsDto.PatientId));
                    command.Parameters.Add(new SqlParameter("@MedicationId", addsDto.MedicationId));
                    command.Parameters.Add(new SqlParameter("@Dose", addsDto.Dose ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@DoseFrequency", addsDto.DoseFrequency ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@DoseDate", addsDto.DoseDate ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@DoseTime", addsDto.DoseTime ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@Indication", addsDto.Indication ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@Route", addsDto.Route ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@Pharmacy", addsDto.Pharmacy ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@Prescriber", addsDto.Prescriber ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@PrescriberSign", addsDto.PrescriberSign ?? (object)DBNull.Value));

                    // Execute the command and return the new identity value
                    var newId = await command.ExecuteScalarAsync();
                    return (int)newId;
                }
            }
        }

        public async Task<int> AddPatientMedicationRegularAdministrationAsync(MedicationAdministrationRegularDto addsDto)
        {
            using (var connection = await _dbConnectionFactory.CreateAsync())
            {
                using (var command = (SqlCommand)connection.CreateCommand())
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "InsertMedicationRegularAdministration"; // Stored procedure name

                    // Add parameters to the command
                    command.Parameters.Add(new SqlParameter("@LabId", addsDto.LabId));
                    command.Parameters.Add(new SqlParameter("@PatientId", addsDto.PatientId));
                    command.Parameters.Add(new SqlParameter("@PatientMedicationChartId", addsDto.PatientMedicationChartId));
                    command.Parameters.Add(new SqlParameter("@DoseDate", addsDto.DoseDate ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@DoseTime", addsDto.DoseTime ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@Dose", addsDto.Dose ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@Route", addsDto.Route ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@StudentSign", addsDto.StudentSign ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@Reason", addsDto.Reason ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@CoSign", addsDto.CoSign ?? (object)DBNull.Value));

                    // Execute the command and return the new identity value
                    var newId = await command.ExecuteScalarAsync();
                    return (int)newId;
                }
            }
        }

        public async Task<IEnumerable<MedicationRegularChartDto>> GetMedicationRegularChartAsync(int labId, int patientId)
        {
            var patients = new List<MedicationRegularChartDto>();

            // Create and open the database connection using the connection factory
            using (var connection = await _dbConnectionFactory.CreateAsync())
            {
                // Ensure we're working with SqlCommand for asynchronous operations
                using (var command = (SqlCommand)connection.CreateCommand())
                {
                    command.CommandText = "GetMedicationRegularChart"; // Assuming stored procedure name is GetPatients
                    command.CommandType = CommandType.StoredProcedure;

                    // Add parameters to the command
                    command.Parameters.Add(new SqlParameter("@LabId", labId));
                    command.Parameters.Add(new SqlParameter("@PatientId", patientId));

                    // Execute the stored procedure and read the results asynchronously
                    using (var reader = await command.ExecuteReaderAsync())
                    {
                        while (await reader.ReadAsync())
                        {
                            var patient = new MedicationRegularChartDto
                            {
                                Id = reader.GetInt32(reader.GetOrdinal("Id")),
                                LabId = reader.GetInt32(reader.GetOrdinal("LabId")),
                                PatientId = reader.GetInt32(reader.GetOrdinal("PatientId")),
                                MedicationId = reader.GetInt32(reader.GetOrdinal("MedicationId")),
                                MedicationName = reader.GetString(reader.GetOrdinal("MedicationName")),
                                Dose = reader.IsDBNull(reader.GetOrdinal("Dose")) ? null : reader.GetString(reader.GetOrdinal("Dose")),
                                DoseTime = reader.IsDBNull(reader.GetOrdinal("DoseTime")) ? null : reader.GetString(reader.GetOrdinal("DoseTime")),
                                DoseFrequency = reader.IsDBNull(reader.GetOrdinal("DoseFrequency")) ? null : reader.GetString(reader.GetOrdinal("DoseFrequency")),
                                DoseDate = reader.GetDateTime(reader.GetOrdinal("DoseDate")),
                                Indication = reader.IsDBNull(reader.GetOrdinal("Indication")) ? null : reader.GetString(reader.GetOrdinal("Indication")),
                                Route = reader.IsDBNull(reader.GetOrdinal("Route")) ? null : reader.GetString(reader.GetOrdinal("Route")),
                                Pharmacy = reader.IsDBNull(reader.GetOrdinal("Pharmacy")) ? null : reader.GetString(reader.GetOrdinal("Pharmacy")),
                                Prescriber = reader.IsDBNull(reader.GetOrdinal("Prescriber")) ? null : reader.GetString(reader.GetOrdinal("Prescriber")),
                                PrescriberSign = reader.IsDBNull(reader.GetOrdinal("PrescriberSign")) ? null : reader.GetString(reader.GetOrdinal("PrescriberSign"))

                            };

                            patients.Add(patient);
                        }
                    }
                }
            }

            return patients;
        }

        public async Task<IEnumerable<MedicationAdministrationRegularDto>> GetPatientMedicationRegularAdministrationAsync(int labId, int patientId, int patientMedicationChartId)
        {
            var patients = new List<MedicationAdministrationRegularDto>();

            // Create and open the database connection using the connection factory
            using (var connection = await _dbConnectionFactory.CreateAsync())
            {
                // Ensure we're working with SqlCommand for asynchronous operations
                using (var command = (SqlCommand)connection.CreateCommand())
                {
                    command.CommandText = "GetMedicationRegularAdministration"; // Assuming stored procedure name is GetPatients
                    command.CommandType = CommandType.StoredProcedure;

                    // Add parameters to the command
                    command.Parameters.Add(new SqlParameter("@LabId", labId));
                    command.Parameters.Add(new SqlParameter("@PatientId", patientId));
                    command.Parameters.Add(new SqlParameter("@PatientMedicationChartId", patientMedicationChartId));

                    // Execute the stored procedure and read the results asynchronously
                    using (var reader = await command.ExecuteReaderAsync())
                    {
                        while (await reader.ReadAsync())
                        {
                            var patient = new MedicationAdministrationRegularDto
                            {
                                Id = reader.GetInt32(reader.GetOrdinal("Id")),
                                LabId = reader.GetInt32(reader.GetOrdinal("LabId")),
                                PatientId = reader.GetInt32(reader.GetOrdinal("PatientId")),
                                PatientMedicationChartId = reader.GetInt32(reader.GetOrdinal("PatientMedicationChartId")),
                                DoseDate = reader.GetDateTime(reader.GetOrdinal("DoseDate")),
                                DoseTime = reader.IsDBNull(reader.GetOrdinal("DoseTime")) ? null : reader.GetString(reader.GetOrdinal("DoseTime")),
                                Route = reader.IsDBNull(reader.GetOrdinal("Route")) ? null : reader.GetString(reader.GetOrdinal("Route")),
                                Dose = reader.IsDBNull(reader.GetOrdinal("Dose")) ? null : reader.GetString(reader.GetOrdinal("Dose")),
                                StudentSign = reader.IsDBNull(reader.GetOrdinal("StudentSign")) ? null : reader.GetString(reader.GetOrdinal("StudentSign")),
                                Reason = reader.IsDBNull(reader.GetOrdinal("Reason")) ? null : reader.GetString(reader.GetOrdinal("Reason")),
                                CoSign = reader.IsDBNull(reader.GetOrdinal("CoSign")) ? null : reader.GetString(reader.GetOrdinal("CoSign"))
                            };

                            patients.Add(patient);
                        }
                    }
                }
            }

            return patients;
        }

        public async Task<int> DeletePatientAddsAsync(int Id)
        {
            using (var connection = await _dbConnectionFactory.CreateAsync())
            {
                using (var command = (SqlCommand)connection.CreateCommand())
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "DeletePatientAdds"; // Stored procedure name

                    // Add parameters to the command
                    command.Parameters.Add(new SqlParameter("@Id", Id));

                    // Execute the command and return the new identity value
                    var newId = await command.ExecuteScalarAsync();
                    return (int)newId;
                }
            }
        }

        public async Task<(int id, string resultMessage)> DeleteMedicationRegularChartAsync(int Id)
        {
            int id = 0;
            string resultMessage = "";

            // Create and open the database connection using the connection factory
            using (var connection = await _dbConnectionFactory.CreateAsync())
            {
                // Ensure we're working with SqlCommand for asynchronous operations
                using (var command = (SqlCommand)connection.CreateCommand())
                {
                    command.CommandText = "DeleteMedicationRegularChart"; // Assuming stored procedure name is GetPatients
                    command.CommandType = CommandType.StoredProcedure;

                    // Add parameters to the command
                    command.Parameters.Add(new SqlParameter("@Id", Id));

                    // Execute the stored procedure and read the results asynchronously
                    using (var reader = await command.ExecuteReaderAsync())
                    {
                        while (await reader.ReadAsync())
                        {
                            id = reader.GetInt32(reader.GetOrdinal("RowsAffected"));
                            resultMessage = reader.GetString(reader.GetOrdinal("ResultMessage"));
                        }
                    }
                }
            }

            return (id, resultMessage);
        }

        public async Task<int> DeleteMedicationRegularAdministrationAsync(int Id)
        {
            using (var connection = await _dbConnectionFactory.CreateAsync())
            {
                using (var command = (SqlCommand)connection.CreateCommand())
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "DeleteMedicationRegularAdministration"; // Stored procedure name

                    // Add parameters to the command
                    command.Parameters.Add(new SqlParameter("@Id", Id));

                    // Execute the command and return the new identity value
                    var newId = await command.ExecuteScalarAsync();
                    return (int)newId;
                }
            }
        }

        public async Task<int> AddBradenAssessmentAsync(BradenDto dto)
        {
            using (var connection = await _dbConnectionFactory.CreateAsync())
            using (var command = (SqlCommand)connection.CreateCommand())
            {
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "[EmrSimulator].dbo.InsertBradenAssessment";

                command.Parameters.Add(new SqlParameter("@LabId", dto.LabId));
                command.Parameters.Add(new SqlParameter("@PatientId", dto.PatientId));
                command.Parameters.Add(new SqlParameter("@DateOfAssessment", dto.DateOfAssessment));
                command.Parameters.Add(new SqlParameter("@NurseInitials", dto.NurseInitials));
                command.Parameters.Add(new SqlParameter("@Sensory", dto.Sensory));
                command.Parameters.Add(new SqlParameter("@Moisture", dto.Moisture));
                command.Parameters.Add(new SqlParameter("@Activity", dto.Activity));
                command.Parameters.Add(new SqlParameter("@Mobility", dto.Mobility));
                command.Parameters.Add(new SqlParameter("@Nutrition", dto.Nutrition));
                command.Parameters.Add(new SqlParameter("@Friction", dto.Friction));
                command.Parameters.Add(new SqlParameter("@TotalScore", dto.TotalScore));
                command.Parameters.Add(new SqlParameter("@RiskKey", dto.RiskKey));
                command.Parameters.Add(new SqlParameter("@Shift", (object?)dto.Shift ?? DBNull.Value));

                var newId = await command.ExecuteScalarAsync();
                return (int)newId;
            }
        }
        public async Task<int> AddBradenAssessmentFollowUpAsync(BradenDto dto)
        {
            using (var connection = await _dbConnectionFactory.CreateAsync())
            using (var command = (SqlCommand)connection.CreateCommand())
            {
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "[EmrSimulator].dbo.InsertBradenAssessmentFollowUp";

                command.Parameters.Add(new SqlParameter("@LabId", dto.LabId));
                command.Parameters.Add(new SqlParameter("@PatientId", dto.PatientId));
                command.Parameters.Add(new SqlParameter("@DateOfAssessment", dto.DateOfAssessment));
                command.Parameters.Add(new SqlParameter("@NurseInitials", dto.NurseInitials));
                command.Parameters.Add(new SqlParameter("@Sensory", dto.Sensory));
                command.Parameters.Add(new SqlParameter("@Moisture", dto.Moisture));
                command.Parameters.Add(new SqlParameter("@Activity", dto.Activity));
                command.Parameters.Add(new SqlParameter("@Mobility", dto.Mobility));
                command.Parameters.Add(new SqlParameter("@Nutrition", dto.Nutrition));
                command.Parameters.Add(new SqlParameter("@Friction", dto.Friction));
                command.Parameters.Add(new SqlParameter("@TotalScore", dto.TotalScore));
                command.Parameters.Add(new SqlParameter("@RiskKey", dto.RiskKey));
                command.Parameters.Add(new SqlParameter("@Shift", (object?)dto.Shift ?? DBNull.Value));

                var newId = await command.ExecuteScalarAsync();
                return (int)newId; // -1 if no initial exists, >0 if success
            }
        }


        public async Task<IEnumerable<BradenDto>> GetBradenAssessmentsAsync(int labId, int? patientId)
        {
            var items = new List<BradenDto>();
            using (var connection = await _dbConnectionFactory.CreateAsync())
            using (var command = (SqlCommand)connection.CreateCommand())
            {
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "[EmrSimulator].dbo.GetBradenAssessments";
                command.Parameters.Add(new SqlParameter("@LabId", labId));
                command.Parameters.Add(new SqlParameter("@PatientId", (object?)patientId ?? DBNull.Value));

                using (var reader = await command.ExecuteReaderAsync())
                {
                    while (await reader.ReadAsync())
                    {
                        var dto = new BradenDto
                        {
                            Id = reader.GetInt32(reader.GetOrdinal("Id")),
                            LabId = reader.GetInt32(reader.GetOrdinal("LabId")),
                            PatientId = reader.GetInt32(reader.GetOrdinal("PatientId")),
                            DateOfAssessment = reader.GetDateTime(reader.GetOrdinal("DateOfAssessment")),
                            Shift = reader.IsDBNull(reader.GetOrdinal("Shift")) ? null : reader.GetString(reader.GetOrdinal("Shift")),
                            NurseInitials = reader.GetString(reader.GetOrdinal("NurseInitials")),
                            TotalScore = reader.GetInt32(reader.GetOrdinal("TotalScore")),
                            RiskKey = reader.GetString(reader.GetOrdinal("RiskKey")),
                            // Factor fields aren’t selected here (list doesn’t need them)
                        };
                        items.Add(dto);
                    }
                }
            }
            return items;
        }

        public async Task<BradenDto?> GetBradenAssessmentByIdAsync(int labId, int id)
        {
            using (var connection = await _dbConnectionFactory.CreateAsync())
            using (var command = (SqlCommand)connection.CreateCommand())
            {
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "[EmrSimulator].dbo.GetBradenAssessmentById";
                command.Parameters.Add(new SqlParameter("@LabId", labId));
                command.Parameters.Add(new SqlParameter("@Id", id));

                using (var reader = await command.ExecuteReaderAsync())
                {
                    if (await reader.ReadAsync())
                    {
                        return new BradenDto
                        {
                            Id = reader.GetInt32(reader.GetOrdinal("Id")),
                            LabId = reader.GetInt32(reader.GetOrdinal("LabId")),
                            PatientId = reader.GetInt32(reader.GetOrdinal("PatientId")),
                            DateOfAssessment = reader.GetDateTime(reader.GetOrdinal("DateOfAssessment")),
                            NurseInitials = reader.GetString(reader.GetOrdinal("NurseInitials")),
                            Sensory = reader.GetInt32(reader.GetOrdinal("Sensory")),
                            Moisture = reader.GetInt32(reader.GetOrdinal("Moisture")),
                            Activity = reader.GetInt32(reader.GetOrdinal("Activity")),
                            Mobility = reader.GetInt32(reader.GetOrdinal("Mobility")),
                            Nutrition = reader.GetInt32(reader.GetOrdinal("Nutrition")),
                            Friction = reader.GetInt32(reader.GetOrdinal("Friction")),
                            TotalScore = reader.GetInt32(reader.GetOrdinal("TotalScore")),
                            RiskKey = reader.GetString(reader.GetOrdinal("RiskKey")),
                            Shift = reader.IsDBNull(reader.GetOrdinal("Shift")) ? null : reader.GetString(reader.GetOrdinal("Shift")),
                        };
                    }
                }
            }
            return null;
        }

        public async Task<int> DeleteBradenAssessmentAsync(int id)
        {
            using (var connection = await _dbConnectionFactory.CreateAsync())
            using (var command = (SqlCommand)connection.CreateCommand())
            {
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "[EmrSimulator].dbo.DeleteBradenAssessment";
                command.Parameters.Add(new SqlParameter("@Id", id));

                var rows = await command.ExecuteScalarAsync();
                return (rows == null || rows == DBNull.Value) ? 0 : Convert.ToInt32(rows);
            }
        }

        // PatientRepository.cs.

        public async Task<int> AddFoodIntakeAsync(FoodIntakeDto dto)
        {
            using (var connection = await _dbConnectionFactory.CreateAsync())
            using (var command = (SqlCommand)connection.CreateCommand())
            {
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "[EmrSimulator].dbo.InsertFoodIntake";

                command.Parameters.Add(new SqlParameter("@LabId", dto.LabId));
                command.Parameters.Add(new SqlParameter("@PatientId", dto.PatientId));
                command.Parameters.Add(new SqlParameter("@DayText", (object?)dto.DayText ?? DBNull.Value));
                command.Parameters.Add(new SqlParameter("@IntakeDate", dto.IntakeDate));
                command.Parameters.Add(new SqlParameter("@Shift1Signature", (object?)dto.Shift1Signature ?? DBNull.Value));
                command.Parameters.Add(new SqlParameter("@Shift1Designation", (object?)dto.Shift1Designation ?? DBNull.Value));
                command.Parameters.Add(new SqlParameter("@Shift2Signature", (object?)dto.Shift2Signature ?? DBNull.Value));
                command.Parameters.Add(new SqlParameter("@Shift2Designation", (object?)dto.Shift2Designation ?? DBNull.Value));

                // meal-level comments (header)
                command.Parameters.Add(new SqlParameter("@BreakfastComment", (object?)dto.BreakfastComment ?? DBNull.Value));
                command.Parameters.Add(new SqlParameter("@MorningTeaComment", (object?)dto.MorningTeaComment ?? DBNull.Value));
                command.Parameters.Add(new SqlParameter("@LunchComment", (object?)dto.LunchComment ?? DBNull.Value));
                command.Parameters.Add(new SqlParameter("@AfternoonTeaComment", (object?)dto.AfternoonTeaComment ?? DBNull.Value));
                command.Parameters.Add(new SqlParameter("@DinnerComment", (object?)dto.DinnerComment ?? DBNull.Value));
                command.Parameters.Add(new SqlParameter("@SupperComment", (object?)dto.SupperComment ?? DBNull.Value));

                var jsonOptions = new JsonSerializerOptions
                {
                    PropertyNamingPolicy = null,
                    DefaultIgnoreCondition = JsonIgnoreCondition.WhenWritingNull
                };

                var itemsJson = JsonSerializer.Serialize(dto.Items ?? new List<FoodIntakeItemDto>(), jsonOptions);
                command.Parameters.Add(new SqlParameter("@ItemsJson", itemsJson));

                var newId = await command.ExecuteScalarAsync();
                return (newId == null || newId == DBNull.Value) ? 0 : Convert.ToInt32(newId);
            }
        }


        public async Task<IEnumerable<FoodIntakeListDto>> GetFoodIntakeHeadersAsync(int labId, int? patientId)
        {
            var list = new List<FoodIntakeListDto>();
            using var connection = await _dbConnectionFactory.CreateAsync();
            using var command = (SqlCommand)connection.CreateCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "[EmrSimulator].dbo.GetFoodIntakeHeaders";
            command.Parameters.Add(new SqlParameter("@LabId", labId));
            command.Parameters.Add(new SqlParameter("@PatientId", (object?)patientId ?? DBNull.Value));

            using var reader = await command.ExecuteReaderAsync();
            while (await reader.ReadAsync())
            {
                list.Add(new FoodIntakeListDto
                {
                    Id = reader.GetInt32(reader.GetOrdinal("Id")),
                    LabId = reader.GetInt32(reader.GetOrdinal("LabId")),
                    PatientId = reader.GetInt32(reader.GetOrdinal("PatientId")),
                    DayText = reader.IsDBNull(reader.GetOrdinal("DayText")) ? null : reader.GetString(reader.GetOrdinal("DayText")),
                    IntakeDate = reader.GetDateTime(reader.GetOrdinal("IntakeDate")),
                    MealsRecordedSummary = reader.IsDBNull(reader.GetOrdinal("MealsRecordedSummary")) ? "" : reader.GetString(reader.GetOrdinal("MealsRecordedSummary")),
                });
            }
            return list;
        }
        public async Task<FoodIntakeDto?> GetFoodIntakeByIdAsync(int labId, int id)
        {
            using var connection = await _dbConnectionFactory.CreateAsync();
            using var command = (SqlCommand)connection.CreateCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "[EmrSimulator].dbo.GetFoodIntakeById";
            command.Parameters.Add(new SqlParameter("@LabId", labId));
            command.Parameters.Add(new SqlParameter("@Id", id));

            using var reader = await command.ExecuteReaderAsync();

            FoodIntakeDto? dto = null;

            if (await reader.ReadAsync())
            {
                dto = new FoodIntakeDto
                {
                    Id = reader.GetInt32(reader.GetOrdinal("Id")),
                    LabId = reader.GetInt32(reader.GetOrdinal("LabId")),
                    PatientId = reader.GetInt32(reader.GetOrdinal("PatientId")),
                    DayText = reader.IsDBNull(reader.GetOrdinal("DayText")) ? null : reader.GetString(reader.GetOrdinal("DayText")),
                    IntakeDate = reader.GetDateTime(reader.GetOrdinal("IntakeDate")),
                    Shift1Signature = reader.IsDBNull(reader.GetOrdinal("Shift1Signature")) ? null : reader.GetString(reader.GetOrdinal("Shift1Signature")),
                    Shift1Designation = reader.IsDBNull(reader.GetOrdinal("Shift1Designation")) ? null : reader.GetString(reader.GetOrdinal("Shift1Designation")),
                    Shift2Signature = reader.IsDBNull(reader.GetOrdinal("Shift2Signature")) ? null : reader.GetString(reader.GetOrdinal("Shift2Signature")),
                    Shift2Designation = reader.IsDBNull(reader.GetOrdinal("Shift2Designation")) ? null : reader.GetString(reader.GetOrdinal("Shift2Designation")),

                    BreakfastComment = reader.IsDBNull(reader.GetOrdinal("BreakfastComment")) ? null : reader.GetString(reader.GetOrdinal("BreakfastComment")),
                    MorningTeaComment = reader.IsDBNull(reader.GetOrdinal("MorningTeaComment")) ? null : reader.GetString(reader.GetOrdinal("MorningTeaComment")),
                    LunchComment = reader.IsDBNull(reader.GetOrdinal("LunchComment")) ? null : reader.GetString(reader.GetOrdinal("LunchComment")),
                    AfternoonTeaComment = reader.IsDBNull(reader.GetOrdinal("AfternoonTeaComment")) ? null : reader.GetString(reader.GetOrdinal("AfternoonTeaComment")),
                    DinnerComment = reader.IsDBNull(reader.GetOrdinal("DinnerComment")) ? null : reader.GetString(reader.GetOrdinal("DinnerComment")),
                    SupperComment = reader.IsDBNull(reader.GetOrdinal("SupperComment")) ? null : reader.GetString(reader.GetOrdinal("SupperComment")),

                    Items = new List<FoodIntakeItemDto>()
                };
            }

            if (dto != null && await reader.NextResultAsync())
            {
                while (await reader.ReadAsync())
                {
                    dto.Items.Add(new FoodIntakeItemDto
                    {
                        Meal = reader.GetString(reader.GetOrdinal("Meal")),
                        Label = reader.GetString(reader.GetOrdinal("Label")),
                        Notes = reader.IsDBNull(reader.GetOrdinal("Notes")) ? null : reader.GetString(reader.GetOrdinal("Notes")),
                        Amount = reader.GetString(reader.GetOrdinal("Amount"))
                    });
                }
            }

            return dto;
        }

        public async Task<int> DeleteFoodIntakeAsync(int id)
        {
            using var connection = await _dbConnectionFactory.CreateAsync();
            using var command = (SqlCommand)connection.CreateCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "[EmrSimulator].dbo.DeleteFoodIntake";
            command.Parameters.Add(new SqlParameter("@Id", id));

            var rows = await command.ExecuteScalarAsync();
            return (rows == null || rows == DBNull.Value) ? 0 : Convert.ToInt32(rows);
        }

        public async Task<int> UpdateFoodIntakeAsync(FoodIntakeDto dto)
        {
            using var connection = await _dbConnectionFactory.CreateAsync();
            using var command = (SqlCommand)connection.CreateCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "[EmrSimulator].dbo.UpdateFoodIntake";

            command.Parameters.Add(new SqlParameter("@Id", dto.Id));
            command.Parameters.Add(new SqlParameter("@LabId", dto.LabId));
            command.Parameters.Add(new SqlParameter("@PatientId", dto.PatientId));
            command.Parameters.Add(new SqlParameter("@DayText", (object?)dto.DayText ?? DBNull.Value));
            command.Parameters.Add(new SqlParameter("@IntakeDate", dto.IntakeDate));
            command.Parameters.Add(new SqlParameter("@Shift1Signature", (object?)dto.Shift1Signature ?? DBNull.Value));
            command.Parameters.Add(new SqlParameter("@Shift1Designation", (object?)dto.Shift1Designation ?? DBNull.Value));
            command.Parameters.Add(new SqlParameter("@Shift2Signature", (object?)dto.Shift2Signature ?? DBNull.Value));
            command.Parameters.Add(new SqlParameter("@Shift2Designation", (object?)dto.Shift2Designation ?? DBNull.Value));

            command.Parameters.Add(new SqlParameter("@BreakfastComment", (object?)dto.BreakfastComment ?? DBNull.Value));
            command.Parameters.Add(new SqlParameter("@MorningTeaComment", (object?)dto.MorningTeaComment ?? DBNull.Value));
            command.Parameters.Add(new SqlParameter("@LunchComment", (object?)dto.LunchComment ?? DBNull.Value));
            command.Parameters.Add(new SqlParameter("@AfternoonTeaComment", (object?)dto.AfternoonTeaComment ?? DBNull.Value));
            command.Parameters.Add(new SqlParameter("@DinnerComment", (object?)dto.DinnerComment ?? DBNull.Value));
            command.Parameters.Add(new SqlParameter("@SupperComment", (object?)dto.SupperComment ?? DBNull.Value));

            var jsonOptions = new JsonSerializerOptions { PropertyNamingPolicy = null, DefaultIgnoreCondition = JsonIgnoreCondition.WhenWritingNull };
            var itemsJson = JsonSerializer.Serialize(dto.Items ?? new List<FoodIntakeItemDto>(), jsonOptions);
            command.Parameters.Add(new SqlParameter("@ItemsJson", itemsJson));

            var ok = await command.ExecuteScalarAsync();
            return (ok == null || ok == DBNull.Value) ? 0 : Convert.ToInt32(ok);
        }



        public async Task<int> AddProgressNotesAsync(ProgressNotesDto addsDto)
        {
            if (addsDto.Id > 0)
            {
                await UpdateProgressNotesAsync(addsDto);
                return addsDto.Id;
            }
            else
            {
                int newId = await InsertProgressNotesAsync(addsDto);
                return newId;
            }
        }

        public async Task<int> InsertProgressNotesAsync(ProgressNotesDto addsDto)
        {
            using (var connection = await _dbConnectionFactory.CreateAsync())
            {
                using (var command = (SqlCommand)connection.CreateCommand())
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "InsertProgressNote"; // Stored procedure name

                    // Add parameters to the command
                    command.Parameters.Add(new SqlParameter("@LabId", addsDto.LabId));
                    command.Parameters.Add(new SqlParameter("@PatientId", addsDto.PatientId));
                    command.Parameters.Add(new SqlParameter("@NotesDate", addsDto.NotesDate ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@Notes", addsDto.Notes ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@Sign", addsDto.Sign ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@NotesFrom", addsDto.NotesFrom ?? (object)DBNull.Value));

                    // Execute the command and return the new identity value
                    var newId = await command.ExecuteScalarAsync();
                    return (int)newId;
                }
            }
        }

        public async Task UpdateProgressNotesAsync(ProgressNotesDto addsDto)
        {
            using (var connection = await _dbConnectionFactory.CreateAsync())
            {
                using (var command = (SqlCommand)connection.CreateCommand())
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "UpdateProgressNote"; // Stored procedure name

                    // Add parameters to the command
                    command.Parameters.Add(new SqlParameter("@Id", addsDto.Id));
                    command.Parameters.Add(new SqlParameter("@LabId", addsDto.LabId));
                    command.Parameters.Add(new SqlParameter("@PatientId", addsDto.PatientId));
                    command.Parameters.Add(new SqlParameter("@NotesDate", addsDto.NotesDate ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@Notes", addsDto.Notes ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@Sign", addsDto.Sign ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@NotesFrom", addsDto.NotesFrom ?? (object)DBNull.Value));

                    // Execute the command
                    await command.ExecuteNonQueryAsync();
                }
            }
        }

        public async Task<int> DeleteProgressNotesAsync(int Id)
        {
            using (var connection = await _dbConnectionFactory.CreateAsync())
            {
                using (var command = (SqlCommand)connection.CreateCommand())
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "DeleteProgressNote"; // Stored procedure name

                    // Add parameters to the command
                    command.Parameters.Add(new SqlParameter("@Id", Id));

                    // Execute the command and return the new identity value
                    var newId = await command.ExecuteScalarAsync();
                    return (int)newId;
                }
            }
        }

        public async Task<IEnumerable<ProgressNotesDto>> GetProgressNotesAsync(int labId, int patientId)
        {
            var patients = new List<ProgressNotesDto>();

            // Create and open the database connection using the connection factory
            using (var connection = await _dbConnectionFactory.CreateAsync())
            {
                // Ensure we're working with SqlCommand for asynchronous operations
                using (var command = (SqlCommand)connection.CreateCommand())
                {
                    command.CommandText = "GetProgressNotes"; // Assuming stored procedure name is GetPatients
                    command.CommandType = CommandType.StoredProcedure;

                    // Add parameters to the command
                    command.Parameters.Add(new SqlParameter("@LabId", labId));
                    command.Parameters.Add(new SqlParameter("@PatientId", patientId));

                    // Execute the stored procedure and read the results asynchronously
                    using (var reader = await command.ExecuteReaderAsync())
                    {
                        while (await reader.ReadAsync())
                        {
                            var patient = new ProgressNotesDto
                            {
                                Id = reader.GetInt32(reader.GetOrdinal("Id")),
                                LabId = reader.GetInt32(reader.GetOrdinal("LabId")),
                                PatientId = reader.GetInt32(reader.GetOrdinal("PatientId")),
                                NotesDate = reader.GetDateTime(reader.GetOrdinal("NotesDate")),
                                Notes = reader.IsDBNull(reader.GetOrdinal("Notes")) ? null : reader.IsDBNull(reader.GetOrdinal("Notes")) ? null : reader.GetString(reader.GetOrdinal("Notes")),
                                Sign = reader.IsDBNull(reader.GetOrdinal("Sign")) ? null : reader.IsDBNull(reader.GetOrdinal("Sign")) ? null : reader.GetString(reader.GetOrdinal("Sign")),
                                NotesFrom = reader.IsDBNull(reader.GetOrdinal("NotesFrom")) ? null : reader.IsDBNull(reader.GetOrdinal("NotesFrom")) ? null : reader.GetString(reader.GetOrdinal("NotesFrom"))
                            };

                            patients.Add(patient);
                        }
                    }
                }
            }

            return patients;
        }

       
        public async Task<int> AddRiskmanIncidentAsync(RiskmanDto dto)
        {
            using (var connection = await _dbConnectionFactory.CreateAsync())
            {
                using (var command = (SqlCommand)connection.CreateCommand())
                {
                    command.CommandType = CommandType.StoredProcedure;
                    var currentDb = ((SqlConnection)connection).Database;
                    Console.WriteLine($"Current DB = {currentDb}");
                    command.CommandText = "[EmrSimulator].dbo.InsertRiskmanIncident";

                    command.Parameters.Add(new SqlParameter("@LabId", dto.LabId));
                    command.Parameters.Add(new SqlParameter("@PatientId", dto.PatientId));
                    command.Parameters.Add(new SqlParameter("@IncidentDate", dto.IncidentDate ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@IncidentTime", dto.IncidentTime ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@URINumber", (object?)dto.URINumber ?? DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@Campus", (object?)dto.Campus ?? DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@WardLocationType", (object?)dto.WardLocationType ?? DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@PersonName", (object?)dto.PersonName ?? DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@DateOfBirth", (object?)dto.DateOfBirth ?? DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@Sex", (object?)dto.Sex ?? DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@IndigenousStatus", (object?)dto.IndigenousStatus ?? DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@BriefSummary", (object?)dto.BriefSummary ?? DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@Details", (object?)dto.Details ?? DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@EventType", (object?)dto.EventType ?? DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@EventSubType", (object?)dto.EventSubType ?? DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@IsClinicalIncident", (object?)dto.IsClinicalIncident ?? DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@Apse", (object?)dto.Apse ?? DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@ClinicalHarmLevel", (object?)dto.ClinicalHarmLevel ?? DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@HarmDuration", (object?)dto.HarmDuration ?? DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@RequiredCareLevelClinical", (object?)dto.RequiredCareLevelClinical ?? DBNull.Value));

                    command.Parameters.Add(new SqlParameter("@EmergencyResponseType", (object?)dto.EmergencyResponseType ?? DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@EmergencyResponseOutcome", (object?)dto.EmergencyResponseOutcome ?? DBNull.Value));

                    command.Parameters.Add(new SqlParameter("@ContributingAdditionalDetail", (object?)dto.ContributingAdditionalDetail ?? DBNull.Value));

                    var csv = (dto.ContributingFactors != null && dto.ContributingFactors.Count > 0)
                        ? string.Join(",", dto.ContributingFactors)
                        : null;
                    command.Parameters.Add(new SqlParameter("@ContributingFactorsCsv", (object?)csv ?? DBNull.Value));

                    command.Parameters.Add(new SqlParameter("@ReporterIsAffectedStaff", (object?)dto.ReporterIsAffectedStaff ?? DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@OhsTypeOfInjury", (object?)dto.OhsTypeOfInjury ?? DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@OhsTypeOfInjuryOther", (object?)dto.OhsTypeOfInjuryOther ?? DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@OhsBodyPartAffected", (object?)dto.OhsBodyPartAffected ?? DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@OhsBodyPartOther", (object?)dto.OhsBodyPartOther ?? DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@OhsLevelOfHarmSustained", (object?)dto.OhsLevelOfHarmSustained ?? DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@OhsRequiredLevelOfCare", (object?)dto.OhsRequiredLevelOfCare ?? DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@OhsActionsRequired", (object?)dto.OhsActionsRequired ?? DBNull.Value));

                    command.Parameters.Add(new SqlParameter("@SignedBy", (object?)dto.SignedBy ?? DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@SignedDate", (object?)dto.SignedDate ?? DBNull.Value));
                    var newId = await command.ExecuteScalarAsync();
                    return (int)newId;
                }
            }
        }
        public async Task<RiskmanDto?> GetRiskmanIncidentByIdAsync(int labId, int id)
        {
            using (var connection = await _dbConnectionFactory.CreateAsync())
            using (var command = (SqlCommand)connection.CreateCommand())
            {
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "[EmrSimulator].dbo.GetRiskmanIncidentById";
                command.Parameters.Add(new SqlParameter("@LabId", labId));
                command.Parameters.Add(new SqlParameter("@Id", id));

                using (var reader = await command.ExecuteReaderAsync())
                {
                    if (await reader.ReadAsync())
                    {
                        var dto = new RiskmanDto
                        {
                            Id = reader.GetInt32(reader.GetOrdinal("Id")),
                            LabId = reader.GetInt32(reader.GetOrdinal("LabId")),
                            PatientId = reader.GetInt32(reader.GetOrdinal("PatientId")),

                            IncidentDate = reader.IsDBNull(reader.GetOrdinal("IncidentDate"))
                                ? (DateTime?)null
                                : reader.GetDateTime(reader.GetOrdinal("IncidentDate")),
                            IncidentTime = reader.IsDBNull(reader.GetOrdinal("IncidentTime"))
                                ? null
                                : reader.GetString(reader.GetOrdinal("IncidentTime")),
                            URINumber = reader.IsDBNull(reader.GetOrdinal("URINumber"))
                                ? null
                                : reader.GetString(reader.GetOrdinal("URINumber")),

                            Campus = reader.IsDBNull(reader.GetOrdinal("Campus"))
                                ? null
                                : reader.GetString(reader.GetOrdinal("Campus")),
                            WardLocationType = reader.IsDBNull(reader.GetOrdinal("WardLocationType"))
                                ? null
                                : reader.GetString(reader.GetOrdinal("WardLocationType")),
                            PersonName = reader.IsDBNull(reader.GetOrdinal("PersonName"))
                                ? null
                                : reader.GetString(reader.GetOrdinal("PersonName")),
                            DateOfBirth = reader.IsDBNull(reader.GetOrdinal("DateOfBirth"))
                                ? (DateTime?)null
                                : reader.GetDateTime(reader.GetOrdinal("DateOfBirth")),
                            Sex = reader.IsDBNull(reader.GetOrdinal("Sex"))
                                ? null
                                : reader.GetString(reader.GetOrdinal("Sex")),
                            IndigenousStatus = reader.IsDBNull(reader.GetOrdinal("IndigenousStatus"))
                                ? null
                                : reader.GetString(reader.GetOrdinal("IndigenousStatus")),
                            BriefSummary = reader.IsDBNull(reader.GetOrdinal("BriefSummary"))
                                ? null
                                : reader.GetString(reader.GetOrdinal("BriefSummary")),
                            Details = reader.IsDBNull(reader.GetOrdinal("Details"))
                                ? null
                                : reader.GetString(reader.GetOrdinal("Details")),
                            EventType = reader.IsDBNull(reader.GetOrdinal("EventType"))
                                ? null
                                : reader.GetString(reader.GetOrdinal("EventType")),
                            EventSubType = reader.IsDBNull(reader.GetOrdinal("EventSubType"))
                                ? null
                                : reader.GetString(reader.GetOrdinal("EventSubType")),

                            // #4 Clinical Incident
                            IsClinicalIncident = reader.IsDBNull(reader.GetOrdinal("IsClinicalIncident"))
                                ? (bool?)null
                                : reader.GetBoolean(reader.GetOrdinal("IsClinicalIncident")),
                            Apse = reader.IsDBNull(reader.GetOrdinal("Apse"))
                                ? (bool?)null
                                : reader.GetBoolean(reader.GetOrdinal("Apse")),
                            ClinicalHarmLevel = reader.IsDBNull(reader.GetOrdinal("ClinicalHarmLevel"))
                                ? null
                                : reader.GetString(reader.GetOrdinal("ClinicalHarmLevel")),
                            HarmDuration = reader.IsDBNull(reader.GetOrdinal("HarmDuration"))
                                ? null
                                : reader.GetString(reader.GetOrdinal("HarmDuration")),
                            RequiredCareLevelClinical = reader.IsDBNull(reader.GetOrdinal("RequiredCareLevelClinical"))
                                ? null
                                : reader.GetString(reader.GetOrdinal("RequiredCareLevelClinical")),

                            // #5 Emergency Response
                            EmergencyResponseType = reader.IsDBNull(reader.GetOrdinal("EmergencyResponseType"))
                                ? null
                                : reader.GetString(reader.GetOrdinal("EmergencyResponseType")),
                            EmergencyResponseOutcome = reader.IsDBNull(reader.GetOrdinal("EmergencyResponseOutcome"))
                                ? null
                                : reader.GetString(reader.GetOrdinal("EmergencyResponseOutcome")),

                            // #6 Contributing Factors (details text)
                            ContributingAdditionalDetail = reader.IsDBNull(reader.GetOrdinal("ContributingAdditionalDetail"))
                                ? null
                                : reader.GetString(reader.GetOrdinal("ContributingAdditionalDetail")),

                            // #7 OHS
                            ReporterIsAffectedStaff = reader.IsDBNull(reader.GetOrdinal("ReporterIsAffectedStaff"))
                                ? (bool?)null
                                : reader.GetBoolean(reader.GetOrdinal("ReporterIsAffectedStaff")),
                            OhsTypeOfInjury = reader.IsDBNull(reader.GetOrdinal("OhsTypeOfInjury"))
                                ? null
                                : reader.GetString(reader.GetOrdinal("OhsTypeOfInjury")),
                            OhsTypeOfInjuryOther = reader.IsDBNull(reader.GetOrdinal("OhsTypeOfInjuryOther"))
                                ? null
                                : reader.GetString(reader.GetOrdinal("OhsTypeOfInjuryOther")),
                            OhsBodyPartAffected = reader.IsDBNull(reader.GetOrdinal("OhsBodyPartAffected"))
                                ? null
                                : reader.GetString(reader.GetOrdinal("OhsBodyPartAffected")),
                            OhsBodyPartOther = reader.IsDBNull(reader.GetOrdinal("OhsBodyPartOther"))
                                ? null
                                : reader.GetString(reader.GetOrdinal("OhsBodyPartOther")),
                            OhsLevelOfHarmSustained = reader.IsDBNull(reader.GetOrdinal("OhsLevelOfHarmSustained"))
                                ? null
                                : reader.GetString(reader.GetOrdinal("OhsLevelOfHarmSustained")),
                            OhsRequiredLevelOfCare = reader.IsDBNull(reader.GetOrdinal("OhsRequiredLevelOfCare"))
                                ? null
                                : reader.GetString(reader.GetOrdinal("OhsRequiredLevelOfCare")),
                            OhsActionsRequired = reader.IsDBNull(reader.GetOrdinal("OhsActionsRequired"))
                                ? null
                                : reader.GetString(reader.GetOrdinal("OhsActionsRequired")),

                            // Sign Off
                            SignedBy = reader.IsDBNull(reader.GetOrdinal("SignedBy"))
                                ? null
                                : reader.GetString(reader.GetOrdinal("SignedBy")),
                            SignedDate = reader.IsDBNull(reader.GetOrdinal("SignedDate"))
                                ? (DateTime?)null
                                : reader.GetDateTime(reader.GetOrdinal("SignedDate")),
                        };

                        // FactorsCsv → List<string> (requires your proc to SELECT it)
                        int ordFactors = reader.GetOrdinal("FactorsCsv");
                        if (!reader.IsDBNull(ordFactors))
                        {
                            var csv = reader.GetString(ordFactors);
                            dto.ContributingFactors = csv
                                .Split(',', StringSplitOptions.RemoveEmptyEntries)
                                .Select(s => s.Trim())
                                .Where(s => s.Length > 0)
                                .ToList();
                        }

                        return dto;
                    }
                }
            }
            return null;
        }


        public async Task<IEnumerable<RiskmanDto>> GetRiskmanIncidentsAsync(int labId, int? patientId)
        {
            var items = new List<RiskmanDto>();

            using (var connection = await _dbConnectionFactory.CreateAsync())
            using (var command = (SqlCommand)connection.CreateCommand())
            {
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "[EmrSimulator].dbo.GetRiskmanIncident";
                command.Parameters.Add(new SqlParameter("@LabId", labId));
                command.Parameters.Add(new SqlParameter("@PatientId", (object?)patientId ?? DBNull.Value));

                using (var reader = await command.ExecuteReaderAsync())
                {
                    while (await reader.ReadAsync())
                    {
                        var dto = new RiskmanDto
                        {
                            Id = reader.GetInt32(reader.GetOrdinal("Id")),
                            LabId = reader.GetInt32(reader.GetOrdinal("LabId")),
                            PatientId = reader.GetInt32(reader.GetOrdinal("PatientId")),
                            IncidentDate = reader.IsDBNull(reader.GetOrdinal("IncidentDate"))
                                ? (DateTime?)null
                                : reader.GetDateTime(reader.GetOrdinal("IncidentDate")),
                            IncidentTime = reader.IsDBNull(reader.GetOrdinal("IncidentTime"))
                                ? null
                                : reader.GetString(reader.GetOrdinal("IncidentTime")),
                            URINumber = reader.IsDBNull(reader.GetOrdinal("URINumber"))
                                ? null
                                : reader.GetString(reader.GetOrdinal("URINumber")),
                            Campus = reader.IsDBNull(reader.GetOrdinal("Campus"))
                                ? null
                                : reader.GetString(reader.GetOrdinal("Campus")),
                            WardLocationType = reader.IsDBNull(reader.GetOrdinal("WardLocationType"))
                                ? null
                                : reader.GetString(reader.GetOrdinal("WardLocationType")),
                            PersonName = reader.IsDBNull(reader.GetOrdinal("PersonName"))
                                ? null
                                : reader.GetString(reader.GetOrdinal("PersonName")),
                            DateOfBirth = reader.IsDBNull(reader.GetOrdinal("DateOfBirth"))
    ? (DateTime?)null
    : reader.GetDateTime(reader.GetOrdinal("DateOfBirth")),
                            Sex = reader.IsDBNull(reader.GetOrdinal("Sex")) ? null : reader.GetString(reader.GetOrdinal("Sex")),
                            IndigenousStatus = reader.IsDBNull(reader.GetOrdinal("IndigenousStatus")) ? null : reader.GetString(reader.GetOrdinal("IndigenousStatus")),
                            BriefSummary = reader.IsDBNull(reader.GetOrdinal("BriefSummary")) ? null : reader.GetString(reader.GetOrdinal("BriefSummary")),
                            Details = reader.IsDBNull(reader.GetOrdinal("Details")) ? null : reader.GetString(reader.GetOrdinal("Details")),
                            EventType = reader.IsDBNull(reader.GetOrdinal("EventType")) ? null : reader.GetString(reader.GetOrdinal("EventType")),
                            EventSubType = reader.IsDBNull(reader.GetOrdinal("EventSubType")) ? null : reader.GetString(reader.GetOrdinal("EventSubType"))

                        };

                        items.Add(dto);
                    }
                }
            }

            return items;
        }



        public async Task<int> DeleteRiskmanIncidentAsync(int id)
        {
            using (var connection = await _dbConnectionFactory.CreateAsync())
            using (var command = (SqlCommand)connection.CreateCommand())
            {
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "[EmrSimulator].dbo.DeleteRiskmanIncident";
                command.Parameters.Add(new SqlParameter("@Id", id));

                // SP returns SELECT CAST(@@ROWCOUNT AS INT)
                var rows = await command.ExecuteScalarAsync();
                return (rows == null || rows == DBNull.Value) ? 0 : Convert.ToInt32(rows);
            }
        }




        public async Task<IEnumerable<ClearDataDto>> ClearPatientDataAsync(int labId, int patientId)
        {
            var patients = new List<ClearDataDto>();

            // Create and open the database connection using the connection factory
            using (var connection = await _dbConnectionFactory.CreateAsync())
            {
                // Ensure we're working with SqlCommand for asynchronous operations
                using (var command = (SqlCommand)connection.CreateCommand())
                {
                    command.CommandText = "ClearPatientData"; // Assuming stored procedure name is GetPatients
                    command.CommandType = CommandType.StoredProcedure;

                    // Add parameters to the command
                    command.Parameters.Add(new SqlParameter("@LabId", labId));
                    command.Parameters.Add(new SqlParameter("@PatientId", patientId));

                    // Execute the stored procedure and read the results asynchronously
                    using (var reader = await command.ExecuteReaderAsync())
                    {
                        while (await reader.ReadAsync())
                        {
                            var patient = new ClearDataDto
                            {
                                ModuleName = reader.GetString(reader.GetOrdinal("TableName")),
                                RowsDeleted = reader.GetInt32(reader.GetOrdinal("RowsDeleted"))
                            };

                            patients.Add(patient);
                        }
                    }
                }
            }

            return patients;
        }

        public async Task<IEnumerable<ClearDataDto>> ClearLabDataAsync(int labId)
        {
            var patients = new List<ClearDataDto>();

            // Create and open the database connection using the connection factory
            using (var connection = await _dbConnectionFactory.CreateAsync())
            {
                // Ensure we're working with SqlCommand for asynchronous operations
                using (var command = (SqlCommand)connection.CreateCommand())
                {
                    command.CommandText = "ClearLabData"; // Assuming stored procedure name is GetPatients
                    command.CommandType = CommandType.StoredProcedure;

                    // Add parameters to the command
                    command.Parameters.Add(new SqlParameter("@LabId", labId));

                    // Execute the stored procedure and read the results asynchronously
                    using (var reader = await command.ExecuteReaderAsync())
                    {
                        while (await reader.ReadAsync())
                        {
                            var patient = new ClearDataDto
                            {
                                ModuleName = reader.GetString(reader.GetOrdinal("TableName")),
                                RowsDeleted = reader.GetInt32(reader.GetOrdinal("RowsDeleted"))
                            };

                            patients.Add(patient);
                        }
                    }
                }
            }

            return patients;
        }

        public async Task<(int id, string resultMessage)> DeleteMedicationAsync(int Id)
        {
            int id = 0;
            string resultMessage = "";

            // Create and open the database connection using the connection factory
            using (var connection = await _dbConnectionFactory.CreateAsync())
            {
                // Ensure we're working with SqlCommand for asynchronous operations
                using (var command = (SqlCommand)connection.CreateCommand())
                {
                    command.CommandText = "DeleteMedication"; // Assuming stored procedure name is GetPatients
                    command.CommandType = CommandType.StoredProcedure;

                    // Add parameters to the command
                    command.Parameters.Add(new SqlParameter("@Id", Id));

                    // Execute the stored procedure and read the results asynchronously
                    using (var reader = await command.ExecuteReaderAsync())
                    {
                        while (await reader.ReadAsync())
                        {

                            id = reader.GetInt32(reader.GetOrdinal("RowsAffected"));
                            resultMessage = reader.GetString(reader.GetOrdinal("ResultMessage"));
                        }
                    }
                }
            }

            return (id, resultMessage);
        }

        public async Task<IvFluidChartDto> GetIvFluidChartByIdAsync(int Id, int labId)
        {
            var patient = new IvFluidChartDto();

            // Create and open the database connection using the connection factory
            using (var connection = await _dbConnectionFactory.CreateAsync())
            {
                // Ensure we're working with SqlCommand for asynchronous operations
                using (var command = (SqlCommand)connection.CreateCommand())
                {
                    command.CommandText = "GetIvFluidChart"; // Assuming stored procedure name is GetPatients
                    command.CommandType = CommandType.StoredProcedure;

                    // Add parameters to the command
                    command.Parameters.Add(new SqlParameter("@Id", Id));
                    command.Parameters.Add(new SqlParameter("@LabId", labId));

                    // Execute the stored procedure and read the results asynchronously
                    using (var reader = await command.ExecuteReaderAsync())
                    {
                        while (await reader.ReadAsync())
                        {

                            patient.Id = reader.GetInt32(reader.GetOrdinal("Id"));
                            patient.LabId = reader.GetInt32(reader.GetOrdinal("LabId"));
                            patient.PatientId = reader.GetInt32(reader.GetOrdinal("PatientId"));
                            patient.Date = reader.GetDateTime(reader.GetOrdinal("Date"));
                            patient.FlaskVol = reader.IsDBNull(reader.GetOrdinal("FlaskVol")) ? null : reader.GetString(reader.GetOrdinal("FlaskVol"));
                            patient.Strength = reader.IsDBNull(reader.GetOrdinal("Strength")) ? null : reader.GetString(reader.GetOrdinal("Strength"));
                            patient.Rate = reader.IsDBNull(reader.GetOrdinal("Rate")) ? null : reader.GetString(reader.GetOrdinal("Rate"));
                            patient.Dose = reader.IsDBNull(reader.GetOrdinal("Dose")) ? null : reader.GetString(reader.GetOrdinal("Dose"));
                            patient.OfficerSign = reader.IsDBNull(reader.GetOrdinal("OfficerSign")) ? null : reader.GetString(reader.GetOrdinal("OfficerSign"));
                        }
                    }
                }
            }

            return patient;
        }

        public async Task<MedicationPrnChartDto> GetMedicationPrnChartByIdAsync(int Id, int labId)
        {
            var patient = new MedicationPrnChartDto();

            // Create and open the database connection using the connection factory
            using (var connection = await _dbConnectionFactory.CreateAsync())
            {
                // Ensure we're working with SqlCommand for asynchronous operations
                using (var command = (SqlCommand)connection.CreateCommand())
                {
                    command.CommandText = "GetMedicationPrnChart"; // Assuming stored procedure name is GetPatients
                    command.CommandType = CommandType.StoredProcedure;

                    // Add parameters to the command
                    command.Parameters.Add(new SqlParameter("@Id", Id));
                    command.Parameters.Add(new SqlParameter("@LabId", labId));

                    // Execute the stored procedure and read the results asynchronously
                    using (var reader = await command.ExecuteReaderAsync())
                    {
                        while (await reader.ReadAsync())
                        {
                            patient.Id = reader.GetInt32(reader.GetOrdinal("Id"));
                            patient.LabId = reader.GetInt32(reader.GetOrdinal("LabId"));
                            patient.PatientId = reader.GetInt32(reader.GetOrdinal("PatientId"));
                            patient.MedicationId = reader.GetInt32(reader.GetOrdinal("MedicationId"));
                            patient.MedicationName = reader.GetString(reader.GetOrdinal("MedicationName"));
                            patient.Dose = reader.IsDBNull(reader.GetOrdinal("Dose")) ? null : reader.GetString(reader.GetOrdinal("Dose"));
                            patient.DoseTime = reader.IsDBNull(reader.GetOrdinal("DoseTime")) ? null : reader.GetString(reader.GetOrdinal("DoseTime"));
                            patient.DoseFrequency = reader.IsDBNull(reader.GetOrdinal("DoseFrequency")) ? null : reader.GetString(reader.GetOrdinal("DoseFrequency"));
                            patient.DoseDate = reader.GetDateTime(reader.GetOrdinal("DoseDate"));
                            patient.Indication = reader.IsDBNull(reader.GetOrdinal("Indication")) ? null : reader.GetString(reader.GetOrdinal("Indication"));
                            patient.Route = reader.IsDBNull(reader.GetOrdinal("Route")) ? null : reader.GetString(reader.GetOrdinal("Route"));
                            patient.Pharmacy = reader.IsDBNull(reader.GetOrdinal("Pharmacy")) ? null : reader.GetString(reader.GetOrdinal("Pharmacy"));
                            patient.Prescriber = reader.IsDBNull(reader.GetOrdinal("Prescriber")) ? null : reader.GetString(reader.GetOrdinal("Prescriber"));
                            patient.PrescriberSign = reader.IsDBNull(reader.GetOrdinal("PrescriberSign")) ? null : reader.GetString(reader.GetOrdinal("PrescriberSign"));
                        }
                    }
                }
            }

            return patient;
        }

        public async Task<MedicationRegularChartDto> GetMedicationRegularChartByIdAsync(int Id, int labId)
        {
            var patient = new MedicationRegularChartDto();

            // Create and open the database connection using the connection factory
            using (var connection = await _dbConnectionFactory.CreateAsync())
            {
                // Ensure we're working with SqlCommand for asynchronous operations
                using (var command = (SqlCommand)connection.CreateCommand())
                {
                    command.CommandText = "GetMedicationRegularChart"; // Assuming stored procedure name is GetPatients
                    command.CommandType = CommandType.StoredProcedure;

                    // Add parameters to the command
                    command.Parameters.Add(new SqlParameter("@Id", Id));
                    command.Parameters.Add(new SqlParameter("@LabId", labId));

                    // Execute the stored procedure and read the results asynchronously
                    using (var reader = await command.ExecuteReaderAsync())
                    {
                        while (await reader.ReadAsync())
                        {
                            patient.Id = reader.GetInt32(reader.GetOrdinal("Id"));
                            patient.LabId = reader.GetInt32(reader.GetOrdinal("LabId"));
                            patient.PatientId = reader.GetInt32(reader.GetOrdinal("PatientId"));
                            patient.MedicationId = reader.GetInt32(reader.GetOrdinal("MedicationId"));
                            patient.MedicationName = reader.GetString(reader.GetOrdinal("MedicationName"));
                            patient.Dose = reader.IsDBNull(reader.GetOrdinal("Dose")) ? null : reader.GetString(reader.GetOrdinal("Dose"));
                            patient.DoseTime = reader.IsDBNull(reader.GetOrdinal("DoseTime")) ? null : reader.GetString(reader.GetOrdinal("DoseTime"));
                            patient.DoseFrequency = reader.IsDBNull(reader.GetOrdinal("DoseFrequency")) ? null : reader.GetString(reader.GetOrdinal("DoseFrequency"));
                            patient.DoseDate = reader.GetDateTime(reader.GetOrdinal("DoseDate"));
                            patient.Indication = reader.IsDBNull(reader.GetOrdinal("Indication")) ? null : reader.GetString(reader.GetOrdinal("Indication"));
                            patient.Route = reader.IsDBNull(reader.GetOrdinal("Route")) ? null : reader.GetString(reader.GetOrdinal("Route"));
                            patient.Pharmacy = reader.IsDBNull(reader.GetOrdinal("Pharmacy")) ? null : reader.GetString(reader.GetOrdinal("Pharmacy"));
                            patient.Prescriber = reader.IsDBNull(reader.GetOrdinal("Prescriber")) ? null : reader.GetString(reader.GetOrdinal("Prescriber"));
                            patient.PrescriberSign = reader.IsDBNull(reader.GetOrdinal("PrescriberSign")) ? null : reader.GetString(reader.GetOrdinal("PrescriberSign"));
                        }
                    }
                }
            }

            return patient;
        }

        public async Task<int> AddPatientAsync(PatientDto addsDto)
        {
            if (addsDto.Id > 0)
            {
                await UpdatePatientAsync(addsDto);
                return addsDto.Id;
            }
            else
            {
                int newId = await InsertPatientAsync(addsDto);
                return newId;
            }
        }

        public async Task<int> InsertPatientAsync(PatientDto addsDto)
        {
            using (var connection = await _dbConnectionFactory.CreateAsync())
            {
                using (var command = (SqlCommand)connection.CreateCommand())
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "InsertPatient"; // Stored procedure name

                    // Add parameters to the command
                    command.Parameters.Add(new SqlParameter("@LabId", addsDto.LabId));
                    command.Parameters.Add(new SqlParameter("@FirstName", addsDto.FirstName ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@LastName", addsDto.LastName ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@DateOfBirth", addsDto.DateOfBirth ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@Gender", addsDto.Gender ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@Address", addsDto.Address ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@AdmitDate", addsDto.AdmitDate ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@Weight", addsDto.Weight ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@Height", addsDto.Height ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@Age", addsDto.Age ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@Allergy", addsDto.Allergy ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@Intolerance", addsDto.Intolerance ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@UriNumber", addsDto.UriNumber ?? (object)DBNull.Value));


                    // Execute the command and return the new identity value
                    var newId = await command.ExecuteScalarAsync();
                    return (int)newId;
                }
            }
        }

        public async Task UpdatePatientAsync(PatientDto addsDto)
        {
            using (var connection = await _dbConnectionFactory.CreateAsync())
            {
                using (var command = (SqlCommand)connection.CreateCommand())
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "UpdatePatient"; // Stored procedure name

                    // Add parameters to the command
                    command.Parameters.Add(new SqlParameter("@Id", addsDto.Id));
                    command.Parameters.Add(new SqlParameter("@LabId", addsDto.LabId));
                    command.Parameters.Add(new SqlParameter("@FirstName", addsDto.FirstName ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@LastName", addsDto.LastName ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@DateOfBirth", addsDto.DateOfBirth ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@Gender", addsDto.Gender ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@Address", addsDto.Address ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@AdmitDate", addsDto.AdmitDate ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@Weight", addsDto.Weight ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@Height", addsDto.Height ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@Age", addsDto.Age ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@Allergy", addsDto.Allergy ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@Intolerance", addsDto.Intolerance ?? (object)DBNull.Value));
                    command.Parameters.Add(new SqlParameter("@UriNumber", addsDto.UriNumber ?? (object)DBNull.Value));

                    // Execute the command
                    await command.ExecuteNonQueryAsync();
                }
            }
        }

        public async Task<int> DeletePatientAsync(int labId, int Id)
        {
            using (var connection = await _dbConnectionFactory.CreateAsync())
            {
                using (var command = (SqlCommand)connection.CreateCommand())
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "DeletePatient"; // Stored procedure name

                    // Add parameters to the command
                    command.Parameters.Add(new SqlParameter("@Id", Id));
                    command.Parameters.Add(new SqlParameter("@LabId", labId));

                    // Execute the command and return the new identity value
                    var newId = await command.ExecuteScalarAsync();
                    return (int)newId;
                }
            }
        }
    }
}
