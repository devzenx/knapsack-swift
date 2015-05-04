
import UIKit

func knapsack(weights : Array<Int>, values : Array<Int>, capacity : Int) -> Int {
 
    
    //We create a 2 dimension array to hold our values. We will solve the problem with a dynamic algorithm solution.
    var knapsackArray = Array<Array<Int>>()
    for column in 0...(count(values) - 1) {
        knapsackArray.append(Array(count: capacity + 1, repeatedValue: 0))
    }
    
    for (var j = 1; j <= capacity ; j++) {
        
        for (var i = 1; i < count(values); i++) {
            
            var itemWeight = weights[i]
            if(j >= itemWeight) { //Either not take the item or  take it.
                knapsackArray[i][j] = max(knapsackArray[i - 1][j],knapsackArray[i - 1][j - itemWeight] + values[i])
            } else { // Item is heavier than max value, only solution not to include it
                knapsackArray[i][j] = knapsackArray[i - 1][j]
            }
            
        }
    }
    
    return knapsackArray[count(values) - 1][capacity]
}

// Example

knapsack([1,2,5,6,7],[1,6,18,22,28], 11)






