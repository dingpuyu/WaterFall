# -  描述
    一个简单地瀑布流的实现，瀑布流的实现一般有三种方式，tableview，collectionview，自定义scrollview。这里写的是自定义的collectionviewFlowLayout实现的瀑布流，貌似图片有些多。主要重写两个方法，-(NSArray*)layoutAttributesForElementsInRect:(CGRect)rect和-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath。
# -  使用方法
    自定义的collectionviewFlowLayout里有几个属性是可决定一些事情的，比如numberOfRow列数，列边距rowMargin,行边距colMargin.这些根据自己情况进行修改，能够实现各种需求
# WaterFall
# WaterFall
# WaterFall
# WaterFall
