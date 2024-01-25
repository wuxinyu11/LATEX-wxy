
include("generate.jl")

using  CairoMakie

# 7 25 46
# 9 41 77
# 11 61 116

ni = 11
ns = 100
a = generate2D(ni,ns)
set∇𝝭!(a)
set∇²𝝭!(a)

I = 66
p = collect(a.𝓒)[I]
xi = p.x
yi = p.y
zi = -0.01
xs = zeros(ns^2)
ys = zeros(ns^2)
𝝭 = zeros(ns^2)
∂𝝭∂x = zeros(ns^2)
∂𝝭∂y = zeros(ns^2)
∂²𝝭∂x² = zeros(ns^2)
∂²𝝭∂y² = zeros(ns^2)
∂²𝝭∂x∂y = zeros(ns^2)
𝓖 = a.𝓖
for (i,ξ) in enumerate(𝓖)
    N = ξ[:𝝭]
    B₁ = ξ[:∂𝝭∂x]
    B₂ = ξ[:∂𝝭∂y]
    B₃ = ξ[:∂²𝝭∂x²]
    B₄ = ξ[:∂²𝝭∂y²]
    B₅ = ξ[:∂²𝝭∂x∂y]
    xs[i] = ξ.x
    ys[i] = ξ.y
    𝝭[i] = N[I]
    ∂𝝭∂x[i] = B₁[I]
    ∂𝝭∂y[i] = B₂[I]
    ∂²𝝭∂x²[i] = B₃[I]
    ∂²𝝭∂y²[i] = B₄[I]
    ∂²𝝭∂x∂y[i] = B₅[I]
end

f = Figure(fonts=(;regular="Arial"))
ax = Axis3(
    f[1,1],
    xgridvisible=false,
    ygridvisible=false,
    zgridvisible=false,
    xlabelvisible=false,
    ylabelvisible=false,
    zlabelvisible=false,
    xticksvisible=false,
    yticksvisible=false,
    # zticksvisible=false,
    xticklabelsvisible=false,
    yticklabelsvisible=false,
    # zticklabelsvisible=false,
    zticklabelsize=40,
)
xlims!(ax, (0.0,1.0))
ylims!(ax, (0.0,1.0))
scatter!(xi, yi, zi, color=:black, markersize = 40, marker=:circle)

# zlims!(ax, (-0.1,1.0))
# surface!(xs, ys, 𝝭, colormap=:jet, alpha=0.9, colorrange=(-0.5,0.5))
# save("𝝭.png",f)

# zlims!(ax, (-10.0,10.0))
# surface!(xs, ys, ∂𝝭∂y, colormap=:jet, alpha=0.8, colorrange=(-5,5))
# save("∂𝝭∂y.png",f)

# zlims!(ax, (-100.0,100.0))
# surface!(xs, ys, ∂²𝝭∂x∂y, colormap=:jet, alpha=0.8,colorrange=(-40,40))
# save("∂²𝝭∂x∂y.png",f)

# zlims!(ax, (-40.0,40.0))
# surface!(xs, ys, ∂²𝝭∂x∂y, colormap=:jet, alpha=0.8,colorrange=(-30,30))
# save("∂²𝝭∂x∂y.png",f)

zlims!(ax, (-50,50.0))
surface!(xs, ys, ∂²𝝭∂y², colormap=:jet, alpha=0.8,colorrange=(-20,20))
save("∂²𝝭∂y².png",f)

# zlims!(ax, (-20,20.0))
# surface!(xs, ys, ∂²𝝭∂y², colormap=:jet, alpha=0.8,colorrange=(-10,10))
# save("∂²𝝭∂y².png",f)

f