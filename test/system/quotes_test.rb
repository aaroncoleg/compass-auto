require "application_system_test_case"

class QuotesTest < ApplicationSystemTestCase
  setup do
    @quote = quotes(:one)
  end

  test "visiting the index" do
    visit quotes_url
    assert_selector "h1", text: "Quotes"
  end

  test "creating a Quote" do
    visit quotes_url
    click_on "New Quote"

    fill_in "Customer", with: @quote.customer_id
    fill_in "Inventory", with: @quote.inventory_id
    fill_in "Price", with: @quote.price
    fill_in "Sold", with: @quote.sold
    click_on "Create Quote"

    assert_text "Quote was successfully created"
    click_on "Back"
  end

  test "updating a Quote" do
    visit quotes_url
    click_on "Edit", match: :first

    fill_in "Customer", with: @quote.customer_id
    fill_in "Inventory", with: @quote.inventory_id
    fill_in "Price", with: @quote.price
    fill_in "Sold", with: @quote.sold
    click_on "Update Quote"

    assert_text "Quote was successfully updated"
    click_on "Back"
  end

  test "destroying a Quote" do
    visit quotes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Quote was successfully destroyed"
  end
end
