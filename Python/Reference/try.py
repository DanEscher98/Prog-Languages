"""
Created on Fri May  7 15:58:12 2021

@author: dany98
"""
import os
from glob import glob
from PIL import Image

DST_DIR = 'data/temp/images_half'
FILES = glob('./data/temp/images/*')
os.makedirs(DST_DIR, exist_ok=True)

def safediv(a, b):
    try:
        print(a/b)
    except (ArithmeticError, TypeError) as err:
        print(err)
        print(type(err))
    else:
        print('Finished without errors')
    finally:
        print('All actions completed')

def resize_images(files):
    for f in files:
        try:
            img = Image.open(f)
            img_resize = img.resize((img.width // 2,
                                     img.height // 2))
            root, ext = os.path.splitext(f)
            basename = os.path.basename(root)
            img_resize.save(os.path.join(DST_DIR,
                                         basename + '_half' + ext))
        except OSError:
            pass

if __name__=="__main__":
    safediv('a', 0)
    resize_images(FILES)
