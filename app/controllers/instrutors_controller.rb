class InstrutorsController < ApplicationController
  before_action :set_instrutor, only: %i[ show edit update destroy ]

  # GET /instrutors or /instrutors.json
  def index
    @instrutors = Instrutor.all
  end

  # GET /instrutors/1 or /instrutors/1.json
  def show
  end

  # GET /instrutors/new
  def new
    @instrutor = Instrutor.new
    @academias = Academium.all.map { |acad| ["#{acad.id} - #{acad.nome}", acad.id] }
    @instrutor.build_endereco
  end

  # GET /instrutors/1/edit
  def edit
    @academias = Academium.all.map { |acad| ["#{acad.id} - #{acad.nome}", acad.id] }
  end

  # POST /instrutors or /instrutors.json
  def create
    @instrutor = Instrutor.new(instrutor_params)
    @academias = Academium.all.map { |acad| ["#{acad.id} - #{acad.nome}", acad.id] }
    @instrutor.endereco = Endereco.new(instrutor_params[:endereco_attributes])

    respond_to do |format|
      if @instrutor.save
        format.html { redirect_to instrutor_url(@instrutor), notice: "Instrutor was successfully created." }
        format.json { render :show, status: :created, location: @instrutor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @instrutor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /instrutors/1 or /instrutors/1.json
  def update
    @academias = Academium.all.map { |acad| ["#{acad.id} - #{acad.nome}", acad.id] }

    respond_to do |format|
      if @instrutor.update(instrutor_params)
        format.html { redirect_to instrutor_url(@instrutor), notice: "Instrutor was successfully updated." }
        format.json { render :show, status: :ok, location: @instrutor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @instrutor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /instrutors/1 or /instrutors/1.json
  def destroy
    @instrutor.destroy

    respond_to do |format|
      format.html { redirect_to instrutors_url, notice: "Instrutor was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instrutor
      @instrutor = Instrutor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def instrutor_params
      params.require(:instrutor).permit(:nome, :cpf, :data_de_nascimento, :contato_telefone, :academium_id, :horas_de_trabalho, :email, :password,
                                        endereco_attributes: [:logradouro, :cep])
    end
end
