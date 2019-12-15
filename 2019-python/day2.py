class Computer:

    def __init__(self, ic):
        self.ic = ic.copy()

    def run(self):
        return self.run0(self.ic)

    def run0(self, ic):
        pos = 0
        while pos < len(ic):
            code = ic[pos]
            if code == 99:
                break
            if code == 1:
                ic[ic[pos + 3]] = ic[ic[pos + 1]] + ic[ic[pos + 2]]
                pos += 4
            if code == 2:
                ic[ic[pos + 3]] = ic[ic[pos + 1]] * ic[ic[pos + 2]]
                pos += 4


input0 = "1,0,0,3,1,1,2,3,1,3,4,3,1,5,0,3,2,10,1,19,2,19,6,23,2,13,23,27,1,9,27,31,2,31,9,35,1,6,35,39,2,10,39,43,1,5,43,47,1,5,47,51,2,51,6,55,2,10,55,59,1,59,9,63,2,13,63,67,1,10,67,71,1,71,5,75,1,75,6,79,1,10,79,83,1,5,83,87,1,5,87,91,2,91,6,95,2,6,95,99,2,10,99,103,1,103,5,107,1,2,107,111,1,6,111,0,99,2,14,0,0"
input0 = input0.split(",")
input0 = [int(x) for x in input0]
print(input0)

c = Computer([1, 0, 0, 0, 99])
c.run()
print(c.ic == [2, 0, 0, 0, 99])

c = Computer([2, 3, 0, 3, 99])
c.run()
print(c.ic == [2, 3, 0, 6, 99])

c = Computer([2, 4, 4, 5, 99, 0])
c.run()
print(c.ic == [2, 4, 4, 5, 99, 9801])

c = Computer([1, 1, 1, 4, 99, 5, 6, 0, 99])
c.run()
print(c.ic == [30, 1, 1, 4, 2, 5, 6, 0, 99])


input0[1] = 12
input0[2] = 2
c = Computer(input0)
c.run()
print(c.ic[0])

i1 = 0
i2 = 0
output = 0
target = 19690720
while True:
    i1 += 1
    input0[1] = i1
    input0[2] = i2
    c = Computer(input0)
    c.run()
    output = c.ic[0]
    print(output)
    if output >= target:
        break

if output > target:
    i1 -= 1
    while True:
        i2 += 1
        input0[1] = i1
        input0[2] = i2
        c = Computer(input0)
        c.run()
        output = c.ic[0]
        print(output)
        if output == target:
            break

print([i1, i2])

