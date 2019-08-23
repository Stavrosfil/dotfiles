import os
import re

def remove_correct_names(filesIterator, prefix):
    print('\nTo be processed :')
    for wall in filesIterator:
        if wall.is_file():
            if not bool(re.match(prefix + r"[0-9]+.(jpg)", wall.name)):
                print(wall.name)
                walls.append(wall.name)
    print('End of list creation.')


basepath = '.'
prefix = 'wall_'
filesIterator = os.scandir(basepath)
walls = []
i = 0
readme = ''

remove_correct_names(filesIterator, prefix)

for wall in walls:
    suffix = os.path.splitext(wall)[1]
    if bool(re.match(r".+\.(jpg)", wall)):
        newName = prefix + str(i) + suffix
        print(newName)
        os.rename(wall, newName)
        readme += '![img](' + newName + ')\n'
        i += 1

f = open('README.md', 'w')
f.write(readme)
f.close()

print(readme)