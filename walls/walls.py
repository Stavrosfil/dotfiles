import os
import re


def pl():
    print('----------------------------------')


def atoi(text):
    return int(text) if text.isdigit() else text


def natural_keys(text):
    """ Turn a string into a list of string and number chunks.
        "z23a" -> ["z", 23, "a"]
    """
    return [atoi(c) for c in re.split(r'(\d+)', text)]


def remove_correct_names(filesIterator, prefix):
    print('\nFiles not matching :')
    pl()
    for wall in filesIterator:
        if wall.is_file():
            if not bool(re.match(prefix + r"[0-9]+.(jpg|png)", wall.name)):
                print(wall.name)
                walls.append(wall.name)
    pl()


basepath = '.'
prefix = 'wall_'
filesIterator = os.scandir(basepath)
walls = []
i = 1
readme = ''

remove_correct_names(filesIterator, prefix)

# Natural sort.
# Also see natsort package.
walls.sort(key=natural_keys)

print('Preparing to rename image files :')
pl()
for wall in walls:
    suffix = os.path.splitext(wall)[1]
    if bool(re.match(r".+\.(jpg|png)", wall)):
        newName = prefix + str(i) + suffix
        print(wall + '\t-->\t' + newName)
        os.rename(wall, newName)
        readme += '![img](' + newName + ')\n'
        i += 1
pl()

f = open('README.md', 'w')
f.write(readme)
f.close()

print(readme)
