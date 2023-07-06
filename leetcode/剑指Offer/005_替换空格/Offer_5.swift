//请实现一个函数，把字符串 s 中的每个空格替换成"%20"。
//
//
//
//示例 1：
//
//输入：s = "We are happy."
//输出："We%20are%20happy."
//
//
//限制：
//
//0 <= s 的长度 <= 10000
//
//来源：力扣（LeetCode）
//链接：https://leetcode.cn/problems/ti-huan-kong-ge-lcof
//著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

import Foundation

class Offer_5 {
    func replaceSpace(_ s: String) -> String {
        return s.replacingOccurrences(of: " ", with: "%20");
    }
    func replaceSpace1(_ s: String) -> String {
        var result = ""
        for c in s {
            if(c == " "){
                result.append("%20")
            }else{
                result.append(c);
            }
        }
        return result
    }
    
    func replaceSpace2(_ s: String) -> String {
        var res = ""
        res = s.reduce("", { str, ch in
            if ch == " " {
                return str + "%20"
            } else {
                return str + String(ch)
            }
        })
        print(res)
        return res
    }
//    func replaceSpace(_ s: String) -> String {
//            var str = ""
//            for c in s {
//                if c == " " {
//                    str.append("%20")
//                } else {
//                    str.append(c)
//                }
//            }
//            return str
//        }

}
