using aI_Test
using Test
using WAV


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
    #hammerWav = joinpath(dirname(@__FILE__),"Hammerhead.wav")
    example02_ = joinpath(dirname(@__FILE__),"example02.wav")

    @test isfile(joinpath(dirname(@__FILE__),"example.wav"))
    @test isfile(joinpath(dirname(@__FILE__),"example02.wav"))
    @test isfile(joinpath(dirname(@__FILE__),"Hammerhead.wav"))
    @test isfile(example02_)
    #y2, fs2 = WAV.wavread(hammerWav)
    y2, fs2 = WAV.wavread(example02_)
    #fs2 = 48000.0
    @test fs2 == 16000.0 # versus 4800.0
    #sqrt(sum(y2.^2.) / length(y2))
    #@test sqrt(sum(y2.^2.) / length(y2)) ≈ 0.16209680234518886
    @test sqrt(sum(y2.^2.) / length(y2)) ≈ 0.7070846851353825
    @test sqrt(sum(x -> x*x, y2) / length(y2)) ≈ 0.7070846851353825
#    isfile("example.wav")
end

#fs2
# example02_ = joinpath(dirname(@__FILE__),"example02.wav")
# isfile(example02_)
# y2, fs2 = WAV.wavread(example02_)
# fs2
# NEW aI TESTS ^^^
#;pwd()
#sqrt(sum(y2.^2.) / length(y2)) == 0.16209680234518886
