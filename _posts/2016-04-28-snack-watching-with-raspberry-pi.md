---
layout: post
title: Snack Watching with Raspberry Pi
date: 2016-04-28 12:00:00.000000000 -05:00
permalink: snack-watching-with-raspberry-pi
author: Benny Cheung
tags:
  - SnackWatcher
  - RaspberryPi
  - Python
category: post
comments: true
image: images/snack-watching-with-raspberry-pi/cover2x.jpg
images:
  cover: images/snack-watching-with-raspberry-pi/cover.jpg
  header: images/snack-watching-with-raspberry-pi/header.jpg
published: true
---

<!--excerpt.start-->
Starting as a fun [Jonah Group](http://www.jonahgroup.com) project,
the **Snack Watcher** is designed to watch the company's "Snack Table". If there are
some new "Snacks" presented on the "Snack Table", it can be used to report the
event onto chat channels, emails or messages saying "Snack Happened!", posting
an image and trying to classify the snacks that it observed. It supports both as
web site for interactive snack viewing and RESTful API for programmatic snack querying.
<!--excerpt.end-->

[Snack Watcher Github Repo](https://github.com/jonahgroup/SnackWatcher)

* Webcam connected to watch at the "Snack Table"

![Snack Watcher Setup 2]({{ site.baseurl }}/images/snack-watching-with-raspberry-pi/Snack_Watcher_Setup_02.jpg)

* `snack-web` captured image sample with blob status (green means New, red means removed) and blob classification (they looks like "package" from classifier training)

![Snack Web Image Capture]({{ site.baseurl }}/images/snack-watching-with-raspberry-pi/Snack_Watcher_Capture.png)

## snack-web
`snack-web` is a web application showing the result of snack watching, which has
been designed to configure and run on a Raspberry Pi 2 or 3. `snack-web` can
be driven, either manually (via Web) or programmatically (via RESTful API) to
take pictures and push the snapshots into the `static/images` directory. Alternatively, the
RESTful API can be programmatically used to watch and to return the images. The API is
a key feature to integrate with a external system, providing utilities to
report the snacks status.

### snack-web Front Page
The following illustrated the front page of `snack-web`, the front page menu items are listed:

- **Links**: display the last N snack captured image and it's processing stages
- **Calibrate**: take a background image for calibrating the background colour
- **Snap**: snap a snack image from the camera now
- **Teach**: (Require advanced setup) Currently still under heavy development, the teaching module is designed to interactively classify snack for future training. This required classifier setup to work.

![Snack Web Front Page]({{ site.baseurl }}/images/snack-watching-with-raspberry-pi/snack_web_link_page_sm.png)

For each snack image capture, it collects the set of processed images for debugging. User can understand how the snacks are identified. For each blob that the system detected, it is stored for displaying and for training. The colour coded blob represent, *green* is the new blob, *yellow* is the stationary blob, and *red* is the removed blob. By click on each image bar, a larger image is shown for detail inspections.

![Snack Web Item Display]({{ site.baseurl }}/images/snack-watching-with-raspberry-pi/snack_web_item_display_sm.png)

## RESTful API
<http://snack-web:8000/api>
(Replace `snack-web` with your host location.)

The images and operations can also be accessed via RESTful API. The available URI resources are listed in this table.

*Table: snack-web RESTful API*

| API | HTTP | Description |
|-----|------|-------------|
| /snacks/ | GET | return all images, that could be a lot of images
| /snacks/snap | GET | take a snapshot and return the latest image. This call takes a snapshot and returns the processed image.
| /snacks/id/{id} | GET | return image {id}. This call gets an image by the database id. If it is not found, null is returned.
| /snacks/state/{class_state} | GET | Get all blobs matched the given class_state. This call gets a list of blobs filtered by c1ass_state.
| /snacks/state | PUT | Update blobs state info by _id. This call accepts a list of (id, c1ass, c1ass_state) objects, updates their associated blobs in the database.
| /snacks/class/names | GET | Get the list of class names. This call returns a list of the class names that a blob can be classified by.
| /snacks/last | GET | Get the last image. This call returns the latest image by date_created DESC. If none exist, null is returned.
| /snacks/last/{int:n} | GET | Get the last n images. This call returns a list of the latest n images by date_created DESC.
| /snacks/last/summary | GET | Get the latest summary. This call returns a summary of the latest processed images including the new, duplicate and removed blobs. If no images exist, it returns null.

### Snapshot Naming Convention

When a camera snapshot is taken, The image will be written into a creation folder according to the snapshot's date-time,

```
snack-{year}_{month}_{day}-{hour}_{minute}_{second}
```

e.g. `snack-2015_06_17-13_14_58` is created at date `2015-06-17` and time `13:14:58`.


The result JSON for an image, for example, requests for the last image using `curl` command.

```
curl http://snack-web:8000/api/snacks/last
```

For a list of images, for example, requests for all snack images using `curl` command.

```
curl http://snack-web:8000/api/snacks/
```
