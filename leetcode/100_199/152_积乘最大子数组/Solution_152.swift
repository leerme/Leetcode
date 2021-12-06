/*
 给你一个整数数组 nums ，请你找出数组中乘积最大的连续子数组（该子数组中至少包含一个数字），并返回该子数组所对应的乘积。
 示例 1:
 输入: [2,3,-2,4]
 输出: 6
 解释: 子数组 [2,3] 有最大乘积 6。
 示例 2:
 
 输入: [-2,0,-1]
 输出: 0
 解释: 结果不能为 2, 因为 [-2,-1] 不是子数组。
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/maximum-product-subarray
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation
class Solution_152 {
    func maxProduct(_ nums: [Int]) -> Int {
        if nums.count == 1 {
            return nums[0];
        }
        var maxF = nums[0];
        var minF = nums[0];
        var ans = nums[0];
        for i in 1..<nums.count-1 {
            let mx = maxF, mn = minF;
            maxF = max(mx*nums[i], max(mn*nums[i], nums[i]));
            minF = min(mn*nums[i], min(mx*nums[i], nums[i]));
            ans = max(maxF, ans);
        }
        return ans;
    }
}
