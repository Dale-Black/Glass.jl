### A Pluto.jl notebook ###
# v0.19.22

using Markdown
using InteractiveUtils

# ╔═╡ 4c7e1fe8-d577-11ed-1fcf-270f582ed63d
begin
	using Pkg
	Pkg.add("Revise")
	Pkg.add("PlutoUI")
	Pkg.develop(path="/Users/daleblack/Library/CloudStorage/GoogleDrive-djblack@uci.edu/My Drive/dev/julia/Glass")
	using Revise, Glass
end

# ╔═╡ e79a07b1-9fe9-479b-ab13-a86e61b6fbab
include("components/MyComponent.jl")

# ╔═╡ 36ee3311-96b0-4184-bf73-4bebba60a9a8
function MyApp()
	return (
		@div(
			@button("first button"),
			@p("first"),
			# @MyComponent()
		)
	)
end

# ╔═╡ af6f0ea0-f1e9-4c01-82bd-884d1ca0c8f6
MyApp()

# ╔═╡ Cell order:
# ╠═4c7e1fe8-d577-11ed-1fcf-270f582ed63d
# ╠═e79a07b1-9fe9-479b-ab13-a86e61b6fbab
# ╠═36ee3311-96b0-4184-bf73-4bebba60a9a8
# ╠═af6f0ea0-f1e9-4c01-82bd-884d1ca0c8f6
