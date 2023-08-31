using Glass

function Index()
    return html(
        head(
            meta(:charset => "UTF-8"),
            meta(:name => "viewport", :content => "width=device-width, initial-scale=1.0"),
            title("To-Do App Home"),
            link(:href => "https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css", :rel => "stylesheet"),
            link(:href => "https://cdn.jsdelivr.net/npm/daisyui/dist/full.css", :rel => "stylesheet")
        ),
        body(:class => "bg-neutral-100",
            nav(:class => "bg-primary py-4",
                divv(:class => "container mx-auto text-white flex justify-between items-center",
                    h1(:class => "text-2xl font-bold", "To-Do App"),
                    a(:href => "/todo", :class => "btn btn-secondary", "To-Do List")
                )
            ),
            divv(:class => "container mx-auto text-center py-10 w-1/2",
                h1(:class => "text-4xl font-bold mb-4", "Hello, Welcome to the To-Do App!"),
                p(:class => "text-lg", "Click the button above to start managing your tasks.")
            )
        )
    )
end

export Index
