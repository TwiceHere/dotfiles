#!/bin/bash

filepath=$1
filename=${filepath%.*}   # Remove extension
extension=${filepath##*.} # Get extension

case "$extension" in
py)
  uv run $filepath
  ;;
c)
  gcc "$filepath" -o "$filename" -lm && ./"$filename" && rm $filename
  ;;
cpp)
  g++ "$filepath" -o "$filename" && ./"$filename" && rm $filename
  ;;
sh)
  bash $filepath
  ;;
go)
  go run $filepath
  ;;
*)
  echo "Unknown file type."
  ;;
esac

# Explanation
# what does ## mean?
# ## is used for removing something from the start of a string
# when combined with *. it removes everything up to and including the last dot(.)
# filename="document.pdf"
# ##*. means "find the last dot (.) and remove everything before it."
# The result is just the extension (pdf) .
#
#
# What does * mean?
# * is a wildcard that means "any characters" (zero or more) .
# in this context:
#   .* --> "A dot followed by any characters" (used for removing extensions).
#   *. --> "any characters followed by a dot" (used for keeping only the extension) .
#
#
# what does .(dot) mean?
# The dot(.) is just a normal character in the filename.
# it seperates the name from the extension .
# We use .* or *. in our patterns to target the dot and the text around it.
#
#
#
# Simple Summary
#
# Expression Meaning
# ${filename%.*} Removes the last dot(.) and everything after it (keeps the name).
# ${filename##*.} Removes everything before the last dot(.) (keeps the extension).
#
