---
layout: post
title: Creating a Love Song with AI
date: 2024-08-17 12:00:00.000000000 -00:00
permalink: creating-a-love-song-with-ai
author: Benny Cheung
artwork:
  author: iStock
tags:
- Generative AI
- AI Music
- AI Avatar
- Movie Making
category: post
comments: true
image: images/creating-a-love-song-with-ai/cover2x.jpg
images:
  cover: images/creating-a-love-song-with-ai/cover.jpg
  header: images/creating-a-love-song-with-ai/header.jpg
published: true
---

<!--excerpt.start-->
I've always dreamed of writing a song for my loved one, but my musical skills are somewhat limited. However, I do have a knack for crafting beautiful love poetry. Thanks to advancements in AI, my dream is now achievable using several innovative tools.
In this article, I'll show you how I combined various AI technologies to create a heartfelt music video:
<!--excerpt.end-->

- [Stable Diffusion](https://github.com/AUTOMATIC1111/stable-diffusion-webui): Trained a model specifically for my beloved to personalize the visuals.
- [Hedra](https://www.hedra.com/): Utilized this beta, free tool for the vocal avatar. Despite some limitations, it works remarkably well.
- [FaceFusion](https://docs.facefusion.io/): Employed this tool for deep-faking certain music video scenes to add a touch of magic to my loved one. (video clips credits: Vivian Chow 周慧敏 - 《天荒愛未老》)
- [Suno](https://suno.com/) v3: Provided my poetry as lyrics to this tool, which then composed the music and even supplied the vocal performance.

![AI_Song_Making_Workflow]({{ site.baseurl }}images/creating-a-love-song-with-ai/AI_Song_Making_Workflow.jpg)

_Figure. **AI-Powered Love Song Creation Workflow:** This diagram illustrates the process of creating a personalized music video using a combination of AI tools. Stable Diffusion was used to generate custom visuals, Hedra created a vocal avatar, and FaceFusion added deep-fake effects to integrate these elements into a music video. Suno V3 was employed to compose and perform a song based on the user’s poetry. The final love song movie was edited and compiled in iMovie before being published on YouTube._

With a final touch of video editing, I managed to weave all these elements into a seamless and touching music video. This project is truly a dream come true, made possible by the incredible capabilities of AI technology. 

> Here is my Chinese poetry, which served as the input lyrics for Suno.

```
[Verse 1]
春雨綿綿情如畫， | Spring rain, tender like a painting,
夏夜星空閃無暇。 | Summer night, stars twinkle without flaw.
秋葉紅遍庭芳秀， | Autumn leaves, red and vibrant in the garden,
冬雪飄飄暖如霞。 | Winter snow, warm and floating like rosy clouds.

[Chorus]
光陰流逝歲無憂， | Time passes without worry through the years,
共渡晨曦共牽手。 | Together, we greet the dawn, hand in hand.
風雨同舟不曾變， | Through storm and wind, our bond unchanged,
地老天荒情深厚。 | As the earth ages, our love remains deep.

[Verse 2]
佳人如玉美若花， | My beloved, as pure as jade, as beautiful as a flower,
傾心細訴枕邊話。 | Whispering sweet words by the pillow.
千言萬語送安康， | Thousands of words wish you peace,
願君笑顏伴芳華。 | May your smile accompany the blooming of youth.
```

[四季的情话 (Love in All Seasons) - Creating a Love Song with AI](https://www.youtube.com/watch?v=vrKwaheRz2k)

{% include youtubePlayer.html id="vrKwaheRz2k" %}


Let's explore each components in the workflow, may be you can replicate the process with a song for your love one.

- [Stable Diffusion - AI Generated Avatar](#stable-diffusion---ai-generated-avatar)
- [Suno - AI Music Generation](#suno---ai-music-generation)
- [Hedra - Audio to Avatar Video](#hedra---audio-to-avatar-video)
- [FaceFusion - AI Video Face Swapping](#facefusion---ai-video-face-swapping)
- [iMovie - Video Composition](#imovie---video-composition)
  - [Video/Audio Sync](#videoaudio-sync)
- [HandBrake - Video Recompression (Optional)](#handbrake---video-recompression-optional)
- [Youtube - Video Publishing](#youtube---video-publishing)
- [Concluding Remarks](#concluding-remarks)


## Stable Diffusion - AI Generated Avatar

[Stable Diffusion](https://github.com/AUTOMATIC1111/stable-diffusion-webui) is a free AI tool that can be used to generate high-quality images of faces. To use Stable Diffusion, you need to provide it with some starting parameters, such as gender, age, and hairstyle, and it will generate a realistic image of a face that matches those parameters.

To generate your personal avatar picture, start by building a personal embedding described in our previous post on [Dreambooth Training for Personal Embedding](https://bennycheung.github.io/dreambooth-training-for-personal-embedding). You can choose any combination of parameters that you like, depending on the kind of avatar that you want to create. Once you have chosen your parameters, run [Stable Diffusion to generate your avatar picture](https://bennycheung.github.io/create-personal-animated-ai-avatar).

![AI_Song_StableDiffusion_Generate_May_Avatar]({{ site.baseurl }}images/creating-a-love-song-with-ai/AI_Song_StableDiffusion_Generate_May_Avatar.jpg)

*Figure. Use Stable Diffusion (via AUTOMATIC1111 Web UI) to generate the personal avatar image from a prompt.*

## Suno - AI Music Generation

[Suno](https://suno.com/) v3 is a fascinating tool for anyone interested in music creation. It takes the concept of text-to-music and runs with it, allowing users to input lyrics or descriptions and receive a full song in return. This isn’t just a simple jingle; we’re talking about complete tracks that include instrumentals, vocals, and lyrics across a variety of genres—pop, rock, jazz, you name it.

What’s impressive is the level of customization available. You can specify the mood, instruments, and style, guiding the AI to create something that resonates with your vision. If you’re not satisfied with the first version, you can generate multiple iterations, tweaking and refining until it feels just right. The vocal synthesis feature adds another layer, enabling the AI to sing or rap your lyrics.

Despite its strengths, Suno isn’t without limitations. Some users have noted issues with song structure and repetitive lyrics. That's why we can give Suno our lyrics instead of the auto-generated one.

Suno represents a significant leap in AI music generation. It democratizes music creation, making it accessible to both seasoned musicians and casual users. If you’ve ever wanted to turn your words into a love song, Suno might just be the tool you need.

Specify the style of musics that you desire, then it output the love song accordingly!

```
Cantonese, alternative rock, pop, female voice, romantic
```

![AI_Song_Suno_Generate_Song_from_Poetry_Lyrics]({{ site.baseurl }}images/creating-a-love-song-with-ai/AI_Song_Suno_Generate_Song_from_Poetry_Lyrics.jpg)

_Figure. This image shows the process of turning Chinese love poetry into a song using Suno. By specifying the style of music, including Cantonese, alternative rock, pop, and romantic elements, Suno generates a tailored love song from the input lyrics._

## Hedra - Audio to Avatar Video

[Hedra](https://www.hedra.com/) is a creation lab focused on developing advanced AI technologies for video generation and storytelling. Their primary goal is to empower creators with tools that offer complete creative control over imagining worlds, characters, and stories.

The company's flagship product is Character-1, a foundation model that allows users to generate video content featuring expressive and controllable human characters. This technology aims to revolutionize the way creators produce video content by providing AI-powered tools for character animation and storytelling.

Hedra is designed for creators, filmmakers, and storytellers who are looking for innovative ways to bring their ideas to life through AI-assisted video generation and world-building tools. Hedra currently can only take square image at 512x512.

![AI_Song_Hedra_Generate_Avatar_Singing_UI_02]({{ site.baseurl }}images/creating-a-love-song-with-ai/AI_Song_Hedra_Generate_Avatar_Singing_UI_02.jpg)

_Figure. **Creating a Lifelike Singing Avatar with Hedra:** This image demonstrates the process of using Hedra to generate a virtual character capable of expressing a wide range of emotions. By uploading or generating audio, you can synchronize it with the character’s expressions to create realistic video content, allowing for the creation of immersive, emotionally engaging avatars._

Hedra lets our avatar to express a wide range of emotions. This isn’t just about making a avatar character look good; it’s about making them feel real. We can generate videos of any length (options to extend the default 30 seconds limit), which means we’re not limited by time constraints.

The quality of the output is impressive, making our content visually appealing. Whether we want our avatar to speak, sing, or rap, Character-1 has you covered. It even converts text into lifelike audio, so we can choose a voice that fits our character’s personality perfectly.


![AI_Song_May_Avatar_Snapshot_Grid]({{ site.baseurl }}images/creating-a-love-song-with-ai/AI_Song_May_Avatar_Snapshot_Grid.jpg)

_Figure. This grid showcases a virtual character generated by Hedra, displaying a variety of expressions and movements. The diverse range of facial expressions and dynamic movements contribute to a lifelike, engaging avatar that enhances the realism and emotional depth of the character._


## FaceFusion - AI Video Face Swapping

 [FaceFusion](https://docs.facefusion.io/) is a powerful tool that has caught the attention of content creators and developers alike. At its core, it allows users to swap faces in images and videos with impressive realism. This capability is not just a gimmick; it’s built on advanced AI technology that makes the results look authentic.

What sets FaceFusion apart is its open-source nature. Available on GitHub, it invites community contributions, which means it’s constantly evolving. The project is actively maintained, with the latest version, 2.6.1, released in July 2024. This commitment to continuous development ensures that users benefit from regular updates and new features.

Among its advanced features are frame enhancers for video quality, colorization tools for black and white footage, and lip-syncing capabilities using the wave2lip model. It also supports multiple face detection options, enhancing accuracy in face swapping.

Importantly, the developers have taken ethical considerations seriously, implementing moderation systems to encourage responsible use. FaceFusion stands out as a significant advancement in AI-driven face manipulation, offering high-quality results for both casual users and professionals.

![AI_Song_FaceFusion_May_Music_Video_Clip_Processing_02]({{ site.baseurl }}images/creating-a-love-song-with-ai/AI_Song_FaceFusion_May_Music_Video_Clip_Processing_02.jpg)

_Figure. Employed FaceFusion for face swapping with the music video scenes to add a touch of magic to my loved one. (video clips credits: Vivian Chow 周慧敏 - 《天荒愛未老》)_

## iMovie - Video Composition

Creating a video composition using iMovie is a relatively straightforward process that enables you to combine video clips, add transitions, incorporate music, and apply various effects.

![AI_Song_iMovie_AI_Song_Editing_01]({{ site.baseurl }}images/creating-a-love-song-with-ai/AI_Song_iMovie_AI_Song_Editing_01.jpg)

_Figure. The movie clips and elements are combined and edited in iMovie._

When you look at a timeline layout for video editing, it’s like peering into the skeleton of a story. The top portion of the timeline is where the video clips live. These clips are arranged in a linear sequence. They vary in scenes and subjects, creating a mosaic of visual content.

Below the video clips, there’s a green audio track that runs the length of the timeline. This track is continuous, where the AI-generated music that play throughout the video. The waveform in the audio track shows variations in volume and intensity, adding another layer to the storytelling.

The entire composition is about 2:03 minutes long. It’s a mix of different scenes and elements to build a narrative. The thoughtful editing, with its balanced mix of clips and smooth transitions, reflects an effort to create an engaging musical love story.


### Video/Audio Sync

Syncing video and audio to match vocals in singing tracks can indeed be challenging.

![AI_Song_iMovie_AV_Sync_01]({{ site.baseurl }}images/creating-a-love-song-with-ai/AI_Song_iMovie_AV_Sync_01.jpg)

Example in the Provided Screenshot:
- The screenshot shows video clips with an audio track at the bottom.
- Align the pattern of peaks and troughs in the audio waveform (the green track) with the corresponding points in the video clip’s visible waveform.
- Use the playhead to precisely line up the starting points of both the video and the audio.

![AI_Song_iMovie_AV_Sync_02]({{ site.baseurl }}images/creating-a-love-song-with-ai/AI_Song_iMovie_AV_Sync_02.jpg)

Tips:
- Always **monitor playback** with headphones to catch any subtle sync issues.
- You can **mute the original audio track** from the video clips to concentrate on the added vocal track.
- Regularly **save your project** to prevent loss of your edits.

## HandBrake - Video Recompression (Optional)

Recompressing a video using [HandBrake](https://handbrake.fr/) can significantly reduce the file size of an MP4 video without sacrificing too much quality. Here’s a step-by-step guide on how to do this:

First, open HandBrake. Launch the application and get ready to load your video. Click on the “Open Source” button and navigate to the MP4 video file you want to compress. Select the file and click “Open.”

Next, select a preset. HandBrake provides various presets for different devices and purposes. For general video compression, you might use the “Fast 1080p30” preset or a similar one suitable for your needs.

Now, adjust the video settings. Ensure the resolution is appropriate for your needs. Lowering the resolution can significantly reduce file size but may affect quality. Use the “Constant Quality” slider to adjust the compression level. A good starting point is RF 20-24; lower values like RF 18-20 produce higher quality and larger files, while higher values like RF 22-24 will have more compression and smaller files. Set the frame rate to “Same as Source” unless you need to change it.

Then, select the destination. Click on the “Browse” button in the “Save As” section to choose the destination folder for the compressed video. You can also rename the output file if desired.

Finally, start the compression. Click on the “Start Encode” button to begin the compression process. HandBrake will process the video, and this may take some time depending on the size and complexity of the video file.

Once HandBrake finishes encoding, navigate to the destination folder and check the new compressed video file. Play it to ensure that the quality meets your expectations.
    
![AI_Song_HandBrake_Video_Recompression_to_Smaller_Size]({{ site.baseurl }}images/creating-a-love-song-with-ai/AI_Song_HandBrake_Video_Recompression_to_Smaller_Size.jpg)

Tips for Effective Compression:
- **Bitrate:** If you need more control, you can manually set the average bitrate under the “Video” tab. Lowering the bitrate will decrease file size but at the cost of quality.
- **Audio Settings:** Compress audio tracks by using a codec like AAC with a bitrate around 128 kbps, which is generally sufficient for most purposes.
- **Passes:** Consider using “2-pass encoding” for better quality at lower bitrates. This option can be found under the “Video” tab.

## Youtube - Video Publishing

The YouTube Studio layout ensures that all necessary information about the video, including title, description, visibility, and detailed editing options, is easily accessible for the user to optimize and manage their video content effectively.

The YouTube video publishing process depicted in the screenshot illustrates the "Video details" section within YouTube Studio. 

- **Video Details Section:**
  - Title: The video is titled "四季的情话 - Creating a Love Song with AI."
  - Description:
    - The description provides an overview of the video's content. It describes the creator’s dream of writing a song, leveraging AI technologies to achieve this goal, and lists various tools and methodologies used in creating the music video.
- **Visibility and Restrictions:**
  - Visibility: The video is marked as "Public," meaning it’s accessible to anyone on YouTube.
  - Restrictions: No restrictions are applied to the video content.

![AI_Song_Youtube_Video_Publishing]({{ site.baseurl }}images/creating-a-love-song-with-ai/AI_Song_Youtube_Video_Publishing.jpg)

_Figure. This screenshot showcases the ‘Video details’ section within YouTube Studio, where the user can optimize and manage their video content. It highlights the easy accessibility of key information, including the video title, description, visibility settings, and editing options, all crucial for effectively publishing and promoting content on YouTube._


## Concluding Remarks

Creating a love song and accompanying music video has long been a dream of mine, and thanks to the advancements in AI technology, this dream has become a reality. The combination of tools like Stable Diffusion, Hedra, FaceFusion, and Suno has enabled me to craft a unique and personalized expression of love, merging my poetry with state-of-the-art AI-generated visuals and music.

This project has shown me the incredible potential of AI not only in creative endeavors but also in making complex tasks more accessible to everyone, regardless of their technical or musical background. By integrating these tools, I was able to overcome my own limitations and produce something that truly resonates on an emotional level.

The journey from writing poetry to publishing a finished video on YouTube was both challenging and rewarding, filled with learning opportunities and moments of inspiration. I hope that by sharing this process, I can inspire others to explore the possibilities of AI in their own creative projects.

