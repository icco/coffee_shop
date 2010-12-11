# Nathaniel Welch's Senior Project Report 

This quarter was an interesting quarter for my senior project. According to my commit log[1], I have rewritten over 90% of the code I wrote during the summer. When I read through my project notes[2], I notice that there were definite struggling points this quarter, even if I ignore the fact that I poorly managed my time on occasion. My biggest struggling point this quarter continued to be the disconnect I have discovered between developing software for the web and developing desktop software.

First off, I would like to bring attention to an article I read recently, titled "Web Programming is Hard"[3]. In the article, the author talks about how her history with embedded C programming and the Qt framework does not translate at all to working in the web world. I found the whole hilarious, because I am struggling from the exact opposite problem. I find the web easy. The stateless world of the web where, thanks to incredibly powerful JavaScript rendering engines, you can modify your entire canvas without any issues, and if you want to change anything substantially, you can just force a page refresh. But what do I find difficult? Qt. Specifically the world in which Qt resides. You have hundreds of objects that make up a single application, and if you need to modify anything, you have to get a handle to the instantiated object so you change explicitly change its state[4]. I'm not sure I'd say that Qt(and desktop application development in general) is difficult, but rather it requires a different mindset.

This quarter has taught me and shown me that I don't enjoy this different mindset. I am glad there are people in this world who do enjoy it, but I have discovered that it is not for me. What is cool though is finding out about different ways to solve problems and how when developing for the desktop, you have to deal with different types of optimizations. I will forever remember the struggles I went through trying to figure out pagination.

Anyway, lets look towards the future. Over winter break, I plan on trying to code up a few last changes to coffee_shop to get it to a place where I am happy, and then spend most of next quarter focused on my paper. I think I have some interesting points to make about desktop application development, so I'm looking forward to writing that.

Till next quarter,
Nathaniel Welch.

Sources:

1. GitHub Commit Log - https://github.com/icco/coffee_shop/compare/639a44c...HEAD
2. Project Notes - http://coffee-shop.heroku.com/notes
3. Web Programming is Hard - http://www.shubharamani.com/wordpress/?p=31
4. QTextEdit - http://doc.trolltech.com/4.7/qtextedit.html
