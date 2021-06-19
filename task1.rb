items =  [100.0, 112.2, 301.1]
discounts = [10.0, 0.0, 0.0]


def Calculation(items, discounts)
  len = items.length
  sum = 0
  for value in 0..len-1 do
    sum += items[value]-Precent(items[value], discounts[value]) 
  end
  puts sum
end

def Precent(price, precent)
  return (price / 100) * precent
end

Calculation(items, discounts)



