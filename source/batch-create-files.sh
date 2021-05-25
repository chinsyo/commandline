#! /bin/bash

seq -w -f "content%g" 10000 10 11000 | xargs touch
