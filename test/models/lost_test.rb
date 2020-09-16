require 'test_helper'

class LostTest < ActiveSupport::TestCase
  test "lost save" do
    lost=Lost.new(
      name:"黒い傘",
      detail:"取っ手が錆びています",
      category:"傘",
      lesson_id:2
    )
    assert lost.save,"保存に失敗だよ"
  end
end
