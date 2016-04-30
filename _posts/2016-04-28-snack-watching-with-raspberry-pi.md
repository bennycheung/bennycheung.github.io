---
layout: post
title: 'Snack Watching with Raspberry Pi'
permalink: 'snack-watching-with-raspberry-pi'
author: Benny Cheung
tags:
  - SnackWatcher
  - Computer Vision
  - RaspberryPi
  - OpenCV
  - SimpleCV
  - Python
  - RESTful API
categories:
  - Posts
cover: images/snack-watching-with-raspberry-pi/cover.jpg
---
<!--excerpt.start-->
Starting as a [Jonah Group](http://www.jonahgroup.com) fun project,
**Snack Watcher** is designed to watch the company's "Snack Table". If there is
some new "Snack" presented on the "Snack Table", it could be used to report the
event onto a chat channels, email or messaging saying "Snack Happened!", posting
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
been designed to configure and run with Raspberry Pi 2 or 3. `snack-web` could
be driven, either manually (via Web) or programmatically (via RESTful API) to
take pictures and push the snapshots into the `static/images` directory. The
RESTful API approach to programmatically watch and return the images should be
the key feature to integrate with a system, providing greater utilities to
report the snack status.

### snack-web Front Page
The following illustrated the front page of `snack-web`, the front page menu items are listed:

- **Links**: display the last N snack captured image and it's processing stages
- **Calibrate**: take a background image for calibrating the background colour
- **Snap**: snap a snack image from the camera now
- **Teach**: (Require advanced setup) Currently still under heavy development, the teaching module is designed to interactively classify snack for future training. This required classifier setup to work.

![Snack Web Front Page]({{ site.baseurl }}/images/snack-watching-with-raspberry-pi/snack_web_link_page_sm.png)

For each snack image capture, it collects the set of processing stage images for debugging and understanding how the snacks are identified. For each blob that the system detected, it will be stored for displaying and training. The colour coded blobs represent, *green* is the new detected blob, *yellow* is the stationary blob, and *red* is the removed blob. By click on each image bar, a larger image will be shown for detail inspections.

![Snack Web Item Display]({{ site.baseurl }}/images/snack-watching-with-raspberry-pi/snack_web_item_display_sm.png)

## RESTful API
<http://snack-web:8000/api>
(Replace `snack-web` with your host location.)

The images and operations can also be accessed via RESTful API. The available URI resources are listed in this table.

*Table: snack-web RESTful API*

| API | HTTP | Description |
|-----|------|-------------|
| /snacks/ | GET | return all images, could be a lot of images
| /snacks/snap | GET | take a snapshot and return the latest images. This call takes a snapshot and then processes and returns the generated image.
| /snacks/id/{id} | GET | return image {id}. This call gets an image by the database id. If it is not found, null is returned.
| /snacks/state/{class_state} | GET | Get blobs by class_state. This call gets a list of blobs filtered by c1ass_state.
| /snacks/state | PUT | Update blobs state info by _id. This call accepts a list of id, c1ass, c1ass_state objects and updates the associated blobs in the database.
| /snacks/class/names | GET | Get list of class names. This call returns a list of the possible class names that a blob can be classified by.
| /snacks/last | GET | Get last image. This call returns the latest image by date_created DESC. If none exist, null is returned.
| /snacks/last/{int:n} | GET | Get last n images. This call returns a list of the latest images by date_created DESC.
| /snacks/last/summary | GET | Get lastest summary. This call returns a summary of the latest processed images including the new, duplicate and removed blobs. If no images exist, it returns null.

### Snapshot Naming Convention

When a camera snapshot is taken, The images will be written into a creation  folder according to the snapshot's date-time,

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
