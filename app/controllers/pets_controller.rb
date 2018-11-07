# frozen_string_literal: true

class PetsController < ApplicationController
  def create
    @pet = Pet.new(pet_params)
    if @pet.save
      redirect_to pets_path
    else
      # This line overrides the default rendering behavior, which
      # would have been to render the "create" view.
      @users = User.pluck(:name, :id)
      render 'new'
    end
  end

  def destroy
    @pet = Pet.find(params[:id])
    redirect_to pets_path if @pet.destroy
  end

  def new
    @pet = Pet.new
    @users = User.pluck(:name, :id)
  end

  def index
    @pets = Pet.order(updated_at: :desc)
  end

  def show; end

  def edit
    @pet = Pet.find(params[:id])
    @users = User.pluck(:name, :id)
  end

  def update
    @pet = Pet.find(params[:id])
    if @pet.update(pet_params)
      redirect_to pets_path
    else
      render 'edit'
    end
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :animal, :avatar, :age)
  end
end
