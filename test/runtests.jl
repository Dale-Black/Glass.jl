using Glass
using HypertextLiteral
using Test

@testset "HTML Elements" begin
    @testset "p" begin
        p1 = @p("this is some text")
        p2 = htl"""<p>this is some text</p>"""
        @test p1 == p2
    end
end
