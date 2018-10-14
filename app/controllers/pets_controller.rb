class PetsController < ApplicationController
  def create
    @pet = Pet.new(pet_params)
    if @pet.save
      redirect_to pets_path
    else
      # This line overrides the default rendering behavior, which
      # would have been to render the "create" view.
      render "new"
    end
  end

  def destroy
    @pet = Pet.find(params[:id])
    redirect_to pets_path if @pet.destroy
  end

  def new
    @pet = Pet.new
  end

  def index
    @pets = Pet.order(updated_at: :desc)
  end

  def show
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    @pet = Pet.find(params[:id])
    if @pet.update(pet_params)
      redirect_to @pet
    else
      render "edit"
    end
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :animal, :avatar, :age)
  end
end



