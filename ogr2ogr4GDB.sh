#OGR2OGR
ogr2ogr -f "PostgreSQL" PG:"host=localhost port=PORT user=USERNAME dbname=DB" Prime2_Sample_Area.gdb -lco SCHEMA=osi -lco overwrite=YES -progress --config PG_USE_COPY YES
