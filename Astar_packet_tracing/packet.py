import heapq

class Router: #define Router class
    def __init__(self, name, subnet):
        self.name = name
        self.subnet = subnet
        self.neighbors = []

    def add_neighbor(self, neighbor):
        self.neighbors.append(neighbor)

class Packet: #define Packet class
    def __init__(self, source_ip, destination_ip):
        self.source_ip = source_ip
        self.destination_ip = destination_ip

class Network: #define Network class
    def __init__(self):
        self.routers = [
            Router('Router 1', '192.168.1.0'),
            Router('Router 2', '192.168.2.0'),
            Router('Router 3', '192.168.3.0'),
            Router('Router 4', '192.168.4.0'),
            Router('Router 5', '192.168.5.0'),
        ]
        self.initialize_connections()

    def initialize_connections(self):
        for i in range(5):
            self.routers[i].add_neighbor(self.routers[(i + 1) % 5]) #finds both neighbors 
            self.routers[i].add_neighbor(self.routers[(i - 1) % 5])

def heuristic(router, goal_router):
    # Simple heuristic: number of hops to the goal router
    return abs(int(router.name.split()[-1]) - int(goal_router.name.split()[-1])) # Manhattan distance

def a_star(network, start_router, goal_router):
    open_set = [(0, start_router)]
    came_from = {}
    g_score = {router: float('inf') for router in network.routers}
    g_score[start_router] = 0
    f_score = {router: float('inf') for router in network.routers}
    f_score[start_router] = heuristic(start_router, goal_router)

    while open_set: #while open list not empty
        _, current = heapq.heappop(open_set) #pop 

        if current == goal_router:
            path = [current]
            while current in came_from:
                current = came_from[current]
                path.append(current)
            path.reverse()
            return path # return path found 

        for neighbor in current.neighbors:
            tentative_g_score = g_score[current] + 1  # Assuming equal cost for all connections
            if tentative_g_score < g_score[neighbor]: #find least g 
                came_from[neighbor] = current
                g_score[neighbor] = tentative_g_score
                f_score[neighbor] = g_score[neighbor] + heuristic(neighbor, goal_router)
                heapq.heappush(open_set, (f_score[neighbor], neighbor)) #push to heap 

    return None

def route_packet(network, packet):
    start_router = None
    goal_router = None

    s_octets = packet.source_ip.split('.')
    dest_octets = packet.destination_ip.split('.')

    for router in network.routers:
        router_octets = router.subnet.split('.')
        if s_octets[:3] == router_octets[:3]:
            start_router = router
        if dest_octets[:3] == router_octets[:3]:
            goal_router = router

    if start_router and goal_router:
        path = a_star(network, start_router, goal_router)
        if path:
            print("Path found:")
            for router in path:
                print(router.name)
        else:
            print("No path found")
    else:
        print("Invalid source or destination IP address")


def main():
    network = Network()
    packet1 = Packet('192.168.5.1', '192.168.2.2')
    packet2 = Packet('192.168.3.1', '192.168.4.2')
    packet3 = Packet('192.168.1.1', '192.168.4.2')
    packet4 = Packet('192.168.4.1', '192.168.2.2')
    route_packet(network, packet1)
    route_packet(network, packet2)
    route_packet(network, packet3)
    route_packet(network, packet4)

if __name__ == "__main__":
    main()
