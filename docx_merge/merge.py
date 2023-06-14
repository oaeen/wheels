import os
from docx import Document
from docxcompose.composer import Composer
from tkinter.filedialog import askdirectory


class Merge:
    def __init__(self):
        # 需要合并的文件路径
        self.folder_path = ''
        self.filepaths = []
        # 合并后文件名
        self.desktop = os.path.join(os.path.join(os.environ['USERPROFILE']), 'Desktop')
        self.merge_filename = 'A合并后的文件.docx'
        self.merge_file = '{}/{}'.format(self.desktop, self.merge_filename)

    def run(self, _files, _merge_file):
        # 默认采用第一个文件的文档格式
        doc = self.docx_process(_files[0])
        merge_docx = Composer(doc)

        for i in range(1, len(_files)):
            docx_file = self.docx_process(_files[i])
            merge_docx.append(docx_file)

        merge_docx.save(_merge_file)

    # 合并时对每个文档的处理，现在为添加分页符
    def docx_process(self, file_path):
        docx_file = Document(file_path)
        docx_file.add_page_break()
        return docx_file

    def get_path(self):
        # 合并后文件名
        try:
            with open(".env", "r") as f:
                self.merge_file = f.read()
        except FileNotFoundError:
            pass

        self.folder_path = askdirectory(title='请选择需要合并的文件路径')
        filenames = os.listdir(self.folder_path)
        self.filepaths = ['{}/{}'.format(self.folder_path, filename) for filename in filenames]
        return self.filepaths, self.merge_file


if __name__ == '__main__':
    merge = Merge()
    merge.get_path()

    try:
        merge.run(merge.filepaths, merge.merge_file)
        print('合并完成')
    except Exception as e:
        print(e)
        print('合并失败')

    input("请按任意键退出！")
