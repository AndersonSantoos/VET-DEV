class SwaggerController < ApplicationController
  include Swagger::Blocks

  # Pular autenticação para todas as ações do Swagger
  skip_before_action :authorize_request

  swagger_root do
    key :swagger, '2.0'
    info do
      key :version, '1.0.0'
      key :title, 'API de Veterinários'
      key :description, 'Documentação da API para gerenciamento de veterinários'
      contact do
        key :name, 'Suporte'
      end
    end
    key :basePath, '/'
    key :consumes, ['application/json']
    key :produces, ['application/json']
  end

  SWAGGERED_CLASSES = [
    VeterinariosController,
    TutorsController,
    AnimalsController,
    ConsultasController,
    PrescricaoMedicasController,
    self
  ].freeze

  def index
    render json: Swagger::Blocks.build_root_json(SWAGGERED_CLASSES)
  end
end
