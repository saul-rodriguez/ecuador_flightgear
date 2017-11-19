sudo -u postgres dropdb ecuador
sudo -u postgres createdb --encoding=UTF8 --owner=giuser ecuador
psql --username=postgres --dbname=ecuador -c "CREATE EXTENSION postgis;"
psql --username=postgres --dbname=ecuador -c "CREATE EXTENSION hstore;"
psql --username=postgres -d ecuador -f /home/saul/flightgear/osmosis/script/pgsnapshot_schema_0.6.sql
psql --username=postgres -d ecuador -f /home/saul/flightgear/osmosis/script/pgsnapshot_schema_0.6_bbox.sql

#ecuador 
#~/osmosis --read-pbf file="ecuador-latest.osm.pbf" --bounding-box completeWays=yes top=1.5 left=-81.5 bottom=-5 right=-75 --write-pbf file="sto.pbf"

~/osmosis --read-pbf file="ecuador-latest.osm.pbf" --log-progress --write-pgsql database=ecuador host=localhost:5432 user=giuser password=hola


