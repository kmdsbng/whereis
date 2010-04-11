require 'helper'

class TestWhereis < Test::Unit::TestCase
  should "return file path" do
    assert File.exist?(whereis('date'))
  end
end



