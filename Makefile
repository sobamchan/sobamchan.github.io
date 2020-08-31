add-journal:
	git add _journals/* && git commit -m "added journal" && git push origin master

add-note:
	git add _notes && git commit -m "added note" && git push origin master
