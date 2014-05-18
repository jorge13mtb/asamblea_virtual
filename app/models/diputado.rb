class Diputado < ActiveRecord::Base
  before_save { self.email = email.downcase }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :nombre, presence: true
  validates :email, presence: true, 
		    format: { with: VALID_EMAIL_REGEX }, 
 		    uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, length: { minimum: 6 }

 def Diputado.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def Diputado.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = Diputado.digest(Diputado.new_remember_token)
    end

end
