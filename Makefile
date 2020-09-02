add-journal:
	git add _journals/* && git commit -m "added journal" && git push origin master

add-note:
	git add _notes/* && git add _wiki/* && git commit -m "added note and wiki" && git push origin master

add-all:
	git add _journals/* && git add _notes/* && git add _wiki/* && git commit -m "added all" && git push origin master
