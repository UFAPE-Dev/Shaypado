class AcademiaController < ApplicationController
  before_action :set_academia, only: %i[ show edit update destroy ]

  # GET /academia or /academia.json
  def index
    @academia = Academia.all
  end

  # GET /academia/1 or /academia/1.json
  def show
  end

  # GET /academia/new
  def new
    @academia = Academia.new
  end

  # GET /academia/1/edit
  def edit
  end

  # POST /academia or /academia.json
  def create
    @academia = Academia.new(academia_params)

    respond_to do |format|
      if @academia.save
        format.html { redirect_to academia_url(@academia), notice: "Academium was successfully created." }
        format.json { render :show, status: :created, location: @academia }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @academia.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /academia/1 or /academia/1.json
  def update
    respond_to do |format|
      if @academia.update(academia_params)
        format.html { redirect_to academia_url(@academia), notice: "Academium was successfully updated." }
        format.json { render :show, status: :ok, location: @academia }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @academia.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /academia/1 or /academia/1.json
  def destroy
    @academia.destroy

    respond_to do |format|
      format.html { redirect_to academia_url, notice: "Academium was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_academia
      @academia = Academia.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def academia_params
      params.require(:academia).permit(:id_proprietario, :integer, :nome, :email, :endereco, :cpf, :contato, :ativo)
    end
end
