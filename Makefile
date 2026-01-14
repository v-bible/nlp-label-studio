.PHONY: change-permission
change-permissions:
	mkdir -p studio-data && sudo chmod -R 777 studio-data

.PHONY: reset-base
reset-base:
	cp "./label_studio_base.sqlite3" "./studio-data/label_studio.sqlite3"
