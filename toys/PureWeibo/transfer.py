from itertools import chain
from pypinyin import pinyin, Style


def sorted_by_pinyin(chars):
    return ''.join(chain.from_iterable(pinyin(chars, style=Style.TONE3)))


# Formatted words
# Delete blank lines and duplicates
# Sort
def format_words(file_path):
    words = []

    with open(file_path, 'r', encoding='utf-8') as file_in:
        for line in file_in.readlines():
            if line.split():
                words.append(line.strip())
    
    words = sorted(list(set(words)), key=sorted_by_pinyin)

    with open(file_path[:-4] + "_sorted.txt", 'w', encoding='utf-8') as file_out:
        for word in words:
            file_out.write(word + '\n')

    return words


# 输出文本

def save(keywords, share_path):
    file = open(share_path, 'w', encoding='utf-8')
    file.write('version=1\n')
    
    for text in keywords:
        file.write('{"inHome":true, "inHot":true,"inHotSearchWord":true, "inStatusComment":true, "inStatusSearch":true, "isOnStatusContent":true, "isOnUserName":true, "isUserNameEquals":false, "word":"' + text + '"}' + '\n')
    file.close()


def test():
    keywords = format_words('p_keywords.txt')
    save(keywords, 'block_words.bak')


test()
