class VeterinariosController < ApplicationController
    def index
        @veterinarios = Veterinario.all
        render json: @veterinarios
    end

    def show
        @veterinario = Veterinario.find(params[:id])
        render json: @veterinario
    end

    def create
        @veterinario = Veterinario.new(veterinario_params)
        if @veterinario.save
            render json: @veterinario, status: :created
        else
            render json: @veterinario.errors, status: :unprocessable_entity
        end
    end

    private

    def veterinario_params
        params.require(:veterinario).permit(:nome, :email, :crmv)
    end

end
