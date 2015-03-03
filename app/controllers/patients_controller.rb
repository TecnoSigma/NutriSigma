class PatientsController < ApplicationController
  def index
    @patients = Patient.all
  end

  def show
    @patient = Patient.find(params[:id])
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
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
  def patient_params
    params.require(:patient).permit(:patient_id, :name, :email, :gender, :age, :height, :weight )
  end
  def save_patient
    if @patient.save
      redirect_to @patient
    else
      render "new"
    end
  end
  def update_patient
    if @patient.update(patient_params)
      redirect_to @patient
    else
      render "edit"
    end
  end
end
