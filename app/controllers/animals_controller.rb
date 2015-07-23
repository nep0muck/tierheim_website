class AnimalsController < ApplicationController
    before_action :find_animal, only: [:show, :edit, :update, :destroy]
    
    def index
        @animals = Animal.all.order("created_at DESC")
    end
    
    def show
    end
    
    def new
       @animal = Animal.new 
    end
    
    def create
        @animal = Animal.new(animal_params)
        
        if @animal.save
            redirect_to @animal, notice: "Successfully created new Animal"
        else
            render 'new'
        end
    end
    
    def edit
    end
    
    def update
        if @animal.update(animal_params)
            redirect_to @animal, notice: "Animal was successfully updated!"
        else
            render 'edit'
        end
    end
    
    def destroy
        @animal.destroy
        redirect_to root_path
    end
    
    
    private
    
    def animal_params
        params.require(:animal).permit(:name, :type_of_animal, :race, :arrived_at, :description)
    end
    
    def find_animal
        @animal = Animal.find(params[:id])
    end
end
