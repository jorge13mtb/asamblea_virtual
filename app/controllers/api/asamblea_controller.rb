class Api::AsambleaController < ApplicationController
  def new
  end

  def diputados
    @diputados = Diputado.all
  end


  def crear_usuario
    @mensaje = Mensaje.new 
    @mensaje.respuesta = "No se pudo crear este usuario"

    @usuario = Usuario.new(:nombre => params[:nombre], :email => params[:email], :password => params[:password],
                           :password_confirmation => params[:password_confirmation])
   
    @mensaje.respuesta = "Usuario creado" if @usuario.save
  end

end


# esta clase es para la respuesta del json
class Mensaje
  attr_accessor :respuesta 
  @respuesta
end
