using Unitful
using Test, LinearAlgebra, Random, ConstructionBase, InverseFunctions, Printf
import Unitful: DimensionError, AffineError
import Unitful: LogScaled, LogInfo, Level, Gain, MixedUnits, Decibel
import Unitful: FreeUnits, ContextUnits, FixedUnits, AffineUnits, AffineQuantity
import ForwardDiff
import Latexify: Latexify, latexify, @latexify, FancyNumberFormatter, SiunitxNumberFormatter
import LaTeXStrings: LaTeXString, @L_str

import Unitful:
    nm, μm, mm, cm, m, km, inch, ft, mi,
    ac,
    mg, g, kg,
    Ra, °F, °C, K,
    rad, mrad, °, deg,
    ms, s, minute, hr, d, yr, Hz,
    J, A, N, mol, V, mJ, eV, dyn, mN,
    mW, W,
    dB, dB_rp, dB_p, dBm, dBV, dBSPL, Decibel,
    Np, Np_rp, Np_p, Neper,
    C

import Unitful: 𝐋, 𝐓, 𝐍, 𝚯

import Unitful:
    Length, Area, Volume,
    Luminosity,
    Time, Frequency,
    Mass,
    Current,
    Temperature, AbsoluteScaleTemperature, RelativeScaleTemperature,
    Action,
    Power,
    MassFlow,
    MolarFlow,
    VolumeFlow

import Unitful: LengthUnits, AreaUnits, MassUnits, TemperatureUnits

using Dates:
    Dates,
    Nanosecond, Microsecond, Millisecond, Second, Minute, Hour, Day, Week,
    Month, Year,
    CompoundPeriod

const colon = Base.:(:)

@testset "Display" begin
    withenv("UNITFUL_FANCY_EXPONENTS" => false) do
        @test string(typeof(1.0m/s)) == "Quantity{Float64, 𝐋 𝐓^-1, FreeUnits{(m, s^-1), 𝐋 𝐓^-1, nothing}}"
        @test string(typeof(m/s)) == "FreeUnits{(m, s^-1), 𝐋 𝐓^-1, nothing}"
        @test string(dimension(1u"m/s")) == "𝐋 𝐓^-1"
        @test string(NoDims) == "NoDims"
    end
    @testset ":fancy_exponent IOContext property" begin
        @test sprint(io -> show(IOContext(io, :fancy_exponent => true), u"m/s")) == "m s⁻¹"
        @test sprint(io -> show(IOContext(io, :fancy_exponent => false), u"m/s")) == "m s^-1"
    end
end

