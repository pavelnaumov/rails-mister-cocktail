class DosesController < ApplicationController
  before_action :set_dose, only: [:show]

  def new
    @dose = Dose.new
  end

  def create

    @dose = Dose.new(dose_params)
    @dose.cocktail_id = @cocktail.id 

    respond_to do |format|
      if @dose.save
        format.html { redirect_to @dose, notice: 'Dose was successfully created.' }
        format.json { render :show, status: :created, location: @dose }
      else
        format.html { render :new }
        format.json { render json: @dose.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @dose.destroy
    respond_to do |format|
      format.html { redirect_to doses_url, notice: 'Dose was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_cocktail
    @dose = Dose.find(params[:id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
  end
end


