import os
import re
# filesIterator = os.scandir('.')
# filesIterator = os.listdir('.')

# for entry in entries:
# print(entry.name)


def remove_correct_names(filesIterator, prefix):
    print('\nTo be processed :')
    for wall in filesIterator:
        if wall.is_file():
            if not bool(re.match(prefix+"[0-9]+.(jpg|png)", wall.name)):
                print(wall.name)
                walls.append(wall.name)
    print('End of list creation.')


basepath = '.'
prefix = 'wall_'
filesIterator = os.scandir(basepath)
walls = []
i = 0

remove_correct_names(filesIterator, prefix)

for wall in walls:
    suffix = os.path.splitext(wall)[1]
    if bool(re.match(r".+\.(jpg|png)", wall)):
        newName = prefix + str(i) + suffix
        print(newName)
        os.rename(wall, newName)
        i += 1