//剑指 Offer 24. 反转链表
//定义一个函数，输入一个链表的头节点，反转该链表并输出反转后链表的头节点。
//
//示例:
//输入: 1->2->3->4->5->NULL
//输出: 5->4->3->2->1->NULL
//限制：
//0 <= 节点个数 <= 5000
import Foundation

class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        if(head == nil || head?.next == nil){
            return head;
        }
        
        var node = reverseList(head?.next);
        head?.next?.next = node;
        head?.next = nil;
        return node;
    }
}

func reverseList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        

        let last = reverseList(head?.next)
        head?.next?.next = head
        head?.next = nil
        // 返回的不是 head，此时 head 已经在末尾了
        return last
    }
}
