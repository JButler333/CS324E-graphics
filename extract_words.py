import re

def get_AllWords(FileName, OutFileName):
    with open(FileName, "r") as SherHolmes:
    text = SherHolmes.read()

    outText = re.findall(r'[a-zA-Z]+', text)
    temp = []
    for item in outText: 
        temp.append(item.lower())
    outText = temp

    outString = "\n".join(outText)


    with open(outFileName,"w") as AllWords:
      AllWords.write(outString)


def main():

    get_allWords("SherlockHolmes.txt", "AllWords.txt")

main()
      


  
