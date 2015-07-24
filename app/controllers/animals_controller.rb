class AnimalsController < ApplicationController
    before_action :find_animal, only: [:show, :edit, :update, :destroy]
    
    def index
        @animals = Animal.all.order("created_at DESC")
    end
    
    def show
    end
    
    def new
       @animal = current_user.animals.build 
    end
    
    def create
        @animal = current_user.animals.build(animal_params)
        
        respond_to do |format|
            if @animal.save
                # redirect_to @animal, notice: "Successfully created new Animal"
                
                if params[:images]
                    #===== The magic is here ;)
                    params[:images].each { |image|
                        @animal.pictures.create(image: image)
                    }
                end
    
                format.html { redirect_to @animal, notice: 'Animal was successfully created.' }
                format.json { render json: @animal, status: :created, location: @animal }
          
            else
                # render 'new'
                format.html { render action: "new" }
                format.json { render json: @animal.errors, status: :unprocessable_entity }
            end
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
        
        
        # AJAX, funktioniert noch nicht
        # respond_to do |format|
        #     if @animal.destroy
        #         format.html { redirect_to root_path }
        #         format.json @animal.as_json( :success => true )
        #     else
        #         flash[:notice] = "Animal failed to delete."
        #         format.html { redirect_to root_path }
        #         format.json @animal.as_json( :success => false )
        #     end
        # end
    end
    
    
    private
    
    def animal_params
        params.require(:animal).permit(:name, :image, :type_of_animal, :race, :arrived_at, :description)
    end
    
    def find_animal
        @animal = Animal.find(params[:id])
    end
end
