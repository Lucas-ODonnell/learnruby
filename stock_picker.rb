def stock_picker(stocks) #indexs are days, stocks are dollar ammounts
    profit = 0
    best_days = []
    stocks.each do |sell|
        stocks.each do |buy|
            if buy < sell && stocks.index(buy) < stocks.index(sell) && sell - buy > profit 
                best_days = [stocks.index(buy), stocks.index(sell)]
                profit = sell - buy #so that eventually we get the most optimal profit
            end
        end
    end
    best_days
end
