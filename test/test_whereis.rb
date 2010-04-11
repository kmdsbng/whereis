require 'helper'

class TestWhereis < Test::Unit::TestCase
  should "return file path" do
    assert File.exist?(whereis('date'))
  end

  should "not return part of file path" do
    begin
      whereis('e')
      assert false, 'should raise'
    rescue RuntimeError => x
      assert true
    end
  end
end



