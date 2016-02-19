# **Google's WebGL Globe**

![](https://4.bp.blogspot.com/-nB6XnTgb4AA/TcLQ4gRBtfI/AAAAAAAAH-U/vb2GuhPN6aM/globe.png)

----

**[Google's  WebGL Globe](https://www.chromeexperiments.com/globe)** looks super nice on their website, but for because i am dumb, i can not get it work with the GitHub [fork](https://github.com/dataarts/webgl-globe).

This is another attempt at figuring out this little puzzle.

# Data Format

The following illustrates the `JSON` data format that the globe expects:

```javascript
var data = [
    [
    'seriesA', [ latitude, longitude, magnitude, latitude, longitude, magnitude, ... ]
    ],
    [
    'seriesB', [ latitude, longitude, magnitude, latitude, longitude, magnitude, ... ]
    ]
];
```

# Basic Usage

The following code polls a `JSON` file (formatted like the one above) for geo-data and adds it to an animated, interactive WebGL globe.

```javascript
// Where to put the globe?
var container = document.getElementById( 'container' );

// Make the globe
var globe = new DAT.Globe( container );

// We're going to ask a file for the JSON data.
var xhr = new XMLHttpRequest();

// Where do we get the data?
xhr.open( 'GET', 'myjson.json', true );

// What do we do when we have it?
xhr.onreadystatechange = function() {

    // If we've received the data
    if ( xhr.readyState === 4 && xhr.status === 200 ) {

        // Parse the JSON
        var data = JSON.parse( xhr.responseText );

        // Tell the globe about your JSON data
        for ( var i = 0; i < data.length; i ++ ) {
            globe.addData( data[i][1], {format: 'magnitude', name: data[i][0]} );
        }

        // Create the geometry
        globe.createPoints();

        // Begin animation
        globe.animate();

    }

};

// Begin request
xhr.send( null );
```
