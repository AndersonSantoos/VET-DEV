class TutorsController < ApplicationController

    #GET /tutors
    def index
        @tutors = Tutor.all
        render json: @tutors
    end

    #GET /tutors/:id
    def show
        @tutor = Tutor.find(params[:id])
        render json: @tutor
    end

    #POST /tutors
    def create
        @tutor = Tutor.new(tutor_params)
        if @tutor.save
            render json: {message: 'Tutor criado com sucesso!', tutor: @tutor}, status: :created
        else
            render json: {error: 'Erro ao criar o tutor'}, status: :unprocessable_entity
        end
    end

     #PUT /tutors/:id
     def update
        @tutor = Tutor.find(params[:id])
        if @tutor.update(tutor_params)
            render json: {message: 'Tutor atualizado com sucesso', tutor: @tutor}
        else
            render json: @tutor.errors, status: :unprocessable_entity
        end
    end

    #DELETE /tutors/:id
    def destroy
        @tutor = Tutor.find(params[:id])
        if @tutor.destroy
            render json: {message: 'Tutor deletado com sucesso!'}, status: :ok
        else
            render json: {error: 'Falha ao deletar tutor'}, status: :unprocessable_entity
        end
    end

    private
    #Permitir apens essa lista de parâmetros existentes.
    def tutor_params
        params.require(:tutor).permit(:nome, :email, :cpf)
    end

end
