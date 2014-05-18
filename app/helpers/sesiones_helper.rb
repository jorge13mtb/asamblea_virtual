module SesionesHelper

def sign_in(diputado)
    remember_token = Diputado.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    diputado.update_attribute(:remember_token, Diputado.digest(remember_token))
    self.current_diputado = diputado
  end


  def signed_in?
    !current_diputado.nil?
  end

  def current_diputado=(diputado)
    @current_diputado = diputado
  end


  def current_diputado
    remember_token = Diputado.digest(cookies[:remember_token])
    @current_diputado ||= Diputado.find_by(remember_token: remember_token)
  end

  def sign_out
    current_diputado.update_attribute(:remember_token, Diputado.digest(Diputado.new_remember_token))
    cookies.delete(:remember_token)
    self.current_diputado = nil
  end
end
