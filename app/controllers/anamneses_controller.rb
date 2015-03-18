class AnamnesesController < ApplicationController
  before_action :check_anamnesis, only: [:new, :create]
  before_action :load_patient, only: [:edit ,:update,:destroy]
  def index
    @anamneses = Anamnesis.all
  end

  def show
    @anamnesis = Anamnesis.find(params[:id])
  end

  def new
    @anamnesis = Anamnesis.new
  end

  def create
    @patient.anamnesis = Anamnesis.new(anamnesis_params)
    all_food_items_check
    save_anamnesis
  end

  def edit
    @anamnesis = Anamnesis.find(params[:id])
  end

  def update
    @patient.anamnesis = Anamnesis.find(params[:id])
    all_food_items_check
    update_anamnesis
  end

  def destroy
    @patient.anamnesis = Anamnesis.find(params[:id]).destroy
    redirect_to @patient
  end
private
  include AnamnesisFoodItemsMethods
  def anamnesis_params
    params.require(:anamnesis).permit(:medical_register_id, 
      :morning_meal_time, 
      :noon_meal_time, 
      :evening_meal_time, 
      :patient_id)
  end

  def save_anamnesis
    if @patient.anamnesis.save
      all_food_items_save
      redirect_to patient_path(@patient.id)
    else
      render "new"
    end
  end
  def update_anamnesis
    if @patient.anamnesis.update(anamnesis_params)
      @patient.anamnesis.anamnesis_food_items.destroy_all
      all_food_items_save
      redirect_to patient_path(@patient.id)
    else
      render "edit"
    end
  end
  def check_anamnesis
    load_patient
    unless @patient.anamnesis.nil?
      redirect_to edit_patient_anamnese_path(@patient.id,@patient.anamnesis.id)
    end
  end
  def load_patient
    @patient = Patient.find(params[:patient_id])
  end
end