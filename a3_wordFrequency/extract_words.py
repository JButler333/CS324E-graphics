import re

def allWords(Book, All):
  #Open and read the Gutenberg novel
  with open(Book, "r") as SherHolmes:
    text = SherHolmes.read()

  #Find all alphabetic words using regular expressions and append the lowercase to a list.
  outText = re.findall(r'[a-zA-Z]+', text)
  temp = []
  for item in outText: 
      temp.append(item.lower())
  outText = temp
  
  #Create an output string joined by newline characters
  outString = "\n".join(outText)

  #Write all words to a text file in the correct format.
  with open(All,"w") as allWords:
    allWords.write(outString)

  return outText


def Unique_and_Frequency(Book, outText, Unique, Frequencies):
  print(outText)
  #Create a dictionary and get the word frequencies
  wordDict = {}
  for item in outText:
    if item in wordDict:
      wordDict[item] = wordDict.get(item)+1
    else:
      wordDict[item] = 1

  #Create a dictionary and get the unique words, as well as getting the frequencies of each items
  uniqueWords = ""
  freqDict = {}
  for item in wordDict:
    if wordDict[item] == 1:
      uniqueWords = uniqueWords + "\n" + item
    if wordDict[item] in freqDict:
      freqDict[wordDict[item]] = freqDict.get(wordDict[item]) + 1
    else:
      freqDict[wordDict[item]] = 1

  #Write unique words to the correct file in the correct format
  with open(Unique,"w") as uniqueWords:
    uniqueWords.write(uniqueWords)

  #Get the frequency in a string format to be appended to the text file
  frequency = ""
  for item in freqDict:
    frequency = frequency + str(item) + ": " + str(freqDict[item]) + "\n"

  #Write the frequencies to the correct file with the correct format 
  with open(Frequencies,"w") as wordFrequency:
    wordFrequency.write(frequency)

  
def main():

  outText = allWords("SherlockHolmes.txt", "allWords.txt")

  Unique_and_Frequency("SherlockHolmes.txt", outText, "uniqueWords.txt", "wordFrequency.txt")

main()