# coding: utf-8

from os import getcwd, listdir, remove
from os.path import isfile, join, splitext

README = "README.md"
SOURCE_DIR = join(getcwd(), 'source')
ASSETS_DIR = join(getcwd(), 'assets')

def clean():
    try:
        remove(README)
    except:
        pass

def list_files():
    srcs = [f for f in listdir(SOURCE_DIR) if isfile(join(SOURCE_DIR, f))]
    imgs = [f for f in listdir(ASSETS_DIR) if isfile(join(ASSETS_DIR, f))]
    srcs.sort()
    imgs.sort()
    return srcs, imgs

def write_to_readme(text):
    with open(README, 'a') as f:
        f.write(text)

def update_title(srcs):
    title = "# commandline"
    title += "\n"
    title += "{} useful bash scripts collection on Mac OSX.(实用的命令行脚本)".format(len(srcs))
    title += "\n"
    return title

def update_content(src, has_img):
    src_name, src_ext = splitext(src)
    img_name, img_ext = src_name, '.png'
    
    text = "* {}".format(src_name)
    text += "\n"
    text += "![{}]({})\n".format(img_name, join(ASSETS_DIR, img_name + img_ext)) if has_img else ""
    with open(join(SOURCE_DIR, src), 'r') as f:
        text += "```bash"
        text += "\n"
        text += f.read()
        text += "\n"
        text += "```"
        text += "\n"
    text += "\n"
    return text
    

def main():
    clean()
    srcs, imgs = list_files()
    title = update_title(srcs)
    write_to_readme(title)
    for src in srcs:
        src_name, src_ext = splitext(src)
        img_name, img_ext = src_name, '.png'
        has_img = (img_name + img_ext) in imgs
        content = update_content(src, has_img)
        write_to_readme(content)

if __name__ == '__main__':
    main()
