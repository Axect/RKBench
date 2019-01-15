/* Runge Kutta 4th order */
module chapel {
  use Math;

  proc main() {
    var x: real = 0.0;
    var y: real = 1.0;
    const step: real = 0.01;
    const max_steps: int = 1001;
    const sample_every_n = 10;

    for steps in 0..max_steps {
      if steps % sample_every_n == 0 {
        writeln("y(", x, "): ", y, "  err: ", actual(x) - y);
      }

      y = RK4(f, x, y, step);
      x = ((x * 10) + (step * 10)) / 10;
    }
  }

  proc RK4(f: func(real, real, real), x: real, y:real, dx: real): real {
    const k1 = dx * f(x, y);
    const k2 = dx * f(x + dx/2, y + k1/2);
    const k3 = dx * f(x + dx/2, y + k2/2);
    const k4 = dx * f(x + dx, y + k3);

    return y + (k1 + 2*k2 + 2*k3 + k4)/6;
  }

  proc f(x: real, y:real): real {
    return x * sqrt(y);
  }

  proc actual(x: real): real {
    return (1.0/16) * (x*x + 4)**2;
  }
}