class DogsController < ApplicationController

    def index
        @dogs = Dog.all
    end
    
    def show
        @dog = Dog.find(params[:id])
    end

    def edit
        @dog = Dog.find(params[:id])
    end

    def new
        @dog = Dog.new 
    end

    def create
        @dog = Dog.create(dog_params)
        if @dog.valid?
            @dog.save
            redirect_to dog_path(@dog)
        else
            flash[:errors] = @dog.errors.full_messages
            redirect_to new_dog_path
        end
    end

    def update
        @dog = Dog.find(params[:id])
        @dog.update(dog_params)
        redirect_to dog_path(@dog)
    end

    def destroy
        @dog = Dog.find(params[:id])
        @dog.destroy
        redirect_to dogs_path
    end

    private 

    def dog_params
        params.require(:dog).permit(:name, :breed, :age)
    end

end
