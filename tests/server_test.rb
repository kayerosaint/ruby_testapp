require_relative './test_helper'

# Server test - test cases for main server module
class ServerTest < Minitest::Test
  def test_ping
    get '/ping'
    assert last_response.ok?
    assert_equal 'pong', last_response.body
  end

  def test_health_check
    get '/health_check'
    assert last_response.ok?
    assert_equal 'success', last_response.body
  end

  def test_stress
    get '/stress', timeout: 1
    assert last_response.ok?
    assert last_response.body.include?('stressed')
  end
end
