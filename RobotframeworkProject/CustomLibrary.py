import autoit
import time

class CustomLibrary:
    def __init__(self, num):
        self.num = int(num)

    def calculate_factorial(self):
        fact = 1
        for i in range(self.num, 0, -1):
            fact = fact * i

        return str(fact)

    def print_square_of_all_values(self, list1):
        return [int(val)**2 for val in list1]

    def upload_file(self, filepath):
        autoit.win_wait_active("[CLASS:#32770]", 3)
        autoit.control_send("[TITLE:Open]", "Edit1", filepath)
        time.sleep(2)
        autoit.control_click("[Class:#32770]", "Button1")
        time.sleep(2)



if __name__ == '__main__':
    obj = CustomLibrary(5)
    print(obj.calculate_factorial())