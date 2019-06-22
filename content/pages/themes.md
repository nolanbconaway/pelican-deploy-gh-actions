Title: Theme setup

As of now, the built-in theming utilities for pelican are weirdly dependent on files and folders external to the site repo. For example, the `pelican-themes` tool allows you to install themes to an external directory (e.g., `~/pelican-themes`), which you then reference using the `THEME` variable in your settings file like `THEME = '~/pelican-themes/theme`.

This is problematic for a Github deployment, since you'll need to install the theme in the same spot when deploying. Here's one way to do it.


## Install the theme to your repo

The approach I am going to take is to store the theme at the top level directory of your repo. During deployment we can install to the same place and it should all come together nicely.

I am going to use a theme within the large collection of pelican themes available [here](https://github.com/getpelican/pelican-themes). 

Clone the whole repo to a folder at the top level of your repo:

```sh
git clone --recursive https://github.com/getpelican/pelican-themes themes
```

Make sure to add that folder to `.gitignore`, you don't want git tracking those files.

```sh
echo '\n# pelican themes folder \nthemes/' >> .gitignore
```

## Set the theme path in your settings

I chose the `blue-penguin` theme, and set it in `pelicanconf.py`, so the file looks like:


```python
#!/usr/bin/env python
# -*- coding: utf-8 -*- #
from __future__ import unicode_literals

AUTHOR = 'Nolan Conaway'
SITENAME = 'Pelican GH Action Deploy Demo'
SITEURL = ''

PATH = 'content'

TIMEZONE = 'America/New_York'

DEFAULT_LANG = 'en'

# Feed generation is usually not desired when developing
FEED_ALL_ATOM = None
CATEGORY_FEED_ATOM = None
TRANSLATION_FEED_ATOM = None
AUTHOR_FEED_ATOM = None
AUTHOR_FEED_RSS = None

DEFAULT_PAGINATION = False

# Uncomment following line if you want document-relative URLs when developing
# RELATIVE_URLS = True

THEME = 'themes/blue-penguin'
```

## Deployment

In the main.workflow file, you can see I added a theme install action like


```
action "Theme Install" {
  args = "git clone --recursive https://github.com/getpelican/pelican-themes themes"
  uses = "jefftriplett/python-actions@master"
  needs = ["Pipenv"]
}
```

Deployment is dependent on that action, so the themes should be in place.