class PatientsController < ApplicationController
  def index
    @patients = Patient.all
  end

  def show
    @patient = Patient.find(params[:id])
  end

  def new
  end

  def create
    @patient = Patient.new(new_patient_params)
    @anamnesis = Anamnesis.new(anamnesis_params)
    save_patient
  end

  def edit
    @patient = Patient.find(params[:id])
  end

  def update
    @patient = Patient.find(params[:id])
    update_patient
  end

  def destroy
    @patient = Patient.find(params[:id]).destroy
    redirect_to patients_path
  end
private
  def new_patient_params
    params.permit(:patient_id, :name, :email, :gender, :age, :height, :weight )
  end
  def edit_patient_params
    params.require(:patient).permit(:patient_id, :name, :email, :gender, :age, :height, :weight )
  end
  def anamnesis_params
    params.permit(:medical_register_id, :morning_meal_time, :noon_meal_time, :evening_meal_time)
  end
  def save_patient
    if @patient.save
      save_anamnesis
    else
      render "new"
    end
  end
  def save_anamnesis
    @anamnesis.patient_id = Patient.last.id
    if @anamnesis.save
      redirect_to @patient
    else
      Patient.last.delete
      render "new"
    end
  end
  def save_patient
    if @patient.save
      save_anamnesis
    else
      render "show"
    end
  end
  def update_patient
    if @patient.update(edit_patient_params)
      redirect_to @patient
    else
      render "edit"
    end
  end
end
