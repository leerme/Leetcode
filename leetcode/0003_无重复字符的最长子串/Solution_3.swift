/*
 给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。

 示例 1:

 输入: "abcabcbb"
 输出: 3
 解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
 示例 2:

 输入: "bbbbb"
 输出: 1
 解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。
 示例 3:

 输入: "pwwkew"
 输出: 3
 解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
      请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/longest-substring-without-repeating-characters
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

class Solution_3 {

    func lengthOfLongestSubstring(_ s: String) -> Int {
      var ans = 0,start = 0,end = 0
        let characters = Array(s)
        var cache:[Character: Int] = [:]
        let length = s.count
        while start < length && end < length {
            let char = characters[end]
            if let cacheVal = cache[char] {
                start = max(start, cacheVal)
            }
            end += 1
            ans = max(ans, end - start)
            cache[char] = end
        }
        return ans
    }
    
//    func lengthOfLongestSubstring(_ s: String) -> Int {
//            var dict = [Character: Int]()
//            var left = 0
//            var result = 0
//            for (index, char) in s.enumerated() {
//                if let charIndex = dict[char] {
//                    left = max(left, charIndex + 1)
//                }
//                dict[char] = index
//                let currentLength = index - left + 1
//                result = max(currentLength, result)
//            }
//            return result
//        }


//    func lengthOfLongestSubstring(_ s: String) -> Int {
//        if s.isEmpty { return 0 }
//        let unicode = s.unicodeScalars.map { Int($0.value) }
//        var indexs = Array(repeating: -1, count: 128)
//        var left = -1
//        var maxCount = 0
//        for i in 0..<unicode.count {
//            left = max(left, indexs[unicode[i]])
//            indexs[unicode[i]] = i
//            maxCount = max(maxCount, i - left)
//        }
//        return maxCount
//    }
    
//    func lengthOfLongestSubstring(_ s: String) -> Int {
//        if(s == ""){
//            return 0
//        }
//        var maxStr = String()
//        var curStr = String()
//        for char in s{
//            while curStr.contains(char) {
//                curStr.remove(at: curStr.startIndex)
//            }
//            curStr.append(char)
//            if(curStr.count > maxStr.count){
//                maxStr = curStr
//            }
//        }
//        return maxStr.count
//    }
//    
//    func lengthOfLongestSubstring1(_ s: String) -> Int {
//      var ans = 0,start = 0,end = 0
//        let characters = Array(s)
//        var cache:[Character: Int] = [:]
//        let length = s.count
//        while start < length && end < length {
//            let char = characters[end]
//            if let cacheVal = cache[char] {
//                start = max(start, cacheVal)
//            }
//            end += 1
//            ans = max(ans, end - start )
//            cache[char] = end
//        }
//        return ans
//    }
}


