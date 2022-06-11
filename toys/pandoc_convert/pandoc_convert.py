import subprocess
import os


def get_file_path():
    print("请输入文件夹路径,直接回车使用当前目录：")
    dir_path = input()
    if dir_path == "":
        dir_path = os.getcwd()
    print("文件夹路径获取成功：" + dir_path)
    return dir_path


def get_file_extension():
    extension_in = "md"
    print("请输入转换后文件类型(eg html)")
    extension_out = input()
    print("convert" + extension_in + "to" + extension_out)
    return extension_in, extension_out


def get_files(dir_path, extension):
    files = [f for f in os.listdir(dir_path) if f.endswith(extension)]
    print("文件获取成功：" + str(files))
    return files


def convert(file_name, convert_ext):
    cmd_str = f'pandoc "{file_name}" -o "{file_name[:-2] + convert_ext}"'
    print(cmd_str)
    subprocess.run(cmd_str, encoding="utf-8", shell=True)
    print(file_name[:-4] + "转化完成！")


def run():
    dir_path = get_file_path()
    extension_in, extension_out = get_file_extension()
    files = get_files(dir_path, extension_in)
    for file in files:
        convert(file, extension_out)
    print("全部文件转换完成！")


if __name__ == "__main__":
    run()
