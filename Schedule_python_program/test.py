from datetime import datetime,timedelta
def parse_time_range(time_range):
    # Remove single quotes and split the string by ':' to get start and end times
    list = time_range.strip("'").split(":")

    # Create datetime objects with a dummy date (e.g., '1970-01-01') and the extracted times


def main():
    input_data = []
    with open("input.txt", "r") as file:
        current_input_set = []

        for line in file:
            line = line.strip()
            # Check if the line is empty (indicating the end of an input set)
            if not line:
                if current_input_set:
                    input_data.append(current_input_set)
                    current_input_set = []
            else:
                # Split the line by comma and remove the outer brackets
                range = line.strip('[]').split(',')
                time_ranges = []
                for element in range:
                    element = element.strip('[]')
                    element = element.replace("':'"," ")
                    element = element.strip("'")
                    time_ranges.append(element)
                    print(element)
                # Append the time ranges to the current input set
                current_input_set.append(time_ranges)
    i = 0
    while i < len(current_input_set):
        mhours1 = current_input_set[i]
        whours1 = current_input_set[i+1]
        mhours2 = current_input_set[i+2]
        whours2 = current_input_set[i+3]
        dur = int(current_input_set[i+4][0])
        obj = datetime.strptime(mhours1[0].split()[0],'%H:%M')
        print(obj)
        print(whours1)
        
        i += 5

    
main()