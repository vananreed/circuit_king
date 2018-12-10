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

  test "visit workout page" do
    @c = Circuit.first
    visit circuit_workout_path(@c)
    assert_selector ".exercise-circuit-name", text: @c.name
  end

  test "visit exercise show page" do
    @e = Exercise.last
    visit exercise_path(@e)
    assert_selector "h3", text: @e.name
  end

  test "visit new exercise page" do
    login_as users(:reed)
    visit '/exercises/new'
    assert_selector ('form')
  end

  test "visit search ace db" do
    login_as users(:reed)
    visit '/search_ace'
    assert_selector ('input')
  end
end
