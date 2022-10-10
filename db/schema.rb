# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_10_09_203717) do
  create_table "academia", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.string "cnpj"
    t.string "contato"
    t.boolean "ativo"
    t.integer "proprietario_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["proprietario_id"], name: "index_academia_on_proprietario_id"
  end

  create_table "alunos", force: :cascade do |t|
    t.string "nome"
    t.string "cpf"
    t.date "data_nascimento"
    t.string "contato"
    t.string "senha"
    t.integer "academium_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["academium_id"], name: "index_alunos_on_academium_id"
  end

  create_table "enderecos", force: :cascade do |t|
    t.string "logradouro"
    t.string "cep"
    t.integer "instrutor_id"
    t.integer "aluno_id"
    t.integer "academium_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["academium_id"], name: "index_enderecos_on_academium_id"
    t.index ["aluno_id"], name: "index_enderecos_on_aluno_id"
    t.index ["instrutor_id"], name: "index_enderecos_on_instrutor_id"
  end

  create_table "exercicios", force: :cascade do |t|
    t.string "titulo"
    t.string "dificuldade"
    t.string "calorias"
    t.text "descricao"
    t.integer "quantidade"
    t.string "tipo"
    t.integer "academium_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["academium_id"], name: "index_exercicios_on_academium_id"
  end

  create_table "instrutors", force: :cascade do |t|
    t.string "nome"
    t.string "cpf"
    t.date "data_nascimento"
    t.string "contato"
    t.integer "academium_id", null: false
    t.time "horario_trabalho"
    t.string "email"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["academium_id"], name: "index_instrutors_on_academium_id"
  end

  create_table "proprietarios", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "nome"
    t.string "endereco"
    t.string "cep"
    t.string "cpf"
    t.date "data_nascimento"
    t.string "contato"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_proprietarios_on_email", unique: true
    t.index ["reset_password_token"], name: "index_proprietarios_on_reset_password_token", unique: true
  end

  add_foreign_key "academia", "proprietarios"
  add_foreign_key "alunos", "academia"
  add_foreign_key "enderecos", "academia"
  add_foreign_key "enderecos", "alunos"
  add_foreign_key "enderecos", "instrutors"
  add_foreign_key "exercicios", "academia"
  add_foreign_key "instrutors", "academia"
end
