require "test_helper"

class AcademiaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @academium = academia(:one)
  end

  test "should get index" do
    get academia_url
    assert_response :success
  end

  test "should get new" do
    get new_academium_url
    assert_response :success
  end

  test "should create academium" do
    assert_difference("Academium.count") do
      post academia_url, params: { academium: { ativo: @academium.ativo, contato: @academium.contato, cpf: @academium.cpf, email: @academium.email, endereco: @academium.endereco, id_proprietario: @academium.id_proprietario, integer: @academium.integer, nome: @academium.nome } }
    end

    assert_redirected_to academium_url(Academia.last)
  end

  test "should show academium" do
    get academium_url(@academium)
    assert_response :success
  end

  test "should get edit" do
    get edit_academium_url(@academium)
    assert_response :success
  end

  test "should update academium" do
    patch academium_url(@academium), params: { academium: { ativo: @academium.ativo, contato: @academium.contato, cpf: @academium.cpf, email: @academium.email, endereco: @academium.endereco, id_proprietario: @academium.id_proprietario, integer: @academium.integer, nome: @academium.nome } }
    assert_redirected_to academium_url(@academium)
  end

  test "should destroy academium" do
    assert_difference("Academium.count", -1) do
      delete academium_url(@academium)
    end

    assert_redirected_to academia_url
  end
end
