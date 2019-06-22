Title: Initial Site Setup

This page explains what is needed to generate the initial site config so that it is compatible with
github pages.

## First, run quickstart

This is a copy of the `pelican-quickstart` prompt I used to generate the site.

```sh
$ pelican-quickstart

Welcome to pelican-quickstart v4.0.1.

This script will help you create a new Pelican-based website.

Please answer the following questions so this script can generate the files
needed by Pelican.

    
Using project associated with current virtual environment.Will save to:
/Users/nolan/Desktop/pelican-deploy-gh-actions

> What will be the title of this web site? Pelican GH Action Deploy Demo
> Who will be the author of this web site? Nolan Conaway
> What will be the default language of this web site? [en] 
> Do you want to specify a URL prefix? e.g., https://example.com   (Y/n) n
> Do you want to enable article pagination? (Y/n) n
> What is your time zone? [Europe/Paris] America/New_York
> Do you want to generate a tasks.py/Makefile to automate generation and publishing? (Y/n) y
> Do you want to upload your website using FTP? (y/N) n
> Do you want to upload your website using SSH? (y/N) n
> Do you want to upload your website using Dropbox? (y/N) n
> Do you want to upload your website using S3? (y/N) n
> Do you want to upload your website using Rackspace Cloud Files? (y/N) n
> Do you want to upload your website using GitHub Pages? (y/N) y
> Is this your personal page (username.github.io)? (y/N) n
Done. Your new project is available at /Users/nolan/Desktop/pelican-deploy-gh-actions
```

## Second, enable relative urls in `publishconf.py`

If you are not publishing to your base `username.github.io` repo, then you'll want to set `RELATIVE_URLS = True`
in the `publishconf.py` file which was generated during pelican-quickstart. 
Otherwise, the urls generated will have a base of `/` instead of a base of `/project/`.

My file now looks like:

```python
#!/usr/bin/env python
# -*- coding: utf-8 -*- #
from __future__ import unicode_literals

# This file is only used if you use `make publish` or
# explicitly specify it as your config file.

import os
import sys
sys.path.append(os.curdir)
from pelicanconf import *

# If your site is available via HTTPS, make sure SITEURL begins with https://
SITEURL = ''
RELATIVE_URLS = True

FEED_ALL_ATOM = 'feeds/all.atom.xml'
CATEGORY_FEED_ATOM = 'feeds/{slug}.atom.xml'

DELETE_OUTPUT_DIRECTORY = True
```