// Please implement the `ComputationError.IllegalArgument` error.

pub const ComputationError = error{
    IllegalArgument,
};

pub fn steps(number: usize) anyerror!usize {
    var step: usize = 0;
    var temp: usize = number;

    if (number == 0) return ComputationError.IllegalArgument;
    while (temp != 1) : (step += 1) {
        if (temp % 2 == 0) {
            temp /= 2;
        } else {
            temp *= 3;
            temp += 1;
        }
    }

    return step;
}
