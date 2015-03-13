class AnamnesesController < ApplicationController
  before_action :check_anamnesis, only: [:new, :create]
  before_action :load_patient, only: [:edit ,:update]
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
    @anamnesis = Anamnesis.new(anamnesis_params)
    save_anamnesis
  end

  def edit
    @anamnesis = Anamnesis.find(params[:id])
  end

  def update
    @anamnesis = Anamnesis.find(params[:id])
    update_anamnesis
  end

  def destroy
    @anamnesis = Anamnesis.find(params[:id]).destroy
    redirect_to anamneses_path
  end
private
  def anamnesis_params
    params.require(:anamnesis).permit(:medical_register_id, :morning_meal_time, :noon_meal_time, :evening_meal_time, :patient_id)
  end
  def save_anamnesis
    if @anamnesis.save
      redirect_to @anamnesis.patient
    else
      render "new"
    end
  end
  def update_anamnesis
    if @anamnesis.update(anamnesis_params)
      redirect_to @anamnesis.patient
    else
      render "edit"
    end
  end
  def check_anamnesis
    load_patient
    unless @patient.anamnesis.nil?
      redirect_to edit_patient_anamnese_path(@patient.anamnesis.id,@patient.id)
    end
  end
  def load_patient
    @patient = Patient.find(params[:patient_id])
  end
end
