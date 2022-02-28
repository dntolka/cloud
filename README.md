################################ BUILD & RUN PROJECT ################################

sudo docker-compose up -d --build

################################ data ################################
################################ mysql ################################

sudo docker cp ./idm_backup/idm.sql db-mysql:/idm.sql

sudo docker exec -it db-mysql /bin/bash

mysql -u root -psecret idm < idm.sql

exit

################################ mongo data storage ################################
sudo docker cp ./volumes_data mongo_db:/volumes_data

sudo docker exec -it mongo_db /bin/bash

mongoimport --host mongo_db --db cloud --collection concerts --type json --file /volumes_data/concerts.json --jsonArray

mongoimport --host mongo_db --db cloud --collection favorites --type json --file /volumes_data/favorites.json --jsonArray

mongoimport --host mongo_db --db cloud --collection feedback --type json --file /volumes_data/feedback.json --jsonArray

exit

################################ mongo orion ################################
sudo docker cp ./volumes_data mongo_db_orion:/volumes_data

sudo docker exec -it mongo_db_orion /bin/bash

mongoimport --host mongo_db_orion --db orion --collection entities --type json --file /volumes_data/entities.json --jsonArray

mongoimport --host mongo_db_orion --db orion --collection csubs --type json --file /volumes_data/csubs.json --jsonArray

exit
