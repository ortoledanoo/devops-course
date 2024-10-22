from datetime import datetime
from time import sleep

class CloudService:
    def __init__(self, name):
        self.name = name
        self.cloud = {}

class Machine:
    def __init__(self, machine_type, machine_name, service):
        self.service = service
        self.machine_name = machine_name
        if self.machine_name in self.service.cloud:
            print("Machine Name Already Exist - Creates New!")
        self.machine_type = machine_type
        if self.machine_type == 1:
            self.cost_per_minute = 2
        elif self.machine_type == 2:
            self.cost_per_minute = 5
        else:
            raise TypeError("Type Can Be Only 1/2")
        self.service.cloud.update({self.machine_name: 0})
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
        self.service.cloud[self.machine_name] = self.service.cloud.get(self.machine_name, 0) + total_price
        return total_price


