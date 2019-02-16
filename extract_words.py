import re

with open("SherlockHolmes.txt", "r") as SherHolmes:
  text = SherHolmes.read()

outText = re.findall(r'[a-zA-Z]+', text)
temp = []
for item in outText: 
    temp.append(item.lower())

outText = temp
wordDict = {}
for item in outText:
	if item in wordDict:
		wordDict[item] = wordDict.get(item)+1
	else:
		wordDict[item] = 1

uniqueWords = ""
freqDict = {}
for item in wordDict:
	if wordDict[item] == 1:
		uniqueWords = uniqueWords + "\n" + item
	if wordDict[item] in freqDict:
		freqDict[wordDict[item]] = freqDict.get(wordDict[item]) + 1
	else:
		freqDict[wordDict[item]] = 1

frequency = ""
for item in freqDict:
	frequency = frequency + str(item) + ": " + str(freqDict[item]) + "\n"



outString = "\n".join(outText)


with open("allWords.txt","w") as allWords:
	allWords.write(outString)
with open("uniqueWords.txt","w") as uniqueWords:
	uniqueWords.write(outString)
with open("wordFrequency.txt","w") as wordFrequency:
	wordFrequency.write(outString)

  
  
