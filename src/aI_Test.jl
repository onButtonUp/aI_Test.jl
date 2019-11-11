# put all using and exports in this package file
# so know where all things coming and leaving are (@31:00 on video)

module aI_Test

using ForwardDiff
using WAV

include("file01.jl")

export my_f, derivative_of_my_f

end # module
