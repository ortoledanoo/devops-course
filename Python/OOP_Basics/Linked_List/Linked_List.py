#Reviewed By Khaled
class Node:
    def __init__(self, data, next = None):
        self.data = data
        self.next = next

class LinkedList:
    def __init__(self):
        self.head = None

    def push(self, data):
        """Push New Value To Linked List"""
        new_node = Node(data) #Creates New class Node and Put User Data Inside
        if self.head is None: #Check if Have Prev Nodes
            self.head = new_node
        else:
            current_node = self.head
            while current_node.next: #while current_node Have Valid Value
                current_node = current_node.next
            current_node.next = new_node #Set To Last Valid Value

    def len(self):
        """Return The Len of Linked List"""
        current_node = self.head
        counter = 0
        #W
        while current_node:
            counter += 1
            current_node = current_node.next
        return counter

    def print_list(self):
        """Print The __str__ Function"""
        print(self.__str__())

    def pop(self):
        """Remove The First Element Of Linked List"""
        if self.head is None:
            return None
        popped_node = self.head
        self.head = self.head.next
        return popped_node.data

    def get_head(self):
        """Return The First Element Of Linked List"""
        current_node = self.head
        return current_node.data

    def is_empty(self):
        """Check if Linked List is Empty"""
        return self.head is None #Check if Have Prev Nodes

    def __str__(self):
        """Print The List Nodes With -> Between The Nodes"""
        current_node = self.head
        string = ""
        while current_node:
            string += f"{current_node.data} -> "
            current_node = current_node.next
        return string + "None"


#Create Linked List
new_list = LinkedList()

#Check if Empty
print(f"The List is Empty? - {new_list.is_empty()}")

#Push 4 Values
new_list.push(input("Enter First Element - "))
new_list.push(input("Enter First Element - "))
new_list.push(input("Enter First Element - "))
new_list.push(input("Enter First Element - "))

#Check Again if Empty
print(f"The List is Empty? - {new_list.is_empty()}")

#Check Len of Linked List
print(f"Number Of Items in Linked List is - {new_list.len()}")

#Print HEAD
print(f"The Head Of Linked List is - {new_list.get_head()}")

#POP
print(f"The Value Of Popped Data - {new_list.pop()}")

#Check Len of Linked List
print(f"Number Of Items in Linked List is - {new_list.len()}")

#Print List in 2 Ways
new_list.print_list()
print(new_list)