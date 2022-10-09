class AlunosController < ApplicationController
  before_action :set_aluno, only: %i[ show edit update destroy ]

  # GET /alunos or /alunos.json
  def index
    @alunos = Aluno.all
  end

  # GET /alunos/1 or /alunos/1.json
  def show
  end

  # GET /alunos/new
  def new
    @aluno = Aluno.new
    @academias = Academium.all.map { |prop| ["#{prop.id} - #{prop.nome}", prop.id] }
  end

  # GET /alunos/1/edit
  def edit
    @academias = Academium.all.map { |prop| ["#{prop.id} - #{prop.nome}", prop.id] }
  end

  # POST /alunos or /alunos.json
  def create
    @academias = Academium.all.map { |prop| ["#{prop.id} - #{prop.nome}", prop.id] }
    @aluno = Aluno.new(aluno_params)

    respond_to do |format|
      if @aluno.save
        format.html { redirect_to aluno_url(@aluno), notice: "Aluno was successfully created." }
        format.json { render :show, status: :created, location: @aluno }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @aluno.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /alunos/1 or /alunos/1.json
  def update
    @academias = Academium.all.map { |prop| ["#{prop.id} - #{prop.nome}", prop.id] }
    respond_to do |format|
      if @aluno.update(aluno_params)
        format.html { redirect_to aluno_url(@aluno), notice: "Aluno was successfully updated." }
        format.json { render :show, status: :ok, location: @aluno }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @aluno.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /alunos/1 or /alunos/1.json
  def destroy
    @aluno.destroy

    respond_to do |format|
      format.html { redirect_to alunos_url, notice: "Aluno was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aluno
      @aluno = Aluno.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def aluno_params
      params.require(:aluno).permit(:nome, :endereco, :cep, :cpf, :data_nascimento, :contato, :senha, :academium_id)
    end
end
