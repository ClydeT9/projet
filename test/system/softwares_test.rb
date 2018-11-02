require "application_system_test_case"

class SoftwaresTest < ApplicationSystemTestCase
  setup do
    @software = softwares(:one)
  end

  test "visiting the index" do
    visit softwares_url
    assert_selector "h1", text: "Softwares"
  end

  test "creating a Software" do
    visit softwares_url
    click_on "New Software"

    fill_in "Description", with: @software.description
    fill_in "Editor", with: @software.editor
    fill_in "Littledescription", with: @software.littledescription
    fill_in "Slogan", with: @software.slogan
    fill_in "Software Type", with: @software.software_type
    fill_in "Software Url", with: @software.software_url
    fill_in "Title", with: @software.title
    click_on "Create Software"

    assert_text "Software was successfully created"
    click_on "Back"
  end

  test "updating a Software" do
    visit softwares_url
    click_on "Edit", match: :first

    fill_in "Description", with: @software.description
    fill_in "Editor", with: @software.editor
    fill_in "Littledescription", with: @software.littledescription
    fill_in "Slogan", with: @software.slogan
    fill_in "Software Type", with: @software.software_type
    fill_in "Software Url", with: @software.software_url
    fill_in "Title", with: @software.title
    click_on "Update Software"

    assert_text "Software was successfully updated"
    click_on "Back"
  end

  test "destroying a Software" do
    visit softwares_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Software was successfully destroyed"
  end
end
