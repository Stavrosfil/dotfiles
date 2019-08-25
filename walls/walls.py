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
    maxNum = 1
    filesIterator = os.scandir(basepath)

    print('\nFiles not matching :')
    pl()

    for wall in filesIterator:
        if wall.is_file():
            # The files to rename must be image files or be already named correctly.
            if not bool(re.match(prefix + r"[0-9]+\." + extensions, wall.name)):
                if bool(re.match(r".+\." + extensions, wall.name)):
                    walls.append(wall.name)
            else:
                maxNum = max(int(re.split(r'(\d+)', wall.name)[1]), maxNum)

    # Natural sort.
    # Also see natsort package.
    walls.sort(key=natural_keys)

    print(walls)

    pl()

    return (walls, maxNum)


# TODO: Fix new file rename if an old one gets deleted.
def rename_files(walls, maxNum):
    i, j = maxNum + 1, 1
    tempFiles = []

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
        i += 1

    pl()


def add_to_readme(wall):
    pass


def saveReadme():
    readme = ''
    readmeList = os.listdir(basepath)
    readmeList.sort(key=natural_keys)
    for wall in readmeList:
        if bool(re.match(prefix + r"[0-9]+\." + extensions, wall)):
            readme += '### ' + wall + '\n'
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
    walls, maxNum = files_to_rename(prefix, extensions)

    # Rename the files using the sorted list
    rename_files(walls, maxNum)

    saveReadme()


if __name__ == "__main__":
    main()
