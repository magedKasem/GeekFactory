//: Playground - noun: a place where people can play

import UIKit

//selection sort O(n^2)
func selection<type : Comparable>(list : [type]) -> [type]{
    //if list is empty or has only one element return it
    guard list.count > 1 else {
        return list
    }
    //make a copy from the original list
    var sortedList = list
    //loop on each element in the list
    for i in 0 ..< sortedList.count - 1 {
        var lowestElement = i
        //move seletion pivot on list elements
        for j in i+1 ..< sortedList.count{
            if sortedList[j] < sortedList[lowestElement]{
                lowestElement = j
            }
        }
        //swap the lowest element with current array index
        if i != lowestElement{
            swap(&sortedList[i], &sortedList[lowestElement])
        }
    }
    return sortedList
}


selection(list: [2,1,3])
selection(list: ["b","d","a","c"])






