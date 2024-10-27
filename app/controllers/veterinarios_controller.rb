class VeterinariosController < ApplicationController

    #GET /veterinarios
    def index
        @veterinarios = Veterinario.all
        render json: @veterinarios
    end

    #GET /veterinarios/:id
    def show
        @veterinario = Veterinario.find(params[:id])
        render json: @veterinario
    end

    #POST /veterinarios
    def create
        @veterinario = Veterinario.new(veterinario_params)
        if @veterinario.save
            render json: @veterinario, status: :created
        else
            render json: @veterinario.errors, status: :unprocessable_entity
        end
    end

    # PATCH/PUT /veterinarios/:id
    def update
        @veterinario = Veterinario.find(params[:id])
        if @veterinario.update(veterinario_params)
            render json: @veterinario
        else
            render json: @veterinario.erros, status: :unprocessable_entity
        end
    end

    #DELETE /veterinarios/:id
    def destroy
        @veterinario = Veterinario.find(params[:id])
        @veterinario.destroy
        head :no_content
    end

    private
    #Permitir apens essa lista de parâmetros existentes.
    def veterinario_params
        params.require(:veterinario).permit(:nome, :email, :crmv)
    end

end
