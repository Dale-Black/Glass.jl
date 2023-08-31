using Glass

function Index()
    return html(
        head(
            meta(:charset => "UTF-8"),
            meta(:name => "viewport", :content => "width=device-width, initial-scale=1.0"),
            title("Glass.jl Documentation"),
            link(:href => "https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css", :rel => "stylesheet"),
            link(:href => "https://cdn.jsdelivr.net/npm/daisyui/dist/full.css", :rel => "stylesheet")
        ),
        body(:class => "bg-neutral-100",
            nav(:class => "bg-primary py-4",
                divv(:class => "container mx-auto text-white flex justify-between items-center",
                    h1(:class => "text-2xl font-bold", "Glass.jl Documentation"),
                    a(:href => "/learn/quickstart", :class => "btn btn-secondary", "Learn Glass.jl")
                )
            ),
            divv(:class => "container mx-auto text-center py-10 w-1/2",
                h1(:class => "text-4xl font-bold mb-4", "Welcome to the Glass.jl Documentation!"),
                p(:class => "text-lg", "Click the button above to start learning how to use Glass.jl."),
                a(:href => "/learn/quickstart", :class => "btn btn-primary mt-4", "Learn Glass.jl")
            )
        )
    )
end

export Index
