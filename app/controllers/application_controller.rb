class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nome, :email, :endereco, :cep, :cpf, :data_nascimento, :contato, :horario_trabalho])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nome, :email, :endereco, :cep, :cpf, :data_nascimento, :contato, :horario_trabalho])
  end
end
