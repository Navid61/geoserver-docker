#!/bin/bash
set -e

# Download OSM data (replace Iran region PBF link with actual source from Geofabrik)
OSM_PBF_URL="https://download.geofabrik.de/asia/iran-latest.osm.pbf"
curl -L -o /tmp/iran.osm.pbf $OSM_PBF_URL


# Import OSM data into PostGIS using osm2pgsql
osm2pgsql -c "host=postgis dbname=geoserver user=geoserver password=geoserver" -d -S /opt/mapping.yml /tmp/iran.osm.pbf


# # Import OSM data into PostGIS using Imposm
# imposm import \
#   -mapping /opt/mapping.yml \
#   -read /tmp/iran.osm.pbf \
#   -write \
#   -connection postgis://geoserver:geoserver@postgis:5432/geoserver \
#   -overwritecache
