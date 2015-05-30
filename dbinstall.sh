#!/bin/bash
sudo apt-get update -y
if [[ -z "$(which expect)" ]]
then
  echo "installing expect"
  sudo apt-get install expect -y
fi

if [[ -z "$(which psql)" ]]
then
  echo "installing postgres"
  sudo apt-get install postgresql -y
  ./initialize_postgres.sh
  sudo su postgres -c ./setup_postgres_vagrant_user.sh
  echo "giving vagrant user trust permissions to vagrant database"
  sudo sed -i 's/local   all             all                                     peer/local   all             all                                     peer\nlocal   vagrant             vagrant                                     trust/' /etc/postgresql/9.1/main/pg_hba.conf
  echo "restarting db server"
  sudo /etc/init.d/postgresql restart||echo error $?
fi


if [[ "$(psql -l | grep vagrant | wc -l)" == 0 ]]
then
  echo "creating vagrant database"
  createdb vagrant
else
  echo "vagrant database is already installed....moving on"
fi
psql -c "DROP TABLE IF EXISTS lad_traits;"
psql -d vagrant -c "CREATE TABLE lad_traits (pubmed_id varchar(255), ontology_id varchar(255))"

psql -c "COPY lad_traits FROM '$PWD/lad_traits.csv' WITH DELIMITER '|';"||echo error $?