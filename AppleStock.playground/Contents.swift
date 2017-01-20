//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


func getMaxProfit(stockPricesYesterday: [Int]) -> Int{
    
    // O(n^2)
    
    var maxProfit = 0
    
    for outerTime in 0..<stockPricesYesterday.count {
        
        for innerTime in 0..<stockPricesYesterday.count {
            
            var earlierTime = ([outerTime, innerTime]).min()
            var laterTime = ([outerTime, innerTime]).max()
            
            var earlierPrice = stockPricesYesterday[earlierTime!]
            var laterPrice = stockPricesYesterday[laterTime!]
            
            var potentialProfit = laterPrice - earlierPrice
            
            maxProfit = ([maxProfit, potentialProfit]).max()!
            
        }
    }
    return maxProfit
}

var stockPricesYesterday = [10, 7, 5, 8, 11, 9]
getMaxProfit(stockPricesYesterday: stockPricesYesterday)

//won't report a negative profit

/***********************************************************************************************/

func getMaxProfit2(stockPricesYesterday: [Int]) -> Int {
    
    var maxProfit = 0
    var minPrice = stockPricesYesterday[0]
    var maxPrice = 0
    
    for i in 0..<stockPricesYesterday.count {
        
        var currentPrice = stockPricesYesterday[i]
        
        minPrice = ([minPrice, currentPrice]).min()!
        
        var potentialProfit = currentPrice - minPrice
        
        maxProfit = ([maxProfit, potentialProfit]).max()!
        
        if stockPricesYesterday[0] == ([maxPrice, currentPrice]).max() {
            
            var sortedArray = stockPricesYesterday.sorted()
            
            return sortedArray[0] - sortedArray.last!
            
        }
    }
    
    return maxProfit
}

getMaxProfit2(stockPricesYesterday: [11, 10, 9, 8, 7])

/***********************************************************************************************/

// More effective solution, satisfies everything, except if array < 2

func getMaxProfit3(stockPricesYesterday: [Int]) -> Int {

    // update minPrice and maxProfit
    var minPrice = stockPricesYesterday[0]
    var maxProfit = stockPricesYesterday[1] - stockPricesYesterday[0]
    
    // can't sell at first index so start at second index
    for i in 1..<stockPricesYesterday.count {
        
        var currentPrice = stockPricesYesterday[i]
        
        // see what profit would be if we bought at the minPrice and sold at the currentPrice
        var potentialProfit = currentPrice - minPrice
        
        // update maxProfit
        maxProfit = ([maxProfit, potentialProfit]).max()!
        
        //update minPrice so it's always the lowest
        minPrice = ([minPrice, currentPrice]).min()!
    }
    
    return maxProfit
}

getMaxProfit3(stockPricesYesterday: [11, 10, 9, 8, 7])
getMaxProfit3(stockPricesYesterday: [1, 2, 3, 4])
getMaxProfit3(stockPricesYesterday: [10, 7, 5, 8, 11, 9])
