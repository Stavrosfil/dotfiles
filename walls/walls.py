import os
import fnmatch
# entries = os.scandir('.')
wallsList = os.listdir('.')

# for entry in entries:
# print(entry.name)

# Search for non image files and remove them from the list
print('\nTo be removed :')
for wall in wallsList:
    suffix = os.path.splitext(wall)[1]
    # if not (fnmatch.fnmatch(wall, 'wall*.png') or fnmatch.fnmatch(wall, 'wall*.jpg')):
    if not (suffix == '.jpg' or suffix == '.png'):
        print(wall)
        wallsList.remove(wall)

print('\nImage files remaining : ' + str(len(wallsList)))

i = 0

for wall in wallsList:
    name = os.path.splitext(wall)
    os.rename(wall, 'wall_' + str(i) + name[1])
