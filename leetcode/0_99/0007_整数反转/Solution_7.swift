/*给你一个 32 位的有符号整数 x ，返回将 x 中的数字部分反转后的结果。
 
 如果反转后整数超过 32 位的有符号整数的范围 [−2^31,  2^31 − 1] ，就返回 0。

 假设环境不允许存储 64 位整数（有符号或无符号）。
  

 示例 1：

 输入：x = 123
 输出：321
 示例 2：

 输入：x = -123
 输出：-321
 示例 3：

 输入：x = 120
 输出：21
 示例 4：

 输入：x = 0
 输出：0
 */
import Foundation
class Solution_7 {
    func reverse(_ x: Int) -> Int {
        var nega:Bool = false;
        if x<0 {
            nega = true;
        }
        var s = String(x);
        var rows = Array<Character>.init(repeating: "0", count: s.count);
        for (index,num) in s.enumerated() {
            rows[index] = num;
        }
        
        s = "";
        for (_,num) in rows.enumerated().reversed() {
            s.append(num);
        }

        var count = (s as NSString).integerValue;
        if count > (1<<31-1){
            count = 0;
        }
        if nega {
            count = 0-count;
        }
        return count;
    }
}
