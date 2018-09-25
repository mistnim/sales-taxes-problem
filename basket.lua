function print_item(quantity, imported, name, price)
   local pricefmt = string.format("%.02f", price / 100)
   io.write(quantity, ' ', imported and 'imported ' or '', name, ' at ', pricefmt, '\n') 
end

Basket = {}

function Basket:new(o)
   o = o or {}
   self.__index = self
   setmetatable(o, self)
   return o
end

function Basket:printReceipt()
   local total_price = 0
   local total_tax = 0
   for _, element in ipairs(self) do
      local item, quantity = element.item, element.quantity
      local price, tax = item:getFinalPriceAndTax()
      price, tax = price * quantity, tax * quantity
      total_price = total_price + price
      total_tax = total_tax + tax
      print_item(element.quantity, item.imported, item.name, price)
   end
   io.write(string.format('Sales Taxes: %.02f\n', total_tax / 100))
   io.write(string.format('Total: %.02f\n', total_price / 100))
end

return { Basket = Basket }
