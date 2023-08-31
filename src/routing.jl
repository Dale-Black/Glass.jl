using HTTP, Oxygen

"""
    _list_julia_files(folder_path, root_path, relative_paths)

Internal function to recursively list all Julia files in a given directory and its subdirectories.

- `folder_path`: The current folder path to scan.
- `root_path`: The root folder from which scanning started. Used to create relative paths.
- `relative_paths`: Vector to collect the relative paths of found Julia files.

"""
function _list_julia_files(folder_path, root_path, relative_paths)
    for item in readdir(folder_path)
        item_path = joinpath(folder_path, item)
        if isdir(item_path)
            _list_julia_files(item_path, root_path, relative_paths)
        elseif occursin(".jl", item)
            relative_path = replace(item_path, root_path => "")
            push!(relative_paths, relative_path)
        end
    end
end

"""
    list_julia_files(root_path)

List all Julia files in a directory and its subdirectories, returning their relative paths as a vector.

- `root_path`: The root folder path to start scanning.

Returns:
- Vector of relative paths to all found Julia files.

"""
function list_julia_files(root_path)
    relative_paths = String[]
    _list_julia_files(root_path, root_path, relative_paths)
    return relative_paths
end

"""
    path_to_routes(paths)

Converts file paths to route paths by removing the `.jl` extension.

- `paths`: Vector of file paths.

Returns:
- Vector of route paths.

"""
path_to_routes(paths) = [replace(p, ".jl" => "") for p in paths]

"""
    route_to_function(route)

Converts a route path to a function name by taking the basename and capitalizing its first letter.

- `route`: The route path string.

Returns:
- Function name string.

"""
route_to_function(route) = uppercasefirst(basename(route))

"""
    setup_file_based_routes(routes_dir)

Set up file-based routing for an Oxygen.jl web application.

- `routes_dir`: The directory containing the `.jl` files that define the routes.

This function performs the following tasks:
1. Lists all `.jl` files under `routes_dir`.
2. Includes all the listed route files.
3. Sets up routes based on the file names, mapping `index.jl` to the root path `/`.

"""
function setup_file_based_routes(routes_dir)
    # List all .jl files under routes_dir
    paths = list_julia_files(routes_dir)

    # Include all the route files
    for p in paths
        include(joinpath(routes_dir, p))
    end

    # Get the route paths
    routes = path_to_routes(paths)

    # Set up the routes
    for r in routes
        func_name = route_to_function(r)
        func_symbol = Symbol(func_name)

        # Replace any occurrence of "index" with "/"
        route_path = replace(r, "index" => "/")

        get(route_path) do request::HTTP.Request
            eval(func_symbol)()
        end
    end
end

export setup_file_based_routes