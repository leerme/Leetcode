/*给定一个整数数组 nums ，找到一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。
 示例 1：
 输入：nums = [-2,1,-3,4,-1,2,1,-5,4]
 输出：6
 解释：连续子数组 [4,-1,2,1] 的和最大，为 6 。
 示例 2：
 输入：nums = [1]
 输出：1
 示例 3：
 输入：nums = [0]
 输出：0
 示例 4：
 输入：nums = [-1]
 输出：-1
 示例 5：
 输入：nums = [-100000]
 输出：-100000
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/maximum-subarray
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

class Solution_53 {
    //官方动态规划 Kanade算法
    func maxSubArray(_ nums: [Int]) -> Int {
        var maxCount = nums[0];
        var tempCount = 0;
        for item in nums {
            tempCount = max(tempCount+item, item);
            maxCount = max(maxCount, tempCount);
        }
        return maxCount;
    }
// 自己想的双指针方法
//    func maxSubArray(_ nums: [Int]) -> Int {
//        var maxCount = nums[0];
//        var i = 0;
//        var j = 0;
//        var temp = 0;
//        while j<nums.count {
//            temp += nums[j];
//            maxCount = max(temp, maxCount);
//            if temp <= 0 {
//                temp = 0;
//                i += 1;
//                j = i;
//                temp = 0;
//            }else{
//                j += 1;
//            }
//        }
//        return maxCount;
//    }
}
