module ReactDocs

using Revise
using Oxygen, HTTP
using Glass
using Glass: html

routes_dir = joinpath(pwd(), "src/routes/")
setup_file_based_routes(routes_dir)

serve()

end # module ReactDocs
