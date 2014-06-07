class Api::AsambleaController < ApplicationController

  def diputados
    @diputados = Diputado.all
  end



  def crear_diputado
    @mensaje = Mensaje.new 
    @mensaje.respuesta = "No se pudo crear el diputado"

    @diputado = Diputado.new(:nombre => params[:nombre], :email => params[:email], :password => params[:password],
                             :password_confirmation => params[:password_confirmation], :UrlFoto => params[:url_foto],
                             :descripcion => params[:descripcion], :Provincia => params[:provincia], :Partido => params[:partido],
                             :cantidad_asistencias => params[:cantidad_asistencias], :cantidad_proyectos => params[:cantidad_proyectos],
                             :texto_proyectos => params[:texto_proyectos], :texto_comisiones => params[:texto_comisiones],
                             :sexo => params[:sexo])

    @mensaje.respuesta = "Diputado creado" if @diputado.save
  end



  def diputados_por_provincia
    @total_diputados = Diputado.all
    @diputados = Array.new

    @total_diputados.each do |diputado|
      @diputados.push(diputado) if diputado.Provincia == params[:provincia]
    end
  end



  def diputados_por_partido
    @total_diputados = Diputado.all
    @diputados = Array.new

    @total_diputados.each do |diputado|
      @diputados.push(diputado) if diputado.Partido == params[:partido]
    end
  end



  def busqueda_diputados
    @total_diputados = Diputado.all
    @diputados = Array.new

    @total_diputados.each do |diputado|

      if diputado.nombre.downcase.include? params[:nombre].downcase 
        if diputado.Provincia == params[:provincia]
          if diputado.Partido ==  params[:partido]
     	    @diputados.push(diputado) 
	  end 
        end
      end
    end
  end


  
  def busqueda_asistencias
    @total_diputados = Diputado.find(:all, :order => "cantidad_asistencias desc")
    @diputados = Array.new

    if params[:sexo] == ""
      @diputados = @total_diputados
    else
      @total_diputados.each do |diputado|
        @diputados.push(diputado) if diputado.sexo == params[:sexo]
      end
    end 
  end



  def busqueda_proyectos
    @total_diputados = Diputado.find(:all, :order => "cantidad_proyectos desc")
    @diputados = Array.new

    if params[:sexo] == ""
      @diputados = @total_diputados
    else
      @total_diputados.each do |diputado|
        @diputados.push(diputado) if diputado.sexo == params[:sexo]
      end
    end 
  end 



  def preguntas_diputado
    diputado = Diputado.find_by email: params[:email]
    @preguntas = diputado.preguntas_diputados if diputado
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
      pregunta = diputado.preguntas_diputados.build(pregunta: params[:pregunta], usuario_id: usuario.id, url_foto: params[:url_foto])
      @mensaje.respuesta = "Pregunta agregada correctamente" if pregunta.save 
    end
  end


  
  def preguntas
    @preguntas = Array.new
    usuario = Usuario.find_by token_app_movil: params[:token]
    @total_preguntas = PreguntasDiputado.all
  
    if usuario 
      @total_preguntas.each do |pregunta|
        @preguntas.push(pregunta) if usuario.id == pregunta.usuario_id
      end
    end
  end

end


  # esta clase es para la respuesta del json
  class Mensaje
    attr_accessor :respuesta 
    @respuesta
  end
