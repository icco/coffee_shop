# Makefile (maybe I need a rake file...)

# things this needs to do...
#    generate documentation
#    update website
#    build a binary

all: run

doc: coffee_shop.rb docs/coffee_shop.html
	rm docs/code/*.html
	rocco coffee_shop.rb libs/*rb
	mv coffee_shop.html docs/code/
	mv libs/*html docs/code/

run: doc coffee_shop.rb
	./coffee_shop.rb

webserver: docs/website.rb
	docs/website.rb

