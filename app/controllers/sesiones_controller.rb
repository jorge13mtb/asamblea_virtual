class SesionesController < ApplicationController

  def new
  end


  def create
    diputado = Diputado.find_by(email: params[:session][:email].downcase)
    if diputado && diputado.authenticate(params[:session][:password])
      sign_in diputado
      redirect_to diputado
    else
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
