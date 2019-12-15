import itertools

class Computer:

    def __init__(self, ic):
        self.ic = ic.copy()
        self.input = []
        self.pos = 0
        self.input_pos = 0
        self.output = []
        self.active = True

    def add_input(self, value):
        self.input.append(value)
        return self

    def run(self):
        return self.run0(self.ic)

    def run0(self, ic):

        while self.pos < len(ic):
            # print(ic)
            cmd = str(ic[self.pos]).zfill(5)
            code = int(cmd[3:5])
            # True - immediate, False - Position
            m1 = int(cmd[2])
            m2 = int(cmd[1])
            m3 = int(cmd[0])
            i1 = -1
            i2 = -1
            i3 = -1
            if self.pos + 1 < len(ic):
                i1 = self.pos + 1 if m1 else ic[self.pos + 1]
            if self.pos + 2 < len(ic):
                i2 = self.pos + 2 if m2 else ic[self.pos + 2]
            if self.pos + 3 < len(ic):
                i3 = self.pos + 3 if m3 else ic[self.pos + 3]

            if code == 99:
                self.active = False
                break

            elif code == 1:
                ic[ic[self.pos + 3]] = ic[i1] + ic[i2]
                self.pos += 4

            elif code == 2:
                ic[ic[self.pos + 3]] = ic[i1] * ic[i2]
                self.pos += 4

            elif code == 3:
                ic[ic[self.pos + 1]] = self.input[self.input_pos]
                self.input_pos += 1
                self.pos += 2

            elif code == 4:
                self.output.append(ic[i1])
                self.pos += 2
                # N.B.: execution is paused on output
                break

            elif code == 5:
                self.pos = self.pos + 3 if ic[i1] == 0 else ic[i2]

            elif code == 6:
                self.pos = ic[i2] if ic[i1] == 0 else self.pos + 3

            elif code == 7:
                ic[i3] = 1 if ic[i1] < ic[i2] else 0
                self.pos += 4

            elif code == 8:
                ic[i3] = 1 if ic[i1] == ic[i2] else 0
                self.pos += 4

            else:
                raise Exception("Code is not supported")


input0 = "3,8,1001,8,10,8,105,1,0,0,21,34,55,68,85,106,187,268,349,430,99999,3,9,1001,9,5,9,1002,9,5,9,4,9,99,3,9,1002,9,2,9,1001,9,2,9,1002,9,5,9,1001,9,2,9,4,9,99,3,9,101,3,9,9,102,3,9,9,4,9,99,3,9,1002,9,5,9,101,3,9,9,102,5,9,9,4,9,99,3,9,1002,9,4,9,1001,9,2,9,102,3,9,9,101,3,9,9,4,9,99,3,9,1001,9,2,9,4,9,3,9,101,2,9,9,4,9,3,9,1002,9,2,9,4,9,3,9,1002,9,2,9,4,9,3,9,1001,9,1,9,4,9,3,9,1001,9,2,9,4,9,3,9,1002,9,2,9,4,9,3,9,101,2,9,9,4,9,3,9,1001,9,2,9,4,9,3,9,102,2,9,9,4,9,99,3,9,1002,9,2,9,4,9,3,9,102,2,9,9,4,9,3,9,101,1,9,9,4,9,3,9,1001,9,1,9,4,9,3,9,1001,9,1,9,4,9,3,9,101,1,9,9,4,9,3,9,1001,9,1,9,4,9,3,9,101,2,9,9,4,9,3,9,1001,9,1,9,4,9,3,9,1001,9,1,9,4,9,99,3,9,1001,9,2,9,4,9,3,9,101,2,9,9,4,9,3,9,101,2,9,9,4,9,3,9,1002,9,2,9,4,9,3,9,102,2,9,9,4,9,3,9,1002,9,2,9,4,9,3,9,101,1,9,9,4,9,3,9,1002,9,2,9,4,9,3,9,102,2,9,9,4,9,3,9,1002,9,2,9,4,9,99,3,9,102,2,9,9,4,9,3,9,1001,9,2,9,4,9,3,9,102,2,9,9,4,9,3,9,102,2,9,9,4,9,3,9,101,1,9,9,4,9,3,9,102,2,9,9,4,9,3,9,102,2,9,9,4,9,3,9,102,2,9,9,4,9,3,9,101,1,9,9,4,9,3,9,1002,9,2,9,4,9,99,3,9,102,2,9,9,4,9,3,9,1001,9,1,9,4,9,3,9,102,2,9,9,4,9,3,9,101,1,9,9,4,9,3,9,102,2,9,9,4,9,3,9,102,2,9,9,4,9,3,9,101,2,9,9,4,9,3,9,101,2,9,9,4,9,3,9,1001,9,2,9,4,9,3,9,102,2,9,9,4,9,99"
# input0 = "3,26,1001,26,-4,26,3,27,1002,27,2,27,1,27,26,27,4,27,1001,28,-1,28,1005,28,6,99,0,0,5"
input0 = input0.split(",")
input0 = [int(x) for x in input0]
print(input0)

max_id = -1

perms = list(itertools.permutations([5, 6, 7, 8, 9]))
for perm in perms:
    # perm = [9, 8, 7, 6, 5]
    c = []
    id = 0
    i = 0
    for p in perm:
        c.append(Computer(input0).add_input(p))

    while c[4].active:
        if c[i].active:
            c[i].add_input(id)
            c[i].run()
            id = c[i].output[-1]
        i = (i + 1) % 5

    max_id = max(max_id, c[4].output[-1])

print(max_id)



# max_id = -1
#
# perms = list(itertools.permutations([0, 1, 2, 3, 4]))
# for perm in perms:
#     c = []
#     id = 0
#     for p in perm:
#         c.append(Computer(input0).add_input(p))
#
#     for i in range(0, 5):
#         c[i].add_input(id)
#         c[i].run()
#         id = c[i].output[-1]
#
#     max_id = max(max_id, id)
#
#
# print(max_id)
