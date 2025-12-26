.PHONY: change-permission
change-permissions:
	sudo chmod 777 ./studio-data/label_studio.sqlite3

.PHONY: reset-base
reset-base:
	cp "./label_studio_base.sqlite3" "./studio-data/label_studio.sqlite3"
