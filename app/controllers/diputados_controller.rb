class DiputadosController < ApplicationController
  before_action :set_diputado, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user, only: [:edit, :update, :show, :index]  

  def index
    @diputados = Diputado.all
  end

  def show
    @diputado = Diputado.find(params[:id])
  end

  def new
    @diputado = Diputado.new
  end

  def edit
  end

  def create
    @diputado = Diputado.new(diputado_params)

    respond_to do |format|
      if @diputado.save
        format.html { redirect_to @diputado, notice: 'Diputado was successfully created.' }
        format.json { render action: 'show', status: :created, location: @diputado }
      else
        format.html { render action: 'new' }
        format.json { render json: @diputado.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diputado
      @diputado = Diputado.find(params[:id])
    end

    def signed_in_user
      redirect_to root_url, notice: "Please sign in." unless signed_in?
    end
end
