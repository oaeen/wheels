import os
import shutil


def run(huorong_log_path, qq_image_tmp_path):
    with open(huorong_log_path, "r", encoding="ANSI") as f:
        img_path_list = [
            line.split(",")[5].strip() for line in f if "FILE_read," in line
        ]
        for img_path in img_path_list:
            img_folder = os.path.dirname(img_path)
            img_name = os.path.basename(img_path)
            try:
                if not os.path.exists(img_folder):
                    os.makedirs(img_folder)
                shutil.move(
                    os.path.join(qq_image_tmp_path, img_name),
                    os.path.dirname(img_folder),
                )
            except:
                continue


if __name__ == "__main__":
    # 将导出日志放到桌面上 重命名为 log.txt
    huorong_log_path = os.path.join(os.path.expanduser("~"), "Desktop\log.txt")
    print(huorong_log_path)
    # QQ群图片会剪切到这个文件夹下，可以手动查看和删除
    qq_image_tmp_path = "D:\qq_image_tmp"
    if not os.path.exists(qq_image_tmp_path):
        os.mkdir(qq_image_tmp_path)
    run(huorong_log_path, qq_image_tmp_path)
