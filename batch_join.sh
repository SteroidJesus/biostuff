NOW=$( date '+%F_%H:%M:%S' )

echo '
import os, cutadapt

print("Hi, this is a simple script for batch-joining of unpaired illumina reads using fastq-join.\nAll you need to do before running it is to put forward and reverse reads into separate folders.\nWritten for one lazy post doc ;)")





Forward_folder = input("\n\nplease, type folder name or folder adress of Forward reads \n")
try:
	F_folder_content = sorted(os.listdir(Forward_folder))
except:
	print("\nThere is no folder like this Maede, but try again, i believe in you\n")
	exit()
Reverse_folder = input("please, type folder name or folder adress of Reverse reads \n")	
try:
	R_folder_content = sorted(os.listdir(Reverse_folder))
except:
	print("\nThere is no folder like this Maede, but try again, i believe in you\n")
	exit()
if len(F_folder_content)!=len(R_folder_content):
	print("\n\ndiffernt number of F and R  reads, how am i supposed to pair this...\n\n")
	exit()
overenie = 0
for x in F_folder_content:
	print(F_folder_content[overenie],"\t->\t",R_folder_content[overenie])
	overenie += 1
pairing_question= input("\nis this pairing correct? (ordered alphabetically) \nY or N\n")
if pairing_question == "y" or pairing_question == "Y" or pairing_question == "yes":
	pass
else:
	print("\n...then fix it\n")
	exit()
overlap = input("\nnow, set your N-minimum overlap (default value is 20)\n")
print("overlap set to ",overlap)
difference = input("\nnow, set your N-% maximum difference (default value is 35)\n")
print("difference set to ",difference)

try:
	os.makedirs("joined")
except: pass
vystup = open("output_record.txt","w")
vystup.write("\n")
vystup.close
redirect = "|tee -a output_record.txt && printf '\\' >> output_record.txt "
output_folder = "joined"
poradie=0
prikazy = []
for x in F_folder_content:
	item1= F_folder_content[poradie]
	item2= R_folder_content[poradie]
	if "(" in item1 or "(" in item2 or ")" in item1 or ")" in item2:
		print("brackets dont work well with bash :( ...please dont use them in filenames")
		exit()
	elif item1[len(item1)-2:len(item1)] == "fq":
		item3= item1[:len(item1)-3]
	elif item1[len(item1)-5:len(item1)] == "fastq":
		item3= item1[:len(item1)-6]
	elif item1[len(item1)-3:len(item1)] == "txt":
		item3= item1[:len(item1)-4]
	else:
		print("\n--->{}<---\nthe file extension is rather weird dont you think?\n".format(item1))
		exit()
	single_command= "fastq-join -p {} -m {} {}/{} {}/{} -o {}/{}.%.fastq {}&& echo '{}' >> output_record.txt &&".format(difference, overlap, Forward_folder, item1, Reverse_folder, item2, output_folder, item3, redirect, item3)
	poradie += 1
	prikazy.append(single_command)	
	
joiner = open("joiner.sh", "w")
prikaz = "".join(prikazy)
prikaz = prikaz[0:len(prikaz)-2]
joiner.write(prikaz)
joiner.close
print("\n\n OK, running, wait\n\n")
exit()
' >batch_join.py

python3 batch_join.py && bash joiner.sh && rm batch_join.py && rm joiner.sh && printf '\n\n' && printf "finished :)\n" && printf '\n\n' && echo 'started' $NOW && NOW2=$( date '+%F_%H:%M:%S' ) && echo 'finished' $NOW2
