from Bio import Entrez

zadanie = open("zadanie.txt", "rt")
vystup = open("vystup.txt", "wt")
Entrez.email = 'someuser@mail.com'
riadok = zadanie.readlines()

for x in riadok:
	if x == "\n":
		fraza = x
	else:
		y = x[0:len(x)-1]
		handle = Entrez.efetch(db="nucleotide", id=y, rettype="gb", retmode="text")
		result = handle.read().split('\n')
		for line in result:
			if "ORGANISM" in line:
				zaciatok = result.index(line)
			if "REFERENCE" in line:
				koniec = result.index(line)
				break
		fraza = "".join(result[zaciatok:koniec])
		while "  " in fraza:
			fraza = fraza.replace("  "," ")
		fraza = y + "\t" + fraza.replace(" ORGANISM ","") + "\n"
	print(fraza)
	vystup.write(fraza)
vystup.close
exit()
