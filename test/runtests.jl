using aI_Test
using Test

@testset "aI_Test.jl" begin
    # 2x + 3y
    @test aI_Test.my_f(2,1) == 7
    @test aI_Test.my_f(2,3) == 13
    @test aI_Test.my_f(2,3) == 11
end
