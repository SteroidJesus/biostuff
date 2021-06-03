list = []
file = open("vstup.txt","rt")
for myline in file:
    x = myline[:-1]
    if x in list:
        print(list)
        continue
    else:
        list.append(x)
        print(list)
vysledok = open("vysledok.txt","wt")
veta = "".join(list)
vysledok.write(veta)
'''
list = []
file = open("vstup.txt","rt")
for myline in file:
    x = myline[:-1]
    if x in list:
        continue
    elif "class" not in myline:
        list.append(x)
vysledok2 = open("vysledok2.txt","wt")
veta = "".join(list)
vysledok2.write(veta)
'''
'''
#odlisne v skupinach
list = []
list2 = []
domain = open("vstup.txt","rt")
phylum = open("vysledok.txt","rt")
for myline in phylum:
    y = myline[:-1]
    list2.append(y)
for myline in domain:
    x = myline[:-1]
    if x in list2 and x not in list:
        list.append(x)
    else:
        continue
vysledok = open("vysledok5.txt","wt")
veta = "".join(list)
vysledok.write(veta)
'''