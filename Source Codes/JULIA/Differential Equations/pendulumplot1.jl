# Open new project -> ' julia --project="." '
# Run this in Julia REPL (Julia 1.7.3) 'include("pendulumplot1.jl") '
# Then run pendulumplot2.jl 'include("pendulumplot2.jl") '
# The gif will be located at /tmp folder

using OrdinaryDiffEq

G = 9.8  # acceleration due to gravity, in m/s^2
L1 = 1.0  # length of pendulum 1 in m
L2 = 1.0  # length of pendulum 2 in m
L = L1 + L2  # maximal length of the combined pendulum
M1 = 1.0  # mass of pendulum 1 in kg
M2 = 1.0  # mass of pendulum 2 in kg
t_stop = 5  # how many seconds to simulate
history_len = 500  # how many trajectory points to display

function pendulum!(du, u, p, t)
    (; M1, M2, L1, L2, G) = p

    du[1] = u[2]

    delta = u[3] - u[1]
    den1 = (M1 + M2) * L1 - M2 * L1 * cos(delta) * cos(delta)
    du[2] = (
        (
            M2 * L1 * u[2] * u[2] * sin(delta) * cos(delta) +
            M2 * G * sin(u[3]) * cos(delta) +
            M2 * L2 * u[4] * u[4] * sin(delta) - (M1 + M2) * G * sin(u[1])
        ) / den1
    )

    du[3] = u[4]

    den2 = (L2 / L1) * den1
    du[4] = (
        (
            -M2 * L2 * u[4] * u[4] * sin(delta) * cos(delta) +
            (M1 + M2) * G * sin(u[1]) * cos(delta) -
            (M1 + M2) * L1 * u[2] * u[2] * sin(delta) - (M1 + M2) * G * sin(u[3])
        ) / den2
    )
    return nothing
end
