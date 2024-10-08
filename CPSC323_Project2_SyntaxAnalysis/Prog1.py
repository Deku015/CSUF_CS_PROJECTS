#Shadi Hirbawi 
# Project 2

table = [["TQ",0,0,0,0,"TQ",0,0],
         [0,"+TQ","-TQ",0,0,0,'e','e'],
         ["FR",0,0,0,0,"FR",0,0],
         [0,'e','e',"*FR","/FR",0,'e','e'],
         ['a',0,0,0,0,"(E)",0,0]]
words = input("Please enter your input string ending in $:")
stack = "E$"
print(stack + "    " + words)
while(words != '$' and stack != '$'):

    if(stack[0] == 'E'):
        if(words[0] == 'a'):
            stack = table[0][0] + stack[1:]
            print(stack + "    " + words)
        if(words[0]=='+' or words[0] == '-' or words[0] == '*' or words[0] == '/' or words[0] == '$'):
            break
        if(words[0] == '('):
            stack = table[0][5] + stack[1:]
            print(stack + "    " + words)

        if(stack[0] == words[0] == 'a'):
            stack = stack[1:]
            words = words[1:]
            print(stack + "    " + words)
            continue
        if(stack[0] == words[0] == '+'):
            stack = stack[1:]
            words = words[1:]
            print(stack + "    " + words)
            continue
        if(stack[0] == words[0] == '-'):
            stack = stack[1:]
            words = words[1:]
            print(stack + "    " + words)
            continue
        if(stack[0] == words[0] == '*'):
            stack = stack[1:]
            words = words[1:]
            print(stack + "    " + words)
            continue
        if(stack[0] == words[0] == '/'):
            stack = stack[1:]
            words = words[1:]
            print(stack + "    " + words)
            continue
        if(stack[0] == words[0] == '('):
            stack = stack[1:]
            words = words[1:]
            print(stack + "    " + words)
            continue
        if(stack[0] == words[0] == ')'):
            stack = stack[1:]
            words = words[1:]
            print(stack + "    " + words)
            continue
        
        

    if(stack[0] == 'Q'):
        if(words[0] == '+'):
            stack = table[1][1] + stack[1:]
            print(stack + "    " + words)

        if(words[0] == '-'):
            stack = table[1][2] + stack[1:]
            print(stack + "    " + words)

        if(words[0] == ')'):
            stack = stack[1:]
            print(stack + "    " + words)

        if(words[0] == '$'):
            stack = stack[1:]
            print(stack + "    " + words)

        if(words[0] == 'a' or words[0] == '*' or words[0] == '/' or words[0] == '('):
            break

        if(stack[0] == words[0] == 'a'):
            stack = stack[1:]
            words = words[1:]
            print(stack + "    " + words)
            continue
        if(stack[0] == words[0] == '+'):
            stack = stack[1:]
            words = words[1:]
            print(stack + "    " + words)
            continue
        if(stack[0] == words[0] == '-'):
            stack = stack[1:]
            words = words[1:]
            print(stack + "    " + words)
            continue
        if(stack[0] == words[0] == '*'):
            stack = stack[1:]
            words = words[1:]
            print(stack + "    " + words)
            continue
        if(stack[0] == words[0] == '/'):
            stack = stack[1:]
            words = words[1:]
            print(stack + "    " + words)
            continue
        if(stack[0] == words[0] == '('):
            stack = stack[1:]
            words = words[1:]
            print(stack + "    " + words)
            continue
        if(stack[0] == words[0] == ')'):
            stack = stack[1:]
            words = words[1:]
            print(stack + "    " + words)
            continue
        
        
        

    if(stack[0] == 'T'):
        if(words[0] == 'a'):
            stack = table[2][0] + stack[1:]
            print(stack + "    " + words)

        if(words[0] == '+' or words[0] == '-' or words[0] == '*' or words[0] == '/' or words[0] == ')' or words[0] == '$'):
            break

        if(words[0] == '('):
            stack = table[2][5] + stack[1:]
            print(stack + "    " + words)
        
        if(stack[0] == words[0] == 'a'):
            stack = stack[1:]
            words = words[1:]
            print(stack + "    " + words)
            continue
        if(stack[0] == words[0] == '+'):
            stack = stack[1:]
            words = words[1:]
            print(stack + "    " + words)
            continue
        if(stack[0] == words[0] == '-'):
            stack = stack[1:]
            words = words[1:]
            print(stack + "    " + words)
            continue
        if(stack[0] == words[0] == '*'):
            stack = stack[1:]
            words = words[1:]
            print(stack + "    " + words)
            continue
        if(stack[0] == words[0] == '/'):
            stack = stack[1:]
            words = words[1:]
            print(stack + "    " + words)
            continue
        if(stack[0] == words[0] == '('):
            stack = stack[1:]
            words = words[1:]
            print(stack + "    " + words)
            continue
        if(stack[0] == words[0] == ')'):
            stack = stack[1:]
            words = words[1:]
            print(stack + "    " + words)
            continue
        

    if(stack[0] == 'R'):
        if(words[0] == '*'):
            stack = table[3][3] + stack[1:]
            print(stack + "    " + words)
        if(words[0] == '$'):
            stack = stack[1:]
            print(stack + "    " + words)

        if(words[0] == '+'):
            stack = stack[1:]
            print(stack + "    " + words)

        if(words[0] == '-'):
            stack = stack[1:]
            print(stack + "    " + words)

        if(words[0] == '/'):
            stack = table[3][4] + stack[1:]
            print(stack + "    " + words)

        if(words[0] == ')'):
            stack = stack[1:]
            print(stack + "    " + words)

        if(words[0] == '(' or words[0] == 'a'):
            break

        if(stack[0] == words[0] == 'a'):
            stack = stack[1:]
            words = words[1:]
            print(stack + "    " + words)
            continue
        if(stack[0] == words[0] == '+'):
            stack = stack[1:]
            words = words[1:]
            print(stack + "    " + words)
            continue
        if(stack[0] == words[0] == '-'):
            stack = stack[1:]
            words = words[1:]
            print(stack + "    " + words)
            continue
        if(stack[0] == words[0] == '*'):
            stack = stack[1:]
            words = words[1:]
            print(stack + "    " + words)
            continue
        if(stack[0] == words[0] == '/'):
            stack = stack[1:]
            words = words[1:]
            print(stack + "    " + words)
            continue
        if(stack[0] == words[0] == '('):
            stack = stack[1:]
            words = words[1:]
            print(stack + "    " + words)
            continue
        if(stack[0] == words[0] == ')'):
            stack = stack[1:]
            words = words[1:]
            print(stack + "    " + words)
            continue
        

    if(stack[0] == 'F'):
        if(words[0] == 'a'):
            stack = table[4][0] + stack[1:]
            print(stack + "    " + words)

        if(words[0] == '('):
            stack = table[4][5] + stack[1:]
            print(stack + "    " + words)

        if(words[0] == '+' or words[0] == '*' or words[0] == '/' or words[0] == '-' or words[0] == ')' or words[0] == '$'):
            break
        
        if(stack[0] == words[0] == 'a'):
            stack = stack[1:]
            words = words[1:]
            print(stack + "    " + words)
            continue
        if(stack[0] == words[0] == '+'):
            stack = stack[1:]
            words = words[1:]
            print(stack + "    " + words)
            continue
        if(stack[0] == words[0] == '-'):
            stack = stack[1:]
            words = words[1:]
            print(stack + "    " + words)
            continue
        if(stack[0] == words[0] == '*'):
            stack = stack[1:]
            words = words[1:]
            print(stack + "    " + words)
            continue
        if(stack[0] == words[0] == '/'):
            stack = stack[1:]
            words = words[1:]
            print(stack + "    " + words)
            continue
        if(stack[0] == words[0] == '('):
            stack = stack[1:]
            words = words[1:]
            print(stack + "    " + words)
            continue
        if(stack[0] == words[0] == ')'):
            stack = stack[1:]
            words = words[1:]
            print(stack + "    " + words)
            continue
    
        

if((stack[0] == 'Q' or stack[0] == 'R' or stack[0] == '$') and words[0] == '$'):
    print("Output: String is accepted/valid")
else:
    print("Output: String is not accepted/invalid")