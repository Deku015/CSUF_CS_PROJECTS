import socket

# Server's IP address
SERVER_IP = "127.0.0.1"

# The server's port number
SERVER_PORT = 1235

# The client's socket
cliSock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# Attempt to connect to the server
cliSock.connect((SERVER_IP, SERVER_PORT))

# Send the message to the server
msg = "Hello World"

# Send the message to the server
# NOTE: the user input is of type string
# Sending data over the socket requires.
# First converting the string into bytes.
# encode() function achieves this.
cliSock.send(msg.encode())
cliMsg = cliSock.recv(1024)
print(str(cliMsg.decode()))
