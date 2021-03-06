//
//  main.swift
//  DynamicProgramming
//
//  Created by ggl on 2020/8/21.
//  Copyright © 2020 ggl. All rights reserved.
//  动态规划

import Foundation

var items = [Int]()
var values = [Int]()

let count = 10
// 物品装量
for _ in 0..<count {
    let num = Int.random(in: 0...30)
    items.append(num)
}

// 物品价值
for _ in 0..<count {
    let value = Int.random(in: 0...10)
    values.append(value)
}

// 背包承重
var loadBearing = Int.random(in: 80...100)

print("============动态规划0-1背包问题，备忘录优化==============")
let packageResult = find(items: items, loadBearing: loadBearing)
print("物品: \(items)，背包承重: \(loadBearing), 最大可放入物品总重量: \(packageResult.weight), 背包物品: \(packageResult.items)")

print("\n============动态规划0-1背包问题，动态规划方式==============")
let maxWeight = knapsack(items: items, loadBearing: loadBearing)
print("物品: \(items)，背包承重: \(loadBearing), 最大可放入物品总重量: \(maxWeight)")

print("\n============动态规划0-1背包问题，动态规划方式，空间优化==============")
let maxWeight2 = knapsack2(items: items, loadBearing: loadBearing)
print("物品: \(items)，背包承重: \(loadBearing), 最大可放入物品总重量: \(maxWeight2)")

print("\n============动态规划0-1背包问题，动态规划方式，背包问题升级，输出最大价值==============")
let (weight, maxValue) = knapsack3(items: items, values: values, loadBearing: loadBearing)
print("物品: \(items), 价值: \(values), 背包承重: \(loadBearing), 重量: \(weight), 最大可放入物品总重量价值为: \(maxValue)")

print("\n============动态规划0-1背包问题，双11购物车问题，输出合适的价格范围==============")

// 购物车商品价格
var shoppingPrices = [Int]()
for _ in 0..<5 {
    let price = Int.random(in: 0...100)
    shoppingPrices.append(price)
}
// 特殊示例，求解可能会产生问题
// shoppingPrices = [68, 64, 32, 41, 88]

// 200元优惠券
let coupon = 200

// 结果
let shoppingResult = shoppingCart(items: shoppingPrices, coupon: coupon)
print("购物车商品价格: \(shoppingPrices), 优惠券价值: \(coupon), 可使用优惠券购买最优惠价格范围为: \(shoppingResult.price)")
for i in 0..<shoppingResult.price.count {
    print("可使用优惠券购买最优惠价格范围为: \(shoppingResult.price[i]), 对应购买的商品清单为: \(shoppingResult.items[i])(\(shoppingResult.items[i].reduce(0) { $0 + $1 }))")
}

print("\n============动态规划杨辉三角问题==============")
let triangleItems = [5, 7, 8, 2, 3, 4, 4, 9, 6, 1, 2, 7, 9, 4, 5]
print("杨辉三角数组元素: \(triangleItems)")
let resultPath = yanghuiTriangleShortestPath(triangleItems: triangleItems)
print("动态规划求解最短路径为: \(resultPath)")

let resultPath1 = yanghuiTriangleShortestPath2(triangleItems: triangleItems)
print("回溯算法求解最短路径为: \(resultPath1)")

print("\n============动态规划棋盘问题==============")
let chessboardItems = [
    [1, 2, 5, 6],
    [3, 1, 2, 8],
    [5, 3, 6, 4],
    [9, 4, 7, 3],
]
print("棋盘数据: ")
for i in 0..<chessboardItems.count {
    for j in 0..<chessboardItems.count {
        print("\(chessboardItems[j][i]) ", terminator: "")
    }
    print("")
}
print("")

let shortestDist = chessboardMinDist(chessboard: chessboardItems)
print("回溯算法求解棋盘最短路径为: \(shortestDist)")

let shortestDist1 = chessboardMinDistDP(chessboard: chessboardItems)
print("动态规划通过状态转移表求解棋盘最短路径为: \(shortestDist1)")

let shortestDist2 = chessboardMinDistDP1(chessboard: chessboardItems)
print("动态规划通过状态转移方程求解棋盘最短路径为: \(shortestDist2)")


print("\n============动态规划硬币找零问题==============")
let coinItems = [1, 3, 5]
let totalPaty = 9
let finalCoinCount = coinChange(coinItems: coinItems, totalPay: totalPaty)
let finalCoinCount1 = coinChangeRecursion(coinItems: coinItems, totalPay: totalPaty)
print("\n动态规划方式硬币数组: \(coinItems), 需要支付: \(totalPaty)元, 最少需要硬币个数: \(finalCoinCount)")
print("回溯算法方式硬币数组: \(coinItems), 需要支付: \(totalPaty)元, 最少需要硬币个数: \(finalCoinCount1)")
