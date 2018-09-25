item = require "item"
basket = require "basket"
Item = item.Item
Basket = basket.Basket

function make_item(name, category, price, imported)
   return Item:new {
      name = name,
      category = category,
      -- Note: prices are encoded in cents in integer objects for precision
      price = price * 100,
      imported = imported
   }
end

local basket1 = {
   {quantity = 2, item = make_item("book", "book", 12.49, false)},  
   {quantity = 1, item = make_item("music CD", "other", 14.99, false)},
   {quantity = 1, item = make_item("chocolate bar", "food", 0.85, false)}
}

local basket2 = {
   {quantity = 1, item = make_item("box of chocolates", "food", 10.00, true)},  
   {quantity = 1, item = make_item("bottle of perfume", "other", 47.50, true)},
}

local basket3 = {
   {quantity = 1, item = make_item("bottle of parfume", "other", 27.99, true)},  
   {quantity = 1, item = make_item("bottle of perfume", "other", 18.99, false)},
   {quantity = 1, item = make_item("packet of headache pills", "medical", 9.75, false)},  
   {quantity = 3, item = make_item("box of chocolates", "food", 11.25, true)},
}

io.write('Output 1:\n')
local b1 = Basket:new(basket1)
basket1:printReceipt()

io.write('\nOutput 2:\n')
local b2 = Basket:new(basket2)
basket2:printReceipt()

io.write('\nOutput 3:\n')
local b3 = Basket:new(basket3)
basket3:printReceipt()
