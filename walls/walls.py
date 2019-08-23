import os
import re

basepath = '.'
prefix = 'wall_'


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
            if not bool(re.match(prefix + r"[0-9]+\." + extensions, wall.name)) and bool(re.match(r".+\." + extensions, wall.name)):
                print(wall.name)
                walls.append(wall.name)
    pl()

    # Natural sort.
    # Also see natsort package.
    walls.sort(key=natural_keys)

    return walls


def rename_files(walls):
    print('Preparing to rename image files :')
    pl()
    i = 1
    for wall in walls:
        suffix = os.path.splitext(wall)[1]
        newName = prefix + str(i) + suffix
        print(wall + '\t-->\t' + newName)
        os.rename(wall, newName)
        i += 1
    pl()


def saveReadme(prefix, extensions):
    filesList = os.listdir(basepath)
    filesList.sort(key=natural_keys)
    readme = ''
    for wall in filesList:
        if bool(re.match(prefix + r"[0-9]+\." + extensions, wall)):
            readme += '![img](' + wall + ')\n'
    print('Updating readme...')
    pl()
    f = open('README.md', 'w')
    f.write(readme)
    print(readme)
    f.close()
    pl()


def main():

    extensions = '(jpg|png)'

    walls = files_to_rename(prefix, extensions)

    rename_files(walls)

    saveReadme(prefix, extensions)


if __name__ == "__main__":
    main()
