class Computer:

    def __init__(self, ic, pause_on_output):
        self.ic = ic.copy()
        self.pause_on_output = pause_on_output
        self.input = []
        self.pos = 0
        self.input_pos = 0
        self.output = []
        self.active = True
        self.rel_base = 0
        self.white = [[0, 0]]
        self.visited = []
        self.position = [0, 0]
        self.direction = [0, 1]

    def add_input(self, value):
        self.input.append(value)
        return self

    def run(self):
        return self.run0(self.ic)

    def run0(self, ic):

        while self.pos < len(ic):
            # print(ic)
            cmd = str(ic[self.pos]).zfill(5)
            # print(cmd)
            # print(self.pos)
            code = int(cmd[3:5])
            # True - immediate, False - Position
            m1 = int(cmd[2])
            m2 = int(cmd[1])
            m3 = int(cmd[0])
            i1 = -1
            i2 = -1
            i3 = -1
            if self.pos + 1 < len(ic):
                i1 = self.pos + 1 if m1 == 1 else ic[self.pos + 1] + (0 if m1 == 0 else self.rel_base)
            if self.pos + 2 < len(ic):
                i2 = self.pos + 2 if m2 == 1 else ic[self.pos + 2] + (0 if m2 == 0 else self.rel_base)
            if self.pos + 3 < len(ic):
                i3 = self.pos + 3 if m3 == 1 else ic[self.pos + 3] + (0 if m3 == 0 else self.rel_base)

            if code == 99:
                self.active = False
                break

            elif code == 1:
                ic[i3] = ic[i1] + ic[i2]
                self.pos += 4

            elif code == 2:
                ic[i3] = ic[i1] * ic[i2]
                self.pos += 4

            elif code == 3:
                ic[i1] = self.input[self.input_pos]
                self.input_pos += 1
                self.pos += 2

            elif code == 4:
                self.output.append(ic[i1])
                self.pos += 2

                if len(self.output) == 2:
                    color = self.output[0]
                    rotation = self.output[1]

                    if self.position not in self.visited:
                        self.visited.append(self.position)

                    if color == 0:
                        if self.position in self.white:
                            self.white.remove(self.position)
                    else:
                        if self.position not in self.white:
                            self.white.append(self.position)

                    rot = [[0, 1], [-1, 0], [0, -1], [1, 0]]
                    if rotation == 0:
                        self.direction = rot[(rot.index(self.direction) + 1) % 4]
                    else:
                        self.direction = rot[(rot.index(self.direction) - 1) % 4]

                    self.position = [self.position[0] + self.direction[0], self.position[1] + self.direction[1]]
                    self.output = []
                    self.add_input(1 if self.position in self.white else 0)

                # N.B.: execution is paused on output
                if self.pause_on_output:
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

            elif code == 9:
                self.rel_base += ic[i1]
                self.pos += 2

            else:
                raise Exception("Code is not supported")



input0 = "3,8,1005,8,327,1106,0,11,0,0,0,104,1,104,0,3,8,102,-1,8,10,1001,10,1,10,4,10,108,0,8,10,4,10,1001,8,0,28,1006,0,42,2,1104,11,10,1006,0,61,2,1005,19,10,3,8,1002,8,-1,10,1001,10,1,10,4,10,1008,8,1,10,4,10,102,1,8,65,1006,0,4,3,8,1002,8,-1,10,1001,10,1,10,4,10,108,1,8,10,4,10,1002,8,1,89,1,1108,10,10,1,1103,11,10,1,109,18,10,1006,0,82,3,8,102,-1,8,10,1001,10,1,10,4,10,108,0,8,10,4,10,102,1,8,126,2,109,7,10,1,104,3,10,1006,0,64,2,1109,20,10,3,8,1002,8,-1,10,101,1,10,10,4,10,108,1,8,10,4,10,101,0,8,163,3,8,102,-1,8,10,1001,10,1,10,4,10,108,1,8,10,4,10,1002,8,1,185,2,1109,12,10,2,103,16,10,1,107,11,10,3,8,102,-1,8,10,1001,10,1,10,4,10,108,0,8,10,4,10,1001,8,0,219,1,1005,19,10,3,8,102,-1,8,10,1001,10,1,10,4,10,108,1,8,10,4,10,102,1,8,245,2,1002,8,10,1,2,9,10,1006,0,27,1006,0,37,3,8,1002,8,-1,10,1001,10,1,10,4,10,108,0,8,10,4,10,102,1,8,281,1006,0,21,3,8,102,-1,8,10,101,1,10,10,4,10,108,0,8,10,4,10,1001,8,0,306,101,1,9,9,1007,9,1075,10,1005,10,15,99,109,649,104,0,104,1,21102,1,847069852568,1,21101,344,0,0,1105,1,448,21101,0,386979963688,1,21101,355,0,0,1105,1,448,3,10,104,0,104,1,3,10,104,0,104,0,3,10,104,0,104,1,3,10,104,0,104,1,3,10,104,0,104,0,3,10,104,0,104,1,21102,46346031251,1,1,21101,0,402,0,1105,1,448,21102,1,29195594775,1,21101,0,413,0,1105,1,448,3,10,104,0,104,0,3,10,104,0,104,0,21101,0,868498428772,1,21101,0,436,0,1106,0,448,21102,718170641172,1,1,21102,1,447,0,1105,1,448,99,109,2,21202,-1,1,1,21102,40,1,2,21102,1,479,3,21102,1,469,0,1105,1,512,109,-2,2105,1,0,0,1,0,0,1,109,2,3,10,204,-1,1001,474,475,490,4,0,1001,474,1,474,108,4,474,10,1006,10,506,1101,0,0,474,109,-2,2106,0,0,0,109,4,2102,1,-1,511,1207,-3,0,10,1006,10,529,21101,0,0,-3,22101,0,-3,1,22101,0,-2,2,21101,0,1,3,21101,548,0,0,1106,0,553,109,-4,2106,0,0,109,5,1207,-3,1,10,1006,10,576,2207,-4,-2,10,1006,10,576,21202,-4,1,-4,1106,0,644,22101,0,-4,1,21201,-3,-1,2,21202,-2,2,3,21102,1,595,0,1105,1,553,21201,1,0,-4,21101,0,1,-1,2207,-4,-2,10,1006,10,614,21102,1,0,-1,22202,-2,-1,-2,2107,0,-3,10,1006,10,636,22102,1,-1,1,21102,1,636,0,106,0,511,21202,-2,-1,-2,22201,-4,-2,-4,109,-5,2105,1,0"
input0 = input0.split(",")
input0 = [int(x) for x in input0]
input0 = input0 + [0] * 10000

c = Computer(input0, False)
c.add_input(1)
c.run()
# print(c.output)
print(c.visited[0:100])
print(c.white[0:100])

print(len(c.visited))
print(len(c.white))

print(c.visited)
print(c.white)

white = [[x[0]-1, x[1] + 5] for x in c.white]


print(min(c.white))
print(min(white))


for y in reversed(range(0, 7)):
    s = ""
    for x in range(0, 39):
        if [x, y] in white:
            s += "#"
        else:
            s += "_"
    print(s)