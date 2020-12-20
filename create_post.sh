#!/bin/bash
# ./create_post.sh "Your Post Name"

date_prefix=`date +'%Y-%m-%d'`

if [ -z "$1" ]
  then 
    post_title="New Post"
  else
    post_title=$1
fi

post_name=`echo $post_title | sed 's/ /-/g' | tr '[:upper:]' '[:lower:]'`
file_name="${date_prefix}-${post_name}.md"

echo "---
layout: post
title: \"$post_title\"
tag: news
---
" > "./_posts/$file_name"