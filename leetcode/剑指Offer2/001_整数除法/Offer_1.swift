/*给定两个整数 a 和 b ，求它们的除法的商 a/b ，要求不得使用乘号 '*'、除号 '/' 以及求余符号 '%' 。
 注意：
 整数除法的结果应当截去（truncate）其小数部分，例如：truncate(8.345) = 8 以及 truncate(-2.7335) = -2
 假设我们的环境只能存储 32 位有符号整数，其数值范围是 [−231, 231−1]。本题中，如果除法结果溢出，则返回 231 − 1
 
 示例 1：
 输入：a = 15, b = 2
 输出：7
 解释：15/2 = truncate(7.5) = 7
 示例 2：

 输入：a = 7, b = -3
 输出：-2
 解释：7/-3 = truncate(-2.33333..) = -2
 示例 3：

 输入：a = 0, b = 1
 输出：0
 
 示例 4：

 输入：a = 1, b = 1
 输出：1
  
 提示:
 -231 <= a, b <= 231 - 1
 b != 0

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/xoh6Oh
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。*/
import Foundation

class Offer_1 {
    func divide(_ a: Int, _ b: Int) -> Int {
        var dividend = a;
        var divisor = b;
        var rev = false;
        if (dividend > 0) {
            dividend = -dividend;
            rev = !rev;
        }
        if (divisor > 0) {
            divisor = -divisor;
            rev = !rev;
        }
        
        var left = 1;
        var right = INT32_MAX;
        var ans = 0;
        while (left <= right) {
            // 注意溢出，并且不能使用除法
            var mid = left + ((Int(right) - left) >> 1);
            var check = quickAdd(divisor, mid, dividend);
            if (check) {
                ans = mid;
                // 注意溢出
                if (mid == INT_MAX) {
                    break;
                }
                left = mid + 1;
            }
            else {
                right = Int32(mid - 1);
            }
        }
        return rev ? -ans : ans;
    }
    
    
    func quickAdd(_ y: Int, _ w: Int, _ x: Int) -> Bool {
        // x 和 y 是负数，z 是正数
        // 需要判断 z * y >= x 是否成立
        var result = 0;
        var add = y;
        var z = w;
        while ((z) != 0) {
            if ((z & 1) != 0) {
                // 需要保证 result + add >= x
                if (result < x - add) {
                    return false;
                }
                result += add;
            }
            if (z != 1) {
                // 需要保证 add + add >= x
                if (add < x - add) {
                    return false;
                }
                add += add;
            }
            // 不能使用除法
            z >>= 1;
        }
        return true;
    }
}
