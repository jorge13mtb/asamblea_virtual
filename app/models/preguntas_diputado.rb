class PreguntasDiputado < ActiveRecord::Base
  belongs_to :diputado
  default_scope -> { order('created_at DESC') }
  validates :diputado_id, presence: true
  validates :pregunta, presence: true
end
