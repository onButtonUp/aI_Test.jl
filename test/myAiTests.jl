using aI_Test
using Test


# OLD EXAMPLE TESTS vvv
@testset "aI_Test.jl" begin
    # 2x + 3y
    @test aI_Test.my_f(2,1) == 7
    @test aI_Test.my_f(2,3) == 13
    @test aI_Test.my_f(1,3) == 11
end

@testset "more testing" begin
    @test derivative_of_my_f(2,1) == 2
end
# OLD EXAMPLE TESTS ^^^


# NEW aI TESTS vvv
# @testset "some WAV testing" begin
#     @test y, fs = wavread("example.wav")
#;pwd()
#file_dir = joinpath(dirname(@__FILE__), "test")

@testset "real aI testing" begin
    @test isfile(joinpath(dirname(@__FILE__),"example.wav"))
    @test isfile(joinpath(dirname(@__FILE__),"Hammerhead.wav"))
#    isfile("example.wav")
end

# NEW aI TESTS ^^^
#;pwd()
