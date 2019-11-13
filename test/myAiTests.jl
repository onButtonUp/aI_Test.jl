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
    pgm_ = joinpath(dirname(@__FILE__),"PGM102T1.wav")

    @test isfile(joinpath(dirname(@__FILE__),"example.wav"))
    @test isfile(joinpath(dirname(@__FILE__),"example02.wav"))
    @test isfile(joinpath(dirname(@__FILE__),"Hammerhead.wav"))
    @test isfile(pgm_)
    #y2, fs2 = WAV.wavread(hammerWav)
    y2, fs2 = WAV.wavread(example02_)
    y_pgm, fs_pgm, nbits_pgm, opt_pgm = WAV.wavread(pgm_)

    #fs2 = 48000.0
    @test fs2 == 16000.0 # versus 48000.0
    @test fs_pgm == 44100
    thisIt_pgm = WAV.getformat(opt_pgm)
    @test thisIt_pgm.nchannels == 2
    #sqrt(sum(y2.^2.) / length(y2))
    #@test sqrt(sum(y2.^2.) / length(y2)) ≈ 0.16209680234518886
    @test sqrt(sum(y2.^2.) / length(y2)) ≈ 0.7070846851353825
    @test sqrt(sum(x -> x*x, y2) / length(y2)) ≈ 0.7070846851353825

    left_pgm = y_pgm[1:end,1]
    right_pgm = y_pgm[1:end,2]
    @test sqrt(sum(x -> x*x, left_pgm) / length(left_pgm)) ≈ 0.06207601152097682
    @test sqrt(sum(x -> x*x, right_pgm) / length(right_pgm)) ≈ 0.06372897603090126

#    isfile("example.wav")
end

#fs2

### COMMENTED vv
# example02_ = joinpath(dirname(@__FILE__),"example02.wav")
# isfile(example02_)
# y2, fs2, nbits, opt = WAV.wavread(example02_)
# fs2
# nbits
# opt
# thisIt = WAV.getformat(opt)
#
# hammerhead_ = joinpath(dirname(@__FILE__),"Hammerhead.wav")
# isfile(hammerhead_)
# y_hammer, fs_hammer, nbits_hammer, opt_hammer = WAV.wavread(hammerhead_)
# fs_hammer
# nbits_hammer
# opt_hammer
# thisIt_hammer = WAV.getformat(opt_hammer)
#
#
# pgm_ = joinpath(dirname(@__FILE__),"PGM102T1.wav")
# isfile(pgm_)
# y_pgm, fs_pgm, nbits_pgm, opt_pgm = WAV.wavread(pgm_)
# fs_pgm
# nbits_pgm
# opt_pgm
# left_pgm = y_pgm[1:end,1]
# right_pgm = y_pgm[1:end,2]
# sqrt(sum(x -> x*x, left_pgm) / length(left_pgm))
# sqrt(sum(x -> x*x, right_pgm) / length(right_pgm))
# thisIt_pgm = WAV.getformat(opt_pgm)
### COMMENTED ^^

# NEW aI TESTS ^^^
#;pwd()
#sqrt(sum(y2.^2.) / length(y2)) == 0.16209680234518886
