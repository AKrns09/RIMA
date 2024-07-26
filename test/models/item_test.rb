require "test_helper"

class ItemTest < ActiveSupport::TestCase
#tomato_item:
  #name: tomato
  #info: quantity=15, supplier id=02

#garlic_item:
  #name: garlic
  #info: quantity=23, supplier id=05

  test "should create item" do
    item = Item.new
    item.name = "tomato"
    item.info = "quantity-15, supplier id-02"
    assert item.save
  end

  #ensures that application won't fail if user creates an item without some data
  test "should create item without name" do
    item = Item.new
    item.info = "quantity=15, supplier id=02"
    assert item.save
  end

  test "should delete item" do
    item = Item.new
    item.save
    assert_difference("Item.count", -1) do
      item.destroy
    end
  end

  test "should update item" do
    item = Item.new
    item.save
    item_update_name = "Onion"
    item.update({
      name: item_update_name
    })
    assert_equal(item_update_name, item.name)
  end
end
