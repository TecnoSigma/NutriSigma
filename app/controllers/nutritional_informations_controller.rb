class NutritionalInformationsController < ApplicationController
  def show
    d = Date.today
    @data = d.strftime("%d/%m/%Y")

    @patient = Patient.find(params[:id])
    nutri_info = NutritionalInformation.new(patient: @patient)

    #Dados do Nutricionista

    #Cálculos da Tabela de Reeducação Alimentar
    kcal = 1026 # ISSO NAO DEVERIA TER SIDO INFORMADO PELO CLIENTE????
    @tee = nutri_info.tee(kcal)
    @ptn = nutri_info.ptn
    @cho = nutri_info.cho(kcal)
    @lip = nutri_info.lip(kcal)

    #Percentual Ideal de Consumo
    @portions = nutri_info.demand_portions(kcal)
  end

  private
  # esse metodo nao serva mais pra nada
 # def demand_all_portions
    #@vegetais_a = nutri_info.demand_portion("Vegetais A", 1026)
    #@vegetais_b = nutri_info.demand_portion("Vegetais B", 1025)
    #@frutas = nutri_info.demand_portion("Frutas", 1025)
    #@arroz = nutri_info.demand_portion("Arroz", 1025)
    #@carnes = nutri_info.demand_portion("Carnes", 1025)
    #@leites_e_derivados = nutri_info.demand_portion("Leites e Derivados", 1025)
    #@desnatado_e_soja = nutri_info.demand_portion("Desnatado e soja", 1025)
    #@gorduras = nutri_info.demand_portion("Gorduras", 1025)
    #@embutidos = nutri_info.demand_portion("Embutidos", 1025)
    #@feijoes = nutri_info.demand_portion("Feijões", 1025)
    #@paes = nutri_info.demand_portion("Pães", 1025)
    #@fibras = nutri_info.demand_portion("Fibras", 1025)
    #@acucar = nutri_info.demand_portion("Açúcar", 1025)
 # end
end
