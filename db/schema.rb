# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140603015226) do

  create_table "diputados", force: true do |t|
    t.string   "nombre"
    t.string   "email"
    t.text     "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "UrlFoto"
    t.string   "Provincia"
    t.string   "Partido"
    t.integer  "cantidad_asistencias"
    t.integer  "cantidad_proyectos"
    t.text     "texto_proyectos"
    t.text     "texto_comisiones"
    t.string   "sexo"
  end

  add_index "diputados", ["email"], name: "index_diputados_on_email", unique: true
  add_index "diputados", ["remember_token"], name: "index_diputados_on_remember_token"

  create_table "preguntas_diputados", force: true do |t|
    t.text     "pregunta"
    t.text     "respuesta"
    t.integer  "diputado_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "usuario_id"
  end

  add_index "preguntas_diputados", ["diputado_id", "created_at"], name: "index_preguntas_diputados_on_diputado_id_and_created_at"
  add_index "preguntas_diputados", ["usuario_id"], name: "index_preguntas_diputados_on_usuario_id"

  create_table "usuarios", force: true do |t|
    t.string   "nombre"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "token_app_movil"
  end

  add_index "usuarios", ["email"], name: "index_usuarios_on_email", unique: true
  add_index "usuarios", ["token_app_movil"], name: "index_usuarios_on_token_app_movil"

end
