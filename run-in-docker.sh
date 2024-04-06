#!/bin/bash

docker build -t ittf-pcre2-test-image .
docker run ittf-pcre2-test-image ./ittf-pcre2-test