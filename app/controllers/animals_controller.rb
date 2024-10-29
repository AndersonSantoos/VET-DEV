class AnimalsController < ApplicationController

    #GET /animals
    def index
        @animals = Animal.all
        render json: @animals
    end

    #GET /animals/:id
    def show
        @animal = Animal.find(params[:id])
        render json: @animal
    end

    #POST /animals
    def create
        @animal = Animal.new(animal_params)
        if @animal.save
            render json: {message: 'Animal criado com sucesso', animal: @animal}, status: :created
        else
            render json: {error: 'Erro ao criar o animal'}, status: :unprocessable_entity
        end
    end

     #PUT /animals/:id
     def update
        @animal = Animal.find(params[:id])
        if @animal.update(animal_params)
            render json: @animal
        else
            render json: @animal.erros, status: :unprocessable_entity
        end
    end

    #DELETE /animals/:id
    def destroy
        @animal = Animal.find(params[:id])
        if @animal.destroy
            render json: {message: 'Animal deletado com sucesso!'}, status: :ok
        else
            render json: {error: 'Falha ao deletar animal'}, status: :unprocessable_entity
        end
    end

    private
    #Permitir apens essa lista de parâmetros existentes.
    def animal_params
        params.require(:animal).permit(:nome, :sexo, :especie, :raca)
    end

end
