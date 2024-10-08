f = open("input.txt",'r')
o = open("output.txt", 'w')
import dynamic
import exhaustive

for i in range(0,10):
  s_and_v = []
  n = int(f.readline())
  list = f.readline()
  amount = int(f.readline())
  f.readline()
  for element in range(0,len(list)):
    if(list[element].isdigit()):
      s_and_v.append(int(list[element]))
  list = []
  i = 0
  while i < len(s_and_v):
    sub_list = []
    sub_list.append(s_and_v[i])
    sub_list.append(s_and_v[i+1])
    list.append(sub_list)
    i+=2
  max_amount_dynamic = dynamic.dynamic(n, list, amount)
  max_amount_exhaustive = exhaustive.exhaustive(n, list, amount)
  o.write(str(max_amount_dynamic) + ' ')
  o.write(str(max_amount_exhaustive)+ "\n")
  

f.close()
o.close()