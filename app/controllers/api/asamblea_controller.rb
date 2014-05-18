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


  def log_in
    @mensaje = Mensaje.new 
    @mensaje.respuesta = ""
    
    usuario = Usuario.find_by email: params[:email]
    usuario.token_app_movil = nil if usuario

    if usuario && usuario.authenticate(params[:password])
     usuario.update_attribute :token_app_movil, Usuario.hash(Usuario.new_remember_token) 
    
    end
    @mensaje.respuesta = usuario.token_app_movil if usuario && usuario.token_app_movil != nil
  end


  def nueva_pregunta
    @mensaje = Mensaje.new 
    @mensaje.respuesta = "No se agrego la pregunta"

    usuario = Usuario.find_by token_app_movil: params[:token]
    diputado = Diputado.find_by email: params[:email_diputado]

    if diputado && usuario
      pregunta = diputado.preguntas_diputados.build(pregunta: params[:pregunta], usuario_id: usuario.id)
      @mensaje.respuesta = "Pregunta agregada correctamente" if pregunta.save 
    end
  end

  
  def preguntas
   @preguntas = PreguntasDiputado.all
  end

end


  # esta clase es para la respuesta del json
  class Mensaje
    attr_accessor :respuesta 
    @respuesta
  end
