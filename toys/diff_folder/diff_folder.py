import os
import shutil

# 判定两个文件夹内的文件是否相同


def diff(folder1, folder2):
    f1 = []
    f2 = []
    for filename in os.listdir(folder1):
        f1.append(filename)
    for filename in os.listdir(folder2):
        f2.append(filename)

    diff_list = list(set(f1).difference(set(f2)))
    if len(diff_list) != 0:
        print("以下文件不同时存在于两个文件夹: \n" + "\n".join(diff_list))

    # 相同文件名则算 md5 判断文件是否相同
    md5_diff_list = []
    for filename in f1:
        if filename in f2:
            md5_1 = get_md5(folder1 + "\\" + filename)
            md5_2 = get_md5(folder2 + "\\" + filename)
            if md5_1 != md5_2:
                md5_diff_list.append(filename)
    if len(md5_diff_list) != 0:
        print("以下文件 md5 不同:\n" + "\n".join(md5_diff_list))
    else:
        print("两个文件夹同名文件均相同")


def get_md5(filename):
    import hashlib

    md5 = hashlib.md5()
    with open(filename, "rb") as f:
        for chunk in iter(lambda: f.read(4096), b""):
            md5.update(chunk)
    return md5.hexdigest()


if __name__ == "__main__":
    parent_path = os.path.abspath(os.path.dirname(__file__))
    print("parent_path: " + parent_path)
    folders = [x[0] for x in os.walk(parent_path)]
    print("compare two folders below: \n{}\n{}\n".format(folders[1], folders[2]))
    diff(folders[1], folders[2])
