extern crate peroxide;
use peroxide::*;

fn main() {
    let init = c!(0, 1);
    let ans = rk4(init, f_vec, 0.01, 1000);
    ans.row(1000).print();
}

fn f(x: f64, y: f64) -> f64 {
    x * y.sqrt()
}

fn f_vec(xs: Vec<f64>) -> Vec<f64> {
    let x = xs[0];
    let y = xs[1];

    vec![f(x,y)]
}