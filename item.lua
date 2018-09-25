TaxRates = { basic = 10, import = 5 }

function apply_tax(price, rate)
   local tax = price * rate
   local r = tax % 500
   if r ~= 0 then
     tax = tax + (500 - r)
   end
   return tax // 100
end

Item = {}

function Item:new(o)
   o = o or {}
   self.__index = self
   setmetatable(o, self)
   return o
end

function Item:getBasicSalesTaxRate()
   local exempt = (self.category == "book") or (self.category == "food") or (self.category == "medical")
   return exempt and 0 or TaxRates.basic
end

function Item:getImportTaxRate()
   return self.imported and TaxRates.import or 0
end

function Item:getFinalPriceAndTax()
   local rate = self:getBasicSalesTaxRate() + self:getImportTaxRate()
   local tax = apply_tax(self.price, rate)
   return self.price + tax, tax
end

return { Item = Item }

