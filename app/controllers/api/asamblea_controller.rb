class Api::AsambleaController < ApplicationController
  def new
  end

  def diputados
    @diputados = Diputado.all
  end
end
