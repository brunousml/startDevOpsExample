import unittest
from Calculator import Calculator


class CalculatorTest(unittest.TestCase):
    def test_sum_with_success(self):
        # Set Up
        expected = 2
        a = 1
        b = 1
        calculator = Calculator(a, b)

        # ACT
        actual = calculator.sum()

        # Assert
        self.assertEqual(actual, expected, msg="We expected {0} but receive {1}".format(expected, actual))

    def test_subtraction_with_success(self):
        # Set Up
        expected = 2
        a = 1
        b = 1
        calculator = Calculator(a, b)

        # ACT
        actual = calculator.sum()

        # Assert
        self.assertEqual(actual, expected, msg="We expected {0} but receive {1}".format(expected, actual))


if __name__ == '__main__':
    unittest.main()