class PrescricaoMedicasController < ApplicationController
    before_action :set_prescricao_medica, only: [:show, :update, :destroy]
  
    # GET /prescricao_medicas
    def index
      @prescricoes_medicas = PrescricaoMedica.all
      render json: @prescricoes_medicas
    rescue StandardError => e
      render json: { error: "Erro ao buscar lista de prescrições: #{e.message}" }, status: :internal_server_error
    end
  
    # GET /prescricao_medicas/:id
    def show
      render json: @prescricao_medica
    rescue ActiveRecord::RecordNotFound
      render json: { error: "Prescrição não encontrada" }, status: :not_found
    end
  
    # POST /prescricao_medicas
    def create
      @prescricao_medica = PrescricaoMedica.new(prescricao_medica_params)
      if @prescricao_medica.save
        render json: { message: 'Prescrição criada com sucesso', prescricao: @prescricao_medica }, status: :created
      else
        render json: { errors: @prescricao_medica.errors.full_messages }, status: :unprocessable_entity
      end
    rescue StandardError => e
      render json: { error: "Erro ao criar a prescrição: #{e.message}" }, status: :internal_server_error
    end
  
    # PUT /prescricao_medicas/:id
    def update
      if @prescricao_medica.update(prescricao_medica_params)
        render json: { message: 'Prescrição atualizada com sucesso', prescricao: @prescricao_medica }
      else
        render json: { errors: @prescricao_medica.errors.full_messages }, status: :unprocessable_entity
      end
    rescue ActiveRecord::RecordNotFound
      render json: { error: "Prescrição não encontrada" }, status: :not_found
    rescue StandardError => e
      render json: { error: "Erro ao atualizar a prescrição: #{e.message}" }, status: :internal_server_error
    end
  
    # DELETE /prescricao_medicas/:id
    def destroy
      if @prescricao_medica.destroy
        render json: { message: 'Prescrição deletada com sucesso!' }, status: :ok
      else
        render json: { error: 'Falha ao deletar a prescrição' }, status: :unprocessable_entity
      end
    rescue ActiveRecord::RecordNotFound
      render json: { error: "Prescrição não encontrada" }, status: :not_found
    rescue StandardError => e
      render json: { error: "Erro ao deletar a prescrição: #{e.message}" }, status: :internal_server_error
    end
  
    private
  
    # Definir a prescrição para as ações show, update e destroy
    def set_prescricao_medica
      @prescricao_medica = PrescricaoMedica.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Prescrição não encontrada' }, status: :not_found
    end
  
    # Permitir apenas essa lista de parâmetros existentes
    def prescricao_medica_params
      params.require(:prescricao_medica).permit(:descricao)
    end
  end
  