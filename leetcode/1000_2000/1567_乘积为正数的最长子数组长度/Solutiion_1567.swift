/*
 
 给你一个整数数组 nums ，请你求出乘积为正数的最长子数组的长度。

 一个数组的子数组是由原数组中零个或者更多个连续数字组成的数组。

 请你返回乘积为正数的最长子数组长度。

 输入：nums = [1,-2,-3,4]
 输出：4
 解释：数组本身乘积就是正数，值为 24 。
 示例 2：

 输入：nums = [0,1,-2,-3,-4]
 输出：3
 解释：最长乘积为正数的子数组为 [1,-2,-3] ，乘积为 6 。
 注意，我们不能把 0 也包括到子数组中，因为这样乘积为 0 ，不是正数。
 示例 3：

 输入：nums = [-1,-2,-3,0,1]
 输出：2
 解释：乘积为正数的最长子数组是 [-1,-2] 或者 [-2,-3] 。
 示例 4：

 输入：nums = [-1,2]
 输出：1
 示例 5：

 输入：nums = [1,2,3,5,-6,4,0,10]
 输出：4

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/maximum-length-of-subarray-with-positive-product
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation

class Solution_1567 {
    func getMaxLen(_ nums: [Int]) -> Int {
        var positive = Array.init(repeating: 0, count: nums.count);
        var negative = Array.init(repeating: 0, count: nums.count);
        var maxLength = 0;
        if nums[0] > 0 {
            positive[0] = 1;
        }else if nums[0] < 0 {
            negative[0] = 1;
        }
        
        if nums.count == 1 {
            return positive[0];
        }
        
        for i in 1..<nums.count {
            if nums[i] > 0 {
                positive[i] = positive[i-1] + 1;
                negative[i] = (negative[i-1] > 0) ? negative[i-1] + 1 : 0;
            } else if nums[i] < 0 {
                positive[i] = (negative[i-1] > 0) ? negative[i-1] + 1 : 0;
                negative[i] = positive[i-1] + 1;
            } else {
                positive[0] = 0;
                negative[0] = 0;
            }
            maxLength = max(maxLength, positive[i]);
        }
        return maxLength;
    }
//    func getMaxLen(_ nums: [Int]) -> Int {
//        return 0;
//    }
}
