使用Aspect实现打点功能

Aspect:面向切面编程

Method Swizzling 利用 Runtime 特性把一个方法的实现与另一个方法的实现进行替换。

方法：使用 Method Swizzling替换UIContol 中的sendAction:to:forEvent:方法，在替换的方法中加入打点代码

这些代码不能实现手势的打点，对于UITableView，是替换cell的点击响应函数