License
=======

This guide and documentation is under the Creative Commons Attribution-ShareAlike CC BY-SA license as found here: http://creativecommons.org/licenses/by-sa/3.0/legalcode


ClusterBuilderManual
====================

A guide on how to build a cluster. Note, there are many interpretations on how to build a cluster. Ultimately it depends on the workload that the cluster is going to be doing. This guide is meant to be used as a learning experience as well as a good reference for other cluster admins.

I started this guide as just a collection of notes that I took when I build clusters. I organized them on a wiki for a time, but they were not complete nor without occasional errors. A friend, almightybeej, cleaned up a significant portion of the manual and added screenshots for the installation.

Now I find that the notes are getting stale and have a few errors simply due to the nature of ever-changing and evolving software. Thus, I have decided to once again update the notes. However, I would like to better track changes and I would love to expand on these notes to include more on how to use and manage the cluster so I decided to use git as a way to manage the updates. Since git doesn't handle pdf or odf very well, I decided to try markdown after a recommendation from one of the puppet developers. So we will see how this goes...

Style Guide for this project:

This website is very useful for working with Markdown: http://markdown.pioul.fr/

End lines with a double space '  '

Code blocks seem to not work consistantly across my Debian Squeeze, Lubuntu 12.04, and Scientific Linux 6.3 computers. Therefore I am using this format for code blocks:
>`code blocks surrounded with a backtick proceeding a greater-than sign`

Linking to another page is done (title)[link].

The GenerateHTML.sh script is working really well so far for converting the markdown to HTML format. I would eventually like to organize this in such a way that I can use one of the Markdown->PDF converters to make a single document guide, but there are a LOT of notes that I want to post first. I figure I would work on the organization as I compose my thoughts.


Shout-outs
==========

Massive props go out to the almightybeej for his help in testing many of these notes and whose expertiese on Cbench is always helpful. :-)  

All the open-source projects that I use on a day-to-day basis. 

To-Do
=====

Verify that every project mentioned in the guide has a link to the website / original authors.  
Make it look pretty.  
Organize it for PDF format later down the road.  
Add content for all the 'Coming Soon' placeholders.  
Ensure that every page gets the license placed neatly at the bottom of the page.
