import os
# Reviewed By Kobi
def find_word_in_files(word):
    for root, dirs, files in os.walk('/home/ortoledano/Desktop'):
        for file in files:
            try:
                if word in open(os.path.join(root, file), 'r').read():
                    print(os.path.join(root, file))
            except:
                pass


find_word_in_files("Toledanocheck")