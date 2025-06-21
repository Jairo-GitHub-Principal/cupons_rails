require "application_system_test_case"

class CuponsTest < ApplicationSystemTestCase
  setup do
    @cupon = cupons(:one)
  end

  test "visiting the index" do
    visit cupons_url
    assert_selector "h1", text: "Cupons"
  end

  test "should create cupon" do
    visit cupons_url
    click_on "New cupon"

    fill_in "Code", with: @cupon.code_id
    fill_in "Description", with: @cupon.description
    fill_in "Url image", with: @cupon.url_image
    click_on "Create Cupon"

    assert_text "Cupon was successfully created"
    click_on "Back"
  end

  test "should update Cupon" do
    visit cupon_url(@cupon)
    click_on "Edit this cupon", match: :first

    fill_in "Code", with: @cupon.code_id
    fill_in "Description", with: @cupon.description
    fill_in "Url image", with: @cupon.url_image
    click_on "Update Cupon"

    assert_text "Cupon was successfully updated"
    click_on "Back"
  end

  test "should destroy Cupon" do
    visit cupon_url(@cupon)
    click_on "Destroy this cupon", match: :first

    assert_text "Cupon was successfully destroyed"
  end
end
