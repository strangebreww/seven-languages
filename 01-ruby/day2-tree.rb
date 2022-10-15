class Tree
	attr_accessor :children, :node_name

	def initialize(tree = {})
		name, children = tree.first

		@node_name = name
		@children = []

		children.each do |key, value|
			@children.push(Tree.new({ key => value }))
		end
	end

	def visit_all(&block)
		visit &block
		@children.each {|c| c.visit_all &block}
	end

	def visit(&block)
		block.call self
	end
end

ruby_tree = Tree.new({
	'grandpa' => {
		'dad' => {
			'child1' => {},
			'child2' => {}
		},
		'uncle' => {
			'child3' => {},
			'child4' => {}
		}
	}
})

puts "Visiting a node"
ruby_tree.visit {|node| puts node.node_name}
puts

puts "Visiting entire tree"
ruby_tree.visit_all {|node| puts node.node_name}
