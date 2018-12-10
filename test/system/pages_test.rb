require "application_system_test_case"

class PagesTest < ApplicationSystemTestCase
  test "visiting the root" do
    visit '/'
    assert_selector "h1", text: "CircuitKing"
  end

  test "visit circuits#index page" do
    visit '/circuits'
    assert_selector ".circuit-card", count: Circuit.count
  end
end
