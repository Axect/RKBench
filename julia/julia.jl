using Printf

f(x, y) = x * sqrt(y)
theoric(t) = (t ^ 2 + 4.0) ^ 2 / 16.0

function rk4(f::Function, x₀::Float64, y₀::Float64, x₁::Float64, n)
    vx = zeros(n+1)
    vy = zeros(n+1)
    vx[1] = x = x₀
    vy[1] = y = y₀
    h = (x₁ - x₀) / n
    for i in 1:n
        k₁ = h * f(x, y)
        k₂ = h * f(x + 0.5h, y + 0.5k₁)
        k₃ = h * f(x + 0.5h, y + 0.5k₂)
        k₄ = h * f(x + h, y + k₃)
        vx[i + 1] = x = x₀ + i * h
        vy[i + 1] = y = y + (k₁ + 2k₂ + 2k₃ + k₄) / 6
    end
    return vx, vy
end
 
vx, vy = rk4(f, 0.0, 1.0, 10.0, 1000)

global m = 0

for (x, y) in Iterators.take(zip(vx, vy), 1000)
    if m % 10 == 0
        @printf("%4.1f %10.5f %+12.4e\n", x, y, y - theoric(x))
    end
    global m += 1
end