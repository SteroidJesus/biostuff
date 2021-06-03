NOW=$( date '+%F_%H:%M:%S' )
echo '

import os, cutadapt

obsah_zlozky = os.listdir()
zoznam_prikazov = []
direction = "-a"
primer_sequence = "AGATCGGAAGAGCACACGTCTGAACTCCAGTCAC"
output_name = ""
input_name = ""
report = ""
vystup = open("script2.sh", "w")
vystup_string = ""

for x in obsah_zlozky:
	if "script" in x or "adapter_cutter.sh" in x or "." not in x:
		continue
	else:
		report = "{}_report.txt".format(x)
		input_name = "\"{}\"".format(x)
		if x[-3:] == ".fq":
			output_name ="\"{}_cut.fastq\"".format(x[0:len(x)-3])
		elif x[-3:] == "stq":
			output_name ="\"{}_cut.fastq\"".format(x[0:len(x)-6])
		else:
			print(x)
			print ("weird file format... what am i supposed to do with this?")
			exit()
		prikaz = "cutadapt {} {} {} > {} 2> {} -j 0 ".format(direction, primer_sequence, input_name, output_name, report)
		zoznam_prikazov.append(prikaz)
		zoznam_prikazov.append("&& \n")
zoznam_prikazov.pop()
vystup_string = vystup_string.join(zoznam_prikazov)
print(vystup_string)

otazka = input("\n does it look ok? continue? \n Y or N \n")

if otazka == "Y" or otazka == "y":
	vystup.write(vystup_string)
	vystup.close()
else: 
	pass

exit()

' >script2.py
python3 script2.py && bash script2.sh && rm script2.sh && rm script2.py && echo "
finished :)
"&&
echo 'start' $NOW &&
NOW2=$( date '+%F_%H:%M:%S' ) &&
echo 'finish' $NOW2

