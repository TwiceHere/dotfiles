gallery = open("WALLPAPER_GALLERY.md").read()

with open("README.md") as f:
    content = f.read()

start = "<!-- WALLPAPER_GALLERY -->"
end = "<!-- END_WALLPAPER_GALLERY -->"

before = content.split(start)[0] + start + "\n"
after = "\n" + end + content.split(end)[1]

with open("README.md", "w") as f:
    f.write(before + gallery + after)

