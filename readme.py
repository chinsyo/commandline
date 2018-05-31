# coding: utf-8

from os import getcwd, listdir, remove
from os.path import isfile, join, splitext

README = "README.md"
SRCDIR = join(getcwd(), 'src')
IMGDIR = join(getcwd(), 'img')

def clean():
    try:
        remove(README)
    except:
        pass

def listresources():
    srcs = [f for f in listdir(SRCDIR) if isfile(join(SRCDIR, f))]
    imgs = [f for f in listdir(IMGDIR) if isfile(join(IMGDIR, f))]
    srcs.sort()
    imgs.sort()
    return srcs, imgs

def writetoreadme(text):
    with open(README, 'a') as f:
        f.write(text)

def generatetitle(srcs):
    title = "# commandline"
    title += "\n"
    title += "{} useful bash scripts collection on Mac OSX.(实用的命令行脚本)".format(len(srcs))
    title += "\n"
    return title

def generatecontent(src, has_img):
    src_name, src_ext = splitext(src)
    img_name, img_ext = src_name, '.png'
    
    text = "* {}".format(src_name)
    text += "\n"
    text += "![{}]({})\n".format(img_name, join("img", img_name + img_ext)) if has_img else ""
    with open(join(SRCDIR, src), 'r') as f:
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
    srcs, imgs = listresources()
    title = generatetitle(srcs)
    writetoreadme(title)
    for src in srcs:
        src_name, src_ext = splitext(src)
        img_name, img_ext = src_name, '.png'
        has_img = (img_name + img_ext) in imgs
        content = generatecontent(src, has_img)
        writetoreadme(content)

if __name__ == '__main__':
    main()
