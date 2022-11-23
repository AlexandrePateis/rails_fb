require "application_system_test_case"

class CostumersTest < ApplicationSystemTestCase
  setup do
    @costumer = costumers(:one)
  end

  test "visiting the index" do
    visit costumers_url
    assert_selector "h1", text: "Costumers"
  end

  test "should create costumer" do
    visit costumers_url
    click_on "New costumer"

    fill_in "Email", with: @costumer.email
    fill_in "Nascimento", with: @costumer.nascimento
    fill_in "Nome", with: @costumer.nome
    fill_in "Telefone", with: @costumer.telefone
    click_on "Create Costumer"

    assert_text "Costumer was successfully created"
    click_on "Back"
  end

  test "should update Costumer" do
    visit costumer_url(@costumer)
    click_on "Edit this costumer", match: :first

    fill_in "Email", with: @costumer.email
    fill_in "Nascimento", with: @costumer.nascimento
    fill_in "Nome", with: @costumer.nome
    fill_in "Telefone", with: @costumer.telefone
    click_on "Update Costumer"

    assert_text "Costumer was successfully updated"
    click_on "Back"
  end

  test "should destroy Costumer" do
    visit costumer_url(@costumer)
    click_on "Destroy this costumer", match: :first

    assert_text "Costumer was successfully destroyed"
  end
end
