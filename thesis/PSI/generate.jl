
using ApproxOperator

function generate2D(ni::Int,ns::Int)

    # etype = (:Quadratic2D,:□,:CubicSpline,:Shape)
    # s = 2.1/(ni-1)
    # nm = 21

    # etype = (:Cubic2D,:□,:CubicSpline,:Shape)
    # s = 3.1/(ni-1)
    # nm = 55

    etype = (:Quartic2D,:□,:CubicSpline,:Shape)
    s = 4.1/(ni-1)
    nm = 120

    nodes = ApproxOperator.Node{(:𝐼,),1}[]
    data = Dict([
        :x=>(1,zeros(ni^2)),
        :y=>(1,zeros(ni^2)),
        :z=>(1,zeros(ni^2)),
        :s₁=>(1,s*ones(ni^2)),
        :s₂=>(1,s*ones(ni^2)),
        :s₃=>(1,s*ones(ni^2)),
    ])
    for (j,y) in enumerate(0.0:1.0/(ni-1):1.0)
        for (i,x) in enumerate(0.0:1.0/(ni-1):1.0)
            node = ApproxOperator.Node{(:𝐼,),1}((ni*(j-1)+i,),data)
            node.x = x
            node.y = y
            push!(nodes,node)
        end
    end

    points = ApproxOperator.Node{(:𝑔,:𝐺,:𝐶,:𝑠),4}[]
    data = Dict([
        :x=>(2,zeros(ns^2)),
        :y=>(2,zeros(ns^2)),
        :z=>(2,zeros(ns^2)),
        :𝝭=>(4,zeros(ni^2*ns^2)),
        :∂𝝭∂x=>(4,zeros(ni^2*ns^2)),
        :∂𝝭∂y=>(4,zeros(ni^2*ns^2)),
        :∂²𝝭∂x²=>(4,zeros(ni^2*ns^2)),
        :∂²𝝭∂y²=>(4,zeros(ni^2*ns^2)),
        :∂²𝝭∂x∂y=>(4,zeros(ni^2*ns^2)),
        :𝗠=>(0,zeros(nm)),
        :∂𝗠∂x=>(0,zeros(nm)),
        :∂𝗠∂y=>(0,zeros(nm)),
        :∂²𝗠∂x²=>(0,zeros(nm)),
        :∂²𝗠∂y²=>(0,zeros(nm)),
        :∂²𝗠∂x∂y=>(0,zeros(nm)),
    ])
    for (j,y) in enumerate(0.0:1.0/(ns-1):1.0)
        for (i,x) in enumerate(0.0:1.0/(ns-1):1.0)
            n = ns*(j-1)+i
            point = ApproxOperator.Node{(:𝑔,:𝐺,:𝐶,:𝑠),4}((0,n,1,ni^2*(n-1)),data)
            point.x = x
            point.y = y
            push!(points,point)
        end
    end

    return ApproxOperator.ReproducingKernel{etype...}((0,ni^2,nodes),(0,ns^2,points))
end