class NutritionalInformationsController < ApplicationController
  def show
    d = Date.today
    @data = d.strftime("%d/%m/%Y")

    #Dados do Paciente
    @patient = Patient.find(params[:id])

    #Dados do Nutricionista
    

    #Cálculos da Tabela de Reeducação Alimentar
    @tee = NutritionalInformation.tee(@patient.age, 1.22, @patient.weight, @patient.height, 1026)
    @ptn = NutritionalInformation.ptn(@patient.weight)
    @cho = NutritionalInformation.cho(@tee)
    @lip = NutritionalInformation.lip(@tee)

    #Percentual Ideal de Consumo
    demand_all_portions
  end

  private
  def demand_all_portions
    @vegetais_a = NutritionalInformation.demand_portion("Vegetais A", 1026)
    @vegetais_b = NutritionalInformation.demand_portion("Vegetais B", @tee[5])
    @frutas = NutritionalInformation.demand_portion("Frutas", @tee[5])
    @arroz = NutritionalInformation.demand_portion("Arroz", @tee[5])
    @carnes = NutritionalInformation.demand_portion("Carnes", @tee[5])
    @leites_e_derivados = NutritionalInformation.demand_portion("Leites e Derivados", @tee[5])
    @desnatado_e_soja = NutritionalInformation.demand_portion("Desnatado e soja", @tee[5])
    @gorduras = NutritionalInformation.demand_portion("Gorduras", @tee[5])
    @embutidos = NutritionalInformation.demand_portion("Embutidos", @tee[5])
    @feijoes = NutritionalInformation.demand_portion("Feijões", @tee[5])
    @paes = NutritionalInformation.demand_portion("Pães", @tee[5])
    @fibras = NutritionalInformation.demand_portion("Fibras", @tee[5])
    @acucar = NutritionalInformation.demand_portion("Açúcar", @tee[5])
  end
end