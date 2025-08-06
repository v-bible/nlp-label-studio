.PHONY: change-permission
change-permission:
	sudo chmod 777 ./studio-data/*

.PHONY: reset-base
reset-base:
	cp "./label_studio_base.sqlite3" "./studio-data/label_studio.sqlite3"
