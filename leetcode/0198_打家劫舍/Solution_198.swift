/*
 你是一个专业的小偷，计划偷窃沿街的房屋。每间房内都藏有一定的现金，影响你偷窃的唯一制约因素就是相邻的房屋装有相互连通的防盗系统，如果两间相邻的房屋在同一晚上被小偷闯入，系统会自动报警。

给定一个代表每个房屋存放金额的非负整数数组，计算你 不触动警报装置的情况下 ，一夜之内能够偷窃到的最高金额。
 示例 1：

 输入：[1,2,3,1]
 输出：4
 解释：偷窃 1 号房屋 (金额 = 1) ，然后偷窃 3 号房屋 (金额 = 3)。
      偷窃到的最高金额 = 1 + 3 = 4 。
 示例 2：

 输入：[2,7,9,3,1]
 输出：12
 解释：偷窃 1 号房屋 (金额 = 2), 偷窃 3 号房屋 (金额 = 9)，接着偷窃 5 号房屋 (金额 = 1)。
      偷窃到的最高金额 = 2 + 9 + 1 = 12 。
 提示：
 0 <= nums.length <= 100
 0 <= nums[i] <= 400
来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/house-robber
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

import Foundation
class Solution_198 {
    func rob(_ nums: [Int]) -> Int {
        var sum1 = 0;
        var sum2 = 0;
        for i in 0..<nums.count {
            if i%2 == 0 {
                sum2 += nums[i];
                sum2 = max(sum1, sum2);
            }else{
                sum1 += nums[i];
                sum1 = max(sum1, sum2);
            }
        }
        return max(sum1, sum2);
    }
    
///方法一：递归 结果正确，超时
//    func rob(_ nums: [Int]) -> Int {
//        if nums.count == 0 {
//            return 0
//        }
//        if nums.count == 1 {
//            return nums[0];
//        }
//        return self.robFirstToIndex(nums: nums, index: nums.count-1);
//    }
//
//    func robFirstToIndex(nums:[Int],index:Int) -> Int {
//        if index == 0 {
//            return nums[0];
//        }
//        if index == 1 {
//            return max(nums[0], nums[1]);
//        }
//        let x1 = self.robFirstToIndex(nums: nums, index: index-1);
//        let x2 = self.robFirstToIndex(nums: nums, index: index - 2) + nums[index];
//        return max(x1, x2);
//    }
    
///方法二：数组缓存次数 减少递归
//    func rob(_ nums: [Int]) -> Int {
//        if nums.count == 0 {
//            return 0
//        }
//        if nums.count == 1 {
//            return nums[0];
//        }
//        var array: [Int] = Array()
//        array.append(nums[0]);
//        array.append(max(nums[0], nums[1]));
//        for index in 2..<nums.count {
//            array.append(max(array[index-2]+nums[index], array[index-1]));
//        }
//        return array[nums.count-1];
//    }

///方法三：用变量代替数组
//    func rob(_ nums: [Int]) -> Int {
//        if nums.count == 0 {
//            return 0
//        }
//        if nums.count == 1 {
//            return nums[0];
//        }
//        var maxFirst = nums[0];
//        var maxNext = max(nums[0], nums[1]);
//        var temp = 0;
//        for index in 2..<nums.count {
//            temp = maxNext;
//            maxNext = max(maxFirst + nums[index],maxNext);
//            maxFirst = temp;
//        }
//        return maxNext;
//    }
    
}



