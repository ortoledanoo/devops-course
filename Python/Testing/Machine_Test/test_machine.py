import pytest
from datetime import datetime, timedelta
from Machine_Prices import Machine, CloudService

@pytest.fixture
def mock_service():
    """Create a Mock Service For Testing"""
    return CloudService("Amazon")

@pytest.fixture
def machine(mock_service):
    """Create a Machine Object For Testing."""
    return Machine(machine_type=1, machine_name="Machine_A", service=mock_service)

def test_machine_initialization(machine):
    """Checks init Process"""
    assert machine.machine_name == "Machine_A"
    assert machine.machine_type == 1
    assert machine.cost_per_minute == 2
    assert machine.service.cloud == {"Machine_A": 0}
    assert machine.time_start is None
    assert machine.time_end is None

# def create_double_machine(machine):
#     """Create Double Machine in Same Name"""
#     another_machine = Machine(machine_type=1, machine_name="Machine_A", service=mock_service)
#     assert another_machine.machine_name == "Machine_A"

def test_start_machine(machine):
    """Checks Machine Started"""
    start_time = machine.start_machine()
    assert machine.time_start is not None
    assert isinstance(machine.time_start, datetime) # Import Module datetime to Work With Dates as Date Objects.

def test_stop_machine(machine):
    machine.start_machine()
    total_price = machine.stop_machine()
    assert machine.time_end is not None
    assert total_price >= 0

def test_total_price(machine):
    """Check total_price is Corrected"""
    machine.start_machine()

    # Make Simulate Of 1 Minute
    machine.time_start = datetime.now() - timedelta(minutes=1)
    machine.time_end = datetime.now()

    price = machine.total_price()
    assert round(price, 3) == 2.000  #Should Be 2.0 For 1 Minute at $2/min

def test_machine_cost_updated(machine):
    """Check if Cost Updated in Dictionary of Service"""
    machine.start_machine()

    # Make Simulate Of 1 Minute
    machine.time_start = datetime.now() - timedelta(minutes=1)
    machine.time_end = datetime.now()

    machine.total_price()
    assert machine.service.cloud["Machine_A"] > 0

