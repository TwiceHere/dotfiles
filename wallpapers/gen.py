import os

output_file = "WALLPAPER_GALLERY.md"
images = sorted(
    [
        f
        for f in os.listdir(".")
        if f.lower().endswith((".jpg", ".jpeg", ".png", ".webp", ".gif"))
    ]
)

cols = 3
rows = [images[i : i + cols] for i in range(0, len(images), cols)]

with open(output_file, "w") as f:
    f.write("## Wallpaper Gallery\n\n")

    # this markdown table header is just for structure; it won't be visible
    f.write("| " * (cols + 1) + "\n")
    f.write("|" + "---|" * cols + "\n")

    for row in rows:
        # we use an html img tag to set a fixed width, forcing columns to be even
        row_md = (
            "| " + " | ".join(f'<img src="{img}" width="400">' for img in row) + " |\n"
        )
        f.write(row_md)
