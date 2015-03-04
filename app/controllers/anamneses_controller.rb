class AnamnesesController < ApplicationController
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
    redirect_to anamnesiss_path
  end
private
  def anamnesis_params
    params.require(:anamnesis).permit()
  end
  def save_anamnesis
    if @anamnesis.save
      redirect_to @anamnesis
    else
      render "new"
    end
  end
  def update_anamnesis
    if @anamnesis.update(anamnesis_params)
      redirect_to @anamnesis
    else
      render "edit"
    end
  end
end
