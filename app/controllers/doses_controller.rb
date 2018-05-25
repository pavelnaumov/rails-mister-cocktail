class DosesController < ApplicationController


  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create

    #need to indentify the cocktails
    #need to define the dose / need to make a new dose
    # save this defined and created dose

    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)

    respond_to do |format|
      if @dose.save
        format.html { redirect_to @cocktail, notice: 'Dose was successfully created.' }

      else
        format.html { render :new }
        format.json { render json: @dose.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    respond_to do |format|
      format.html { redirect_to @dose.cocktail, notice: 'Dose was successfully destroyed.' }
    end
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
  end
end


