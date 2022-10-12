class AcademiaController < ApplicationController
  before_action :set_academium, only: %i[ show edit update destroy ]

  # GET /academia or /academia.json
  def index
    @academia = Academium.all
  end

  # GET /academia/1 or /academia/1.json
  def show
  end

  # GET /academia/new
  def new
    @academium = Academium.new
    @proprietarios = Proprietario.all.map { |prop| ["#{prop.id} - #{prop.nome}", prop.id] }
    @academium.build_endereco
  end

  # GET /academia/1/edit
  def edit
    @proprietarios = Proprietario.all.map { |prop| ["#{prop.id} - #{prop.nome}", prop.id] }
  end

  # POST /academia or /academia.json
  def create
    @academium = Academium.new(academium_params)
    @proprietarios = Proprietario.all.map { |prop| ["#{prop.id} - #{prop.nome}", prop.id] }
    @academium.endereco = Endereco.new(academium_params[:endereco_attributes])

    respond_to do |format|
      if @academium.save
        format.html { redirect_to academium_url(@academium), notice: "Academium was successfully created." }
        format.json { render :show, status: :created, location: @academium }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @academium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /academia/1 or /academia/1.json
  def update
    @proprietarios = Proprietario.all.map { |prop| ["#{prop.id} - #{prop.nome}", prop.id] }

    respond_to do |format|
      if @academium.update(academium_params)
        format.html { redirect_to academium_url(@academium), notice: "Academium was successfully updated." }
        format.json { render :show, status: :ok, location: @academium }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @academium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /academia/1 or /academia/1.json
  def destroy
    @academium.destroy

    respond_to do |format|
      format.html { redirect_to academia_url, notice: "Academium was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_academium
      @academium = Academium.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def academium_params
      params.require(:academium).permit(:nome, :email_comercial, :cnpj, :contato_comercial, :ativo, :proprietario_id,
                                        endereco_attributes: [:logradouro, :cep])
    end
end
