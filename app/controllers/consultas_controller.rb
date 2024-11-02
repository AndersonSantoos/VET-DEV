class ConsultasController < ApplicationController

    #GET /consultas
    def index
        @consultas = Consulta.all
        render json: @consultas
    end

    #GET /consultas/:id
    def show
        @consulta = Consulta.find(params[:id])
        render json: @consulta
    end

    #POST /consultas
    def create
        @consulta = Consulta.new(consulta_params)
        if @consulta.save
            render json: {message: 'Consulta criado com sucesso', consulta: @consulta}, status: :created
        else
            render json: {error: 'Erro ao criar a consulta'}, status: :unprocessable_entity
        end
    end

     #PUT /consultas/:id
     def update
        @consulta = Consulta.find(params[:id])
        if @consulta.update(consulta_params)
            render json: {message: 'Consulta atualizada com sucesso!', consulta: @consulta} 
        else
            render json: @consulta.erros, status: :unprocessable_entity
        end
    end

    #DELETE /consultas/:id
    def destroy
        @consulta = Animal.find(params[:id])
        if @consulta.destroy
            render json: {message: 'Consulta deletado com sucesso!'}, status: :ok
        else
            render json: {error: 'Falha ao deletar consulta'}, status: :unprocessable_entity
        end
    end

    private

    #Permitir apens essa lista de parâmetros existentes.
    def consulta_params
        params.require(:consulta).permit(:data_hora, :sintomas, :observcoes)
    end

end
