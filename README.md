This project automates installing and setting up a postgres database with an initial user, database, table and data. We can leverage it to build test databases
for any future projects that involve database interactions


To test simply
* run `vagrant up`
* Navigate to `cd /var/www/sites/deploy_postgres/`
* run `./dbinstall.sh`

This should install a Postgres database with a user `vagrant` and a database table `lad_traits`
The pg_hba.conf should have a vagrant user with trust priviledges to the `vagrant` database
