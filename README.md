# Some Experiments with Vectortiles

Please read the original [README](README-original.md).

This is a fork of [https://github.com/osm2vectortiles/mapbox-gl-styles](https://github.com/osm2vectortiles/mapbox-gl-styles) - which I use as a base for some experiments with vectortiles. The goals are:

- Explore the toolchain and workflow
- Display offline vectortile data 

## Data

A good overview about creating the vectortile data from osm is given in the youtube video [2016 - FOSS4G: Create Vector Tiles from OpenStreetMap](https://www.youtube.com/watch?v=D7mmXonFIqA).

Download vectortiles (`.mbtiles`) data from here: [http://osm2vectortiles.org/downloads/](http://osm2vectortiles.org/downloads/).

**Note:** The files hosted on osm2vectortiles only go to zoom level 14, and they
seem a bit patchy to me.


## Tileserver ##

### Install

`npm install -g tileserver-gl-light`

### Run ###

`tileserver-gl-light switzerland.mbtiles`

`http://localhost:8080//data/osm2vectortiles/4/6/5.pbf` is the URL of the tile pbf at `4/6/5`.


## Server ##

`python -m SimpleHTTPServer` serves you the `index.html` file and all else.

## Makefile ##

The [Makefile](Makefile) has three targets:

- `server` runs the python HTTP server
- `tileserver` runs the tileserver
- `download` gets you the vectortiles from Rome, Italy

## Convert `.mbtiles` file to directory tree of `.pbf`##

Use [mbutil](https://github.com/mapbox/mbutil).

```bash
pip install mbutil
rehash
```

The first step is to run the python command line utility `mb-util` just obtained:

```bash
mb-util ./rome_italy.mbtiles ./rome_italy/
``` 

The result is a directory tree of the form `./rome_italy/{z}/{x}/{y}.png`. Although the filetype indicates `png` files they are in fact gzipped `pbf` files.

Run the bash script [`convert.sh`](convert.sh) to do the gunzipping:

```bash
./convert.sh rome_italy/	# unzip the png's into pbf's, delete the png's
```


## Other stuff to look at ##

- [https://github.com/klokantech/mapbox-gl-js-offline-example](https://github.com/klokantech/mapbox-gl-js-offline-example) has an example for displaying offline vectortiles. The vectortile `.pbf` files are extracted from the `.mbtiles` file and served from there. That eliminates the tileserver.
- todo