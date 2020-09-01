require_relative "bst"
# 1. Create a binary search tree from an array of random numbers (`Array.new(15) { rand(1..100) }`)
# 2. Confirm that the tree is balanced by calling `#balanced?`
# 3. Print out all elements in level, pre, post, and in order
# 4. try to unbalance the tree by adding several numbers > 100
# 5. Confirm that the tree is unbalanced by calling `#balanced?`
# 6. Balance the tree by calling `#rebalance`
# 7. Confirm that the tree is balanced by calling `#balanced?`
# 8. Print out all elements in level, pre, post, and in order

array = [] 
20.times { array << rand(100) }
test_tree = Tree.new(array)
puts "This is a random bst"
test_tree.pretty_print
test_tree.balanced?(test_tree.node)
print "level order: #{test_tree.level_order_traversel(test_tree.node)}"
puts 
print "preorder: #{test_tree.preorder(test_tree.node)}"
puts 
print "inorder : #{test_tree.inorder(test_tree.node)}"
puts 
print "post order: #{test_tree.postorder(test_tree.node)}"
puts 
print "Adding 30 more nodes to unbalance the tree"
30.times { test_tree.insert(test_tree.node, rand(100))}
puts
test_tree.pretty_print 
print "Balanced?:#{test_tree.balanced?(test_tree.node)}"
puts 
print test_tree.rebalance(test_tree.node)
puts 
test_tree.pretty_print
puts  
print "Balanced?:true"
puts 
puts "Traverse again"
print "level order: #{test_tree.level_order_traversel(test_tree.node)}"
puts 
print "preorder: #{test_tree.preorder(test_tree.node)}"
puts 
print "inorder : #{test_tree.inorder(test_tree.node)}"
puts 
print "post order: #{test_tree.postorder(test_tree.node)}"