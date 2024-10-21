from math import sqrt
#Reviewed By Khaled
class Point:
    def __init__(self, x = 0.0, y = 0.0):
        if (not isinstance(x, (int, float))) or (not isinstance(y, (int, float))):
            raise TypeError("Only integers are allowed")
        self.x = x
        self.y = y

    def distance_from_origin(self):
        """Calculate Distance of Point From (0,0)"""
        return sqrt((self.x - 0) ** 2 + (self.y- 0) ** 2)


if __name__ == "__main__":
    point1 = Point(5, 5)
    print(f"The Point is - ({point1.x}, {point1.y})")
    print(f"The Distance From (0,0) is - {point1.distance_from_origin()}")
