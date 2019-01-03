# frozen_string_literal: true

require 'test_helper'

class BestiaryControllerControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get bestiary_controller_index_url
    assert_response :success
  end

  test 'should get novigrad_monsters' do
    get bestiary_controller_novigrad_monsters_url
    assert_response :success
  end
end
