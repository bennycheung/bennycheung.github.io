---
layout: post
title: Interactive Hex World Map using D3
date: 2016-05-01 12:00:00.000000000 -05:00
permalink: interactive-hex-world-map-using-d3
author: Benny Cheung
tags:
  - D3
  - Hex
  - Mapping
category: post
comments: true
image:
  cover: images/interactive-hex-world-map-using-d3/cover.jpg
  header: images/interactive-hex-world-map-using-d3/header.jpg
published: false
---
<link rel="stylesheet" href="css/hexmap/hexlib.css">
<script src="js/d3/d3.v3.min.js"></script>
<script src="js/d3/topojson.v1.min.js"></script>
<script src="js/d3/d3.hexbin.js"></script>


And here, I've used d3 to target an element `<div id="hexbin">` in this document:

<div id="globecontainer">
</div>

<div class="float-container">
  <div style="width:280px;display:inline-block;margin:5px">
    <svg id="grid-offset-odd-r" width="800" height="417"></svg>
  </div>
</div>

<div id="hexbin"></div>

<script src="js/hexmap/hexlib.js"></script>
<script src="js/hexmap/hexlib_ui.js"></script>
<script src="js/hexmap/hexglobe.js"></script>

<script>
  var grid_odd_r = makeHexOddR("#grid-offset-odd-r", 10, 800, 417);
  makeHexBinMap(grid_odd_r, "#hexbin", 10, "images/interactive-hex-world-map-using-d3/world_height.png", 800, 417);
</script>

<script src="js/hexmap/globe.js"></script>

<script src="js/jquery/jquery-1.7.min.js"></script>
<script src="js/jquery/jquery.event.drag-2.2.js"></script>
