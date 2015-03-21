class NutritionalInformationsController < ApplicationController
  def show
    d = Date.today
    @data = d.strftime("%d/%m/%Y")

    #Dados do Paciente
    @patient = Patient.find(params[:id])

    #Dados do Nutricionista
    

    #Cálculos da Tabela de Reeducação Alimentar
    @tee = NutritionalInformation.tee(@patient.age, @patient.anamnesis.physical_activity, @patient.weight, @patient.height, 1026)
    @ptn = NutritionalInformation.ptn(@patient.weight)
    @cho = NutritionalInformation.cho(@tee)
    @lip = NutritionalInformation.lip(@tee)

    #Percentual Ideal de Consumo
    demand_all_portions
  end

  private
  def demand_all_portions
    @vegetais_a = NutritionalInformation.demand_portion("Vegetais A", 1026)
    @vegetais_b = NutritionalInformation.demand_portion("Vegetais B", 1025)
    @frutas = NutritionalInformation.demand_portion("Frutas", 1025)
    @arroz = NutritionalInformation.demand_portion("Arroz", 1025)
    @carnes = NutritionalInformation.demand_portion("Carnes", 1025)
    @leites_e_derivados = NutritionalInformation.demand_portion("Leites e Derivados", 1025)
    @desnatado_e_soja = NutritionalInformation.demand_portion("Desnatado e soja", 1025)
    @gorduras = NutritionalInformation.demand_portion("Gorduras", 1025)
    @embutidos = NutritionalInformation.demand_portion("Embutidos", 1025)
    @feijoes = NutritionalInformation.demand_portion("Feijões", 1025)
    @paes = NutritionalInformation.demand_portion("Pães", 1025)
    @fibras = NutritionalInformation.demand_portion("Fibras", 1025)
    @acucar = NutritionalInformation.demand_portion("Açúcar", 1025)
  end
end