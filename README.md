# Linnesq.github.io

## Setup & Installation

Install [rbenv](https://github.com/rbenv/rbenv).

Run `make pre-install` from the project root to get ruby and the project dependencies installed.

To get this blog running locally run `make serve` or `docker-compose up` and it should be available on http://localhost:4000/

## Make a post

Easiest way is to run the create post script:

```
./create_post.sh "Your Post Name"
```

This will make a markdown file inside the `_posts` directory with

* a filename format of `YYYY-mm-dd-<post-name>.md`
* some default front-matter

To change the default post name, you can add front matter to the markdown file, e.g. 

```
---
layout: post
title: "Custom blog title"
---
```

A single `tag` or multiple `tags` can be added to the frontmatter, e.g. 

```
---
<other frontmatter config>
tags: news bash
---
```

or singular

```
---
<other frontmatter config>
tag: news
---
```

and will appear as a link to `/topics` on the post.