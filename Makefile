# Makefile (maybe I need a rake file...)

# things this needs to do...
#    generate documentation
#    update website
#    build a binary

doc: coffee_shop.rb
	rocco coffee_shop.rb
	mv coffee_shop.html docs/
