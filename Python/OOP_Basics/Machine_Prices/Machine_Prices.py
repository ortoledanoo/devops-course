from datetime import datetime
from time import sleep

main_dict = {}

class Machine:
    def __init__(self, machine_type, machine_name):
        self.machine_name = machine_name
        self.machine_type = machine_type
        if self.machine_type == 1:
            self.cost_per_minute = 2
        elif self.machine_type == 2:
            self.cost_per_minute = 5
        else:
            raise TypeError("Type Can Be Only 1/2")
        main_dict.update({self.machine_name: 0})
        self.time_start = None
        self.time_end = None

    def start_machine(self):
        """Starts Machine and Saves The Time Right Now at time_start"""
        self.time_start = datetime.now()
        print(f"Machine Type {self.machine_type} Started at {self.time_start}")
        return self.time_start

    def stop_machine(self):
        """Stop Machine and Saves The Time Stopped ad time_end. Return total_price() Function"""
        self.time_end = datetime.now()
        print(f"Machine_stopped at {self.time_end}")
        return self.total_price()

    def total_price(self):
        """Calculate Time Running and According To Duration Calculate Total Price and Return"""
        duration = (self.time_end - self.time_start).total_seconds() / 60.0
        total_price = duration * self.cost_per_minute
        main_dict[self.machine_name] = main_dict.get(self.machine_name, 0) + total_price
        return total_price


if __name__ == "__main__":
    cost = 0
    machine_a = Machine(1, "Machine_A")
    machine_b = Machine(1, "Machine_B")
    machine_c = Machine(1, "Machine_C")
    machine_d = Machine(2, "Machine_D")
    machine_a.start_machine()
    machine_b.start_machine()
    machine_c.start_machine()
    machine_d.start_machine()
    print(main_dict)
    sleep(6)

    machine_e = Machine(2, "Machine_E")
    machine_e.start_machine()
    sleep(6)

    cost += machine_b.stop_machine()
    sleep(6)

    cost += machine_a.stop_machine()
    cost += machine_c.stop_machine()
    cost += machine_d.stop_machine()
    cost += machine_e.stop_machine()
    print(main_dict)
    print(round(cost, 3))
    print(round(sum(main_dict.values()), 3))


