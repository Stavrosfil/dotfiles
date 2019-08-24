import os
import re

basepath = '.'
prefix = 'wall_'
extensions = '(jpg|png)'


def pl():
    print('----------------------------------')


def atoi(text):
    return int(text) if text.isdigit() else text


# This is used for natural sorting of a string list.
def natural_keys(text):
    """ Turn a string into a list of string and number chunks.
        "z23a" -> ["z", 23, "a"]
    """
    return [atoi(c) for c in re.split(r'(\d+)', text)]


def files_to_rename(prefix, extensions):
    walls = []
    filesIterator = os.scandir(basepath)

    print('\nFiles not matching :')
    pl()

    for wall in filesIterator:
        if wall.is_file():
            # The files to rename must be image files or be already named correctly.
            # if not bool(re.match(prefix + r"[0-9]+\." + extensions, wall.name)):
            if bool(re.match(r".+\." + extensions, wall.name)):
                walls.append(wall.name)
            # else:
                # readmeList.append(wall.name)

    # Natural sort.
    # Also see natsort package.
    walls.sort(key=natural_keys)

    print(walls)

    pl()
    
    return walls


# TODO: Fix new file rename if an old one gets deleted.
def rename_files(walls):
    i, j = 1, 1
    readmeList, tempFiles = [], []

    print('Preparing to rename image files :')
    pl()

    for wall in walls:
        suffix = os.path.splitext(wall)[1]
        tempName = str(j) + '_temp' + suffix
        os.rename(wall, tempName)
        tempFiles.append(tempName)
        j += 1

    for wall in tempFiles:
        suffix = os.path.splitext(wall)[1]
        newName = prefix + str(i) + suffix
        print(wall + '\t-->\t' + newName)
        os.rename(wall, newName)
        readmeList.append(newName)
        i += 1

    pl()

    # The list returned is already sorted
    return readmeList


def add_to_readme(wall):
    pass


def saveReadme(readmeList):
    readme = ''
    for wall in readmeList:
        readme += '![img](' + wall + ')\n'
    print('Updating readme...')
    pl()
    f = open('README.md', 'w')
    f.write(readme)
    print(readme)
    f.close()
    pl()


def main():

    # Get the sorted walls list to rename.
    walls = files_to_rename(prefix, extensions)

    # Rename the files using the sorted list
    readmeList = rename_files(walls)

    saveReadme(readmeList)


if __name__ == "__main__":
    main()
