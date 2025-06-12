def sqrt_newton(x, tolerance=1e-10, max_iterations=100):
    """
    Approximates the square root of a number using the Newton-Raphson method.

    Args:
        x (float): The number to compute the square root of.
        tolerance (float): The accuracy threshold.
        max_iterations (int): Maximum number of iterations.

    Returns:
        float: The estimated square root of x.
    """
    if x < 0:
        raise ValueError("Cannot compute square root of negative number.")
    if x == 0:
        return 0

    guess = x / 2.0  # Initial guess
    for i in range(max_iterations):
        new_guess = 0.5 * (guess + x / guess)  # Newton-Raphson update
        print(f"Iteration {i+1}: guess = {new_guess}")  # Show progress
        if abs(new_guess - guess) < tolerance:  # Check convergence
            return new_guess
        guess = new_guess
    return guess  # Return the last guess if max_iterations reached

# Example usage
number = 25
result = sqrt_newton(number)
print(f"\nThe square root of {number} is approximately {result:.6f}")

