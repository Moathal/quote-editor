require "application_system_test_case"

class CompnameaniesTest < ApplicationSystemTestCase
  setup do
    @compnameany = compnameanies(:one)
  end

  test "visiting the index" do
    visit compnameanies_url
    assert_selector "h1", text: "Compnameanies"
  end

  test "should create compnameany" do
    visit compnameanies_url
    click_on "New compnameany"

    fill_in "Name", with: @compnameany.name
    click_on "Create Compnameany"

    assert_text "Compnameany was successfully created"
    click_on "Back"
  end

  test "should update Compnameany" do
    visit compnameany_url(@compnameany)
    click_on "Edit this compnameany", match: :first

    fill_in "Name", with: @compnameany.name
    click_on "Update Compnameany"

    assert_text "Compnameany was successfully updated"
    click_on "Back"
  end

  test "should destroy Compnameany" do
    visit compnameany_url(@compnameany)
    click_on "Destroy this compnameany", match: :first

    assert_text "Compnameany was successfully destroyed"
  end
end
